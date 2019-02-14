package com.linghang.model.business.water;

import java.math.BigDecimal;

public class WaterStaticReportModel {


    /**
     * 手机
     */
    private String phone;


    private String asphaltName;

    private Long orgId;

    /**
     * 骨料仓名称
     */
    private String aggregateName;

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
     * 级配超标批次
     */
    private Integer sieveExceed;

    /**
     * 水泥超标批次
     */
    private Integer cementExceed;

    /**
     * 水超标批次
     */
    private Integer waterExceed;

    /**
     * 骨料超标批次
     */
    private Integer aggregateExceed;

    /**
     * 骨料1超标批次
     */
    private Integer g1Batch;
    /**
     * 骨料1超标批次
     */
    private Integer g2Batch;
    /**
     * 骨料1超标批次
     */
    private Integer g3Batch;
    /**
     * 骨料1超标批次
     */
    private Integer g4Batch;
    /**
     * 骨料1超标批次
     */
    private Integer g5Batch;
    /**
     * 骨料1超标批次
     */
    private Integer g6Batch;
    /**
     * 骨料1超标批次
     */
    private Integer g7Batch;
    /**
     * 骨料1超标批次
     */
    private Integer g8Batch;
    /**
     * 骨料1超标批次
     */
    private Integer g9Batch;
    /**
     * 骨料1超标批次
     */
    private Integer g10Batch;

    public String getAggregateName() {
        return aggregateName;
    }

    public void setAggregateName(String aggregateName) {
        this.aggregateName = aggregateName;
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

    public String getAsphaltName() {
        return asphaltName;
    }

    public void setAsphaltName(String asphaltName) {
        this.asphaltName = asphaltName;
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getSieveExceed() {
        return sieveExceed;
    }

    public void setSieveExceed(Integer sieveExceed) {
        this.sieveExceed = sieveExceed;
    }

    public Integer getCementExceed() {
        return cementExceed;
    }

    public void setCementExceed(Integer cementExceed) {
        this.cementExceed = cementExceed;
    }

    public Integer getWaterExceed() {
        return waterExceed;
    }

    public void setWaterExceed(Integer waterExceed) {
        this.waterExceed = waterExceed;
    }

    public Integer getAggregateExceed() {
        return aggregateExceed;
    }

    public void setAggregateExceed(Integer aggregateExceed) {
        this.aggregateExceed = aggregateExceed;
    }

    public Integer getG1Batch() {
        return g1Batch;
    }

    public void setG1Batch(Integer g1Batch) {
        this.g1Batch = g1Batch;
    }

    public Integer getG2Batch() {
        return g2Batch;
    }

    public void setG2Batch(Integer g2Batch) {
        this.g2Batch = g2Batch;
    }

    public Integer getG3Batch() {
        return g3Batch;
    }

    public void setG3Batch(Integer g3Batch) {
        this.g3Batch = g3Batch;
    }

    public Integer getG4Batch() {
        return g4Batch;
    }

    public void setG4Batch(Integer g4Batch) {
        this.g4Batch = g4Batch;
    }

    public Integer getG5Batch() {
        return g5Batch;
    }

    public void setG5Batch(Integer g5Batch) {
        this.g5Batch = g5Batch;
    }

    public Integer getG6Batch() {
        return g6Batch;
    }

    public void setG6Batch(Integer g6Batch) {
        this.g6Batch = g6Batch;
    }

    public Integer getG7Batch() {
        return g7Batch;
    }

    public void setG7Batch(Integer g7Batch) {
        this.g7Batch = g7Batch;
    }

    public Integer getG8Batch() {
        return g8Batch;
    }

    public void setG8Batch(Integer g8Batch) {
        this.g8Batch = g8Batch;
    }

    public Integer getG9Batch() {
        return g9Batch;
    }

    public void setG9Batch(Integer g9Batch) {
        this.g9Batch = g9Batch;
    }

    public Integer getG10Batch() {
        return g10Batch;
    }

    public void setG10Batch(Integer g10Batch) {
        this.g10Batch = g10Batch;
    }
}
