package com.linghang.model.business.continuous;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.io.Serializable;
import java.util.Date;

/**
 * @author wuchen on 2019/01/28.
 */
public class ContinuousWarningRecordModel implements Serializable {

    /**
     * 版本号
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private static final long serialVersionUID = 1L;


    /**
     * id
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Long id;


    /**
     * 连续超标配置Id
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Long continuWarningId;


    /**
     * 用户Id
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Long userId;


    /**
     * 用户名称
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String userName;


    /**
     * 修改时间
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Date updateTime;


    /**
     * 拌合机类型
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer mixerType;


    /**
     * 预警类型(1:区分超标级别 2：:不
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer warningType;


    /**
     * 一级预警连续盘数(区分级别直接
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer firstWarning;


    /**
     * 二级预警连续盘数(区分级别直接
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer secondWarning;


    /**
     * 三级预警连续盘数(区分级别直接
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer threeWarning;


    /**
     * 备注信息
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String remark;

    public ContinuousWarningRecordModel (Long id, Long continuWarningId, Long userId, String userName, Date updateTime, Integer mixerType, Integer warningType, Integer firstWarning, Integer secondWarning, Integer threeWarning, String remark) {
        this.id = id;
        this.continuWarningId = continuWarningId;
        this.userId = userId;
        this.userName = userName;
        this.updateTime = updateTime;
        this.mixerType = mixerType;
        this.warningType = warningType;
        this.firstWarning = firstWarning;
        this.secondWarning = secondWarning;
        this.threeWarning = threeWarning;
        this.remark = remark;
    }

    public ContinuousWarningRecordModel () {
        
    }

    public ContinuousWarningRecordModel(Long continuWarningId) {
        this.continuWarningId = continuWarningId;
    }

    public ContinuousWarningRecordModel(Long continuWarningId, Long userId, String userName, Date updateTime, Integer mixerType, Integer warningType, Integer firstWarning, Integer secondWarning, Integer threeWarning, String remark) {
        this.continuWarningId = continuWarningId;
        this.userId = userId;
        this.userName = userName;
        this.updateTime = updateTime;
        this.mixerType = mixerType;
        this.warningType = warningType;
        this.firstWarning = firstWarning;
        this.secondWarning = secondWarning;
        this.threeWarning = threeWarning;
        this.remark = remark;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getContinuWarningId() {
        return continuWarningId;
    }

    public void setContinuWarningId(Long continuWarningId) {
        this.continuWarningId = continuWarningId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getMixerType() {
        return mixerType;
    }

    public void setMixerType(Integer mixerType) {
        this.mixerType = mixerType;
    }

    public Integer getWarningType() {
        return warningType;
    }

    public void setWarningType(Integer warningType) {
        this.warningType = warningType;
    }

    public Integer getFirstWarning() {
        return firstWarning;
    }

    public void setFirstWarning(Integer firstWarning) {
        this.firstWarning = firstWarning;
    }

    public Integer getSecondWarning() {
        return secondWarning;
    }

    public void setSecondWarning(Integer secondWarning) {
        this.secondWarning = secondWarning;
    }

    public Integer getThreeWarning() {
        return threeWarning;
    }

    public void setThreeWarning(Integer threeWarning) {
        this.threeWarning = threeWarning;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", continuWarningId=").append(continuWarningId);
        sb.append(", userId=").append(userId);
        sb.append(", userName=").append(userName);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", mixerType=").append(mixerType);
        sb.append(", warningType=").append(warningType);
        sb.append(", firstWarning=").append(firstWarning);
        sb.append(", secondWarning=").append(secondWarning);
        sb.append(", threeWarning=").append(threeWarning);
        sb.append(", remark=").append(remark);
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
        ContinuousWarningRecordModel other = (ContinuousWarningRecordModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getContinuWarningId() == null ? other.getContinuWarningId() == null : this.getContinuWarningId().equals(other.getContinuWarningId()))
            && (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
            && (this.getUserName() == null ? other.getUserName() == null : this.getUserName().equals(other.getUserName()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()))
            && (this.getMixerType() == null ? other.getMixerType() == null : this.getMixerType().equals(other.getMixerType()))
            && (this.getWarningType() == null ? other.getWarningType() == null : this.getWarningType().equals(other.getWarningType()))
            && (this.getFirstWarning() == null ? other.getFirstWarning() == null : this.getFirstWarning().equals(other.getFirstWarning()))
            && (this.getSecondWarning() == null ? other.getSecondWarning() == null : this.getSecondWarning().equals(other.getSecondWarning()))
            && (this.getThreeWarning() == null ? other.getThreeWarning() == null : this.getThreeWarning().equals(other.getThreeWarning()))
            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getContinuWarningId() == null) ? 0 : getContinuWarningId().hashCode());
        result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
        result = prime * result + ((getUserName() == null) ? 0 : getUserName().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        result = prime * result + ((getMixerType() == null) ? 0 : getMixerType().hashCode());
        result = prime * result + ((getWarningType() == null) ? 0 : getWarningType().hashCode());
        result = prime * result + ((getFirstWarning() == null) ? 0 : getFirstWarning().hashCode());
        result = prime * result + ((getSecondWarning() == null) ? 0 : getSecondWarning().hashCode());
        result = prime * result + ((getThreeWarning() == null) ? 0 : getThreeWarning().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        return result;
    }
}