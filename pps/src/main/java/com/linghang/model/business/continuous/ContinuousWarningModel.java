package com.linghang.model.business.continuous;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.io.Serializable;
import java.util.Date;

/**
 * @author wuchen on 2019/01/28.
 */
public class ContinuousWarningModel implements Serializable {

    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;


    /**
     * id
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Long id;


    /**
     * 项目名称
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Long projectId;


    /**
     * 项目名称
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String projectName;


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


    /**
     * 修改时间
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Date updateTime;

    public ContinuousWarningModel (Long id, Long projectId, String projectName, Integer mixerType, Integer warningType, Integer firstWarning, Integer secondWarning, Integer threeWarning, String remark, Date updateTime) {
        this.id = id;
        this.projectId = projectId;
        this.projectName = projectName;
        this.mixerType = mixerType;
        this.warningType = warningType;
        this.firstWarning = firstWarning;
        this.secondWarning = secondWarning;
        this.threeWarning = threeWarning;
        this.remark = remark;
        this.updateTime = updateTime;
    }

    public ContinuousWarningModel () {
        
    }

    public ContinuousWarningModel(Long projectId, Integer mixerType) {
        this.projectId = projectId;
        this.mixerType = mixerType;
    }

    public ContinuousWarningModel(Long id, Long projectId, Integer mixerType) {
        this.id = id;
        this.projectId = projectId;
        this.mixerType = mixerType;
    }

    public ContinuousWarningModel(Long projectId) {
        this.projectId = projectId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName == null ? null : projectName.trim();
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

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", projectId=").append(projectId);
        sb.append(", projectName=").append(projectName);
        sb.append(", mixerType=").append(mixerType);
        sb.append(", warningType=").append(warningType);
        sb.append(", firstWarning=").append(firstWarning);
        sb.append(", secondWarning=").append(secondWarning);
        sb.append(", threeWarning=").append(threeWarning);
        sb.append(", remark=").append(remark);
        sb.append(", updateTime=").append(updateTime);
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
        ContinuousWarningModel other = (ContinuousWarningModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getProjectId() == null ? other.getProjectId() == null : this.getProjectId().equals(other.getProjectId()))
            && (this.getProjectName() == null ? other.getProjectName() == null : this.getProjectName().equals(other.getProjectName()))
            && (this.getMixerType() == null ? other.getMixerType() == null : this.getMixerType().equals(other.getMixerType()))
            && (this.getWarningType() == null ? other.getWarningType() == null : this.getWarningType().equals(other.getWarningType()))
            && (this.getFirstWarning() == null ? other.getFirstWarning() == null : this.getFirstWarning().equals(other.getFirstWarning()))
            && (this.getSecondWarning() == null ? other.getSecondWarning() == null : this.getSecondWarning().equals(other.getSecondWarning()))
            && (this.getThreeWarning() == null ? other.getThreeWarning() == null : this.getThreeWarning().equals(other.getThreeWarning()))
            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getProjectId() == null) ? 0 : getProjectId().hashCode());
        result = prime * result + ((getProjectName() == null) ? 0 : getProjectName().hashCode());
        result = prime * result + ((getMixerType() == null) ? 0 : getMixerType().hashCode());
        result = prime * result + ((getWarningType() == null) ? 0 : getWarningType().hashCode());
        result = prime * result + ((getFirstWarning() == null) ? 0 : getFirstWarning().hashCode());
        result = prime * result + ((getSecondWarning() == null) ? 0 : getSecondWarning().hashCode());
        result = prime * result + ((getThreeWarning() == null) ? 0 : getThreeWarning().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        return result;
    }
}