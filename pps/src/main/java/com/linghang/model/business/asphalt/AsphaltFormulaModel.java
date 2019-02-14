package com.linghang.model.business.asphalt;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author wuchen on 2018/12/17.
 * 沥青配方表 Model
 */
public class AsphaltFormulaModel implements Serializable {

    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */
    private Long id;


    /**
     * 配方编号
     */
    private String asphaltNo;


    /**
     * 配方名称
     */
    private String name;


    /**
     * 摊铺层级
     */
    private Long pavingLevel;


    /**
     * 国标等级
     */
    private Long standardLevel;


    /**
     * 计划产量
     */
    private BigDecimal planOutput;


    /**
     * 附加产量
     */
    private BigDecimal additionalOutput;


    /**
     * 合格率
     */
    private BigDecimal passRate;
    /**
     * 附加合格率
     */
    private BigDecimal additionalPassRate;


    /**
     * 配方状态--0启用-1禁用
     */
    private Integer status;


    /**
     * 沥青拌合站id
     */
    private Long asphaltId;


    /**
     * 备注
     */
    private String remarks;


    /**
     * 更新时间
     */
    private Date updateTime;


    /**
     * 更新人
     */
    private Long updateUser;


    /**
     * 数据版本
     */
    private Integer dataVersion;


    /**
     * 数据可见 0可见-1不可见
     */
    private Integer isVisible;

    public AsphaltFormulaModel(Long id, String asphaltNo, String name, Long pavingLevel, Long standardLevel, BigDecimal planOutput, BigDecimal additionalOutput, BigDecimal passRate, Integer status, Long asphaltId, String remarks, Date updateTime, Long updateUser, Integer dataVersion, Integer isVisible) {
        this.id = id;
        this.asphaltNo = asphaltNo;
        this.name = name;
        this.pavingLevel = pavingLevel;
        this.standardLevel = standardLevel;
        this.planOutput = planOutput;
        this.additionalOutput = additionalOutput;
        this.passRate = passRate;
        this.status = status;
        this.asphaltId = asphaltId;
        this.remarks = remarks;
        this.updateTime = updateTime;
        this.updateUser = updateUser;
        this.dataVersion = dataVersion;
        this.isVisible = isVisible;
    }

    public AsphaltFormulaModel() {

    }

    public BigDecimal getAdditionalPassRate() {
        return additionalPassRate;
    }

    public void setAdditionalPassRate(BigDecimal additionalPassRate) {
        this.additionalPassRate = additionalPassRate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAsphaltNo() {
        return asphaltNo;
    }

    public void setAsphaltNo(String asphaltNo) {
        this.asphaltNo = asphaltNo == null ? null : asphaltNo.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Long getPavingLevel() {
        return pavingLevel;
    }

    public void setPavingLevel(Long pavingLevel) {
        this.pavingLevel = pavingLevel;
    }

    public Long getStandardLevel() {
        return standardLevel;
    }

    public void setStandardLevel(Long standardLevel) {
        this.standardLevel = standardLevel;
    }

    public BigDecimal getPlanOutput() {
        return planOutput;
    }

    public void setPlanOutput(BigDecimal planOutput) {
        this.planOutput = planOutput;
    }

    public BigDecimal getAdditionalOutput() {
        return additionalOutput;
    }

    public void setAdditionalOutput(BigDecimal additionalOutput) {
        this.additionalOutput = additionalOutput;
    }

    public BigDecimal getPassRate() {
        return passRate;
    }

    public void setPassRate(BigDecimal passRate) {
        this.passRate = passRate;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getAsphaltId() {
        return asphaltId;
    }

    public void setAsphaltId(Long asphaltId) {
        this.asphaltId = asphaltId;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
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

    public Integer getDataVersion() {
        return dataVersion;
    }

    public void setDataVersion(Integer dataVersion) {
        this.dataVersion = dataVersion;
    }

    public Integer getIsVisible() {
        return isVisible;
    }

    public void setIsVisible(Integer isVisible) {
        this.isVisible = isVisible;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", asphaltNo=").append(asphaltNo);
        sb.append(", name=").append(name);
        sb.append(", pavingLevel=").append(pavingLevel);
        sb.append(", standardLevel=").append(standardLevel);
        sb.append(", planOutput=").append(planOutput);
        sb.append(", additionalOutput=").append(additionalOutput);
        sb.append(", passRate=").append(passRate);
        sb.append(", status=").append(status);
        sb.append(", asphaltId=").append(asphaltId);
        sb.append(", remarks=").append(remarks);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", updateUser=").append(updateUser);
        sb.append(", dataVersion=").append(dataVersion);
        sb.append(", isVisible=").append(isVisible);
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
        AsphaltFormulaModel other = (AsphaltFormulaModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getAsphaltNo() == null ? other.getAsphaltNo() == null : this.getAsphaltNo().equals(other.getAsphaltNo()))
                && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
                && (this.getPavingLevel() == null ? other.getPavingLevel() == null : this.getPavingLevel().equals(other.getPavingLevel()))
                && (this.getStandardLevel() == null ? other.getStandardLevel() == null : this.getStandardLevel().equals(other.getStandardLevel()))
                && (this.getPlanOutput() == null ? other.getPlanOutput() == null : this.getPlanOutput().equals(other.getPlanOutput()))
                && (this.getAdditionalOutput() == null ? other.getAdditionalOutput() == null : this.getAdditionalOutput().equals(other.getAdditionalOutput()))
                && (this.getPassRate() == null ? other.getPassRate() == null : this.getPassRate().equals(other.getPassRate()))
                && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
                && (this.getAsphaltId() == null ? other.getAsphaltId() == null : this.getAsphaltId().equals(other.getAsphaltId()))
                && (this.getRemarks() == null ? other.getRemarks() == null : this.getRemarks().equals(other.getRemarks()))
                && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()))
                && (this.getUpdateUser() == null ? other.getUpdateUser() == null : this.getUpdateUser().equals(other.getUpdateUser()))
                && (this.getDataVersion() == null ? other.getDataVersion() == null : this.getDataVersion().equals(other.getDataVersion()))
                && (this.getIsVisible() == null ? other.getIsVisible() == null : this.getIsVisible().equals(other.getIsVisible()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getAsphaltNo() == null) ? 0 : getAsphaltNo().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getPavingLevel() == null) ? 0 : getPavingLevel().hashCode());
        result = prime * result + ((getStandardLevel() == null) ? 0 : getStandardLevel().hashCode());
        result = prime * result + ((getPlanOutput() == null) ? 0 : getPlanOutput().hashCode());
        result = prime * result + ((getAdditionalOutput() == null) ? 0 : getAdditionalOutput().hashCode());
        result = prime * result + ((getPassRate() == null) ? 0 : getPassRate().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getAsphaltId() == null) ? 0 : getAsphaltId().hashCode());
        result = prime * result + ((getRemarks() == null) ? 0 : getRemarks().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        result = prime * result + ((getUpdateUser() == null) ? 0 : getUpdateUser().hashCode());
        result = prime * result + ((getDataVersion() == null) ? 0 : getDataVersion().hashCode());
        result = prime * result + ((getIsVisible() == null) ? 0 : getIsVisible().hashCode());
        return result;
    }
}