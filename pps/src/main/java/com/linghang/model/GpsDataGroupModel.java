package com.linghang.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by i_it on 2019/01/29.
 * 摊铺统计 Model
 */
public class GpsDataGroupModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 日期
     */
    private Date date;

    /**
     * 日期String
     */
    private String dateStr;

    /**
     * 起始桩号
     */
    private String startStake;

    /**
     * 结束桩号
     */
    private String endStake;

    /**
     * 摊铺层级
     */
    private Integer layer;

    /**
     * 出料总数（吨）
     */
    private BigDecimal material;

    /**
     * 组织机构ID
     */
    private Long orgId;

    /**
     * 工区Id
     */
    private Long workAreaId;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDateStr() {
        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

    public String getStartStake() {
        return startStake;
    }

    public void setStartStake(String startStake) {
        this.startStake = startStake == null ? null : startStake.trim();
    }

    public String getEndStake() {
        return endStake;
    }

    public void setEndStake(String endStake) {
        this.endStake = endStake == null ? null : endStake.trim();
    }

    public Integer getLayer() {
        return layer;
    }

    public void setLayer(Integer layer) {
        this.layer = layer;
    }

    public BigDecimal getMaterial() {
        return material;
    }

    public void setMaterial(BigDecimal material) {
        this.material = material;
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public Long getWorkAreaId() {
        return workAreaId;
    }

    public void setWorkAreaId(Long workAreaId) {
        this.workAreaId = workAreaId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", date=").append(date);
        sb.append(", startStake=").append(startStake);
        sb.append(", endStake=").append(endStake);
        sb.append(", layer=").append(layer);
        sb.append(", material=").append(material);
        sb.append(", orgId=").append(orgId);
        sb.append(", workAreaId=").append(workAreaId);
        sb.append(", startTime=").append(startTime);
        sb.append(", endTime=").append(endTime);
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
        GpsDataGroupModel other = (GpsDataGroupModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getDate() == null ? other.getDate() == null : this.getDate().equals(other.getDate()))
                && (this.getStartStake() == null ? other.getStartStake() == null : this.getStartStake().equals(other.getStartStake()))
                && (this.getEndStake() == null ? other.getEndStake() == null : this.getEndStake().equals(other.getEndStake()))
                && (this.getLayer() == null ? other.getLayer() == null : this.getLayer().equals(other.getLayer()))
                && (this.getMaterial() == null ? other.getMaterial() == null : this.getMaterial().equals(other.getMaterial()))
                && (this.getOrgId() == null ? other.getOrgId() == null : this.getOrgId().equals(other.getOrgId()))
                && (this.getWorkAreaId() == null ? other.getWorkAreaId() == null : this.getWorkAreaId().equals(other.getWorkAreaId()))
                && (this.getStartTime() == null ? other.getStartTime() == null : this.getStartTime().equals(other.getStartTime()))
                && (this.getEndTime() == null ? other.getEndTime() == null : this.getEndTime().equals(other.getEndTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getDate() == null) ? 0 : getDate().hashCode());
        result = prime * result + ((getStartStake() == null) ? 0 : getStartStake().hashCode());
        result = prime * result + ((getEndStake() == null) ? 0 : getEndStake().hashCode());
        result = prime * result + ((getLayer() == null) ? 0 : getLayer().hashCode());
        result = prime * result + ((getMaterial() == null) ? 0 : getMaterial().hashCode());
        result = prime * result + ((getOrgId() == null) ? 0 : getOrgId().hashCode());
        result = prime * result + ((getWorkAreaId() == null) ? 0 : getWorkAreaId().hashCode());
        result = prime * result + ((getStartTime() == null) ? 0 : getStartTime().hashCode());
        result = prime * result + ((getEndTime() == null) ? 0 : getEndTime().hashCode());
        return result;
    }
}