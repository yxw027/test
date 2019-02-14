package com.linghang.model;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author Dell on 2019/01/28.
 * 工艺明细表 Model
 */
public class CraftDetailModel implements Serializable {

    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */
    private Long id;


    /**
     * 工艺层级ID
     */
    private Long craftLayerId;


    /**
     * 工艺类型
     */
    private Integer craft;


    /**
     * 车辆类型
     */
    private Integer carType;


    /**
     * 摊铺厚度
     */
    private BigDecimal thickness;


    /**
     * 速度最小值
     */
    private BigDecimal speedMin;
    /**
     * 速度最大值
     */
    private BigDecimal speedMax;

    /**
     * 温度最小值
     */
    private Integer tempMin;


    /**
     * 温度最大值
     */
    private Integer tempMax;


    /**
     * 遍数最小值
     */
    private Integer timesMin;


    /**
     * 遍数最大值
     */
    private Integer timesMax;


    /**
     * 启用
     */
    private Integer enabled;

    public CraftDetailModel(Long id, Long craftLayerId, Integer craft, Integer carType, BigDecimal thickness, BigDecimal speedMin, Integer tempMin, Integer tempMax, Integer timesMin, Integer timesMax, Integer enabled) {
        this.id = id;
        this.craftLayerId = craftLayerId;
        this.craft = craft;
        this.carType = carType;
        this.thickness = thickness;
        this.speedMin = speedMin;
        this.tempMin = tempMin;
        this.tempMax = tempMax;
        this.timesMin = timesMin;
        this.timesMax = timesMax;
        this.enabled = enabled;
    }

    public CraftDetailModel() {

    }

    public BigDecimal getSpeedMax() {
        return speedMax;
    }

    public void setSpeedMax(BigDecimal speedMax) {
        this.speedMax = speedMax;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCraftLayerId() {
        return craftLayerId;
    }

    public void setCraftLayerId(Long craftLayerId) {
        this.craftLayerId = craftLayerId;
    }

    public Integer getCraft() {
        return craft;
    }

    public void setCraft(Integer craft) {
        this.craft = craft;
    }

    public Integer getCarType() {
        return carType;
    }

    public void setCarType(Integer carType) {
        this.carType = carType;
    }

    public BigDecimal getThickness() {
        return thickness;
    }

    public void setThickness(BigDecimal thickness) {
        this.thickness = thickness;
    }

    public BigDecimal getSpeedMin() {
        return speedMin;
    }

    public void setSpeedMin(BigDecimal speedMin) {
        this.speedMin = speedMin;
    }

    public Integer getTempMin() {
        return tempMin;
    }

    public void setTempMin(Integer tempMin) {
        this.tempMin = tempMin;
    }

    public Integer getTempMax() {
        return tempMax;
    }

    public void setTempMax(Integer tempMax) {
        this.tempMax = tempMax;
    }

    public Integer getTimesMin() {
        return timesMin;
    }

    public void setTimesMin(Integer timesMin) {
        this.timesMin = timesMin;
    }

    public Integer getTimesMax() {
        return timesMax;
    }

    public void setTimesMax(Integer timesMax) {
        this.timesMax = timesMax;
    }

    public Integer getEnabled() {
        return enabled;
    }

    public void setEnabled(Integer enabled) {
        this.enabled = enabled;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", craftLayerId=").append(craftLayerId);
        sb.append(", craft=").append(craft);
        sb.append(", carType=").append(carType);
        sb.append(", thickness=").append(thickness);
        sb.append(", speedMin=").append(speedMin);
        sb.append(", tempMin=").append(tempMin);
        sb.append(", tempMax=").append(tempMax);
        sb.append(", timesMin=").append(timesMin);
        sb.append(", timesMax=").append(timesMax);
        sb.append(", enabled=").append(enabled);
        sb.append("]");
        return sb.toString();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        CraftDetailModel other = (CraftDetailModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getCraftLayerId() == null ? other.getCraftLayerId() == null : this.getCraftLayerId().equals(other.getCraftLayerId()))
                && (this.getCraft() == null ? other.getCraft() == null : this.getCraft().equals(other.getCraft()))
                && (this.getCarType() == null ? other.getCarType() == null : this.getCarType().equals(other.getCarType()))
                && (this.getThickness() == null ? other.getThickness() == null : this.getThickness().equals(other.getThickness()))
                && (this.getSpeedMin() == null ? other.getSpeedMin() == null : this.getSpeedMin().equals(other.getSpeedMin()))
                && (this.getTempMin() == null ? other.getTempMin() == null : this.getTempMin().equals(other.getTempMin()))
                && (this.getTempMax() == null ? other.getTempMax() == null : this.getTempMax().equals(other.getTempMax()))
                && (this.getTimesMin() == null ? other.getTimesMin() == null : this.getTimesMin().equals(other.getTimesMin()))
                && (this.getTimesMax() == null ? other.getTimesMax() == null : this.getTimesMax().equals(other.getTimesMax()))
                && (this.getEnabled() == null ? other.getEnabled() == null : this.getEnabled().equals(other.getEnabled()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getCraftLayerId() == null) ? 0 : getCraftLayerId().hashCode());
        result = prime * result + ((getCraft() == null) ? 0 : getCraft().hashCode());
        result = prime * result + ((getCarType() == null) ? 0 : getCarType().hashCode());
        result = prime * result + ((getThickness() == null) ? 0 : getThickness().hashCode());
        result = prime * result + ((getSpeedMin() == null) ? 0 : getSpeedMin().hashCode());
        result = prime * result + ((getTempMin() == null) ? 0 : getTempMin().hashCode());
        result = prime * result + ((getTempMax() == null) ? 0 : getTempMax().hashCode());
        result = prime * result + ((getTimesMin() == null) ? 0 : getTimesMin().hashCode());
        result = prime * result + ((getTimesMax() == null) ? 0 : getTimesMax().hashCode());
        result = prime * result + ((getEnabled() == null) ? 0 : getEnabled().hashCode());
        return result;
    }
}