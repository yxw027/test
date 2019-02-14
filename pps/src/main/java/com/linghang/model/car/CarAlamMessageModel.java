package com.linghang.model.car;

import com.linghang.model.CarVehicleManagementModel;
import com.linghang.serversocket.carlocation.shannxinavi.Message0200Model;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by dell on 2019/01/14.
 * 车辆报警 Model
 */
public class CarAlamMessageModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键无意义
     */
    private Long id;

    /**
     * 报警类型
     */
    private Integer alamType;

    /**
     * 车牌号
     */
    private String carNumber;

    /**
     * 报警时间
     */
    private Date alamTime;

    /**
     * 载重
     */
    private String load;

    /**
     * 组织机构id
     */
    private Long orgId;

    /**
     * 速度
     */
    private String speed;

    /**
     * 联系人
     */
    private String contact;

    /**
     * 联系电话
     */
    private String contactPhone;

    public CarAlamMessageModel() {
    }

    public CarAlamMessageModel(Long id, Integer alamType, String carNumber, Date alamTime, String load, Long orgId, String speed, String contact, String contactPhone) {
        this.id = id;
        this.alamType = alamType;
        this.carNumber = carNumber;
        this.alamTime = alamTime;
        this.load = load;
        this.orgId = orgId;
        this.speed = speed;
        this.contact = contact;
        this.contactPhone = contactPhone;
    }

    public CarAlamMessageModel(CarVehicleManagementModel carVehicleManagementModel, Message0200Model message0200Model) {
        this.load = carVehicleManagementModel.getLoad().toString();

        try {
            this.alamTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(message0200Model.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        this.speed = message0200Model.getSpeed().toString();
        this.orgId = carVehicleManagementModel.getOrgId();
        this.contact = carVehicleManagementModel.getContact();
        this.contactPhone = carVehicleManagementModel.getContactPhone();
        this.carNumber = carVehicleManagementModel.getCarNumber();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getAlamType() {
        return alamType;
    }

    public void setAlamType(Integer alamType) {
        this.alamType = alamType;
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber == null ? null : carNumber.trim();
    }

    public Date getAlamTime() {
        return alamTime;
    }

    public void setAlamTime(Date alamTime) {
        this.alamTime = alamTime;
    }

    public String getLoad() {
        return load;
    }

    public void setLoad(String load) {
        this.load = load == null ? null : load.trim();
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public String getSpeed() {
        return speed;
    }

    public void setSpeed(String speed) {
        this.speed = speed == null ? null : speed.trim();
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
        this.contactPhone = contactPhone == null ? null : contactPhone.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", alamType=").append(alamType);
        sb.append(", carNumber=").append(carNumber);
        sb.append(", alamTime=").append(alamTime);
        sb.append(", load=").append(load);
        sb.append(", orgId=").append(orgId);
        sb.append(", speed=").append(speed);
        sb.append(", contact=").append(contact);
        sb.append(", contactPhone=").append(contactPhone);
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
        CarAlamMessageModel other = (CarAlamMessageModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getAlamType() == null ? other.getAlamType() == null : this.getAlamType().equals(other.getAlamType()))
                && (this.getCarNumber() == null ? other.getCarNumber() == null : this.getCarNumber().equals(other.getCarNumber()))
                && (this.getAlamTime() == null ? other.getAlamTime() == null : this.getAlamTime().equals(other.getAlamTime()))
                && (this.getLoad() == null ? other.getLoad() == null : this.getLoad().equals(other.getLoad()))
                && (this.getOrgId() == null ? other.getOrgId() == null : this.getOrgId().equals(other.getOrgId()))
                && (this.getSpeed() == null ? other.getSpeed() == null : this.getSpeed().equals(other.getSpeed()))
                && (this.getContact() == null ? other.getContact() == null : this.getContact().equals(other.getContact()))
                && (this.getContactPhone() == null ? other.getContactPhone() == null : this.getContactPhone().equals(other.getContactPhone()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getAlamType() == null) ? 0 : getAlamType().hashCode());
        result = prime * result + ((getCarNumber() == null) ? 0 : getCarNumber().hashCode());
        result = prime * result + ((getAlamTime() == null) ? 0 : getAlamTime().hashCode());
        result = prime * result + ((getLoad() == null) ? 0 : getLoad().hashCode());
        result = prime * result + ((getOrgId() == null) ? 0 : getOrgId().hashCode());
        result = prime * result + ((getSpeed() == null) ? 0 : getSpeed().hashCode());
        result = prime * result + ((getContact() == null) ? 0 : getContact().hashCode());
        result = prime * result + ((getContactPhone() == null) ? 0 : getContactPhone().hashCode());
        return result;
    }
}