package com.linghang.model.business.water;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Entity基类
 *
 * @author linghang
 */
public class WaterEntity extends BaseEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 计划产量
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal planProduction;

    /*
    最新出料
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Date lastProductionTime;

    /**
     * 实际产量
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal actualProduction;

    /**
     * 生产进度
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal productionSchedule;

    /**
     * 合格率
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal yield;

    /**
     * 配方筛孔设置信息
     */
    private List<WaterSieveSettingModel> sieves;

    private BigDecimal countWeight;

    private Integer unprocessedData;

    private WaterFormulaModel formulaModel;

    public WaterFormulaModel getFormulaModel() {
        return formulaModel;
    }

    public void setFormulaModel(WaterFormulaModel formulaModel) {
        this.formulaModel = formulaModel;
    }

    public BigDecimal getPlanProduction() {
        return planProduction;
    }

    public void setPlanProduction(BigDecimal planProduction) {
        this.planProduction = planProduction;
    }

    public BigDecimal getActualProduction() {
        return actualProduction;
    }

    public void setActualProduction(BigDecimal actualProduction) {
        this.actualProduction = actualProduction;
    }

    public BigDecimal getProductionSchedule() {
        return productionSchedule;
    }

    public void setProductionSchedule(BigDecimal productionSchedule) {
        this.productionSchedule = productionSchedule;
    }

    public BigDecimal getYield() {
        return yield;
    }

    public void setYield(BigDecimal yield) {
        this.yield = yield;
    }

    public List<WaterSieveSettingModel> getSieves() {
        return sieves;
    }

    public void setSieves(List<WaterSieveSettingModel> sieves) {
        this.sieves = sieves;
    }

    public Date getLastProductionTime() {
        return lastProductionTime;
    }

    public void setLastProductionTime(Date lastProductionTime) {
        this.lastProductionTime = lastProductionTime;
    }

    public BigDecimal getCountWeight() {
        return countWeight;
    }

    public void setCountWeight(BigDecimal countWeight) {
        this.countWeight = countWeight;
    }

    public Integer getUnprocessedData() {
        return unprocessedData;
    }

    public void setUnprocessedData(Integer unprocessedData) {
        this.unprocessedData = unprocessedData;
    }
}
