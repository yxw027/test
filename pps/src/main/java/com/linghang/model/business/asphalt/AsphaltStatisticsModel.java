package com.linghang.model.business.asphalt;

import java.math.BigDecimal;

/**
 * @author wuchen
 * 沥青站各配方数据统计
 */
public class AsphaltStatisticsModel {

    /**
     * 沥青站Id
     */
    private Long asphaltId;

    /**
     * 配方Id
     */
    private Long formulaId;

    /**
     * 配方名称
     */
    private String formulaName;

    /**
     * 已生产批次
     */
    private Integer productionBatch;

    /**
     * 已生产重量
     */
    private BigDecimal productionWeight;

    /**
     * 不合格重量
     */
    private BigDecimal unqualifiedWeight;

    /**
     * 不合格批次
     */
    private Integer unqualifiedBatch;

    /**
     * 油石比超标
     */
    private BigDecimal oilStoneExceed;

    /**
     * 级配超标
     */
    private BigDecimal gradationExceed;

    /**
     * 温度超标
     */
    private BigDecimal temperatureExceed;

    public Long getAsphaltId() {
        return asphaltId;
    }

    public void setAsphaltId(Long asphaltId) {
        this.asphaltId = asphaltId;
    }

    public Long getFormulaId() {
        return formulaId;
    }

    public void setFormulaId(Long formulaId) {
        this.formulaId = formulaId;
    }

    public String getFormulaName() {
        return formulaName;
    }

    public void setFormulaName(String formulaName) {
        this.formulaName = formulaName;
    }

    public Integer getProductionBatch() {
        return productionBatch;
    }

    public void setProductionBatch(Integer productionBatch) {
        this.productionBatch = productionBatch;
    }

    public BigDecimal getProductionWeight() {
        return productionWeight;
    }

    public void setProductionWeight(BigDecimal productionWeight) {
        this.productionWeight = productionWeight;
    }

    public BigDecimal getUnqualifiedWeight() {
        return unqualifiedWeight;
    }

    public void setUnqualifiedWeight(BigDecimal unqualifiedWeight) {
        this.unqualifiedWeight = unqualifiedWeight;
    }

    public Integer getUnqualifiedBatch() {
        return unqualifiedBatch;
    }

    public void setUnqualifiedBatch(Integer unqualifiedBatch) {
        this.unqualifiedBatch = unqualifiedBatch;
    }

    public BigDecimal getOilStoneExceed() {
        return oilStoneExceed;
    }

    public void setOilStoneExceed(BigDecimal oilStoneExceed) {
        this.oilStoneExceed = oilStoneExceed;
    }

    public BigDecimal getGradationExceed() {
        return gradationExceed;
    }

    public void setGradationExceed(BigDecimal gradationExceed) {
        this.gradationExceed = gradationExceed;
    }

    public BigDecimal getTemperatureExceed() {
        return temperatureExceed;
    }

    public void setTemperatureExceed(BigDecimal temperatureExceed) {
        this.temperatureExceed = temperatureExceed;
    }
}
