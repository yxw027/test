package com.linghang.service.business.water;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.linghang.mapper.business.water.WaterFormulaMapper;
import com.linghang.model.base.UserModel;
import com.linghang.model.business.water.WaterFormulaModel;
import com.linghang.model.business.water.WaterInfoModel;
import com.linghang.model.business.water.WaterSieveSettingModel;
import com.linghang.model.business.water.WaterWarningConfigModel;
import com.linghang.model.business.water.param.WaterFormulaSieveModel;
import com.linghang.util.Constant;
import com.linghang.util.IdWorker;
import com.linghang.util.ListUtil;
import com.linghang.util.StringUtil;
import org.apache.commons.collections.map.HashedMap;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

/**
 * Created by dell on 2018/12/19.
 * 沥青配方表 Service
 *
 * @author 田朋
 */
@Service
public class WaterFormulaService {

    @Autowired
    private WaterFormulaMapper waterFormulaMapper;

    @Autowired
    private WaterInfoService infoService;

    @Autowired
    private WaterSieveSettingService settingService;

    @Autowired
    private WaterWarningConfigService waterWarningConfigService;

    private static final String[] ARRAY_NUMBER = new String[]{"cement", "water", "g1", "g2", "g3", "g4", "g5", "g6", "g7", "g8", "g9", "g10"};

    private static final String KEY_INFO = "info";

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.waterFormulaMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.waterFormulaMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(WaterFormulaModel model) {
        return model != null && this.waterFormulaMapper.insert(model) == 1;
    }

