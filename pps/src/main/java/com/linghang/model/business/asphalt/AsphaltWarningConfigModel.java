package com.linghang.model.business.asphalt;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author wuchen on 2018/12/17.
 * 告警设置表 Model
 */
public class AsphaltWarningConfigModel implements Serializable {

    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */
    private Long id;


    /**
     * 告警分类
     */
    private Integer type;


    /**
     * 告警级别
     */
    private Integer level;


    /**
     * 目标值--配方值
     */
    private BigDecimal formulaValue;


    /**
     * 一级上限值
     */
    private BigDecimal firstHigh;


    /**
     * 一级下限制
     */
    private BigDecimal firstLow;


    /**
     * 二级上限值
     */
    private BigDecimal secondHigh;


    /**
     * 二级下限值
     */
    private BigDecimal secondLow;


    /**
     * 三级上限制
     */
    private BigDecimal threeHigh;


    /**
     * 三级下限值
     */
    private BigDecimal threeLow;


    /**
     * 更新时间
     */
    private Date updateTime;


    /**
     * 更新人
     */
    private Long updateUser;


    /**
     * 配方id
     */
    private Long formulaId;


    /**
     * 数据版本
     */
    private Integer dataVersion;


    /**
     * 数据可见 0可见 1不可见
     */
    private Integer isVisible;

    public AsphaltWarningConfigModel(Long id, Integer type, Integer level, BigDecimal formulaValue, BigDecimal firstHigh, BigDecimal firstLow, BigDecimal secondHigh, BigDecimal secondLow, BigDecimal threeHigh, BigDecimal threeLow, Date updateTime, Long updateUser, Long formulaId, Integer dataVersion, Integer isVisible) {
        this.id = id;
        this.type = type;
        this.level = level;
        this.formulaValue = formulaValue;
        this.firstHigh = firstHigh;
        this.firstLow = firstLow;
        this.secondHigh = secondHigh;
        this.secondLow = secondLow;
        this.threeHigh = threeHigh;
        this.threeLow = threeLow;
        this.updateTime = updateTime;
        this.updateUser = updateUser;
        this.formulaId = formulaId;
        this.dataVersion = dataVersion;
        this.isVisible = isVisible;
    }

    public AsphaltWarningConfigModel() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public BigDecimal getFormulaValue() {
        return formulaValue;
    }

    public void setFormulaValue(BigDecimal formulaValue) {
        this.formulaValue = formulaValue;
    }

    public BigDecimal getFirstHigh() {
        return firstHigh;
    }

    public void setFirstHigh(BigDecimal firstHigh) {
        this.firstHigh = firstHigh;
    }

    public BigDecimal getFirstLow() {
        return firstLow;
    }

    public void setFirstLow(BigDecimal firstLow) {
        this.firstLow = firstLow;
    }

    public BigDecimal getSecondHigh() {
        return secondHigh;
    }

    public void setSecondHigh(BigDecimal secondHigh) {
        this.secondHigh = secondHigh;
    }

    public BigDecimal getSecondLow() {
        return secondLow;
    }

    public void setSecondLow(BigDecimal secondLow) {
        this.secondLow = secondLow;
    }

    public BigDecimal getThreeHigh() {
        return threeHigh;
    }

    public void setThreeHigh(BigDecimal threeHigh) {
        this.threeHigh = threeHigh;
    }

    public BigDecimal getThreeLow() {
        return threeLow;
    }

    public void setThreeLow(BigDecimal threeLow) {
        this.threeLow = threeLow;
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

    public Long getFormulaId() {
        return formulaId;
    }

    public void setFormulaId(Long formulaId) {
        this.formulaId = formulaId;
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
        sb.append(", type=").append(type);
        sb.append(", level=").append(level);
        sb.append(", formulaValue=").append(formulaValue);
        sb.append(", firstHigh=").append(firstHigh);
        sb.append(", firstLow=").append(firstLow);
        sb.append(", secondHigh=").append(secondHigh);
        sb.append(", secondLow=").append(secondLow);
        sb.append(", threeHigh=").append(threeHigh);
        sb.append(", threeLow=").append(threeLow);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", updateUser=").append(updateUser);
        sb.append(", formulaId=").append(formulaId);
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
        AsphaltWarningConfigModel other = (AsphaltWarningConfigModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
                && (this.getLevel() == null ? other.getLevel() == null : this.getLevel().equals(other.getLevel()))
                && (this.getFormulaValue() == null ? other.getFormulaValue() == null : this.getFormulaValue().equals(other.getFormulaValue()))
                && (this.getFirstHigh() == null ? other.getFirstHigh() == null : this.getFirstHigh().equals(other.getFirstHigh()))
                && (this.getFirstLow() == null ? other.getFirstLow() == null : this.getFirstLow().equals(other.getFirstLow()))
                && (this.getSecondHigh() == null ? other.getSecondHigh() == null : this.getSecondHigh().equals(other.getSecondHigh()))
                && (this.getSecondLow() == null ? other.getSecondLow() == null : this.getSecondLow().equals(other.getSecondLow()))
                && (this.getThreeHigh() == null ? other.getThreeHigh() == null : this.getThreeHigh().equals(other.getThreeHigh()))
                && (this.getThreeLow() == null ? other.getThreeLow() == null : this.getThreeLow().equals(other.getThreeLow()))
                && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()))
                && (this.getUpdateUser() == null ? other.getUpdateUser() == null : this.getUpdateUser().equals(other.getUpdateUser()))
                && (this.getFormulaId() == null ? other.getFormulaId() == null : this.getFormulaId().equals(other.getFormulaId()))
                && (this.getDataVersion() == null ? other.getDataVersion() == null : this.getDataVersion().equals(other.getDataVersion()))
                && (this.getIsVisible() == null ? other.getIsVisible() == null : this.getIsVisible().equals(other.getIsVisible()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getLevel() == null) ? 0 : getLevel().hashCode());
        result = prime * result + ((getFormulaValue() == null) ? 0 : getFormulaValue().hashCode());
        result = prime * result + ((getFirstHigh() == null) ? 0 : getFirstHigh().hashCode());
        result = prime * result + ((getFirstLow() == null) ? 0 : getFirstLow().hashCode());
        result = prime * result + ((getSecondHigh() == null) ? 0 : getSecondHigh().hashCode());
        result = prime * result + ((getSecondLow() == null) ? 0 : getSecondLow().hashCode());
        result = prime * result + ((getThreeHigh() == null) ? 0 : getThreeHigh().hashCode());
        result = prime * result + ((getThreeLow() == null) ? 0 : getThreeLow().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        result = prime * result + ((getUpdateUser() == null) ? 0 : getUpdateUser().hashCode());
        result = prime * result + ((getFormulaId() == null) ? 0 : getFormulaId().hashCode());
        result = prime * result + ((getDataVersion() == null) ? 0 : getDataVersion().hashCode());
        result = prime * result + ((getIsVisible() == null) ? 0 : getIsVisible().hashCode());
        return result;
    }
}