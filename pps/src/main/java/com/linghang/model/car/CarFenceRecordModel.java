package com.linghang.model.car;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by dell on 2019/01/11.
 * 围栏记录 Model
 */
public class CarFenceRecordModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键 无意义
     */
    private Long id;

    /**
     * 围栏id
     */
    private Long electricFenceId;

    /**
     * 围栏位置坐标
     */
    private String fancePosition;

    /**
     * 经纬度坐标
     */
    private String wsg84;

    /**
     * 围栏中心点
     */
    private String pointCenter;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

    private String carMessage;


    public CarFenceRecordModel(Long id, Long electricFenceId, String fancePosition, String wsg84, String pointCenter, Date startTime, Date endTime, String carMessage) {
        this.id = id;
        this.electricFenceId = electricFenceId;
        this.fancePosition = fancePosition;
        this.wsg84 = wsg84;
        this.pointCenter = pointCenter;
        this.startTime = startTime;
        this.endTime = endTime;
        this.carMessage = carMessage;
    }

    public String getCarMessage() {
        return carMessage;
    }

    public CarFenceRecordModel() {
    }

    public void setCarMessage(String carMessage) {
        this.carMessage = carMessage;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getElectricFenceId() {
        return electricFenceId;
    }

    public void setElectricFenceId(Long electricFenceId) {
        this.electricFenceId = electricFenceId;
    }

    public String getFancePosition() {
        return fancePosition;
    }

    public void setFancePosition(String fancePosition) {
        this.fancePosition = fancePosition == null ? null : fancePosition.trim();
    }

    public String getWsg84() {
        return wsg84;
    }

    public void setWsg84(String wsg84) {
        this.wsg84 = wsg84 == null ? null : wsg84.trim();
    }

    public String getPointCenter() {
        return pointCenter;
    }

    public void setPointCenter(String pointCenter) {
        this.pointCenter = pointCenter == null ? null : pointCenter.trim();
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
        sb.append(", electricFenceId=").append(electricFenceId);
        sb.append(", fancePosition=").append(fancePosition);
        sb.append(", wsg84=").append(wsg84);
        sb.append(", pointCenter=").append(pointCenter);
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
        CarFenceRecordModel other = (CarFenceRecordModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getElectricFenceId() == null ? other.getElectricFenceId() == null : this.getElectricFenceId().equals(other.getElectricFenceId()))
            && (this.getFancePosition() == null ? other.getFancePosition() == null : this.getFancePosition().equals(other.getFancePosition()))
            && (this.getWsg84() == null ? other.getWsg84() == null : this.getWsg84().equals(other.getWsg84()))
            && (this.getPointCenter() == null ? other.getPointCenter() == null : this.getPointCenter().equals(other.getPointCenter()))
            && (this.getStartTime() == null ? other.getStartTime() == null : this.getStartTime().equals(other.getStartTime()))
            && (this.getEndTime() == null ? other.getEndTime() == null : this.getEndTime().equals(other.getEndTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getElectricFenceId() == null) ? 0 : getElectricFenceId().hashCode());
        result = prime * result + ((getFancePosition() == null) ? 0 : getFancePosition().hashCode());
        result = prime * result + ((getWsg84() == null) ? 0 : getWsg84().hashCode());
        result = prime * result + ((getPointCenter() == null) ? 0 : getPointCenter().hashCode());
        result = prime * result + ((getStartTime() == null) ? 0 : getStartTime().hashCode());
        result = prime * result + ((getEndTime() == null) ? 0 : getEndTime().hashCode());
        return result;
    }
}