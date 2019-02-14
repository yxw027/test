package com.linghang.model.car;

import java.io.Serializable;

/**
 * Created by dell on 2019/01/08.
 * 车辆状态 Model
 */
public class CarStatusModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键无意义
     */
    private Long id;

    /**
     * 位置id
     */
    private Long positionId;

    /**
     * 车辆状态
     */
    private Integer carStatus;

    /**
     * 状态key
     */
    private Integer statusKey;

    /**
     * 状态信息
     */
    private String statusMessage;

    public CarStatusModel(Long id, Long positionId, Integer carStatus, Integer statusKey, String statusMessage) {
        this.id = id;
        this.positionId = positionId;
        this.carStatus = carStatus;
        this.statusKey = statusKey;
        this.statusMessage = statusMessage;
    }

    public CarStatusModel() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPositionId() {
        return positionId;
    }

    public void setPositionId(Long positionId) {
        this.positionId = positionId;
    }

    public Integer getCarStatus() {
        return carStatus;
    }

    public void setCarStatus(Integer carStatus) {
        this.carStatus = carStatus;
    }

    public Integer getStatusKey() {
        return statusKey;
    }

    public void setStatusKey(Integer statusKey) {
        this.statusKey = statusKey;
    }

    public String getStatusMessage() {
        return statusMessage;
    }

    public void setStatusMessage(String statusMessage) {
        this.statusMessage = statusMessage == null ? null : statusMessage.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", positionId=").append(positionId);
        sb.append(", carStatus=").append(carStatus);
        sb.append(", statusKey=").append(statusKey);
        sb.append(", statusMessage=").append(statusMessage);
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
        CarStatusModel other = (CarStatusModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getPositionId() == null ? other.getPositionId() == null : this.getPositionId().equals(other.getPositionId()))
                && (this.getCarStatus() == null ? other.getCarStatus() == null : this.getCarStatus().equals(other.getCarStatus()))
                && (this.getStatusKey() == null ? other.getStatusKey() == null : this.getStatusKey().equals(other.getStatusKey()))
                && (this.getStatusMessage() == null ? other.getStatusMessage() == null : this.getStatusMessage().equals(other.getStatusMessage()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getPositionId() == null) ? 0 : getPositionId().hashCode());
        result = prime * result + ((getCarStatus() == null) ? 0 : getCarStatus().hashCode());
        result = prime * result + ((getStatusKey() == null) ? 0 : getStatusKey().hashCode());
        result = prime * result + ((getStatusMessage() == null) ? 0 : getStatusMessage().hashCode());
        return result;
    }
}