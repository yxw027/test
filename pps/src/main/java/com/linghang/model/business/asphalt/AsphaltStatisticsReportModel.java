package com.linghang.model.business.asphalt;

import java.math.BigDecimal;

/**
 * @author wuchen
 * 报表model
 */
public class AsphaltStatisticsReportModel extends AsphaltStatisticsModel {

    /**
     * 平均油石比
     */
    private BigDecimal averageOilStone;

    /**
     * 设计油石比
     */
    private BigDecimal designOilStone;

    /**
     * 平均温度
     */
    private BigDecimal averageTemperature;

    /**
     * 设计温度
     */
    private BigDecimal designTemperature;

    /**
     * 统计推送电话
     */
    private String phone;

    private String asphaltName;

    private Long orgId;

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public String getAsphaltName() {
        return asphaltName;
    }

    public void setAsphaltName(String asphaltName) {
        this.asphaltName = asphaltName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public BigDecimal getAverageOilStone() {
        return averageOilStone;
    }

    public void setAverageOilStone(BigDecimal averageOilStone) {
        this.averageOilStone = averageOilStone;
    }

    public BigDecimal getDesignOilStone() {
        return designOilStone;
    }

    public void setDesignOilStone(BigDecimal designOilStone) {
        this.designOilStone = designOilStone;
    }

    public BigDecimal getAverageTemperature() {
        return averageTemperature;
    }

    public void setAverageTemperature(BigDecimal averageTemperature) {
        this.averageTemperature = averageTemperature;
    }

    public BigDecimal getDesignTemperature() {
        return designTemperature;
    }

    public void setDesignTemperature(BigDecimal designTemperature) {
        this.designTemperature = designTemperature;
    }
}
