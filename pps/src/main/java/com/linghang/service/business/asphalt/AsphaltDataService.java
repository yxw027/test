package com.linghang.service.business.asphalt;

import com.linghang.enums.AlarmType;
import com.linghang.enums.OrgType;
import com.linghang.enums.WarningLevel;
import com.linghang.enums.asphalt.AsphaltWarningConfigType;
import com.linghang.enums.asphalt.DataUnit;
import com.linghang.enums.asphalt.ExcessDataLevel;
import com.linghang.enums.asphalt.SieveDiameterType;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.business.asphalt.*;
import com.linghang.model.business.continuous.ContinuousWarningModel;
import com.linghang.model.business.water.MachinePhoneNoteRecordModel;
import com.linghang.service.base.OrganizationService;
import com.linghang.service.business.continuous.ContinuousWarningService;
import com.linghang.service.business.water.MachinePhoneNoteRecordService;
import com.linghang.util.*;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 沥青数据接收计算
 *
 * @author youp
 * @date 2018-12-17
 **/
@Service
public class AsphaltDataService {
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private AsphaltInfoService infoService;
    @Autowired
    private AsphaltSieveSettingService sieveSettingService;
    @Autowired
    private AsphaltMetadataResultService resultService;
    @Autowired
    private AsphaltMetadataService metadataService;
    @Autowired
    private AsphaltFormulaService formulaService;
    @Autowired
    private AsphaltWarningConfigService configService;
    @Autowired
    private AsphaltPushSettingService pushSettingService;
    @Autowired
    private AsphaltWarningMessageService messageService;
    @Autowired
    private AsphaltWarningNoteConfigService asphaltWarningNoteConfigService;
    @Autowired
    private MachinePhoneNoteRecordService machinePhoneNoteRecordService;
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
     * @param model
     * @param isOld 是否处理已有数据
     * @return
     */
    public String receiveData(AsphaltMetadataModel model, boolean isOld) {
        if (model == null || model.getMixingMachineId() == null) {
            return FAIL;
        }
        model.setAsphaltId(model.getMixingMachineId());
        AsphaltInfoModel infoModel = infoService.selectById(model.getAsphaltId());
        if (infoModel == null) {
            System.out.println("站点信息错误");
            return FAIL;
        }
        if (isMaterialsNull(model, infoModel)) {
            System.out.println("存在null值--无效数据");
            return FAIL;
        }
        if (isRepeatData(model, isOld)) {
            System.out.println("重复数据");
            return FAIL;
        }
        setMixingTime(model);
        double glWeight = getAggregateWeight(model, infoModel);
        model.setCreateTime(new Date());
        model.setWeight(new BigDecimal(glWeight + model.getAsphalt().doubleValue()).setScale(2, BigDecimal.ROUND_HALF_UP));
        model.setAggregateWeight(new BigDecimal(glWeight).setScale(2, BigDecimal.ROUND_HALF_UP));
        AsphaltFormulaModel formulaModel = formulaService.selectByFormulaCode(model.getFormulaCode(), model.getAsphaltId());
        if (formulaModel != null) {
            model.setFormulaId(formulaModel.getId());
            if (isOld) {
                metadataService.updateById(model);
            } else {
                model.setId(IdWorker.nextId());
                metadataService.insert(model);
            }
            StringBuffer sb = new StringBuffer();
            AsphaltMetadataResultModel resultModel = new AsphaltMetadataResultModel();
            resultModel.setId(IdWorker.nextId());
            //新增超标信息
            AsphaltWarningMessageModel msgModel = new AsphaltWarningMessageModel();
            msgModel.setAsphaltId(formulaModel.getAsphaltId());
            msgModel.setDataId(model.getId());
            msgModel.setType(model.getFormulaCode());
            msgModel.setCreateTime(new Date());
            //油石比计算及温度
            calculationOilStoneAndTemplate(resultModel, model, infoModel, formulaModel, sb, msgModel);
            //筛孔数据校验
            resultModel = validDataForSieve(resultModel, model, infoModel, formulaModel, sb, msgModel);
            if (sb.length() > 0 && !StringUtils.isEmpty(resultModel.getExcessMsg())) {
                //推送消息
                List<OrganizationModel> project = organizationService.getProjectData(infoModel.getOrgId(), OrgType.PROJECT.getInteger());
                OrganizationModel org = organizationService.selectById(infoModel.getOrgId());
                StringBuffer head = new StringBuffer();
                head.append("【").append(project.get(0).getName()).append("】")
                        .append(org.getName()).append(infoModel.getName()).append("于")
                        .append(DatetimeUtil.formatDate(model.getTime(), "yyyy-MM-dd HH:mm:ss"));
                head.append(sb.toString());

                sendMsgToUser(head, formulaModel.getAsphaltId(), getStandardLevel(resultModel), infoModel);
            }
            //超标判断
            boolean oilStoneExcess = msgModel.getOilStoneResult() != null && msgModel.getOilStoneResult() > 0;
            boolean tempExcess = msgModel.getTempResult() != null && msgModel.getTempResult() > 0;
            boolean sieveExcess = msgModel.getSieveResult() != null && msgModel.getSieveResult() > 0;
            boolean asphaltTempExcess = msgModel.getAsphaltTempResult() != null && msgModel.getAsphaltTempResult() > 0;
            boolean aggTempExcess = msgModel.getAggTempResult() != null && msgModel.getAggTempResult() > 0;
            boolean mixingTempExcess = msgModel.getMixingTempResult() != null && msgModel.getMixingTempResult() > 0;
            if (oilStoneExcess || tempExcess || sieveExcess || asphaltTempExcess || aggTempExcess || mixingTempExcess) {
                //信息超标则插入数据库
                messageService.insert(msgModel);
            }
        } else {
            if (isOld) {
                metadataService.updateById(model);
            } else {
                model.setId(IdWorker.nextId());
                metadataService.insert(model);
            }
        }
        return SUCCESS;
    }

