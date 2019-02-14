package com.linghang.model.business.asphalt.param;

import com.linghang.model.business.asphalt.AsphaltMetadataResultModel;
import com.linghang.model.business.asphalt.AsphaltSieveSettingModel;

import java.util.List;

/**
 * 实时数据--级配列表结果集
 *
 * @author youp
 * @date 2018-12-21
 **/
public class AsphaltMetadataResultParamModel extends AsphaltMetadataResultModel {
    /**
     * 级配设置
     */
    private List<AsphaltSieveSettingModel> settingModels;
    /**
     * 配方信息
     */
    private AsphaltFormulaParamModel formulaModel;

    public List<AsphaltSieveSettingModel> getSettingModels() {
        return settingModels;
    }

    public void setSettingModels(List<AsphaltSieveSettingModel> settingModels) {
        this.settingModels = settingModels;
    }

    public AsphaltFormulaParamModel getFormulaModel() {
        return formulaModel;
    }

    public void setFormulaModel(AsphaltFormulaParamModel formulaModel) {
        this.formulaModel = formulaModel;
    }
}
