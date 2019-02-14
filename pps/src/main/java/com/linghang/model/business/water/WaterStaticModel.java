package com.linghang.model.business.water;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.math.BigDecimal;

/**
 * @author dell
 * description:
 * date: 2018/12/19 19:02
 */
public class WaterStaticModel extends BaseEntity {

    /**
     * 站点ID
     */
    private Long stationId;
    /**
     * 配方
     */
    private String formula;
    /**
     * 生产批次
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String productBatches;
    /**
     * 生产总重
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal productWeight;
    /**
     * 不合格重量
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal unqualifiedWeight;
    /**
     * 不合格批次
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String unqualifiedBatches;
    /**
     * 合格标记 0为合格 1为不合格
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer qualifiedFlag;
    /**
     * 水泥超标批次
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String unqualifiedComentBatches;
    /**
     * 合格率
     */
    private String passRate;

    private String startTime;

    private String endTime;

    public String getPassRate() {
        return passRate;
    }

    public void setPassRate(String passRate) {
        this.passRate = passRate;
    }

    public String getFormula() {
        return formula;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }


    public BigDecimal getProductWeight() {
        return productWeight;
    }

    public void setProductWeight(BigDecimal productWeight) {
        this.productWeight = productWeight;
    }

    public BigDecimal getUnqualifiedWeight() {
        return unqualifiedWeight;
    }

    public void setUnqualifiedWeight(BigDecimal unqualifiedWeight) {
        this.unqualifiedWeight = unqualifiedWeight;
    }

    public Long getStationId() {
        return stationId;
    }

    public void setStationId(Long stationId) {
        this.stationId = stationId;
    }

    public Integer getQualifiedFlag() {
        return qualifiedFlag;
    }

    public void setQualifiedFlag(Integer qualifiedFlag) {
        this.qualifiedFlag = qualifiedFlag;
    }

    public String getProductBatches() {
        return productBatches;
    }

    public void setProductBatches(String productBatches) {
        this.productBatches = productBatches;
    }

    public String getUnqualifiedBatches() {
        return unqualifiedBatches;
    }

    public void setUnqualifiedBatches(String unqualifiedBatches) {
        this.unqualifiedBatches = unqualifiedBatches;
    }

    public String getUnqualifiedComentBatches() {
        return unqualifiedComentBatches;
    }

    public void setUnqualifiedComentBatches(String unqualifiedComentBatches) {
        this.unqualifiedComentBatches = unqualifiedComentBatches;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "WaterStaticModel{" +
                "stationId=" + stationId +
                ", formula='" + formula + '\'' +
                ", productBatches=" + productBatches +
                ", productWeight=" + productWeight +
                ", unqualifiedWeight=" + unqualifiedWeight +
                ", unqualifiedBatches=" + unqualifiedBatches +
                ", qualifiedFlag=" + qualifiedFlag +
                ", unqualifiedComentBatches=" + unqualifiedComentBatches +
                '}';
    }
}
