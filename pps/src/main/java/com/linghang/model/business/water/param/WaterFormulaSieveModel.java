package com.linghang.model.business.water.param;

import com.linghang.model.business.water.WaterFormulaModel;
import com.linghang.model.business.water.WaterInfoModel;
import com.linghang.model.business.water.WaterSieveSettingModel;
import com.linghang.model.business.water.WaterWarningConfigModel;

import java.util.List;

/**
 * 配方设置筛孔返回结果封装--需要站点设置信息
 *
 * @author youp
 * @date 2018-12-19
 **/
public class WaterFormulaSieveModel {
    /**
     * 筛孔设置信息
     */
    private List<WaterWarningConfigModel> sieves;
    /**
     * 配方信息
     */
    private WaterInfoModel info;

    private WaterFormulaModel waterFormulaModel;

    private List<WaterSieveSettingModel> sieveSettings;

    public List<WaterWarningConfigModel> getSieves() {
        return sieves;
    }

    public void setSieves(List<WaterWarningConfigModel> sieves) {
        this.sieves = sieves;
    }

    public WaterInfoModel getInfo() {
        return info;
    }

    public void setInfo(WaterInfoModel info) {
        this.info = info;
    }

    public WaterFormulaModel getWaterFormulaModel() {
        return waterFormulaModel;
    }

    public void setWaterFormulaModel(WaterFormulaModel waterFormulaModel) {
        this.waterFormulaModel = waterFormulaModel;
    }

    public List<WaterSieveSettingModel> getSieveSettings() {
        return sieveSettings;
    }

    public void setSieveSettings(List<WaterSieveSettingModel> sieveSettings) {
        this.sieveSettings = sieveSettings;
    }
}
