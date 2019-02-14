package com.linghang.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author by i_it on 2018/11/21.
 * 摊铺压路车辆 Model
 */
public class CarModel extends GpsDataModel implements Serializable {

    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 设备号
     */
    private String sid;

    /**
     * 名称
     */
    private String name;

    /**
     * 宽度
     */
    private Float width;

    /**
     * 组织架构id
     */
    private Long orgId;

    /**
     * 车辆类型
     */
    private Integer carType;

    /**
     * 工区ID
     */
    private Long workAreaId;

    /**
     * 工作时间
     */
    private Date workTime;

    /**
     * 转场时间
     */
    private Date moveTime;

    /**
     * 状态
     */
    private Integer status;
    /**
     * 摊铺层级ID
     */
    private Integer paver_layer_id;
    /**
     * 压路层级ID
     */
    private Integer roller_layer_id;

    public CarModel() {
        super();
    }

    public CarModel(GpsDataModel gpsDataModel) {
        setGpsData(gpsDataModel);
    }

    public void setGpsData(GpsDataModel gpsDataModel) {
        if (gpsDataModel != null) {
//            this.setSid(gpsDataModel.getCarId());
            this.setLon(gpsDataModel.getLon());
            this.setLat(gpsDataModel.getLat());
            this.setHi(gpsDataModel.getHi());
            this.setDrct(gpsDataModel.getDrct());
            this.setSpeed(gpsDataModel.getSpeed());
            this.setTemperature(gpsDataModel.getTemperature());
            this.setMile(gpsDataModel.getMile());
            this.setGpsTime(gpsDataModel.getGpsTime());
        }
    }

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public String getSid() {
        return sid;
    }

    @Override
    public void setSid(String sid) {
        this.sid = sid == null ? null : sid.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Float getWidth() {
        return width;
    }

    public void setWidth(Float width) {
        this.width = width;
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public Integer getCarType() {
        return carType;
    }

    public void setCarType(Integer carType) {
        this.carType = carType;
    }

    @Override
    public Long getWorkAreaId() {
        return workAreaId;
    }

    @Override
    public void setWorkAreaId(Long workAreaId) {
        this.workAreaId = workAreaId;
    }

    public Date getWorkTime() {
        return workTime;
    }

    public void setWorkTime(Date workTime) {
        this.workTime = workTime;
    }

    public Date getMoveTime() {
        return moveTime;
    }

    public void setMoveTime(Date moveTime) {
        this.moveTime = moveTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getPaver_layer_id() {
        return paver_layer_id;
    }

    public void setPaver_layer_id(Integer paver_layer_id) {
        this.paver_layer_id = paver_layer_id;
    }

    public Integer getRoller_layer_id() {
        return roller_layer_id;
    }

    public void setRoller_layer_id(Integer roller_layer_id) {
        this.roller_layer_id = roller_layer_id;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", sid=").append(sid);
        sb.append(", name=").append(name);
        sb.append(", width=").append(width);
        sb.append(", orgId=").append(orgId);
        sb.append(", carType=").append(carType);
        sb.append(", workAreaId=").append(workAreaId);
        sb.append(", workTime=").append(workTime);
        sb.append(", moveTime=").append(moveTime);
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
        CarModel other = (CarModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getSid() == null ? other.getSid() == null : this.getSid().equals(other.getSid()))
                && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
                && (this.getWidth() == null ? other.getWidth() == null : this.getWidth().equals(other.getWidth()))
                && (this.getOrgId() == null ? other.getOrgId() == null : this.getOrgId().equals(other.getOrgId()))
                && (this.getCarType() == null ? other.getCarType() == null : this.getCarType().equals(other.getCarType()))
                && (this.getCrafts() == null ? other.getCrafts() == null : this.getCrafts().equals(other.getCrafts()))
                && (this.getWorkAreaId() == null ? other.getWorkAreaId() == null : this.getWorkAreaId().equals(other.getWorkAreaId()))
                && (this.getWorkTime() == null ? other.getWorkTime() == null : this.getWorkTime().equals(other.getWorkTime()))
                && (this.getMoveTime() == null ? other.getMoveTime() == null : this.getMoveTime().equals(other.getMoveTime()))
                && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getSid() == null) ? 0 : getSid().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getWidth() == null) ? 0 : getWidth().hashCode());
        result = prime * result + ((getOrgId() == null) ? 0 : getOrgId().hashCode());
        result = prime * result + ((getCarType() == null) ? 0 : getCarType().hashCode());
        result = prime * result + ((getCrafts() == null) ? 0 : getCrafts().hashCode());
        result = prime * result + ((getWorkAreaId() == null) ? 0 : getWorkAreaId().hashCode());
        result = prime * result + ((getWorkTime() == null) ? 0 : getWorkTime().hashCode());
        result = prime * result + ((getMoveTime() == null) ? 0 : getMoveTime().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        return result;
    }
}