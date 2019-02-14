package com.linghang.model.business.asphalt.param;

import com.linghang.enums.asphalt.AsphaltWarningConfigType;
import com.linghang.model.business.asphalt.AsphaltFormulaModel;
import com.linghang.model.business.asphalt.AsphaltSieveSettingModel;
import com.linghang.model.business.asphalt.AsphaltWarningConfigModel;

import java.math.BigDecimal;
import java.util.List;

/**
 * 配方参数
 *
 * @author youp
 * @date 2018-12-19
 **/
public class AsphaltFormulaParamModel extends AsphaltFormulaModel {
    /**
     * 温度告警信息
     */
    private AsphaltWarningConfigModel temp;
    /**
     * 油石比信息
     */
    private AsphaltWarningConfigModel oilStone;
    /**
     * 沥青温度告警信息
     */
    private AsphaltWarningConfigModel asphaltTemp;
    /**
     * 集料温度告警信息
     */
    private AsphaltWarningConfigModel aggTemp;

    /**
     * 拌合温度告警信息
     */
    private AsphaltWarningConfigModel mixingTemp;
    /**
     * 统计重量
     */
    private BigDecimal countWeight;

    private Integer tempType = AsphaltWarningConfigType.TEMPERATURE.getValue();
    private Integer oilStoneType = AsphaltWarningConfigType.OILSTONERATIO.getValue();
    private Integer asphaltTempType = AsphaltWarningConfigType.ASPHALTTEMPERATURE.getValue();
    private Integer aggTempType = AsphaltWarningConfigType.AGGTEMPERATURE.getValue();
    private Integer mixingTempType = AsphaltWarningConfigType.MIXINGTEMPERATURE.getValue();



    /**
     * 总数据条数
     */
    private Long allCount;
    /**
     * 数据通过校验的条数
     */
    private Long passCount;
    /**
     * 配方筛孔设置信息
     */
    private List<AsphaltSieveSettingModel> sieves;
    /**
     * 未处理数据数量
     */
    private Integer unprocessedData;

    public Long getAllCount() {
        return allCount;
    }

    public void setAllCount(Long allCount) {
        this.allCount = allCount;
    }

    public Long getPassCount() {
        return passCount;
    }

    public void setPassCount(Long passCount) {
        this.passCount = passCount;
    }

    public List<AsphaltSieveSettingModel> getSieves() {
        return sieves;
    }

    public void setSieves(List<AsphaltSieveSettingModel> sieves) {
        this.sieves = sieves;
    }

    public BigDecimal getCountWeight() {
        return countWeight;
    }

    public void setCountWeight(BigDecimal countWeight) {
        this.countWeight = countWeight;
    }

    public Integer getTempType() {
        return tempType;
    }

    public void setTempType(Integer tempType) {
        this.tempType = tempType;
    }

    public Integer getOilStoneType() {
        return oilStoneType;
    }

    public void setOilStoneType(Integer oilStoneType) {
        this.oilStoneType = oilStoneType;
    }

    public AsphaltWarningConfigModel getTemp() {
        return temp;
    }

    public void setTemp(AsphaltWarningConfigModel temp) {
        this.temp = temp;
    }

    public AsphaltWarningConfigModel getOilStone() {
        return oilStone;
    }

    public void setOilStone(AsphaltWarningConfigModel oilStone) {
        this.oilStone = oilStone;
    }

    public Integer getUnprocessedData() {
        return unprocessedData;
    }

    public void setUnprocessedData(Integer unprocessedData) {
        this.unprocessedData = unprocessedData;
    }

    public Integer getAsphaltTempType() {
        return asphaltTempType;
    }

    public void setAsphaltTempType(Integer asphaltTempType) {
        this.asphaltTempType = asphaltTempType;
    }

    public Integer getAggTempType() {
        return aggTempType;
    }

    public void setAggTempType(Integer aggTempType) {
        this.aggTempType = aggTempType;
    }

    public AsphaltWarningConfigModel getAsphaltTemp() {
        return asphaltTemp;
    }

    public void setAsphaltTemp(AsphaltWarningConfigModel asphaltTemp) {
        this.asphaltTemp = asphaltTemp;
    }

    public AsphaltWarningConfigModel getAggTemp() {
        return aggTemp;
    }

    public void setAggTemp(AsphaltWarningConfigModel aggTemp) {
        this.aggTemp = aggTemp;
    }

    public AsphaltWarningConfigModel getMixingTemp() {
        return mixingTemp;
    }

    public void setMixingTemp(AsphaltWarningConfigModel mixingTemp) {
        this.mixingTemp = mixingTemp;
    }

    public Integer getMixingTempType() {
        return mixingTempType;
    }

    public void setMixingTempType(Integer mixingTempType) {
        this.mixingTempType = mixingTempType;
    }
}
