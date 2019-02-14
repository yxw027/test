package com.linghang.service.business.asphalt;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.enums.asphalt.AsphaltWarningConfigType;
import com.linghang.enums.asphalt.DataDeleteStatus;
import com.linghang.mapper.business.asphalt.AsphaltFormulaMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.base.UserModel;
import com.linghang.model.business.asphalt.AsphaltFormulaModel;
import com.linghang.model.business.asphalt.AsphaltInfoModel;
import com.linghang.model.business.asphalt.AsphaltSieveSettingModel;
import com.linghang.model.business.asphalt.AsphaltWarningConfigModel;
import com.linghang.model.business.asphalt.param.AsphaltFormulaParamModel;
import com.linghang.model.business.asphalt.param.AsphaltFormulaSieveModel;
import com.linghang.model.business.asphalt.param.FormulaInfoModel;
import com.linghang.util.BeanUtil;
import com.linghang.util.IdWorker;
import com.linghang.util.ListUtil;
import com.linghang.util.ResultUtil;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author wuchen on 2018/12/17.
 * 沥青配方表 Service
 */
@Service
public class AsphaltFormulaService {

    private Logger logger = LoggerFactory.getLogger(AsphaltFormulaService.class);


    @Autowired
    private AsphaltFormulaMapper asphaltFormulaMapper;
    @Autowired
    private AsphaltWarningConfigService configService;
    @Autowired
    private AsphaltInfoService infoService;
    @Autowired
    private AsphaltSieveSettingService settingService;

