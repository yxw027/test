package com.linghang.model;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * Created by i_it on 2019/01/09.
 * 桩号详情列表 Model
 */
public class StakeModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 路段桩号ID
     */
    private Long stakeGroupId;

    /**
     * 桩号
     */
    private String stakeNo;

    /**
     * 北京54-x
     */
    private BigDecimal x;

    /**
     * 北京54-y
     */
    private BigDecimal y;

    /**
     * WGS84_经度
     */
    private Double lon;

    /**
     * WGS84_纬度
     */
    private Double lat;

    /**
     * 桩号里程
     */
    private Integer mile;

    /**
     * 左面层
     */
    private BigDecimal leftLayer;

    /**
     * 左上基层
     */
    private BigDecimal leftUpperLevel;

    /**
     * 左下基层
     */
    private BigDecimal leftLowestLevel;

    /**
     * 左底基层
     */
    private BigDecimal leftSubbase;

    /**
     * 右面层
     */
    private BigDecimal rightLayer;

    /**
     * 右上基层
     */
    private BigDecimal rightUpperLevel;

    /**
     * 右下基层
     */
    private BigDecimal rightLowestLevel;

    /**
     * 右底基层
     */
    private BigDecimal rightSubbase;

    /**
     * 桩号类型
     */
    private String stakeType;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getStakeGroupId() {
        return stakeGroupId;
    }

    public void setStakeGroupId(Long stakeGroupId) {
        this.stakeGroupId = stakeGroupId;
    }

    public String getStakeNo() {
        return stakeNo;
    }

    public void setStakeNo(String stakeNo) {
        this.stakeNo = stakeNo == null ? null : stakeNo.trim();
    }

    public BigDecimal getX() {
        return x;
    }

    public void setX(BigDecimal x) {
        this.x = x;
    }

    public BigDecimal getY() {
        return y;
    }

    public void setY(BigDecimal y) {
        this.y = y;
    }

    public Double getLon() {
        return lon;
    }

    public void setLon(Double lon) {
        this.lon = lon;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Integer getMile() {
        return mile;
    }

    public void setMile(Integer mile) {
        this.mile = mile;
    }

    public BigDecimal getLeftLayer() {
        return leftLayer;
    }

    public void setLeftLayer(BigDecimal leftLayer) {
        this.leftLayer = leftLayer;
    }

    public BigDecimal getLeftUpperLevel() {
        return leftUpperLevel;
    }

    public void setLeftUpperLevel(BigDecimal leftUpperLevel) {
        this.leftUpperLevel = leftUpperLevel;
    }

    public BigDecimal getLeftLowestLevel() {
        return leftLowestLevel;
    }

    public void setLeftLowestLevel(BigDecimal leftLowestLevel) {
        this.leftLowestLevel = leftLowestLevel;
    }

    public BigDecimal getLeftSubbase() {
        return leftSubbase;
    }

    public void setLeftSubbase(BigDecimal leftSubbase) {
        this.leftSubbase = leftSubbase;
    }

    public BigDecimal getRightLayer() {
        return rightLayer;
    }

    public void setRightLayer(BigDecimal rightLayer) {
        this.rightLayer = rightLayer;
    }

    public BigDecimal getRightUpperLevel() {
        return rightUpperLevel;
    }

    public void setRightUpperLevel(BigDecimal rightUpperLevel) {
        this.rightUpperLevel = rightUpperLevel;
    }

    public BigDecimal getRightLowestLevel() {
        return rightLowestLevel;
    }

    public void setRightLowestLevel(BigDecimal rightLowestLevel) {
        this.rightLowestLevel = rightLowestLevel;
    }

    public BigDecimal getRightSubbase() {
        return rightSubbase;
    }

    public void setRightSubbase(BigDecimal rightSubbase) {
        this.rightSubbase = rightSubbase;
    }

    public String getStakeType() {
        return stakeType;
    }

    public void setStakeType(String stakeType) {
        this.stakeType = stakeType == null ? null : stakeType.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", stakeGroupId=").append(stakeGroupId);
        sb.append(", stakeNo=").append(stakeNo);
        sb.append(", x=").append(x);
        sb.append(", y=").append(y);
        sb.append(", lon=").append(lon);
        sb.append(", lat=").append(lat);
        sb.append(", mile=").append(mile);
        sb.append(", leftLayer=").append(leftLayer);
        sb.append(", leftUpperLevel=").append(leftUpperLevel);
        sb.append(", leftLowestLevel=").append(leftLowestLevel);
        sb.append(", leftSubbase=").append(leftSubbase);
        sb.append(", rightLayer=").append(rightLayer);
        sb.append(", rightUpperLevel=").append(rightUpperLevel);
        sb.append(", rightLowestLevel=").append(rightLowestLevel);
        sb.append(", rightSubbase=").append(rightSubbase);
        sb.append(", stakeType=").append(stakeType);
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
        StakeModel other = (StakeModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getStakeGroupId() == null ? other.getStakeGroupId() == null : this.getStakeGroupId().equals(other.getStakeGroupId()))
                && (this.getStakeNo() == null ? other.getStakeNo() == null : this.getStakeNo().equals(other.getStakeNo()))
                && (this.getX() == null ? other.getX() == null : this.getX().equals(other.getX()))
                && (this.getY() == null ? other.getY() == null : this.getY().equals(other.getY()))
                && (this.getLon() == null ? other.getLon() == null : this.getLon().equals(other.getLon()))
                && (this.getLat() == null ? other.getLat() == null : this.getLat().equals(other.getLat()))
                && (this.getMile() == null ? other.getMile() == null : this.getMile().equals(other.getMile()))
                && (this.getLeftLayer() == null ? other.getLeftLayer() == null : this.getLeftLayer().equals(other.getLeftLayer()))
                && (this.getLeftUpperLevel() == null ? other.getLeftUpperLevel() == null : this.getLeftUpperLevel().equals(other.getLeftUpperLevel()))
                && (this.getLeftLowestLevel() == null ? other.getLeftLowestLevel() == null : this.getLeftLowestLevel().equals(other.getLeftLowestLevel()))
                && (this.getLeftSubbase() == null ? other.getLeftSubbase() == null : this.getLeftSubbase().equals(other.getLeftSubbase()))
                && (this.getRightLayer() == null ? other.getRightLayer() == null : this.getRightLayer().equals(other.getRightLayer()))
                && (this.getRightUpperLevel() == null ? other.getRightUpperLevel() == null : this.getRightUpperLevel().equals(other.getRightUpperLevel()))
                && (this.getRightLowestLevel() == null ? other.getRightLowestLevel() == null : this.getRightLowestLevel().equals(other.getRightLowestLevel()))
                && (this.getRightSubbase() == null ? other.getRightSubbase() == null : this.getRightSubbase().equals(other.getRightSubbase()))
                && (this.getStakeType() == null ? other.getStakeType() == null : this.getStakeType().equals(other.getStakeType()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getStakeGroupId() == null) ? 0 : getStakeGroupId().hashCode());
        result = prime * result + ((getStakeNo() == null) ? 0 : getStakeNo().hashCode());
        result = prime * result + ((getX() == null) ? 0 : getX().hashCode());
        result = prime * result + ((getY() == null) ? 0 : getY().hashCode());
        result = prime * result + ((getLon() == null) ? 0 : getLon().hashCode());
        result = prime * result + ((getLat() == null) ? 0 : getLat().hashCode());
        result = prime * result + ((getMile() == null) ? 0 : getMile().hashCode());
        result = prime * result + ((getLeftLayer() == null) ? 0 : getLeftLayer().hashCode());
        result = prime * result + ((getLeftUpperLevel() == null) ? 0 : getLeftUpperLevel().hashCode());
        result = prime * result + ((getLeftLowestLevel() == null) ? 0 : getLeftLowestLevel().hashCode());
        result = prime * result + ((getLeftSubbase() == null) ? 0 : getLeftSubbase().hashCode());
        result = prime * result + ((getRightLayer() == null) ? 0 : getRightLayer().hashCode());
        result = prime * result + ((getRightUpperLevel() == null) ? 0 : getRightUpperLevel().hashCode());
        result = prime * result + ((getRightLowestLevel() == null) ? 0 : getRightLowestLevel().hashCode());
        result = prime * result + ((getRightSubbase() == null) ? 0 : getRightSubbase().hashCode());
        result = prime * result + ((getStakeType() == null) ? 0 : getStakeType().hashCode());
        return result;
    }
}