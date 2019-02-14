package com.linghang.model.car;


import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * Created by dell on 2019/01/08.
 * 车辆位置信息 Model
 */
public class CarPositionModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    private Long id;

    /**
     * 车牌号
     */
    private String carnum;

    /**
     * 车辆位置
     */
    private String address;

    /**
     * 经度
     */
    private BigDecimal xlabe;

    /**
     * 纬度
     */
    private BigDecimal ylabe;

    /**
     * 速度
     */
    private BigDecimal speed;

    /**
     * 监控时间
     */
    private String locationTime;

    /**
     * 方向
     */
    private Integer direction;


    /**
     * 最大速度
     */
    private BigDecimal maxSpeed;

    public BigDecimal getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(BigDecimal maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

    /**
     * 报警状态
     */
    private List<CarAlarmModel> carAlarmModels;

    /**
     * 车辆状态
     */
    private List<CarStatusModel> carStatusModels;

    private CarFenceRecordModel carFenceRecordModel;
    /**
     * 数据表名称
     */
    private String tableName;

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public CarFenceRecordModel getCarFenceRecordModel() {
        return carFenceRecordModel;
    }

    public void setCarFenceRecordModel(CarFenceRecordModel carFenceRecordModel) {
        this.carFenceRecordModel = carFenceRecordModel;
    }

    public CarPositionModel() {
    }

    public CarPositionModel(Long id, String carnum, String address, BigDecimal xlabe, BigDecimal ylabe, BigDecimal speed, String locationTime, Integer direction, Integer alarmType, Integer alarmSatus, String alarmMessage) {
        this.id = id;
        this.carnum = carnum;
        this.address = address;
        this.xlabe = xlabe;
        this.ylabe = ylabe;
        this.speed = speed;
        this.locationTime = locationTime;
        this.direction = direction;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCarnum() {
        return carnum;
    }

    public void setCarnum(String carnum) {
        this.carnum = carnum == null ? null : carnum.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public BigDecimal getXlabe() {
        return xlabe;
    }

    public void setXlabe(BigDecimal xlabe) {
        this.xlabe = xlabe;
    }

    public BigDecimal getYlabe() {
        return ylabe;
    }

    public void setYlabe(BigDecimal ylabe) {
        this.ylabe = ylabe;
    }

    public BigDecimal getSpeed() {
        return speed;
    }

    public void setSpeed(BigDecimal speed) {
        this.speed = speed;
    }

    public String getLocationTime() {
        return locationTime;
    }

    public void setLocationTime(String locationTime) {
        this.locationTime = locationTime == null ? null : locationTime.trim();
    }

    public Integer getDirection() {
        return direction;
    }

    public void setDirection(Integer direction) {
        this.direction = direction;
    }


    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", carnum=").append(carnum);
        sb.append(", address=").append(address);
        sb.append(", xlabe=").append(xlabe);
        sb.append(", ylabe=").append(ylabe);
        sb.append(", speed=").append(speed);
        sb.append(", locationTime=").append(locationTime);
        sb.append(", direction=").append(direction);
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
        CarPositionModel other = (CarPositionModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getCarnum() == null ? other.getCarnum() == null : this.getCarnum().equals(other.getCarnum()))
                && (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()))
                && (this.getXlabe() == null ? other.getXlabe() == null : this.getXlabe().equals(other.getXlabe()))
                && (this.getYlabe() == null ? other.getYlabe() == null : this.getYlabe().equals(other.getYlabe()))
                && (this.getSpeed() == null ? other.getSpeed() == null : this.getSpeed().equals(other.getSpeed()))
                && (this.getLocationTime() == null ? other.getLocationTime() == null : this.getLocationTime().equals(other.getLocationTime()))
                && (this.getDirection() == null ? other.getDirection() == null : this.getDirection().equals(other.getDirection()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getCarnum() == null) ? 0 : getCarnum().hashCode());
        result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
        result = prime * result + ((getXlabe() == null) ? 0 : getXlabe().hashCode());
        result = prime * result + ((getYlabe() == null) ? 0 : getYlabe().hashCode());
        result = prime * result + ((getSpeed() == null) ? 0 : getSpeed().hashCode());
        result = prime * result + ((getLocationTime() == null) ? 0 : getLocationTime().hashCode());
        result = prime * result + ((getDirection() == null) ? 0 : getDirection().hashCode());
        return result;
    }

    public List<CarAlarmModel> getCarAlarmModels() {
        return carAlarmModels;
    }

    public void setCarAlarmModels(List<CarAlarmModel> carAlarmModels) {
        this.carAlarmModels = carAlarmModels;
    }

    public List<CarStatusModel> getCarStatusModels() {
        return carStatusModels;
    }

    public void setCarStatusModels(List<CarStatusModel> carStatusModels) {
        this.carStatusModels = carStatusModels;
    }
}