    /**
     * 级配数量
     */
    private static int sieveNum = 13;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.asphaltFormulaMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.asphaltFormulaMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(AsphaltFormulaModel model) {
        return model != null && this.asphaltFormulaMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<AsphaltFormulaModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        int limit = 100;
        if (models.size() > limit) {
            for (List<AsphaltFormulaModel> list : ListUtil.getSubList(models, limit)) {
                this.asphaltFormulaMapper.insertList(list);
            }
        } else {
            return this.asphaltFormulaMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(AsphaltFormulaModel model) {
        return model != null && this.asphaltFormulaMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public AsphaltFormulaModel selectById(Long id) {
        return id == null ? null : this.asphaltFormulaMapper.selectById(id);
    }

    /**
     * 按模型选择
     *
     * @param asphaltId
     */
    public List<AsphaltFormulaParamModel> selectAll(Long asphaltId) {
        AsphaltFormulaParamModel model = new AsphaltFormulaParamModel();
        model.setAsphaltId(asphaltId);
        List<AsphaltFormulaParamModel> list = this.asphaltFormulaMapper.selectAll(model);
        if (CollectionUtils.isEmpty(list)) {
            list = new ArrayList<>();
        }
        return list;
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(AsphaltFormulaModel model) {
        return !(model == null || model.getId() == null) && this.asphaltFormulaMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(AsphaltFormulaModel model) {
        return !(model == null || model.getId() == null) && this.asphaltFormulaMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(AsphaltFormulaModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 更新为不可见
     *
     * @param model
     * @return
     */
    public boolean updateUnVisible(AsphaltFormulaModel model) {
        return !(model == null || model.getId() == null) && this.asphaltFormulaMapper.updateUnVisible(model) == 1;
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<AsphaltFormulaModel> selectByOptions(KendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.asphaltFormulaMapper.selectByOptions(options));
    }

    /**
     * 根据配方编号查询配方信息
     *
     * @param formulaCode
     * @param asphaltId
     * @return
     */
    public AsphaltFormulaModel selectByFormulaCode(String formulaCode, Long asphaltId) {
        return asphaltFormulaMapper.selectByFormulaCode(formulaCode, asphaltId);
    }

    /**
     * 添加配方信息
     *
     * @param model
     * @return
     */
    public Map<String, Object> addFormula(FormulaInfoModel model) {
        AsphaltFormulaModel info = model.getInfo();
        AsphaltWarningConfigModel oilStone = model.getOilStone();
        AsphaltWarningConfigModel temperature = model.getTemperature();
        AsphaltWarningConfigModel asphaltTemp = model.getAsphaltTemperature();
        AsphaltWarningConfigModel aggTemp = model.getAggTemperature();
        AsphaltWarningConfigModel mixingTemp = model.getMixingTemperature();
        if (info != null) {
            info.setIsVisible(0);
            info.setDataVersion(1);
            info.setUpdateTime(new Date());
            UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
            info.setUpdateUser(userModel.getId());
            info.setPassRate(new BigDecimal(0));
            if (info.getId() != null) {
                AsphaltFormulaModel old = asphaltFormulaMapper.selectById(info.getId());
                if (old == null || DataDeleteStatus.DELETE.getValue().equals(old.getIsVisible())) {
                    return ResultUtil.getErrorResultMap("信息错误");
                }
                if (!old.getAsphaltNo().equals(info.getAsphaltNo())) {
                    if (asphaltFormulaMapper.selectByFormulaCode(info.getAsphaltNo(), info.getAsphaltId()) != null) {
                        return ResultUtil.getErrorResultMap("配方编号重复");
                    }
                }
                info.setDataVersion(old.getDataVersion() + 1);
                asphaltFormulaMapper.updateById(info);
            } else {
                if (asphaltFormulaMapper.selectByFormulaCode(info.getAsphaltNo(), info.getAsphaltId()) != null) {
                    return ResultUtil.getErrorResultMap("配方编号重复");
                }
                info.setId(IdWorker.nextId());
                asphaltFormulaMapper.insert(info);
            }
            if (validWarningConfig(info, oilStone, AsphaltWarningConfigType.OILSTONERATIO.getValue())) {
                return ResultUtil.getErrorResultMap("油石比信息错误");
            }
            if (validWarningConfig(info, temperature, AsphaltWarningConfigType.TEMPERATURE.getValue())) {
                return ResultUtil.getErrorResultMap("出料温度信息错误");
            }
            if (validWarningConfig(info, asphaltTemp, AsphaltWarningConfigType.ASPHALTTEMPERATURE.getValue())) {
                return ResultUtil.getErrorResultMap("沥青温度信息错误");
            }
            if (validWarningConfig(info, aggTemp, AsphaltWarningConfigType.AGGTEMPERATURE.getValue())) {
                return ResultUtil.getErrorResultMap("集料温度信息错误");
            }
            if (validWarningConfig(info, mixingTemp, AsphaltWarningConfigType.MIXINGTEMPERATURE.getValue())) {
                return ResultUtil.getErrorResultMap("拌合温度信息错误");
            }
            return ResultUtil.getSuccessResultMap("保存成功");
        }
        return ResultUtil.getErrorResultMap("信息错误");
    }

    /**
     * 校验告警信息信息
     *
     * @param info
     * @param temp
     * @return
     */
    public boolean validWarningConfig(AsphaltFormulaModel info, AsphaltWarningConfigModel temp, Integer type) {
        if (temp != null) {
            temp.setType(type);
            if (temp.getId() != null) {
                AsphaltWarningConfigModel old = configService.selectById(temp.getId());
                if (old == null || DataDeleteStatus.DELETE.getValue().equals(old.getIsVisible())) {
                    return true;
                }
                temp.setDataVersion(old.getDataVersion() + 1);
                configService.updateUnIsVisible(temp.getId());
            } else {
                temp.setDataVersion(1);
            }
            insertWarningConfig(info, temp);
        }
        return false;
    }

    /**
     * 保存告警配置信息
     *
     * @param info
     * @param oilStone
     */
    private void insertWarningConfig(AsphaltFormulaModel info, AsphaltWarningConfigModel oilStone) {
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        oilStone.setId(IdWorker.nextId());
        oilStone.setDataVersion(1);
        oilStone.setFormulaId(info.getId());
        oilStone.setIsVisible(0);
        oilStone.setUpdateTime(new Date());
        oilStone.setUpdateUser(userModel.getId());
        configService.insert(oilStone);
    }

    public Map<String, Object> getById(Long id) {
        AsphaltFormulaParamModel info = this.asphaltFormulaMapper.getById(id);
        return ResultUtil.getSuccessResultMap(info);
    }

    public AsphaltFormulaSieveModel getAsphaltInfoByFormulaId(Long formulaId) {
        AsphaltFormulaSieveModel model = new AsphaltFormulaSieveModel();
        AsphaltInfoModel infoModel = infoService.selectByFormulaId(formulaId);
        model.setInfo(infoModel);
        List<AsphaltSieveSettingModel> sieves = settingService.selectByFormulaId(formulaId);
        if (CollectionUtils.isEmpty(sieves)) {
            sieves = new ArrayList<>();
            for (int i = 1; i <= sieveNum; i++) {
                AsphaltSieveSettingModel settingModel = new AsphaltSieveSettingModel();
                settingModel.setLevel(i);
                settingModel.setUpdateTime(new Date());
                settingModel.setIsVisible(0);
                settingModel.setDataVersion(1);
                sieves.add(i - 1, settingModel);
            }
        }
        model.setSieves(sieves);
        return model;
    }

    /**
     * 获取油石比及温度配置详细信息
     *
     * @param id
     * @return
     */
    public AsphaltFormulaParamModel getDetailById(Long id) {
        return this.asphaltFormulaMapper.getDetailById(id);
    }

    public List<Map<String, Object>> getFormulaByAsphaltId(Long asphaltId) {
        return this.asphaltFormulaMapper.getFormulaByAsphaltId(asphaltId);
    }

    public List<AsphaltFormulaParamModel> searchFormulaByParam(Long asphaltId, String searchTime, String type) {
        String weight = "weight";
        String sieve = "sieve";
        String all = "all";
        if (weight.equals(type)) {
            return this.asphaltFormulaMapper.searchFormulaByParam(asphaltId, searchTime);
        } else if (sieve.equals(type)) {
            return this.asphaltFormulaMapper.searchFormulaBySieveParam(asphaltId, searchTime);
        } else if (all.equals(type)) {
            AsphaltFormulaModel model = new AsphaltFormulaModel();
            model.setAsphaltId(asphaltId);
            model.setIsVisible(0);
            List<AsphaltFormulaModel> list = this.asphaltFormulaMapper.selectByModel(model);
            List<Map<String, Object>> result = BeanUtil.formatBeanToKendoList(list, null, "name");
            return BeanUtil.transferListMapToListBean(result, AsphaltFormulaParamModel.class);
        } else {
            return new ArrayList<>();
        }
    }

    public List<Map<String, Object>> selectStatisticByStationId(Long stationId) {
        return asphaltFormulaMapper.selectStatisticByStationId(stationId);
    }
}