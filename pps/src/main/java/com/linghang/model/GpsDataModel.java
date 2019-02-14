package com.linghang.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author by i_it on 2019/01/21.
 * ENH绘图数据 Model
 */
public class GpsDataModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    private Long id;

    /**
     * 设备ID
     */
    private String sid;

    /**
     * 经度
     */
    private Double lon;

    /**
     * 纬度
     */
    private Double lat;

    /**
     * 高线
     */
    private Double hi;

    /**
     * 方向
     */
    private Double drct;

    /**
     * 速度
     */
    private Double speed;

    /**
     * 温度
     */
    private Integer temperature;

    /**
     * 射频打卡
     */
    private String rfid;

    /**
     * 英里
     */
    private Integer mile;

    /**
     * 模型
     */
    private Integer dmod;

    /**
     * 上报时间
     */
    private Date gpsTime;

    /**
     * 震动类型
     */
    private Integer vibrateType;

    /**
     * 组ID
     */
    private Long groupId;

    /**
     * 工作层级
     */
    private Integer layer;

    /**
     * 工艺
     */
    private Integer crafts;

    /**
     * 施工车辆Id
     */
    private Long carId;

    /**
     * 工区ID
     */
    private Long workAreaId;
    /**
     * 上一点距离
     */
    private Double distance;

    private Long lastId;
    private Date startTime;
    private Date endTime;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid == null ? null : sid.trim();
    }

    public Double getLon() {
        return lon;
    }

    public void setLon(Double lon) {
        this.lon = lon;
    }

    public Double getLat() {
        return lat;
    }

    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Double getHi() {
        return hi;
    }

    public void setHi(Double hi) {
        this.hi = hi;
    }

    public Double getDrct() {
        return drct;
    }

    public void setDrct(Double drct) {
        this.drct = drct;
    }

    public Double getSpeed() {
        return speed;
    }

    public void setSpeed(Double speed) {
        this.speed = speed;
    }

    public Integer getTemperature() {
        return temperature;
    }

    public void setTemperature(Integer temperature) {
        this.temperature = temperature;
    }

    public String getRfid() {
        return rfid;
    }

    public void setRfid(String rfid) {
        this.rfid = rfid == null ? null : rfid.trim();

    }

    public Integer getMile() {
        return mile;
    }

    public void setMile(Integer mile) {
        this.mile = mile;
    }

    public Integer getDmod() {
        return dmod;
    }

    public void setDmod(Integer dmod) {
        this.dmod = dmod;
    }

    public Date getGpsTime() {
        return gpsTime;
    }

    public void setGpsTime(Date gpsTime) {
        this.gpsTime = gpsTime;
    }

    public Integer getVibrateType() {
        return vibrateType;
    }

    public void setVibrateType(Integer vibrateType) {
        this.vibrateType = vibrateType;
    }

    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    public Integer getLayer() {
        return layer;
    }

    public void setLayer(Integer layer) {
        this.layer = layer;
    }

    public Integer getCrafts() {
        return crafts;
    }

    public void setCrafts(Integer crafts) {
        this.crafts = crafts;
    }

    public Long getCarId() {
        return carId;
    }

    public void setCarId(Long carId) {
        this.carId = carId;
    }

    public Long getWorkAreaId() {
        return workAreaId;
    }

    public void setWorkAreaId(Long workAreaId) {
        this.workAreaId = workAreaId;
    }

    public Long getLastId() {
        return lastId;
    }

    public void setLastId(Long lastId) {
        this.lastId = lastId;
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

    public Double getDistance() {
        return distance;
    }

    public void setDistance(Double distance) {
        this.distance = distance;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", sid=").append(sid);
        sb.append(", lon=").append(lon);
        sb.append(", lat=").append(lat);
        sb.append(", hi=").append(hi);
        sb.append(", drct=").append(drct);
        sb.append(", speed=").append(speed);
        sb.append(", temperature=").append(temperature);
        sb.append(", mile=").append(mile);
        sb.append(", dmod=").append(dmod);
        sb.append(", gpsTime=").append(gpsTime);
        sb.append(", vibrateType=").append(vibrateType);
        sb.append(", groupId=").append(groupId);
        sb.append(", layer=").append(layer);
        sb.append(", crafts=").append(crafts);
        sb.append(", carId=").append(carId);
        sb.append(", workAreaId=").append(workAreaId);
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
        GpsDataModel other = (GpsDataModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getSid() == null ? other.getSid() == null : this.getSid().equals(other.getSid()))
                && (this.getLon() == null ? other.getLon() == null : this.getLon().equals(other.getLon()))
                && (this.getLat() == null ? other.getLat() == null : this.getLat().equals(other.getLat()))
                && (this.getHi() == null ? other.getHi() == null : this.getHi().equals(other.getHi()))
                && (this.getDrct() == null ? other.getDrct() == null : this.getDrct().equals(other.getDrct()))
                && (this.getSpeed() == null ? other.getSpeed() == null : this.getSpeed().equals(other.getSpeed()))
                && (this.getTemperature() == null ? other.getTemperature() == null : this.getTemperature().equals(other.getTemperature()))
                && (this.getMile() == null ? other.getMile() == null : this.getMile().equals(other.getMile()))
                && (this.getDmod() == null ? other.getDmod() == null : this.getDmod().equals(other.getDmod()))
                && (this.getGpsTime() == null ? other.getGpsTime() == null : this.getGpsTime().equals(other.getGpsTime()))
                && (this.getVibrateType() == null ? other.getVibrateType() == null : this.getVibrateType().equals(other.getVibrateType()))
                && (this.getGroupId() == null ? other.getGroupId() == null : this.getGroupId().equals(other.getGroupId()))
                && (this.getLayer() == null ? other.getLayer() == null : this.getLayer().equals(other.getLayer()))
                && (this.getCrafts() == null ? other.getCrafts() == null : this.getCrafts().equals(other.getCrafts()))
                && (this.getCarId() == null ? other.getCarId() == null : this.getCarId().equals(other.getCarId()))
                && (this.getWorkAreaId() == null ? other.getWorkAreaId() == null : this.getWorkAreaId().equals(other.getWorkAreaId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getSid() == null) ? 0 : getSid().hashCode());
        result = prime * result + ((getLon() == null) ? 0 : getLon().hashCode());
        result = prime * result + ((getLat() == null) ? 0 : getLat().hashCode());
        result = prime * result + ((getHi() == null) ? 0 : getHi().hashCode());
        result = prime * result + ((getDrct() == null) ? 0 : getDrct().hashCode());
        result = prime * result + ((getSpeed() == null) ? 0 : getSpeed().hashCode());
        result = prime * result + ((getTemperature() == null) ? 0 : getTemperature().hashCode());
        result = prime * result + ((getMile() == null) ? 0 : getMile().hashCode());
        result = prime * result + ((getDmod() == null) ? 0 : getDmod().hashCode());
        result = prime * result + ((getGpsTime() == null) ? 0 : getGpsTime().hashCode());
        result = prime * result + ((getVibrateType() == null) ? 0 : getVibrateType().hashCode());
        result = prime * result + ((getGroupId() == null) ? 0 : getGroupId().hashCode());
        result = prime * result + ((getLayer() == null) ? 0 : getLayer().hashCode());
        result = prime * result + ((getCrafts() == null) ? 0 : getCrafts().hashCode());
        result = prime * result + ((getCarId() == null) ? 0 : getCarId().hashCode());
        result = prime * result + ((getWorkAreaId() == null) ? 0 : getWorkAreaId().hashCode());
        return result;
    }
}