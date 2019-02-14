package com.linghang.model.car;

import java.io.Serializable;
import java.util.List;

/**
 * Created by dell on 2019/01/02.
 * 电子围栏 Model
 */

public class CarElectricFenceModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键无意义
     */
    private Long id;

    /**
     * 组织机构id
     */
    private Long orgId;

    /**
     * 围栏名称
     */
    private String fenceName;

    /**
     * 位置信息
     */
    private String locationMessage;

    /**
     * 关联车辆
     */
    private String carMessage;

    /**
     * 围栏位置坐标
     */
    private String fancePosition;

    /**
     * 围栏下发状态
     */
    private Integer fancePositionStatus;

    /**
     * 备注
     */
    private String remark;

    /**
     * 经纬度坐标
     */
    private String wsg84;

    /**
     * 围栏中心点
     */
    private String pointCenter;
    /**
     * 电子围栏标识
     */
    private Integer electricFencemark;

    public String getPointCenter() {
        return pointCenter;
    }

    public void setPointCenter(String pointCenter) {
        this.pointCenter = pointCenter;
    }

    public String getWsg84() {
        return wsg84;
    }

    public void setWsg84(String wsg84) {
        this.wsg84 = wsg84;
    }

    private List<CarElectronicFencePointModel> carElectronicFencePointModels;


    private List<WSG84> wsg84s;

    public List<WSG84> getWsg84s() {
        return wsg84s;
    }

    public void setWsg84s(List<WSG84> wsg84s) {
        this.wsg84s = wsg84s;
    }

    public List<CarElectronicFencePointModel> getCarElectronicFencePointModels() {
        return carElectronicFencePointModels;
    }

    public void setCarElectronicFencePointModels(List<CarElectronicFencePointModel> carElectronicFencePointModels) {
        this.carElectronicFencePointModels = carElectronicFencePointModels;
    }


    public Integer getElectricFencemark() {
        return electricFencemark;
    }

    public void setElectricFencemark(Integer electricFencemark) {
        this.electricFencemark = electricFencemark;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public String getFenceName() {
        return fenceName;
    }

    public void setFenceName(String fenceName) {
        this.fenceName = fenceName == null ? null : fenceName.trim();
    }

    public String getLocationMessage() {
        return locationMessage;
    }

    public void setLocationMessage(String locationMessage) {
        this.locationMessage = locationMessage == null ? null : locationMessage.trim();
    }

    public String getCarMessage() {
        return carMessage;
    }

    public void setCarMessage(String carMessage) {
        this.carMessage = carMessage == null ? null : carMessage.trim();
    }

    public String getFancePosition() {
        return fancePosition;
    }

    public void setFancePosition(String fancePosition) {
        this.fancePosition = fancePosition == null ? null : fancePosition.trim();
    }

    public Integer getFancePositionStatus() {
        return fancePositionStatus;
    }

    public void setFancePositionStatus(Integer fancePositionStatus) {
        this.fancePositionStatus = fancePositionStatus;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", orgId=").append(orgId);
        sb.append(", fenceName=").append(fenceName);
        sb.append(", locationMessage=").append(locationMessage);
        sb.append(", carMessage=").append(carMessage);
        sb.append(", fancePosition=").append(fancePosition);
        sb.append(", fancePositionStatus=").append(fancePositionStatus);
        sb.append(", remark=").append(remark);
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
        CarElectricFenceModel other = (CarElectricFenceModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getOrgId() == null ? other.getOrgId() == null : this.getOrgId().equals(other.getOrgId()))
                && (this.getFenceName() == null ? other.getFenceName() == null : this.getFenceName().equals(other.getFenceName()))
                && (this.getLocationMessage() == null ? other.getLocationMessage() == null : this.getLocationMessage().equals(other.getLocationMessage()))
                && (this.getCarMessage() == null ? other.getCarMessage() == null : this.getCarMessage().equals(other.getCarMessage()))
                && (this.getFancePosition() == null ? other.getFancePosition() == null : this.getFancePosition().equals(other.getFancePosition()))
                && (this.getFancePositionStatus() == null ? other.getFancePositionStatus() == null : this.getFancePositionStatus().equals(other.getFancePositionStatus()))
                && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getOrgId() == null) ? 0 : getOrgId().hashCode());
        result = prime * result + ((getFenceName() == null) ? 0 : getFenceName().hashCode());
        result = prime * result + ((getLocationMessage() == null) ? 0 : getLocationMessage().hashCode());
        result = prime * result + ((getCarMessage() == null) ? 0 : getCarMessage().hashCode());
        result = prime * result + ((getFancePosition() == null) ? 0 : getFancePosition().hashCode());
        result = prime * result + ((getFancePositionStatus() == null) ? 0 : getFancePositionStatus().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        return result;
    }
}