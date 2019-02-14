package com.linghang.model;

import com.linghang.model.car.CarElectricFenceModel;
import com.linghang.model.car.CarFenceRecordModel;
import com.linghang.model.car.CarPositionModel;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by dell on 2018/12/25.
 * 车辆管理 Model
 */
public class CarVehicleManagementModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键无意义
     */
    private Long id;

    /**
     * 车牌号
     */
    private String carNumber;

    /**
     * 车辆标识
     */
    private Integer carMark;

    /**
     * 射频卡编号
     */
    private String rfCardNumber;

    /**
     * gps卡号
     */
    private String gpsCardNumber;

    /**
     * 联系人
     */
    private String contact;

    /**
     * 联系人电话
     */
    private String contactPhone;

    /**
     * 载重
     */
    private BigDecimal load;

    /**
     * 添加时间
     */
    private Date addTime;

    /**
     * 组织机构id
     */
    private Long orgId;

    /**
     * 预留字段
     */
    private String data1;

    /**
     * 预留字段2
     */
    private String data2;
    /**
     * 车辆类型 1 运输车辆  2 作业车辆
     */
    private  Integer carType;
    /**
     * 是否下发电子围栏 0 未下发 1 已下发
     */
    private Integer isIssued;

    public Integer getIsIssued() {
        return isIssued;
    }

    public void setIsIssued(Integer isIssued) {
        this.isIssued = isIssued;
    }


    public String tableName;
    private List<CarPositionModel> carPositionModelList;
    private String starTime;
    private String endTime;

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    /**
     * 轨迹回放 电子围栏
     */
    private String selectTime;
    private CarFenceRecordModel carFenceRecordModel;

    public List<CarPositionModel> getCarPositionModelList() {
        return carPositionModelList;
    }

    public void setCarPositionModelList(List<CarPositionModel> carPositionModelList) {
        this.carPositionModelList = carPositionModelList;
    }

    public String getStarTime() {
        return starTime;
    }

    public void setStarTime(String starTime) {
        this.starTime = starTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getSelectTime() {
        return selectTime;
    }

    public void setSelectTime(String selectTime) {
        this.selectTime = selectTime;
    }

    public CarFenceRecordModel getCarFenceRecordModel() {
        return carFenceRecordModel;
    }

    public void setCarFenceRecordModel(CarFenceRecordModel carFenceRecordModel) {
        this.carFenceRecordModel = carFenceRecordModel;
    }

    private CarElectricFenceModel carElectricFenceModel;

    public CarElectricFenceModel getCarElectricFenceModel() {
        return carElectricFenceModel;
    }

    public void setCarElectricFenceModel(CarElectricFenceModel carElectricFenceModel) {
        this.carElectricFenceModel = carElectricFenceModel;
    }

    public Integer getCarType() {
        return carType;
    }

    public void setCarType(Integer carType) {
        this.carType = carType;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber == null ? null : carNumber.trim();
    }

    public Integer getCarMark() {
        return carMark;
    }

    public void setCarMark(Integer carMark) {
        this.carMark = carMark;
    }

    public String getRfCardNumber() {
        return rfCardNumber;
    }

    public void setRfCardNumber(String rfCardNumber) {
        this.rfCardNumber = rfCardNumber == null ? null : rfCardNumber.trim();
    }

    public String getGpsCardNumber() {
        return gpsCardNumber;
    }

    public void setGpsCardNumber(String gpsCardNumber) {
        this.gpsCardNumber = gpsCardNumber == null ? null : gpsCardNumber.trim();
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact == null ? null : contact.trim();
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public BigDecimal getLoad() {
        return load;
    }

    public void setLoad(BigDecimal load) {
        this.load = load;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public String getData1() {
        return data1;
    }

    public void setData1(String data1) {
        this.data1 = data1 == null ? null : data1.trim();
    }

    public String getData2() {
        return data2;
    }

    public void setData2(String data2) {
        this.data2 = data2 == null ? null : data2.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", carNumber=").append(carNumber);
        sb.append(", carMark=").append(carMark);
        sb.append(", rfCardNumber=").append(rfCardNumber);
        sb.append(", gpsCardNumber=").append(gpsCardNumber);
        sb.append(", contact=").append(contact);
        sb.append(", contactPhone=").append(contactPhone);
        sb.append(", load=").append(load);
        sb.append(", addTime=").append(addTime);
        sb.append(", orgId=").append(orgId);
        sb.append(", data1=").append(data1);
        sb.append(", data2=").append(data2);
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
        CarVehicleManagementModel other = (CarVehicleManagementModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getCarNumber() == null ? other.getCarNumber() == null : this.getCarNumber().equals(other.getCarNumber()))
            && (this.getCarMark() == null ? other.getCarMark() == null : this.getCarMark().equals(other.getCarMark()))
            && (this.getRfCardNumber() == null ? other.getRfCardNumber() == null : this.getRfCardNumber().equals(other.getRfCardNumber()))
            && (this.getGpsCardNumber() == null ? other.getGpsCardNumber() == null : this.getGpsCardNumber().equals(other.getGpsCardNumber()))
            && (this.getContact() == null ? other.getContact() == null : this.getContact().equals(other.getContact()))
            && (this.getContactPhone() == null ? other.getContactPhone() == null : this.getContactPhone().equals(other.getContactPhone()))
            && (this.getLoad() == null ? other.getLoad() == null : this.getLoad().equals(other.getLoad()))
            && (this.getAddTime() == null ? other.getAddTime() == null : this.getAddTime().equals(other.getAddTime()))
            && (this.getOrgId() == null ? other.getOrgId() == null : this.getOrgId().equals(other.getOrgId()))
            && (this.getData1() == null ? other.getData1() == null : this.getData1().equals(other.getData1()))
            && (this.getData2() == null ? other.getData2() == null : this.getData2().equals(other.getData2()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getCarNumber() == null) ? 0 : getCarNumber().hashCode());
        result = prime * result + ((getCarMark() == null) ? 0 : getCarMark().hashCode());
        result = prime * result + ((getRfCardNumber() == null) ? 0 : getRfCardNumber().hashCode());
        result = prime * result + ((getGpsCardNumber() == null) ? 0 : getGpsCardNumber().hashCode());
        result = prime * result + ((getContact() == null) ? 0 : getContact().hashCode());
        result = prime * result + ((getContactPhone() == null) ? 0 : getContactPhone().hashCode());
        result = prime * result + ((getLoad() == null) ? 0 : getLoad().hashCode());
        result = prime * result + ((getAddTime() == null) ? 0 : getAddTime().hashCode());
        result = prime * result + ((getOrgId() == null) ? 0 : getOrgId().hashCode());
        result = prime * result + ((getData1() == null) ? 0 : getData1().hashCode());
        result = prime * result + ((getData2() == null) ? 0 : getData2().hashCode());
        return result;
    }
}