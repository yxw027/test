package com.linghang.model.business.asphalt;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.io.Serializable;
import java.util.Date;

/**
 * @author wuchen on 2018/12/17.
 * 沥青站基础信息 Model
 */
public class AsphaltInfoModel implements Serializable {

    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */
    private Long id;
    /**
     * 组织机构id
     */
    private Long orgId;


    /**
     * 名称
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String name;


    /**
     * 联系人
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String contact;


    /**
     * 联系电话
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String phone;


    /**
     * 安装时间
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Date installTime;


    /**
     * 地址
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String address;


    /**
     * 坐标
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String coordinate;


    /**
     * 安装型号
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String type;


    /**
     * 骨料仓数量
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer aggregateNum;


    /**
     * 粉料仓数量
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer powderNum;


    /**
     * 骨料仓名称
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String aggregateName;


    /**
     * 更新时间
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Date updateTime;


    /**
     * 更新人
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Long updateUser;


    /**
     * 备注
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String remarks;
    /**
     * 出料口溫度
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer outMouthTemp = 0;


    /**
     * 沥青温度
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer asphaltTemp = 0;


    /**
     * 石料温度
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer stoneTemp = 0;

    /**
     * 拌合温度
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer mixingTemp = 0;

    /**
     * 射频卡号
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String cardMark;

    /**
     * 统计预警电话
     */
    private Integer isOpen;

    /**
     * 统计预警接收电话
     */
    private String warningPhone;


    public AsphaltInfoModel(String cardMark) {
        this.cardMark = cardMark;
    }

    public AsphaltInfoModel(Long orgId) {
        this.orgId = orgId;
    }

    public AsphaltInfoModel(Long id, String name, String contact, String phone, Date installTime, String address, String coordinate, String type, Integer aggregateNum, Integer powderNum, String aggregateName, Date updateTime, Long updateUser, String remarks) {
        this.id = id;
        this.name = name;
        this.contact = contact;
        this.phone = phone;
        this.installTime = installTime;
        this.address = address;
        this.coordinate = coordinate;
        this.type = type;
        this.aggregateNum = aggregateNum;
        this.powderNum = powderNum;
        this.aggregateName = aggregateName;
        this.updateTime = updateTime;
        this.updateUser = updateUser;
        this.remarks = remarks;
    }

    public String getCardMark() {
        return cardMark;
    }

    public void setCardMark(String cardMark) {
        this.cardMark = cardMark;
    }

    public Integer getOutMouthTemp() {
        return outMouthTemp;
    }

    public void setOutMouthTemp(Integer outMouthTemp) {
        this.outMouthTemp = outMouthTemp;
    }

    public Integer getAsphaltTemp() {
        return asphaltTemp;
    }

    public void setAsphaltTemp(Integer asphaltTemp) {
        this.asphaltTemp = asphaltTemp;
    }

    public Integer getStoneTemp() {
        return stoneTemp;
    }

    public void setStoneTemp(Integer stoneTemp) {
        this.stoneTemp = stoneTemp;
    }

    public Integer getIsOpen() {
        return isOpen;
    }

    public void setIsOpen(Integer isOpen) {
        this.isOpen = isOpen;
    }

    public String getWarningPhone() {
        return warningPhone;
    }

    public void setWarningPhone(String warningPhone) {
        this.warningPhone = warningPhone;
    }

    public AsphaltInfoModel() {

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact == null ? null : contact.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Date getInstallTime() {
        return installTime;
    }

    public void setInstallTime(Date installTime) {
        this.installTime = installTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getCoordinate() {
        return coordinate;
    }

    public void setCoordinate(String coordinate) {
        this.coordinate = coordinate == null ? null : coordinate.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getAggregateNum() {
        return aggregateNum;
    }

    public void setAggregateNum(Integer aggregateNum) {
        this.aggregateNum = aggregateNum;
    }

    public Integer getPowderNum() {
        return powderNum;
    }

    public void setPowderNum(Integer powderNum) {
        this.powderNum = powderNum;
    }

    public String getAggregateName() {
        return aggregateName;
    }

    public void setAggregateName(String aggregateName) {
        this.aggregateName = aggregateName == null ? null : aggregateName.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Long getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(Long updateUser) {
        this.updateUser = updateUser;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

    public Integer getMixingTemp() {
        return mixingTemp;
    }

    public void setMixingTemp(Integer mixingTemp) {
        this.mixingTemp = mixingTemp;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", contact=").append(contact);
        sb.append(", phone=").append(phone);
        sb.append(", installTime=").append(installTime);
        sb.append(", address=").append(address);
        sb.append(", coordinate=").append(coordinate);
        sb.append(", type=").append(type);
        sb.append(", aggregateNum=").append(aggregateNum);
        sb.append(", powderNum=").append(powderNum);
        sb.append(", aggregateName=").append(aggregateName);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", updateUser=").append(updateUser);
        sb.append(", remarks=").append(remarks);
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
        AsphaltInfoModel other = (AsphaltInfoModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
                && (this.getContact() == null ? other.getContact() == null : this.getContact().equals(other.getContact()))
                && (this.getPhone() == null ? other.getPhone() == null : this.getPhone().equals(other.getPhone()))
                && (this.getInstallTime() == null ? other.getInstallTime() == null : this.getInstallTime().equals(other.getInstallTime()))
                && (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()))
                && (this.getCoordinate() == null ? other.getCoordinate() == null : this.getCoordinate().equals(other.getCoordinate()))
                && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
                && (this.getAggregateNum() == null ? other.getAggregateNum() == null : this.getAggregateNum().equals(other.getAggregateNum()))
                && (this.getPowderNum() == null ? other.getPowderNum() == null : this.getPowderNum().equals(other.getPowderNum()))
                && (this.getAggregateName() == null ? other.getAggregateName() == null : this.getAggregateName().equals(other.getAggregateName()))
                && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()))
                && (this.getUpdateUser() == null ? other.getUpdateUser() == null : this.getUpdateUser().equals(other.getUpdateUser()))
                && (this.getRemarks() == null ? other.getRemarks() == null : this.getRemarks().equals(other.getRemarks()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getContact() == null) ? 0 : getContact().hashCode());
        result = prime * result + ((getPhone() == null) ? 0 : getPhone().hashCode());
        result = prime * result + ((getInstallTime() == null) ? 0 : getInstallTime().hashCode());
        result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
        result = prime * result + ((getCoordinate() == null) ? 0 : getCoordinate().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getAggregateNum() == null) ? 0 : getAggregateNum().hashCode());
        result = prime * result + ((getPowderNum() == null) ? 0 : getPowderNum().hashCode());
        result = prime * result + ((getAggregateName() == null) ? 0 : getAggregateName().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        result = prime * result + ((getUpdateUser() == null) ? 0 : getUpdateUser().hashCode());
        result = prime * result + ((getRemarks() == null) ? 0 : getRemarks().hashCode());
        return result;
    }
}