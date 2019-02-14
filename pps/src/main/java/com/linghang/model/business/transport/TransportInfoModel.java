package com.linghang.model.business.transport;

import com.linghang.model.CarVehicleManagementModel;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author youp on 2019/01/02.
 * 车辆接料-运输-对接出料的过程数 Model
 */
public class TransportInfoModel implements Serializable {

    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */
    private Long id;


    /**
     * 组织id
     */
    private Long orgId;
    /**
     * 拌合站名称
     */
    private String mixingName;
    /**
     * 拌合站id
     */
    private Long mixingId;
    /**
     * 拌合站类型 {@link com.linghang.enums.MachineType}
     */
    private Integer mixingType;

    /**
     * 车辆射频卡号
     */
    private String carMark;


    /**
     * 车辆id
     */
    private Long carId;


    /**
     * 接料开始时间
     */
    private Date receiveStartTime;


    /**
     * 接料结束时间
     */
    private Date receiveEndTime;


    /**
     * 对接出料开始时间
     */
    private Date outputStartTime;


    /**
     * 对接出料结束时间
     */
    private Date outputEndTime;


    /**
     * 对接时间
     */
    private Long receiveTime;


    /**
     * 运输时间
     */
    private Long transportTime;


    /**
     * 对接出料时间
     */
    private Long outputTime;


    /**
     * 状态，1接料中，2运输中，3对接中，4运输结束
     */
    private Integer status;

    /**
     * 摊铺机id
     */
    private String pavingCarId;
    /**
     * 摊铺机名称
     */
    private String pavingCarName;
    /**
     * 接料总重
     */
    private BigDecimal weight;

    private CarVehicleManagementModel carVehicleManagementModel;

