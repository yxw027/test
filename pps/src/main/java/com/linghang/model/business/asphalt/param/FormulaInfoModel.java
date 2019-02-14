package com.linghang.model.business.asphalt.param;

import com.linghang.model.business.asphalt.AsphaltFormulaModel;
import com.linghang.model.business.asphalt.AsphaltWarningConfigModel;

/**
 * 配方保存信息接收model
 *
 * @author youp
 * @date 2018-12-18
 **/
public class FormulaInfoModel {

    private AsphaltFormulaModel info;
    private AsphaltWarningConfigModel oilStone;
    private AsphaltWarningConfigModel temperature;
    private AsphaltWarningConfigModel asphaltTemperature;
    private AsphaltWarningConfigModel aggTemperature;
    private AsphaltWarningConfigModel mixingTemperature;


    public AsphaltFormulaModel getInfo() {
        return info;
    }

    public void setInfo(AsphaltFormulaModel info) {
        this.info = info;
    }

    public AsphaltWarningConfigModel getOilStone() {
        return oilStone;
    }

    public void setOilStone(AsphaltWarningConfigModel oilStone) {
        this.oilStone = oilStone;
    }

    public AsphaltWarningConfigModel getTemperature() {
        return temperature;
    }

    public void setTemperature(AsphaltWarningConfigModel temperature) {
        this.temperature = temperature;
    }

    public AsphaltWarningConfigModel getAsphaltTemperature() {
        return asphaltTemperature;
    }

    public void setAsphaltTemperature(AsphaltWarningConfigModel asphaltTemperature) {
        this.asphaltTemperature = asphaltTemperature;
    }

    public AsphaltWarningConfigModel getAggTemperature() {
        return aggTemperature;
    }

    public void setAggTemperature(AsphaltWarningConfigModel aggTemperature) {
        this.aggTemperature = aggTemperature;
    }

    public AsphaltWarningConfigModel getMixingTemperature() {
        return mixingTemperature;
    }

    public void setMixingTemperature(AsphaltWarningConfigModel mixingTemperature) {
        this.mixingTemperature = mixingTemperature;
    }
}
