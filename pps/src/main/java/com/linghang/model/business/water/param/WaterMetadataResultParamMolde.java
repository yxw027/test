package com.linghang.model.business.water.param;

import com.linghang.model.business.water.WaterFormulaModel;
import com.linghang.model.business.water.WaterMetadataResultModel;
import com.linghang.model.business.water.WaterSieveSettingModel;

import java.util.List;

/**
 * @description: 水稳数据结果model
 * @author: xuqiang
 * @createDate: 2018-12-27 16:42
 **/
public class WaterMetadataResultParamMolde extends WaterMetadataResultModel {

    /**
     * 级配设置
     */
    private List<WaterSieveSettingModel> settingModels;


    private WaterFormulaModel waterFormulaModel;

    public WaterFormulaModel getWaterFormulaModel() {
        return waterFormulaModel;
    }

    public void setWaterFormulaModel(WaterFormulaModel waterFormulaModel) {
        this.waterFormulaModel = waterFormulaModel;
    }

    public List<WaterSieveSettingModel> getSettingModels() {
        return settingModels;
    }

    public void setSettingModels(List<WaterSieveSettingModel> settingModels) {
        this.settingModels = settingModels;
    }
}