    public BigDecimal getWeight() {
        return weight;
    }

    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }

    public CarVehicleManagementModel getCarVehicleManagementModel() {
        return carVehicleManagementModel;
    }

    public void setCarVehicleManagementModel(CarVehicleManagementModel carVehicleManagementModel) {
        this.carVehicleManagementModel = carVehicleManagementModel;
    }

    public TransportInfoModel(Long id, Long orgId, String carMark, Long carId, Date receiveStartTime, Date receiveEndTime, Date outputStartTime, Date outputEndTime, Long receiveTime, Long transportTime, Long outputTime, Integer status) {
        this.id = id;
        this.orgId = orgId;
        this.carMark = carMark;
        this.carId = carId;
        this.receiveStartTime = receiveStartTime;
        this.receiveEndTime = receiveEndTime;
        this.outputStartTime = outputStartTime;
        this.outputEndTime = outputEndTime;
        this.receiveTime = receiveTime;
        this.transportTime = transportTime;
        this.outputTime = outputTime;
        this.status = status;
    }

    public TransportInfoModel() {

    }

    public String getPavingCarId() {
        return pavingCarId;
    }

    public void setPavingCarId(String pavingCarId) {
        this.pavingCarId = pavingCarId;
    }

    public String getPavingCarName() {
        return pavingCarName;
    }

    public void setPavingCarName(String pavingCarName) {
        this.pavingCarName = pavingCarName;
    }

    public String getMixingName() {
        return mixingName;
    }

    public void setMixingName(String mixingName) {
        this.mixingName = mixingName;
    }

    public Long getMixingId() {
        return mixingId;
    }

    public void setMixingId(Long mixingId) {
        this.mixingId = mixingId;
    }

    public Integer getMixingType() {
        return mixingType;
    }

    public void setMixingType(Integer mixingType) {
        this.mixingType = mixingType;
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

    public String getCarMark() {
        return carMark;
    }

    public void setCarMark(String carMark) {
        this.carMark = carMark;
    }

    public Long getCarId() {
        return carId;
    }

    public void setCarId(Long carId) {
        this.carId = carId;
    }

    public Date getReceiveStartTime() {
        return receiveStartTime;
    }

    public void setReceiveStartTime(Date receiveStartTime) {
        this.receiveStartTime = receiveStartTime;
    }

    public Date getReceiveEndTime() {
        return receiveEndTime;
    }

    public void setReceiveEndTime(Date receiveEndTime) {
        this.receiveEndTime = receiveEndTime;
    }

    public Date getOutputStartTime() {
        return outputStartTime;
    }

    public void setOutputStartTime(Date outputStartTime) {
        this.outputStartTime = outputStartTime;
    }

    public Date getOutputEndTime() {
        return outputEndTime;
    }

    public void setOutputEndTime(Date outputEndTime) {
        this.outputEndTime = outputEndTime;
    }

    public Long getReceiveTime() {
        return receiveTime;
    }

    public void setReceiveTime(Long receiveTime) {
        this.receiveTime = receiveTime;
    }

    public Long getTransportTime() {
        return transportTime;
    }

    public void setTransportTime(Long transportTime) {
        this.transportTime = transportTime;
    }

    public Long getOutputTime() {
        return outputTime;
    }

    public void setOutputTime(Long outputTime) {
        this.outputTime = outputTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", orgId=").append(orgId);
        sb.append(", carMark=").append(carMark);
        sb.append(", carId=").append(carId);
        sb.append(", receiveStartTime=").append(receiveStartTime);
        sb.append(", receiveEndTime=").append(receiveEndTime);
        sb.append(", outputStartTime=").append(outputStartTime);
        sb.append(", outputEndTime=").append(outputEndTime);
        sb.append(", receiveTime=").append(receiveTime);
        sb.append(", transportTime=").append(transportTime);
        sb.append(", outputTime=").append(outputTime);
        sb.append(", status=").append(status);
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
        TransportInfoModel other = (TransportInfoModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getOrgId() == null ? other.getOrgId() == null : this.getOrgId().equals(other.getOrgId()))
                && (this.getCarMark() == null ? other.getCarMark() == null : this.getCarMark().equals(other.getCarMark()))
                && (this.getCarId() == null ? other.getCarId() == null : this.getCarId().equals(other.getCarId()))
                && (this.getReceiveStartTime() == null ? other.getReceiveStartTime() == null : this.getReceiveStartTime().equals(other.getReceiveStartTime()))
                && (this.getReceiveEndTime() == null ? other.getReceiveEndTime() == null : this.getReceiveEndTime().equals(other.getReceiveEndTime()))
                && (this.getOutputStartTime() == null ? other.getOutputStartTime() == null : this.getOutputStartTime().equals(other.getOutputStartTime()))
                && (this.getOutputEndTime() == null ? other.getOutputEndTime() == null : this.getOutputEndTime().equals(other.getOutputEndTime()))
                && (this.getReceiveTime() == null ? other.getReceiveTime() == null : this.getReceiveTime().equals(other.getReceiveTime()))
                && (this.getTransportTime() == null ? other.getTransportTime() == null : this.getTransportTime().equals(other.getTransportTime()))
                && (this.getOutputTime() == null ? other.getOutputTime() == null : this.getOutputTime().equals(other.getOutputTime()))
                && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getOrgId() == null) ? 0 : getOrgId().hashCode());
        result = prime * result + ((getCarMark() == null) ? 0 : getCarMark().hashCode());
        result = prime * result + ((getCarId() == null) ? 0 : getCarId().hashCode());
        result = prime * result + ((getReceiveStartTime() == null) ? 0 : getReceiveStartTime().hashCode());
        result = prime * result + ((getReceiveEndTime() == null) ? 0 : getReceiveEndTime().hashCode());
        result = prime * result + ((getOutputStartTime() == null) ? 0 : getOutputStartTime().hashCode());
        result = prime * result + ((getOutputEndTime() == null) ? 0 : getOutputEndTime().hashCode());
        result = prime * result + ((getReceiveTime() == null) ? 0 : getReceiveTime().hashCode());
        result = prime * result + ((getTransportTime() == null) ? 0 : getTransportTime().hashCode());
        result = prime * result + ((getOutputTime() == null) ? 0 : getOutputTime().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        return result;
    }
}