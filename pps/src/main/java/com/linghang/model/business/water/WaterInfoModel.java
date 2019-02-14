package com.linghang.model.business.water;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by dell on 2018/12/19.
 * 沥青站基础信息 Model
 */
public class WaterInfoModel extends WaterEntity implements Serializable {

    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 联系人
     */
    private String contact;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 安装时间
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Date installTime;

    /**
     * 地址
     */
    private String address;

    /**
     * 坐标
     */
    private String coordinate;

    /**
     * 骨料仓数量
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer aggregateNum;

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
    private Long updateUser;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 型号
     */
    private String type;

    /**
     * 计划产量
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal planCount;

    /**
     * 统计是否开启
     */
    private Integer isOpen;

    /**
     * 统计电话
     */
    private String warningPhone;

    /**
     * 射频卡号
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String cardMark;

    public WaterInfoModel() {
    }

    public WaterInfoModel(Long id, String name, String contact, String phone, Date installTime, String address, String coordinate, Integer aggregateNum, String aggregateName, Date updateTime, Long updateUser, String remarks, String type, BigDecimal planCount) {
        this.id = id;
        this.name = name;
        this.contact = contact;
        this.phone = phone;
        this.installTime = installTime;
        this.address = address;
        this.coordinate = coordinate;
        this.aggregateNum = aggregateNum;
        this.aggregateName = aggregateName;
        this.updateTime = updateTime;
        this.updateUser = updateUser;
        this.remarks = remarks;
        this.type = type;
        this.planCount = planCount;
    }

    public String getCardMark() {
        return cardMark;
    }

    public void setCardMark(String cardMark) {
        this.cardMark = cardMark;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Integer getAggregateNum() {
        return aggregateNum;
    }

    public void setAggregateNum(Integer aggregateNum) {
        this.aggregateNum = aggregateNum;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public BigDecimal getPlanCount() {
        return planCount;
    }

    public void setPlanCount(BigDecimal planCount) {
        this.planCount = planCount;
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
        sb.append(", aggregateNum=").append(aggregateNum);
        sb.append(", aggregateName=").append(aggregateName);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", updateUser=").append(updateUser);
        sb.append(", remarks=").append(remarks);
        sb.append(", type=").append(type);
        sb.append(", planCount=").append(planCount);
        sb.append("]");
        return sb.toString();
    }
}