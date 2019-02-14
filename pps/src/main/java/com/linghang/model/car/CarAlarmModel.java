package com.linghang.model.car;

import java.io.Serializable;

/**
 * Created by dell on 2019/01/08.
 * 车辆状态  对应车辆位置id Model
 */
public class CarAlarmModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    private Long id;

    /**
     * 车辆位置信息id
     */
    private Long positionId;

    /**
     * 报警类型
     */
    private Integer alarmType;

    /**
     * 报警信息
     */
    private String alarmMessage;

    public CarAlarmModel(Long id, Long positionId, Integer alarmType, String alarmMessage) {
        this.id = id;
        this.positionId = positionId;
        this.alarmType = alarmType;
        this.alarmMessage = alarmMessage;
    }

    public CarAlarmModel() {

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


    public Integer getAlarmType() {
        return alarmType;
    }

    public void setAlarmType(Integer alarmType) {
        this.alarmType = alarmType;
    }

    public String getAlarmMessage() {
        return alarmMessage;
    }

    public void setAlarmMessage(String alarmMessage) {
        this.alarmMessage = alarmMessage == null ? null : alarmMessage.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", positionId=").append(positionId);
        sb.append(", alarmType=").append(alarmType);
        sb.append(", alarmMessage=").append(alarmMessage);
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
        CarAlarmModel other = (CarAlarmModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getPositionId() == null ? other.getPositionId() == null : this.getPositionId().equals(other.getPositionId()))
                && (this.getAlarmType() == null ? other.getAlarmType() == null : this.getAlarmType().equals(other.getAlarmType()))
                && (this.getAlarmMessage() == null ? other.getAlarmMessage() == null : this.getAlarmMessage().equals(other.getAlarmMessage()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getPositionId() == null) ? 0 : getPositionId().hashCode());
        result = prime * result + ((getAlarmType() == null) ? 0 : getAlarmType().hashCode());
        result = prime * result + ((getAlarmMessage() == null) ? 0 : getAlarmMessage().hashCode());
        return result;
    }
}