    private Integer getStandardLevel(AsphaltMetadataResultModel model) {
        List<Integer> list = new ArrayList<>();
        list.add(model.getTempLevel() == null ? 0 : model.getTempLevel());
        list.add(model.getAsphaltTempLevel() == null ? 0 : model.getAsphaltTempLevel());
        list.add(model.getAggTempLevel() == null ? 0 : model.getAggTempLevel());
        list.add(model.getGradationLevel() == null ? 0 : model.getGradationLevel());
        list.add(model.getOilStoneLevel() == null ? 0 : model.getOilStoneLevel());
        list.add(model.getMixingTempLevel() == null ? 0 : model.getMixingTempLevel());
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
     * @param model
     * @param isOld 是否旧数据处理
     * @return
     */
    private boolean isRepeatData(AsphaltMetadataModel model, boolean isOld) {
        if (isOld) {
            return false;
        }
        List<AsphaltMetadataModel> repeatData = metadataService.selectRepeatData(model);
        if (!CollectionUtils.isEmpty(repeatData)) {
            return true;
        }
        return false;
    }

    /**
     * 判断数据信息为null
     *
     * @param model
     * @param infoModel
     * @return
     */
    private boolean isMaterialsNull(AsphaltMetadataModel model, AsphaltInfoModel infoModel) {
        if (model.getTemperature() == null) {
            return true;
        }
        int powerNum = infoModel.getPowderNum();
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
        if (!isNull) {
            for (int i = 1; i <= powerNum; i++) {
                BigDecimal b = map.get("f" + i) == null ? null : (BigDecimal) map.get("f" + i);
                if (b == null) {
                    isNull = true;
                    break;
                }
            }
        }
        return isNull;
    }

    /**
     * 推送短信消息到用户
     *
     * @param sb
     * @param asphaltId
     */
    private void sendMsgToUser(StringBuffer sb, Long asphaltId, Integer level, AsphaltInfoModel infoModel) {
        //获取该拌合机项目
        OrganizationModel projectModel = organizationService.getProject(infoModel.getOrgId());
        //获取项目下配置
        ContinuousWarningModel mixConfig = continuousWarningService.getMixConfig(projectModel.getId(), AlarmType.ASPHALT.getInteger());
        if (mixConfig != null){
            List<Integer> excelLevel = new ArrayList<>();
            List<Integer> numbers = new ArrayList<>();
            //获取超标级别
            try {
                excelLevel = MixingUtil.getExcelLevel(asphaltId, level, mixConfig, excelLevel, numbers,AlarmType.ASPHALT.getInteger(),resultService,null);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //如果设置了连续盘数，未满足超标不发送
            if (excelLevel.size() == 0){
                return;
            }
            for (Integer excel : excelLevel) {
                StringBuffer excelMsg = new StringBuffer();
                excelMsg.append(sb);
                //连续盘数预警信息追加
                MixingUtil.setExcelMsg(excelMsg, level, mixConfig, excel, numbers);
                sendPhoneNote(excelMsg, asphaltId, excel, infoModel, projectModel);
            }
            return;
        }
        sendPhoneNote(sb, asphaltId, level, infoModel, projectModel);
    }

    private void sendPhoneNote(StringBuffer sb, Long asphaltId, Integer level, AsphaltInfoModel infoModel, OrganizationModel projectModel) {
        List<AsphaltWarningNoteConfigModel> asphaltPhone = asphaltWarningNoteConfigService.getAsphaltPhone(asphaltId.toString(), level);
        String phones = "";
        if (!StringUtils.isEmpty(asphaltPhone)) {
            for (int i = 0; i < asphaltPhone.size(); i++) {
                phones += asphaltPhone.get(i).getPhone();
                if (i != asphaltPhone.size() - 1) {
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
            machinePhoneNoteRecordService.insert(new MachinePhoneNoteRecordModel(2, "", phones, infoModel.getName(), sb.toString(), new Date(), projectModel.getName(), success, "实时数据"));
        }
    }

    /**
     * 计算油石比及温度
     *
     * @param resultModel
     * @param model
     * @param infoModel
     * @param sb
     * @param msgModel
     */
    private void calculationOilStoneAndTemplate(AsphaltMetadataResultModel resultModel, AsphaltMetadataModel model, AsphaltInfoModel infoModel, AsphaltFormulaModel asphalt, StringBuffer sb, AsphaltWarningMessageModel msgModel) {
        double glWeight = getAggregateWeight(model, infoModel);
        BigDecimal oilStone = new BigDecimal((model.getAsphalt().doubleValue() / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP);
        model.setOilStoneProportion(oilStone);
        resultModel.setOilStoneProportion(oilStone);
        resultModel.setTemperature(model.getTemperature() == null ? BigDecimal.ZERO : model.getTemperature().setScale(2, BigDecimal.ROUND_HALF_UP));
        resultModel.setAsphaltTemperature(model.getAsphaltTemperature() == null ? BigDecimal.ZERO : model.getAsphaltTemperature().setScale(2, BigDecimal.ROUND_HALF_UP));
        resultModel.setAggTemperature(model.getAggregateTemperature() == null ? BigDecimal.ZERO : model.getAggregateTemperature().setScale(2, BigDecimal.ROUND_HALF_UP));
        resultModel.setMixingTemperature(model.getMixingTemperature() == null ? BigDecimal.ZERO : model.getMixingTemperature().setScale(2, BigDecimal.ROUND_HALF_UP));
        List<AsphaltWarningConfigModel> list = configService.selectByFormulaId(asphalt.getId());
        if (!CollectionUtils.isEmpty(list)) {
            for (AsphaltWarningConfigModel configModel : list) {
                Integer level = ExcessDataLevel.ZERO.getValue();
                StringBuffer str = new StringBuffer();
                //校验油石比及温度是否超标
                if (AsphaltWarningConfigType.OILSTONERATIO.getValue().equals(configModel.getType())) {
                    level = validLevelNew(oilStone, configModel, str, AsphaltWarningConfigType.OILSTONERATIO.getText(), DataUnit.percent_sign);
                    if (level != null && !ExcessDataLevel.ZERO.getValue().equals(level)) {
                        setOilStoneResultMsg(resultModel, model, sb, msgModel, str, level);
                    } else {
                        msgModel.setOilStoneResult(level);
                    }
                    resultModel.setOilStoneLevel(level);
                    model.setOilStoneLevel(level);
                } else if (AsphaltWarningConfigType.TEMPERATURE.getValue().equals(configModel.getType())) {
                    level = validLevelNew(model.getTemperature() == null ? new BigDecimal("0") : model.getTemperature(), configModel, str, AsphaltWarningConfigType.TEMPERATURE.getText(), DataUnit.temperature);
                    if (level != null && !ExcessDataLevel.ZERO.getValue().equals(level)) {
                        setTempResultAndMsg(resultModel, model, sb, msgModel, str, level, configModel.getType());
                    } else {
                        msgModel.setTempResult(level);
                    }
                    resultModel.setTempLevel(level);
                    model.setTempLevel(level);
                } else if (AsphaltWarningConfigType.ASPHALTTEMPERATURE.getValue().equals(configModel.getType())) {
                    level = validLevelNew(model.getAsphaltTemperature() == null ? new BigDecimal("0") : model.getAsphaltTemperature(), configModel, str, AsphaltWarningConfigType.ASPHALTTEMPERATURE.getText(), DataUnit.temperature);
                    if (level != null && !ExcessDataLevel.ZERO.getValue().equals(level)) {
                        setTempResultAndMsg(resultModel, model, sb, msgModel, str, level, configModel.getType());
                    } else {
                        msgModel.setAsphaltTempResult(level);
                    }
                    resultModel.setAsphaltTempLevel(level);
                    model.setAsphaltTempLevel(level);
                } else if (AsphaltWarningConfigType.AGGTEMPERATURE.getValue().equals(configModel.getType())) {
                    level = validLevelNew(model.getAggregateTemperature() == null ? new BigDecimal("0") : model.getAggregateTemperature(), configModel, str, AsphaltWarningConfigType.AGGTEMPERATURE.getText(), DataUnit.temperature);
                    if (level != null && !ExcessDataLevel.ZERO.getValue().equals(level)) {
                        setTempResultAndMsg(resultModel, model, sb, msgModel, str, level, configModel.getType());
                    } else {
                        msgModel.setAggTempResult(level);
                    }
                    resultModel.setAggTempLevel(level);
                    model.setAggTempLevel(level);
                } else if (AsphaltWarningConfigType.MIXINGTEMPERATURE.getValue().equals(configModel.getType())) {
                    level = validLevelNew(model.getMixingTemperature() == null ? new BigDecimal("0") : model.getMixingTemperature(), configModel, str, AsphaltWarningConfigType.MIXINGTEMPERATURE.getText(), DataUnit.temperature);
                    if (level != null && !ExcessDataLevel.ZERO.getValue().equals(level)) {
                        setTempResultAndMsg(resultModel, model, sb, msgModel, str, level, configModel.getType());
                    } else {
                        msgModel.setMixingTempResult(level);
                    }
                    resultModel.setMixingTempLevel(level);
                    model.setMixingTempLevel(level);
                }
                resultModel.setExcessMsg(sb.toString());
            }
        }
    }

    /**
     * 设置油石比超标信息
     *
     * @param resultModel
     * @param model
     * @param sb
     * @param msgModel
     * @param str
     * @param level
     */
    private void setOilStoneResultMsg(AsphaltMetadataResultModel resultModel, AsphaltMetadataModel model, StringBuffer sb, AsphaltWarningMessageModel msgModel, StringBuffer str, int level) {
        str.append(";");
        resultModel.setOilStoneMsg(str.toString());
        sb.append(str.toString());
        resultModel.setIsPass(1);
        model.setIsPass(1);
        msgModel.setOilStoneResult(level);
        msgModel.setOilStoneMsg(str.toString());
    }

    /**
     * 设置温度超标信息
     *
     * @param resultModel
     * @param model
     * @param sb
     * @param msgModel
     * @param str
     * @param level
     * @param type
     */
    private void setTempResultAndMsg(AsphaltMetadataResultModel resultModel, AsphaltMetadataModel model, StringBuffer sb, AsphaltWarningMessageModel msgModel, StringBuffer str, int level, Integer type) {
        str.append(";");
        sb.append(str.toString());
        resultModel.setIsPass(1);
        model.setIsPass(1);
        if (AsphaltWarningConfigType.TEMPERATURE.getValue().equals(type)) {
            resultModel.setTempMsg(str.toString());
            msgModel.setTempResult(level);
            msgModel.setTempMsg(str.toString());
        } else if (AsphaltWarningConfigType.ASPHALTTEMPERATURE.getValue().equals(type)) {
            resultModel.setAsphaltTempMsg(str.toString());
            msgModel.setAsphaltTempResult(level);
            msgModel.setAsphaltTempMsg(str.toString());
        } else if (AsphaltWarningConfigType.AGGTEMPERATURE.getValue().equals(type)) {
            resultModel.setAggTempMsg(str.toString());
            msgModel.setAggTempResult(level);
            msgModel.setAggTempMsg(str.toString());
        } else if (AsphaltWarningConfigType.MIXINGTEMPERATURE.getValue().equals(type)) {
            resultModel.setMixingTempMsg(str.toString());
            msgModel.setMixingTempResult(level);
            msgModel.setMixingTempMsg(str.toString());
        }

    }

    /**
     * 获取数据骨料总重量--无沥青重量
     *
     * @param model
     * @param infoModel
     * @return
     */
    public double getAggregateWeight(AsphaltMetadataModel model, AsphaltInfoModel infoModel) {
        int aggregateNum = infoModel.getAggregateNum();
        int powderNum = infoModel.getPowderNum();
        Map<String, Object> dataMap = BeanUtil.transBean2Map(model);
        double glWeight = 0;
        for (int i = 1; i <= aggregateNum; i++) {
            BigDecimal guliao = (BigDecimal) dataMap.get("g" + i);
            glWeight += guliao.doubleValue();
        }
        for (int i = 1; i <= powderNum; i++) {
            BigDecimal fenliao = (BigDecimal) dataMap.get("f" + i);
            glWeight += fenliao.doubleValue();
        }
        return glWeight;
    }

    /**
     * 校验数据,计算各筛孔直径比率
     *
     * @param resultModel
     * @param model
     * @param infoModel
     * @param formula
     * @param sb
     * @param msgModel
     */
    private AsphaltMetadataResultModel validDataForSieve(AsphaltMetadataResultModel resultModel, AsphaltMetadataModel model, AsphaltInfoModel infoModel, AsphaltFormulaModel formula, StringBuffer sb, AsphaltWarningMessageModel msgModel) {
        int aggregateNum = infoModel.getAggregateNum();
        int powderNum = infoModel.getPowderNum();
        StringBuffer sieveStr = new StringBuffer();
        Map<String, Object> dataMap = BeanUtil.transBean2Map(model);
        //获取当前配方的筛孔配置信息
        List<AsphaltSieveSettingModel> sieveSettingModels = sieveSettingService.selectByFormulaId(formula.getId());
        if (!CollectionUtils.isEmpty(sieveSettingModels)) {
            double glWeight = getAggregateWeight(model, infoModel);
            resultModel = setBaseResultModel(resultModel, model, infoModel, formula, glWeight);
            Integer maxLevel = 0;
            //计算各骨料比率值
            for (AsphaltSieveSettingModel settingModel : sieveSettingModels) {
                if (resultModel.getSieveVersion() == null) {
                    //记录计算时的筛孔设置数据版本
                    resultModel.setSieveVersion(settingModel.getDataVersion());
                }
                Map<String, Object> setting = BeanUtil.transBean2Map(settingModel);
                double gl = 0;
                for (int i = 1; i <= aggregateNum; i++) {
                    BigDecimal guliao = (BigDecimal) dataMap.get("g" + i);
                    BigDecimal rate = (BigDecimal) setting.get("g" + i);
                    gl += (guliao.doubleValue() * rate.doubleValue()) / 100;
                }
                for (int i = 1; i <= powderNum; i++) {
                    BigDecimal fenliao = (BigDecimal) dataMap.get("f" + i);
                    BigDecimal rate = (BigDecimal) setting.get("f" + i);
                    gl += (fenliao.doubleValue() * rate.doubleValue()) / 100;
                }
                //骨料比率值/总骨料重量==各筛孔比率直径
                BigDecimal result = new BigDecimal((gl / glWeight) * 100).setScale(2, BigDecimal.ROUND_HALF_UP);
                resultModel = setResultModel(resultModel, result, settingModel, sieveStr);
            }
            String suffix = ",";
            if (sieveStr != null && sieveStr.lastIndexOf(suffix) > -1) {
                String msg = "筛孔:" + sieveStr.substring(0, sieveStr.length() - 1) + "超标;";
                sb.append(msg);
                model.setIsPass(1);
                model.setGradationLevel(resultModel.getGradationLevel());
                resultModel.setExcessMsg(sb.toString());
                resultModel.setIsPass(1);
                msgModel.setSieveMsg(msg);
                msgModel.setSieveResult(resultModel.getGradationLevel());
            } else {
                model.setGradationLevel(0);
                msgModel.setSieveResult(0);
            }
            //保存筛孔率计算
            resultService.insert(resultModel);
            metadataService.updateById(model);
        }
        return resultModel;
    }

    /**
     * 设置基础信息
     *
     * @param resultModel
     * @param model
     * @param infoModel
     * @param formula
     * @param glWeight
     * @return
     */
    private AsphaltMetadataResultModel setBaseResultModel(AsphaltMetadataResultModel resultModel, AsphaltMetadataModel model, AsphaltInfoModel infoModel, AsphaltFormulaModel formula, double glWeight) {
        resultModel.setTime(model.getTime());
        resultModel.setFormulaId(formula.getId());
        resultModel.setDataId(model.getId());
        resultModel.setFormulaCode(model.getFormulaCode());
        resultModel.setTemperature(model.getTemperature().setScale(2, BigDecimal.ROUND_HALF_UP));
        resultModel.setAggregateWeight(new BigDecimal(glWeight).setScale(2, BigDecimal.ROUND_HALF_UP));
        resultModel.setWeight(new BigDecimal(glWeight + model.getAsphalt().doubleValue()).setScale(2, BigDecimal.ROUND_HALF_UP));
        resultModel.setAsphalt(model.getAsphalt().setScale(2, BigDecimal.ROUND_HALF_UP));
        resultModel.setAsphaltId(infoModel.getId());
        return resultModel;
    }

    /**
     * 超标数据等级
     * 设置结果集
     *
     * @param resultModel
     * @param result
     * @param settingModel
     * @param sb
     */
    private AsphaltMetadataResultModel setResultModel(AsphaltMetadataResultModel resultModel, BigDecimal result, AsphaltSieveSettingModel settingModel, StringBuffer sb) {
        Integer level = 0;
        String content = "筛孔" + SieveDiameterType.getTextByValue(settingModel.getLevel()) + "mm直径";
        StringBuffer sieveStr = new StringBuffer();
        //校验级别
        level = validLevelNewForSieve(result, settingModel, sieveStr, DataUnit.percent_sign, content);
        //将bean转换为map,方便取值存值
        Map<String, Object> map = BeanUtil.transBean2Map(resultModel);
        map.put("sieve" + settingModel.getLevel().intValue(), result);
        map.put("sieve" + settingModel.getLevel().intValue() + "State", level);
        map.put("sieve" + settingModel.getLevel().intValue() + "Msg", sieveStr.toString());
        if (level != null && level.intValue() > 0) {
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
     * @param result
     * @param model
     * @param sb
     * @param unit
     * @param content
     * @return
     */
    private Integer validLevelNewForSieve(BigDecimal result, AsphaltSieveSettingModel model, StringBuffer sb, String unit, String content) {
        return validDataLevel(result, model.getFirstHigh(), model.getFirstLow(),
                model.getSecondHigh(), model.getSecondLow(),
                model.getThreeHigh(), model.getThreeLow(),
                sb, unit, content
        );
    }

    /**
     * 校验数据超标级别
     * <p>
     * 数据超标判断区域计算图
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
        if (firstHigh.equals(secondHigh) && firstHigh.equals(threeHigh) && firstLow.equals(secondLow) && firstLow.equals(threeLow)) {
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
    private Integer validLevelNew(BigDecimal result, AsphaltWarningConfigModel configModel, StringBuffer str, String content, String unit) {
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
    private void setMixingTime(AsphaltMetadataModel model) {
        if (model.getEndTime() == null) {
            if (model.getMixingTime() == null) {
                model.setMixingTime(0L);
            }
            long endTime = model.getStartTime().getTime() + model.getMixingTime() * 1000;
            model.setEndTime(new Date(endTime));
            model.setTime(model.getStartTime());
        } else {
            long timeDiff = model.getEndTime().getTime() - model.getStartTime().getTime();
            if (model.getTime() == null) {
                model.setTime(model.getStartTime());
            }
            model.setMixingTime((long) (timeDiff / 1000));
        }
    }
}