    public List<WaterFormulaModel> selectAll(Long asphaltId) {
        WaterFormulaModel model = new WaterFormulaModel();
        model.setStationId(asphaltId);
        List<WaterFormulaModel> list = this.waterFormulaMapper.selectAll(model);
        if (CollectionUtils.isEmpty(list)) {
            list = new ArrayList<>();
        }
        return list;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<WaterFormulaModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > Constant.NUM_ONE_HUNDRED) {
            for (List<WaterFormulaModel> list : ListUtil.getSubList(models, Constant.NUM_ONE_HUNDRED)) {
                this.waterFormulaMapper.insertList(list);
            }
        } else {
            return this.waterFormulaMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(WaterFormulaModel model) {
        return model != null && this.waterFormulaMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public WaterFormulaModel selectById(Long id) {
        return id == null ? null : this.waterFormulaMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<WaterFormulaModel> selectByModel(WaterFormulaModel model) {
        return model == null ? new ArrayList<>(0) : this.waterFormulaMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(WaterFormulaModel model) {
        return !(model == null || model.getId() == null) && this.waterFormulaMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(WaterFormulaModel model) {
        return !(model == null || model.getId() == null) && this.waterFormulaMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(WaterFormulaModel model) {
        return !(model == null || model.getId() == null) && this.waterFormulaMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(WaterFormulaModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.waterFormulaMapper.insert(model) == 1;
        }
        return this.waterFormulaMapper.updateById(model) == 1;
    }

    public WaterFormulaSieveModel getWaterInfoByFormulaId(Long formulaId, String aggregateName) {
        WaterFormulaSieveModel model = new WaterFormulaSieveModel();
        WaterInfoModel infoModel = infoService.selectByFormulaId(formulaId);
        WaterFormulaModel waterFormulaModel = waterFormulaMapper.selectById(formulaId);
        model.setInfo(infoModel);
        List<WaterWarningConfigModel> waterWarningConfigModels = waterWarningConfigService.selectByFormulaId(formulaId);
        List<WaterWarningConfigModel> list = new ArrayList<>();
        String[] aggregateNameArray = new String[]{};
        if (!StringUtils.isEmpty(aggregateName)) {
            aggregateNameArray = aggregateName.split(",");
        }
        if (CollectionUtils.isEmpty(waterWarningConfigModels)) {
            for (int i = 0; i < aggregateNameArray.length; i++) {
                WaterWarningConfigModel settingModel = new WaterWarningConfigModel();
                settingModel.setLname(aggregateNameArray[i]);
                settingModel.setNumber(ARRAY_NUMBER[i]);
                list.add(settingModel);
            }
        } else {
            list.addAll(waterWarningConfigModels);
            if (waterWarningConfigModels.size() < aggregateNameArray.length) {
                for (int i = waterWarningConfigModels.size(); i < aggregateNameArray.length; i++) {
                    WaterWarningConfigModel settingModel = new WaterWarningConfigModel();
                    settingModel.setLname(aggregateNameArray[i]);
                    settingModel.setNumber(ARRAY_NUMBER[i]);
                    list.add(settingModel);
                }
            } else if (waterWarningConfigModels.size() > aggregateNameArray.length) {
                list = list.subList(0, aggregateNameArray.length);
            }
        }
        model.setSieves(list);
        model.setWaterFormulaModel(waterFormulaModel);
        return model;
    }


    private static final int ON_USE = 0;
    private static final int NOT_USE = 1;
    private static final int IS_VISIBLE = 0;
    private static final int NOT_VISIBLE = 1;

    @Transactional(rollbackFor = ExecutionException.class)
    public Map<String, Object> addFormula(Map<String, String> map) {
        Map<String, Object> resultMap = new HashedMap();
        if (map.get(KEY_INFO) == null || StringUtil.isEmpty(map.get(KEY_INFO))) {
            resultMap.put("status", false);
            resultMap.put("msg", "传入参数错误，无法进行新增，请刷新后重试！");
        }
        return insertFormulaInfo(map);
    }

    private Map<String, Object> insertFormulaInfo(Map<String, String> map) {
        Map<String, Object> resultMap = new HashedMap();
        WaterFormulaModel waterFormulaModel = JSON.parseObject(map.get("info"), new TypeReference<WaterFormulaModel>() {
        });
        if (waterFormulaModel.getType().equals(0)) {
            WaterFormulaModel waterDefaultFormulaModel1 = this.selectDefaultModelAndId(waterFormulaModel);
            if (waterDefaultFormulaModel1 != null) {
                resultMap.put("status", false);
                resultMap.put("msg", "该设备默认配方已经存在，修改类型后再提交！");
                return resultMap;
            }
        }
        List<WaterWarningConfigModel> waterWarningConfigModels = JSON.parseObject(map.get("configSet"), new TypeReference<List<WaterWarningConfigModel>>() {
        });
        waterFormulaModel.setRemarks(map.get("remark"));
        if (!checkParamIsAvailable(waterFormulaModel)) {
            resultMap.put("status", false);
            resultMap.put("msg", "该设备下配方编号已经存在，无法重复定义！");
            return resultMap;
        }

        if (waterFormulaModel.getId() != null) {
            waterFormulaModel = this.updateWaterFormulaModel(waterFormulaModel);
        } else {
            waterFormulaModel = this.insertWaterFormulaModel(waterFormulaModel);
        }
        insertWaterWarningConfigModels(waterFormulaModel, waterWarningConfigModels);

        resultMap.put("status", true);
        resultMap.put("msg", "配置添加成功！");
        return resultMap;
    }

    private boolean checkParamIsAvailable(WaterFormulaModel waterFormulaModel) {
        List<WaterFormulaModel> list = waterFormulaMapper.checkParamIsAvailable(waterFormulaModel);
        if (list.size() > 0) {
            return false;
        }
        return true;
    }

    private WaterFormulaModel updateWaterFormulaModel(WaterFormulaModel waterFormulaModel) {
        waterFormulaModel.setUpdateTime(new Date());
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        waterFormulaModel.setUpdateUser(userModel.getId());
        this.waterFormulaMapper.updateByIdSelective(waterFormulaModel);
        return waterFormulaModel;
    }

    private void insertWaterWarningConfigModels(WaterFormulaModel waterFormulaModel, List<WaterWarningConfigModel> waterWarningConfigModels) {
        int dataVersion = waterWarningConfigService.updateStatusByFormulaId(waterFormulaModel.getId(), IS_VISIBLE);
        for (int i = 0; i < waterWarningConfigModels.size(); i++) {
            waterWarningConfigModels.get(i).setId(IdWorker.nextId());
            waterWarningConfigModels.get(i).setIsVisible(IS_VISIBLE);
            waterWarningConfigModels.get(i).setUpdateUser(waterFormulaModel.getUpdateUser());
            waterWarningConfigModels.get(i).setUpdateTime(waterFormulaModel.getUpdateTime());
            waterWarningConfigModels.get(i).setDataVersion(dataVersion + 1);
            waterWarningConfigModels.get(i).setFormulaId(waterFormulaModel.getId());
        }
        waterWarningConfigService.insertList(waterWarningConfigModels);
    }

    private WaterFormulaModel insertWaterFormulaModel(WaterFormulaModel waterFormulaModel) {
        waterFormulaModel.setUpdateTime(new Date());
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        waterFormulaModel.setUpdateUser(userModel.getId());
        waterFormulaModel.setDataVersion(1);
        waterFormulaModel.setIsVisible(IS_VISIBLE);
        waterFormulaModel.setId(IdWorker.nextId());
        this.waterFormulaMapper.insert(waterFormulaModel);
        return waterFormulaModel;
    }

    public void updateIsAvailable(WaterFormulaModel model) {
        this.waterFormulaMapper.updateByIdSelective(new WaterFormulaModel(model.getId(), NOT_VISIBLE));
        this.waterWarningConfigService.updateStatusByFormulaId(model.getId(), NOT_VISIBLE);
        this.settingService.updateByIdSelective(new WaterSieveSettingModel(model.getId(), NOT_VISIBLE));
    }

    public WaterFormulaSieveModel getWaterFormulaSieveByFormulaId(Long formulaId) {
        WaterFormulaSieveModel model = new WaterFormulaSieveModel();
        WaterInfoModel infoModel = infoService.selectByFormulaId(formulaId);
        model.setInfo(infoModel);
        List<WaterSieveSettingModel> sieves = settingService.selectByFormulaId(formulaId);
        if (CollectionUtils.isEmpty(sieves)) {
            sieves = new ArrayList<>();
            for (int i = 1; i <= Constant.NUM_THIRTEEN; i++) {
                WaterSieveSettingModel settingModel = new WaterSieveSettingModel();
                settingModel.setLevel(i);
                settingModel.setUpdateTime(new Date());
                settingModel.setIsVisible(0);
                settingModel.setDataVersion(1);
                sieves.add(i - 1, settingModel);
            }
        }
        model.setSieveSettings(sieves);
        return model;
    }

    /**
     * 根据配方编号查询配方信息
     *
     * @param formulaCode
     * @return
     */
    public WaterFormulaModel selectByFormulaCode(String formulaCode, Long stationId) {
        return waterFormulaMapper.selectByFormulaCode(formulaCode, stationId);
    }

    /**
     * 获取指定站点默认配方
     *
     * @param stationId
     * @return
     */
    public WaterFormulaModel selectDefaultModel(Long stationId) {
        return waterFormulaMapper.selectDefaultModel(stationId);
    }

    public WaterFormulaModel selectDefaultModelAndId(WaterFormulaModel model) {
        return waterFormulaMapper.selectDefaultModelAndId(model);
    }

    public List<WaterFormulaSieveModel> searchFormulaByParam(Long stationId, String searchTime, String type) {
        String weight = "weight";
        if (weight.equals(type)) {
            return this.waterFormulaMapper.searchFormulaByParam(stationId, searchTime);
        } else if ("sieve".equals(type)) {
            return this.waterFormulaMapper.searchFormulaBySieveParam(stationId, searchTime);
        } else {
            return this.waterFormulaMapper.searchFormulaByAggregateParam(stationId, searchTime);
        }

    }

    public WaterFormulaModel selectDetailById(Long id) {
        return waterFormulaMapper.selectDetailById(id);
    }

    public List<Map<String, Object>> selectStatisticByStationId(Long stationId) {
        return waterFormulaMapper.selectStatisticByStationId(stationId);
    }
}