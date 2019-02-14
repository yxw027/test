package com.linghang.service.business.water;

import com.linghang.enums.AlarmType;
import com.linghang.enums.OrgType;
import com.linghang.enums.WarningLevel;
import com.linghang.enums.asphalt.DataUnit;
import com.linghang.enums.asphalt.ExcessDataLevel;
import com.linghang.enums.asphalt.SieveDiameterType;
import com.linghang.enums.water.WaterWarningConfigType;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.business.continuous.ContinuousWarningModel;
import com.linghang.model.business.water.*;
import com.linghang.service.base.OrganizationService;
import com.linghang.service.business.continuous.ContinuousWarningService;
import com.linghang.util.*;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 水稳数据接收计算
 *
 * @author youp
 * @date 2018-12-17
 **/
@Service
public class WaterDataService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private WaterInfoService infoService;
    @Autowired
    private WaterSieveSettingService sieveSettingService;
    @Autowired
    private WaterMetadataResultService resultService;
    @Autowired
    private WaterMetaDataService metadataService;
    @Autowired
    private WaterFormulaService formulaService;
    @Autowired
    private WaterWarningConfigService configService;
    @Autowired
    private WaterWarningNoteConfigService waterWarningNoteConfigService;
    @Autowired
    private WaterWarningMessageService messageService;
    @Autowired
    private WaterMetadataAggregateService aggregateService;
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private MachinePhoneNoteRecordService machinePhoneNoteRecordService;
    @Autowired
    private WaterWarningConfigService waterWarningConfigService;
    @Autowired
    private ContinuousWarningService continuousWarningService;
    /**
     * 成功返回
     */
    private static final String SUCCESS = "success";
    /**
     * 失败返回
     */
    private static final String FAIL = "fail";

    /**
     * 沥青数据数据接收
     *
     * @param model WaterMetaDataModel
     * @return SUCCESS / FAIL
     */
    public String receiveData(WaterMetaDataModel model, boolean isOld) {
        if (model == null || model.getMixingMachineId() == null) {
            return FAIL;
        }
        model.setStationId(model.getMixingMachineId());
        WaterInfoModel infoModel = infoService.selectById(model.getStationId());

        if (infoModel == null) {
            logger.info("站点信息错误");
            return FAIL;
        }
        if (isMaterialsNull(model, infoModel)) {
            logger.info("存在null值--无效数据");
            return FAIL;
        }
        if (isRepeatData(model, isOld)) {
            logger.info("重复数据");
            return FAIL;
        }

        setMixingTime(model);

        /*
         * 如果配方编号为空，如果有默认配方按默认配方处理
         * 如果有配方编号但和库里的编号对不上，不管有没有默认配方，不做处理
         */

        WaterFormulaModel formula = null;
        if (model.getFormulaCode() == null || "".equals(model.getFormulaCode())) {
            //获取默认配比
            formula = formulaService.selectDefaultModel(model.getStationId());
        } else {
            formula = formulaService.selectByFormulaCode(model.getFormulaCode(), model.getStationId());
        }
        double glWeight = getAggregateWeight(model, infoModel);
        if (glWeight == 0) {
            return FAIL;
        }
        model.setCreateTime(new Date());
        model.setIsPass(0);
        model.setWeight(new BigDecimal(glWeight + model.getWater().doubleValue() + model.getCement().doubleValue()).setScale(2, BigDecimal.ROUND_HALF_UP));
        if (formula != null) {
            Long formulaId = formula.getId();

            //获取和设置骨配版本
            List<WaterWarningConfigModel> waterWarningConfigModels = waterWarningConfigService.selectByFormulaId(formulaId);
            Integer version = null;
            if (!CollectionUtils.isEmpty(waterWarningConfigModels)) {
                version = waterWarningConfigModels.get(0).getDataVersion();
                model.setDataVersion(version);
            }
            model.setFormulaId(formula.getId());
            model.setFormulaCode(formula.getNumber());

            //如果不是旧数据，添加到metadata表
            if (!isOld) {
                model.setId(IdWorker.nextId());
                metadataService.insert(model);
            }
            StringBuffer sb = new StringBuffer();
            WaterMetadataResultModel resultModel = new WaterMetadataResultModel();
            resultModel.setId(IdWorker.nextId());
            resultModel.setIsPass(0);
            WaterWarningMessageModel msgModel = new WaterWarningMessageModel();
            msgModel.setStationId(formula.getStationId());
            msgModel.setDataId(model.getId());
            msgModel.setFormulaId(formula.getId());
            msgModel.setFormulaName(formula.getName());
            msgModel.setCreateTime(new Date());
            msgModel.setDataTime(model.getTime());
            msgModel.setWater(model.getWater());
            msgModel.setCement(model.getCement());
            msgModel.setTotalWeight(new BigDecimal(glWeight + model.getWater().doubleValue() + model.getCement().doubleValue()).setScale(2, BigDecimal.ROUND_HALF_UP));
            //骨料配比
            calculation(resultModel, model, infoModel, formula, sb, msgModel, isOld);
            //级配
            validDataForSieve(resultModel, model, infoModel, formula, sb, msgModel);
            //更新data表超标
            if (isOld) {
                metadataService.updateById(model);
            } else if (model.getIsPass() != null && model.getIsPass() == 1) {
                metadataService.updateById(model);
            }
            if (sb.length() > 0) {
                msgModel.setContent(sb.toString());
                List<OrganizationModel> project = organizationService.getProjectData(infoModel.getOrgId(), OrgType.PROJECT.getInteger());
                OrganizationModel org = organizationService.selectById(infoModel.getOrgId());
                StringBuffer head = new StringBuffer();
                head.append("【").append(project.get(0).getName()).append("】")
                        .append(org.getName()).append(infoModel.getName()).append("于")
                        .append(DatetimeUtil.formatDate(model.getTime(), "yyyy-MM-dd HH:mm:ss"));
                head.append(sb.toString());
                //推送消息
                sendMsgToUser(head, formula.getStationId(), getStandardLevel(msgModel), infoModel,model.getId());
                //信息超标则插入数据库
                messageService.insert(msgModel);
            }
        } else {
            if (isOld) {
                metadataService.updateById(model);
            } else {
                model.setId(IdWorker.nextId());
                metadataService.insert(model);
                WaterMetadataAggregateModel aggregateModel = calculationNoWarning(model, infoModel);
                aggregateService.insert(aggregateModel);
            }
        }
        return SUCCESS;
    }

    private Integer getStandardLevel(WaterWarningMessageModel model) {
        List<Integer> list = new ArrayList<>();
        list.add(model.getAggregateResult() == null ? 0 : model.getAggregateResult());
        list.add(model.getCementResult() == null ? 0 : model.getCementResult());
        list.add(model.getWaterResult() == null ? 0 : model.getWaterResult());
        list.add(model.getSieveResult() == null ? 0 : model.getSieveResult());
        int maxLevel = list.get(0);
        for (Integer integer : list) {
            if (integer > maxLevel) {
                maxLevel = integer;
            }
        }
        return maxLevel;
    }

    /**
     * 重复数据，骨料相同，时间相同
     *
     * @param model WaterMetaDataModel
     * @return boolean
     */
    private boolean isRepeatData(WaterMetaDataModel model, boolean isOld) {
        if (isOld) {
            return false;
        }
        List<WaterMetaDataModel> repeatData = metadataService.selectRepeatData(model);
        return !CollectionUtils.isEmpty(repeatData);
    }

    /**
     * 判断数据信息为null
     *
     * @param model     WaterMetaDataModel
     * @param infoModel WaterInfoModel
     * @return boolean
     * @author 田朋
     */
    private boolean isMaterialsNull(WaterMetaDataModel model, WaterInfoModel infoModel) {

        //骨料数量
        int aggregateNum = infoModel.getAggregateNum();
        boolean isNull = false;
        Map<String, Object> map = BeanUtil.transBean2Map(model);
        for (int i = 1; i <= aggregateNum; i++) {
            BigDecimal b = map.get("g" + i) == null ? null : (BigDecimal) map.get("g" + i);
            if (b == null) {
                isNull = true;
                break;
            }
        }
        return isNull;
    }

    /**
     * 推送短信消息到用户
     *
     * @param sb        StringBuffer
     * @param stationId Long
     */
    private void sendMsgToUser(StringBuffer sb, Long stationId, Integer level, WaterInfoModel infoModel,Long dataId) {
        //获取该拌合机项目
        OrganizationModel projectModel = organizationService.getProject(infoModel.getOrgId());
        //获取项目下配置
        ContinuousWarningModel mixConfig = continuousWarningService.getMixConfig(projectModel.getId(), AlarmType.WATER.getInteger());
        //没有配置按原有预警执行
        if (mixConfig != null){
            List<Integer> excelLevel = new ArrayList<>();
            List<Integer> numbers = new ArrayList<>();
            try {
                excelLevel = MixingUtil.getExcelLevel(stationId, level, mixConfig, excelLevel, numbers,AlarmType.WATER.getInteger(),metadataService,dataId);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (excelLevel.size() == 0){
                return;
            }
            for (Integer excel : excelLevel) {
                StringBuffer excelMsg = new StringBuffer();
                excelMsg.append(sb);
                //连续盘数预警信息追加
                MixingUtil.setExcelMsg(excelMsg, level, mixConfig, excel, numbers);
                sendPhoneNote(excelMsg, stationId, excel, infoModel, projectModel);
            }
            return;
        }
        sendPhoneNote(sb, stationId, level, infoModel, projectModel);
    }

    private void sendPhoneNote(StringBuffer sb, Long stationId, Integer level, WaterInfoModel infoModel, OrganizationModel projectModel) {
        List<WaterWarningNoteConfigModel> phoneList = waterWarningNoteConfigService.getPhone(stationId.toString(), level);
        String phones = "";
        if (!StringUtils.isEmpty(phoneList)) {
            for (int i = 0; i < phoneList.size(); i++) {
                phones += phoneList.get(i).getPhone();
                if (i != phoneList.size() - 1) {
                    phones += ",";
                }
            }
        }
        if (!StringUtils.isEmpty(phones)) {
            JSONObject jsonObject = SmsUtils.sendSms(phones, sb.toString());
            String success = "失败";
            if ("Success".equals(jsonObject.get("returnstatus"))) {
                success = "成功";
            }
            machinePhoneNoteRecordService.insert(new MachinePhoneNoteRecordModel(1, "", phones, infoModel.getName(), sb.toString(), new Date(), projectModel.getName(), success, "实时数据"));
        }
    }


    /**
     * 获取数据骨料总重量
     *
     * @param model     WaterMetaDataModel
     * @param infoModel WaterInfoModel
     * @return glWeight
     */
    public double getAggregateWeight(WaterMetaDataModel model, WaterInfoModel infoModel) {
        int aggregateNum = infoModel.getAggregateNum();
        Map<String, Object> dataMap = BeanUtil.transBean2Map(model);
        double glWeight = 0;
        for (int i = 1; i <= aggregateNum; i++) {
            BigDecimal guliao = (BigDecimal) dataMap.get("g" + i);
            glWeight += guliao.doubleValue();
        }
        return glWeight;
    }


    /**
     * 计算骨料配比
     *
     * @param formulaModel WaterFormulaModel
     * @param resultModel  WaterMetadataResultModel
     * @param model        WaterMetaDataModel
     * @param infoModel    WaterInfoModel
     * @param sb           StringBuffer
     * @param msgModel     WaterWarningMessageModel
     * @param isOld        boolean
     */
    private void calculation(WaterMetadataResultModel resultModel, WaterMetaDataModel model, WaterInfoModel infoModel,
                             WaterFormulaModel formulaModel, StringBuffer sb, WaterWarningMessageModel msgModel, boolean isOld) {

        //获取骨料重量
        double glWeight = getAggregateWeight(model, infoModel);

        WaterMetadataAggregateModel aggregateModel = new WaterMetadataAggregateModel();
        aggregateModel.setIsPass(0);
        aggregateModel.setAggregateWeight(new BigDecimal(glWeight).setScale(2, BigDecimal.ROUND_HALF_UP));
        BigDecimal cement = BigDecimal.ZERO;
        if (glWeight != 0) {
            cement = new BigDecimal((model.getCement().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP);
        }
        model.setCementProportion(cement);
        resultModel.setCementProportion(cement);
        aggregateModel.setCement(cement);

        BigDecimal water = new BigDecimal((model.getWater().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP);
        resultModel.setWaterProportion(water);
        aggregateModel.setWater(water);

        //根据配方id获取骨配设置
        List<WaterWarningConfigModel> list = configService.selectByFormulaId(formulaModel.getId());
        if (!CollectionUtils.isEmpty(list)) {

            //骨配最大报警级别
            Integer maxLevel = 0;

            //判断骨料等级是否都为null
            boolean isAllNotNull = false;

            for (WaterWarningConfigModel configModel : list) {
                Integer level = ExcessDataLevel.ZERO.getValue();
                StringBuffer str = new StringBuffer();

                //水泥
                if (WaterWarningConfigType.CEMENT.getValue().equals(configModel.getNumber())) {
                    level = validLevelNew(cement, configModel, str, WaterWarningConfigType.CEMENT.getText(), DataUnit.percent_sign);
                    if (level != null && !ExcessDataLevel.ZERO.getValue().equals(level)) {
                        setCementResultMsg(aggregateModel, model, sb, msgModel, str, level);
                        aggregateModel.setIsPass(1);
                    }
                    resultModel.setCementLevel(level);
                    msgModel.setCementResult(level);
                    model.setCementLevel(level);
                    aggregateModel.setCementState(level != null && level > 0 ? 1 : 0);
                    aggregateModel.setCementLevel(level);

                    //水
                } else if (WaterWarningConfigType.WATER.getValue().equals(configModel.getNumber())) {
                    level = validLevelNew(water, configModel, str, WaterWarningConfigType.WATER.getText(), DataUnit.percent_sign);
                    if (level != null && !ExcessDataLevel.ZERO.getValue().equals(level)) {
                        setWaterResultAndMsg(aggregateModel, model, sb, msgModel, str, level);
                        aggregateModel.setIsPass(1);
                    }
                    resultModel.setWaterLevel(level);
                    msgModel.setWaterResult(level);
                    model.setWaterLevel(level);
                    aggregateModel.setWaterState(level != null && level > 0 ? 1 : 0);
                    aggregateModel.setWaterLevel(level);

                    //骨料
                } else if ("g1".equals(configModel.getNumber()) || "g2".equals(configModel.getNumber()) || "g3".equals(configModel.getNumber()) ||
                        "g4".equals(configModel.getNumber()) || "g5".equals(configModel.getNumber()) || "g6".equals(configModel.getNumber()) ||
                        "g7".equals(configModel.getNumber()) || "g8".equals(configModel.getNumber()) || "g9".equals(configModel.getNumber()) ||
                        "g10".equals(configModel.getNumber())) {

                    try {
                        String functionName = "get" + configModel.getNumber().toUpperCase();
                        Method mg = model.getClass().getMethod(functionName);
                        BigDecimal value = (BigDecimal) mg.invoke(model);

                        if (value != null) {
                            value = new BigDecimal((value.doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP);
                            level = validLevelNew(value, configModel, str, getConfigType(configModel.getNumber()), DataUnit.percent_sign);
                            setMetaDataGuliao(configModel.getNumber(), aggregateModel, value);
                            if (level != null && !ExcessDataLevel.ZERO.getValue().equals(level)) {
                                if (maxLevel < level) {
                                    maxLevel = level;
                                }
                                setGuliaoResultAndMsg(aggregateModel, model, sb, msgModel, str, configModel.getNumber(), level, maxLevel);
                            }

                            if (level != null) {
                                isAllNotNull = true;
                            } else {
                                setGuliaoResultAndMsgNoCofig(aggregateModel, configModel.getNumber(), null);
                            }

                            aggregateModel.setAggregateLevel(isAllNotNull ? maxLevel : null);
                            msgModel.setAggregateResult(isAllNotNull ? maxLevel : null);
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            //封装基本数据
            setMetaDataAggregate(aggregateModel, model);
            if (isOld) {
                aggregateModel.setDataId(model.getId());
                aggregateService.updateByDataId(aggregateModel);
            } else {
                aggregateService.insert(aggregateModel);
            }
        } else {

            WaterMetadataAggregateModel waterMetadataAggregateModel = calculationNoWarning(model, infoModel);
            if (isOld) {
                aggregateService.updateByDataId(waterMetadataAggregateModel);
            } else {
                aggregateService.insert(waterMetadataAggregateModel);
            }
        }

    }

    private WaterMetadataAggregateModel calculationNoWarning(WaterMetaDataModel model, WaterInfoModel infoModel) {
        double glWeight = getAggregateWeight(model, infoModel);

        WaterMetadataAggregateModel aggregateModel = new WaterMetadataAggregateModel();
        aggregateModel.setDataId(model.getId());
        aggregateModel.setAggregateWeight(new BigDecimal(glWeight));
        //aggregateModel.setIsPass(1);

        BigDecimal cement = new BigDecimal((model.getCement().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP);
        model.setCementProportion(cement);
        aggregateModel.setCement(cement);

        BigDecimal water = new BigDecimal((model.getWater().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP);
        aggregateModel.setWater(water);

        if (model.getG1() != null) {
            aggregateModel.setG1(new BigDecimal((model.getG1().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP));
        }
        if (model.getG2() != null) {
            aggregateModel.setG2(new BigDecimal((model.getG2().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP));
        }
        if (model.getG3() != null) {
            aggregateModel.setG3(new BigDecimal((model.getG3().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP));
        }
        if (model.getG4() != null) {
            aggregateModel.setG4(new BigDecimal((model.getG4().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP));
        }
        if (model.getG5() != null) {
            aggregateModel.setG5(new BigDecimal((model.getG5().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP));
        }
        if (model.getG6() != null) {
            aggregateModel.setG6(new BigDecimal((model.getG6().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP));
        }
        if (model.getG7() != null) {
            aggregateModel.setG7(new BigDecimal((model.getG7().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP));
        }
        if (model.getG8() != null) {
            aggregateModel.setG8(new BigDecimal((model.getG8().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP));
        }
        if (model.getG9() != null) {
            aggregateModel.setG9(new BigDecimal((model.getG9().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP));
        }
        if (model.getG10() != null) {
            aggregateModel.setG10(new BigDecimal((model.getG10().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP));
        }
        //封装基本数据
        setMetaDataAggregate(aggregateModel, model);
        return aggregateModel;
    }

    private void setMetaDataAggregate(WaterMetadataAggregateModel aggregateModel, WaterMetaDataModel model) {
        aggregateModel.setStationId(model.getStationId());
        aggregateModel.setFormulaId(model.getFormulaId());
        aggregateModel.setFormulaCode(model.getFormulaCode());
        aggregateModel.setBatchCode(model.getBatchCode());
        aggregateModel.setDataId(model.getId());
        aggregateModel.setTime(model.getTime());
        aggregateModel.setWeight(model.getWeight());
    }

    private void setMetaDataGuliao(String type, WaterMetadataAggregateModel aggregateModel, BigDecimal value) {
        switch (type) {
            case "g1":
                aggregateModel.setG1(value);
                break;
            case "g2":
                aggregateModel.setG2(value);
                break;
            case "g3":
                aggregateModel.setG3(value);
                break;
            case "g4":
                aggregateModel.setG4(value);
                break;
            case "g5":
                aggregateModel.setG5(value);
                break;
            case "g6":
                aggregateModel.setG6(value);
                break;
            case "g7":
                aggregateModel.setG7(value);
                break;
            case "g8":
                aggregateModel.setG8(value);
                break;
            case "g9":
                aggregateModel.setG9(value);
                break;
            case "g10":
                aggregateModel.setG10(value);
                break;
            default:
                break;
        }
    }


    private String getConfigType(String type) {
        String configType = "";
        switch (type) {
            case "g1":
                configType = WaterWarningConfigType.G1.getText();
                break;
            case "g2":
                configType = WaterWarningConfigType.G2.getText();
                break;
            case "g3":
                configType = WaterWarningConfigType.G3.getText();
                break;
            case "g4":
                configType = WaterWarningConfigType.G4.getText();
                break;
            case "g5":
                configType = WaterWarningConfigType.G5.getText();
                break;
            case "g6":
                configType = WaterWarningConfigType.G6.getText();
                break;
            case "g7":
                configType = WaterWarningConfigType.G7.getText();
                break;
            case "g8":
                configType = WaterWarningConfigType.G8.getText();
                break;
            case "g9":
                configType = WaterWarningConfigType.G9.getText();
                break;
            case "g10":
                configType = WaterWarningConfigType.G10.getText();
                break;

            default:
                break;
        }
        return configType;
    }

    /**
     * 设置水泥超标信息
     *
     * @param aggregateModel WaterMetadataAggregateModel
     * @param model          WaterMetaDataModel
     * @param sb             StringBuffer
     * @param msgModel       WaterWarningMessageModel
     * @param str            StringBuffer
     */
    private void setCementResultMsg(WaterMetadataAggregateModel aggregateModel, WaterMetaDataModel model, StringBuffer sb, WaterWarningMessageModel msgModel, StringBuffer str, Integer level) {
        str.append("；");
        aggregateModel.setCementMsg(str.toString());
        sb.append(str.toString());
        model.setIsPass(1);
        msgModel.setCementResult(level);
        msgModel.setCementMsg(str.toString());
    }

    /**
     * 设置水超标信息
     *
     * @param aggregateModel WaterMetadataAggregateModel
     * @param model          WaterMetaDataModel
     * @param sb             StringBuffer
     * @param msgModel       WaterWarningMessageModel
     * @param str            StringBuffer
     */
    private void setWaterResultAndMsg(WaterMetadataAggregateModel aggregateModel, WaterMetaDataModel model, StringBuffer sb, WaterWarningMessageModel msgModel, StringBuffer str, Integer level) {
        str.append("；");
        aggregateModel.setWaterMsg(str.toString());
        sb.append(str.toString());
        model.setIsPass(1);
        msgModel.setWaterResult(level);
        msgModel.setWaterMsg(str.toString());
    }

    /**
     * 设置水超标信息
     *
     * @param aggregateModel WaterMetadataAggregateModel
     * @param model          WaterMetaDataModel
     * @param sb             StringBuffer
     * @param msgModel       WaterWarningMessageModel
     * @param str            StringBuffer
     */
    private void setGuliaoResultAndMsg(WaterMetadataAggregateModel aggregateModel, WaterMetaDataModel model, StringBuffer sb,
                                       WaterWarningMessageModel msgModel, StringBuffer str, String configNumber, Integer level, Integer maxLevel) {
        str.append("；");
        switch (configNumber) {
            case "g1":
                aggregateModel.setG1Level(level);
                aggregateModel.setG1State(1);
                aggregateModel.setG1Msg(str.toString());
                break;
            case "g2":
                aggregateModel.setG2Level(level);
                aggregateModel.setG2State(1);
                aggregateModel.setG2Msg(str.toString());
                break;
            case "g3":
                aggregateModel.setG3Level(level);
                aggregateModel.setG3State(1);
                aggregateModel.setG3Msg(str.toString());
                break;
            case "g4":
                aggregateModel.setG4Level(level);
                aggregateModel.setG4State(1);
                aggregateModel.setG4Msg(str.toString());
                break;
            case "g5":
                aggregateModel.setG5Level(level);
                aggregateModel.setG5State(1);
                aggregateModel.setG5Msg(str.toString());
                break;
            case "g6":
                aggregateModel.setG6Level(level);
                aggregateModel.setG6State(1);
                aggregateModel.setG6Msg(str.toString());
                break;
            case "g7":
                aggregateModel.setG7Level(level);
                aggregateModel.setG7State(1);
                aggregateModel.setG7Msg(str.toString());
                break;
            case "g8":
                aggregateModel.setG8Level(level);
                aggregateModel.setG8State(1);
                aggregateModel.setG8Msg(str.toString());
                break;
            case "g9":
                aggregateModel.setG9Level(level);
                aggregateModel.setG9State(1);
                aggregateModel.setG9Msg(str.toString());
                break;
            case "g10":
                aggregateModel.setG10Level(level);
                aggregateModel.setG10State(1);
                aggregateModel.setG10Msg(str.toString());
                break;
            default:
                break;
        }
        msgModel.setAggregateResult(maxLevel);
        sb.append(str.toString());
        aggregateModel.setIsPass(1);
        model.setIsPass(1);
    }

    private void setGuliaoResultAndMsgNoCofig(WaterMetadataAggregateModel aggregateModel, String configNumber, Integer level) {
        switch (configNumber) {
            case "g1":
                aggregateModel.setG1Level(level);
                break;
            case "g2":
                aggregateModel.setG2Level(level);
                break;
            case "g3":
                aggregateModel.setG3Level(level);
                break;
            case "g4":
                aggregateModel.setG4Level(level);
                break;
            case "g5":
                aggregateModel.setG5Level(level);
                break;
            case "g6":
                aggregateModel.setG6Level(level);
                break;
            case "g7":
                aggregateModel.setG7Level(level);
                break;
            case "g8":
                aggregateModel.setG8Level(level);
                break;
            case "g9":
                aggregateModel.setG9Level(level);
                break;
            case "g10":
                aggregateModel.setG10Level(level);
                break;
            default:
                break;
        }
    }

    /**
     * 校验数据,计算各筛孔直径比率
     *
     * @param resultModel WaterMetadataResultModel
     * @param model WaterMetaDataModel
     * @param infoModel WaterInfoModel
     * @param formula WaterFormulaModel
     * @param sb StringBuffer
     */
    private WaterMetadataResultModel validDataForSieve(WaterMetadataResultModel resultModel, WaterMetaDataModel model, WaterInfoModel infoModel, WaterFormulaModel formula, StringBuffer sb, WaterWarningMessageModel msgModel) {
        int aggregateNum = infoModel.getAggregateNum();
        Map<String, Object> dataMap = BeanUtil.transBean2Map(model);
        StringBuffer sieveStr = new StringBuffer();
        //获取当前配方的筛孔配置信息
        List<WaterSieveSettingModel> sieveSettingModels = sieveSettingService.selectByFormulaId(formula.getId());
        if (!CollectionUtils.isEmpty(sieveSettingModels)) {
            msgModel.setSieveResult(0);
            //获取骨料重量
            double glWeight = getAggregateWeight(model, infoModel);

            //设置基础信息
            resultModel = setBaseResultModel(resultModel, model, infoModel, formula, glWeight);
            //计算各骨料比率值
            for (WaterSieveSettingModel settingModel : sieveSettingModels) {
                if (resultModel.getSieveVersion() == null) {
                    //记录计算时的筛孔设置数据版本
                    resultModel.setSieveVersion(settingModel.getDataVersion());
                    model.setSieveVersion(settingModel.getDataVersion());
                }
                Map<String, Object> setting = BeanUtil.transBean2Map(settingModel);
                double gl = 0;
                for (int i = 1; i <= aggregateNum; i++) {
                    BigDecimal guliao = (BigDecimal) dataMap.get("g" + i);
                    BigDecimal rate = (BigDecimal) setting.get("g" + i);
                    if (rate == null) {
                        rate = new BigDecimal(100);
                    }
                    gl += (guliao.doubleValue() * rate.doubleValue()) / 100;
                }

                //骨料比率值/总骨料重量==各筛孔比率直径
                BigDecimal result = new BigDecimal((gl / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP);
                Integer maxLevel = resultModel.getMaxLevel() == null ? 0 : resultModel.getMaxLevel();
                resultModel = setResultModel(resultModel, result, settingModel, maxLevel, sieveStr);
            }

            String suffix = ",";
            if (sieveStr.lastIndexOf(suffix) > -1) {
                String msg = "筛孔:" + sieveStr.substring(0, sieveStr.length() - 1) + "超标;";
                sb.append(msg);
                resultModel.setExcessMsg(sb.toString());
                model.setIsPass(1);
                resultModel.setIsPass(1);
            }
            msgModel.setSieveResult(resultModel.getGradationLevel());
            //保存筛孔率计算
            resultService.insert(resultModel);
        }
        return resultModel;
    }

    /**
     * 设置基础信息
     *
     * @param resultModel WaterMetadataResultModel
     * @param model WaterMetaDataModel
     * @param infoModel WaterInfoModel
     * @param formula WaterFormulaModel
     * @param glWeight double
     * @return WaterMetadataResultModel
     */
    private WaterMetadataResultModel setBaseResultModel(WaterMetadataResultModel resultModel, WaterMetaDataModel model, WaterInfoModel infoModel, WaterFormulaModel formula, double glWeight) {
        resultModel.setTime(model.getTime());
        resultModel.setFormulaId(formula.getId());
        resultModel.setDataId(model.getId());
        resultModel.setFormulaCode(model.getFormulaCode());
        resultModel.setAggregateWeight(new BigDecimal(glWeight).setScale(2, BigDecimal.ROUND_HALF_UP));
        resultModel.setWeight(new BigDecimal(glWeight + model.getCement().doubleValue() + model.getWater().doubleValue()).setScale(2, BigDecimal.ROUND_HALF_UP));
        resultModel.setStationId(infoModel.getId());
        return resultModel;
    }


    /**
     * 级配
     * 设置结果集
     *
     * @param resultModel WaterMetadataResultModel
     * @param result result
     * @param settingModel WaterSieveSettingModel
     * @param sb StringBuffer
     */
    private WaterMetadataResultModel setResultModel(WaterMetadataResultModel resultModel, BigDecimal result, WaterSieveSettingModel settingModel, Integer maxLevel, StringBuffer sb) {
        Integer level = 0;
        String content = "筛孔" + SieveDiameterType.getTextByValue(settingModel.getLevel()) + "mm直径";
        StringBuffer sieveStr = new StringBuffer();
        //校验级别
        level = validLevelNewForSieve(result, settingModel, sieveStr, DataUnit.percent_sign, content);
        //将bean转换为map,方便取值存值
        Map<String, Object> map = BeanUtil.transBean2Map(resultModel);
        map.put("sieve" + settingModel.getLevel(), result);
        map.put("sieve" + settingModel.getLevel() + "State", level);
        map.put("sieve" + settingModel.getLevel() + "Msg", sieveStr.toString());
        if (level > 0) {
            sb.append(SieveDiameterType.getTextByValue(settingModel.getLevel())).append(",");
            resultModel.setIsPass(1);
            if (resultModel.getGradationLevel() == null || resultModel.getGradationLevel().intValue() < level) {
                //标记最大级别
                map.put("gradationLevel", level);
            }
        }
        return BeanUtil.mapToBean(map, resultModel.getClass());
    }

    /**
     * 级配筛孔数据校验
     *
     * @param result BigDecimal
     * @param model WaterSieveSettingModel
     * @param sb StringBuffer
     * @param unit String
     * @param content String
     * @return Integer
     */
    private Integer validLevelNewForSieve(BigDecimal result, WaterSieveSettingModel model, StringBuffer sb, String unit, String content) {
        return validDataLevel(result, model.getFirstHigh(), model.getFirstLow(),
                model.getSecondHigh(), model.getSecondLow(),
                model.getThreeHigh(), model.getThreeLow(),
                sb, unit, content
        );
    }

    /**
     * 校验数据超标级别
     * <p>
     * 正常判断 区域计算图
     * --三级-->--)[--<=---二级---<---)[--<=---一级---<--)[----<=---正常范围----<=---](--<--一级---<=--](---<---二级---<=--](---三级----
     * ---------tLow----------------sLow--------------fLow-------targetValue-----fHigh-------------sHigh--------------tHigh----------
     *
     * @param result
     * @param firstHigh
     * @param firstLow
     * @param secondHigh
     * @param secondLow
     * @param threeHigh
     * @param threeLow
     * @param str
     * @param unit
     * @param content
     * @return
     */
    private Integer validDataLevel(BigDecimal result, BigDecimal firstHigh, BigDecimal firstLow,
                                   BigDecimal secondHigh, BigDecimal secondLow,
                                   BigDecimal threeHigh, BigDecimal threeLow,
                                   StringBuffer str, String unit, String content) {
        int level = ExcessDataLevel.ZERO.getValue();
        if (firstHigh == null && secondHigh == null && threeHigh == null && firstLow == null && secondLow == null && threeLow == null) {
            return null;
        }
        //判断三种级别设置相同按一级计算
        if (firstHigh.equals(secondHigh)
                && firstHigh.equals(threeHigh)
                && firstLow.equals(secondLow)
                && firstLow.equals(threeLow)
        ) {
            if (result.compareTo(firstHigh) > 0) {
                return setWarningMsg(result, content, unit, firstHigh, "超出上限", str, ExcessDataLevel.ONE.getValue());
            } else if (result.compareTo(firstLow) < 0) {
                return setWarningMsg(firstLow, content, unit, result, "超出下限", str, ExcessDataLevel.ONE.getValue());
            }
            return level;
        }
        //一级超标判断
        if (result.compareTo(firstHigh) > 0 && result.compareTo(secondHigh) <= 0) {
            return setWarningMsg(result, content, unit, firstHigh, "超出上限", str, ExcessDataLevel.ONE.getValue());
        } else if (result.compareTo(secondLow) >= 0 && result.compareTo(firstLow) < 0) {
            return setWarningMsg(firstLow, content, unit, result, "超出下限", str, ExcessDataLevel.ONE.getValue());
        }
        //二三级上下限值设置相同不做校验--重新校验一级数据
        if (secondHigh.equals(secondLow) || threeHigh.equals(threeLow)) {
            if (result.compareTo(firstHigh) > 0) {
                return setWarningMsg(result, content, unit, firstHigh, "超出上限", str, ExcessDataLevel.ONE.getValue());
            } else if (result.compareTo(firstLow) < 0) {
                return setWarningMsg(firstLow, content, unit, result, "超出下限", str, ExcessDataLevel.ONE.getValue());
            }
            return level;
        }
        //二三级相同按二级计算
        if (threeHigh.equals(secondHigh) && threeLow.equals(secondLow)) {
            if (result.compareTo(secondHigh) > 0) {
                return setWarningMsg(result, content, unit, firstHigh, "超出上限", str, ExcessDataLevel.TWO.getValue());
            } else if (result.compareTo(secondLow) < 0) {
                return setWarningMsg(firstLow, content, unit, result, "超出下限", str, ExcessDataLevel.TWO.getValue());
            }
            return level;
        }
        // 二三级数据校验
        if (result.compareTo(secondHigh) > 0 && result.compareTo(threeHigh) <= 0) {
            return setWarningMsg(result, content, unit, firstHigh, "超出上限", str, ExcessDataLevel.TWO.getValue());
        } else if (result.compareTo(threeLow) >= 0 && result.compareTo(secondLow) < 0) {
            return setWarningMsg(firstLow, content, unit, result, "超出下限", str, ExcessDataLevel.TWO.getValue());
        } else if (result.compareTo(threeHigh) > 0) {
            return setWarningMsg(result, content, unit, firstHigh, "超出上限", str, ExcessDataLevel.THREE.getValue());
        } else if (result.compareTo(threeLow) < 0) {
            return setWarningMsg(firstLow, content, unit, result, "超出下限", str, ExcessDataLevel.THREE.getValue());
        }
        return level;
    }

    /**
     * 新的数据级别算法
     *
     * @param result
     * @param configModel
     * @param str
     * @param content
     * @param unit
     */
    private Integer validLevelNew(BigDecimal result, WaterWarningConfigModel configModel, StringBuffer str, String content, String unit) {
        return validDataLevel(result, configModel.getFirstHigh(), configModel.getFirstLow(),
                configModel.getSecondHigh(), configModel.getSecondLow(),
                configModel.getThreeHigh(), configModel.getThreeLow(),
                str, unit, content);
    }

    /**
     * 生成告警信息
     *
     * @param max
     * @param type
     * @param unit
     * @param min
     * @param content
     * @return
     */
    private Integer setWarningMsg(BigDecimal max, String type, String unit, BigDecimal min, String content, StringBuffer str, Integer level) {
        double cha = new BigDecimal(max.doubleValue() - min.doubleValue()).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        if (str != null) {
            str.append(type).append(content).append(cha).append(unit);
        }
        return level;
    }

    /**
     * 校验设置拌合时间
     *
     * @param model
     */
    private void setMixingTime(WaterMetaDataModel model) {
        if (model.getEndTime() == null) {
            if (model.getMixTime() == null) {
                model.setMixTime(0L);
            }
            long endTime = model.getStartTime().getTime() + model.getMixTime() * 1000;
            model.setEndTime(new Date(endTime));
            model.setTime(model.getStartTime());
        } else {
            long timeDiff = model.getEndTime().getTime() - model.getStartTime().getTime();
            if (model.getTime() == null) {
                model.setTime(model.getStartTime());
            }
            model.setMixTime(timeDiff / 1000);
        }
    }

}
