package com.linghang.model.business.water;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;

/**
 * Created by lvruixing on 2018/12/19.
 * 筛孔设置表 Model
 */
public class WaterSieveSettingModel implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

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
     * 筛孔级别
     */
    private Integer level;

    /**
     * 配方值
     */
    private BigDecimal formulaValue;

    /**
     * 一级上限值
     */
    private BigDecimal firstHigh;


    /**
     * 一级下限值
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
     * 三级上限值
     */
    private BigDecimal threeHigh;


    /**
     * 三级下限值
     */
    private BigDecimal threeLow;

    /**
     * 骨料1
     */
    private BigDecimal g1;

    /**
     * 骨料2
     */
    private BigDecimal g2;

    /**
     * 骨料3
     */
    private BigDecimal g3;

    /**
     * 骨料4
     */
    private BigDecimal g4;

    /**
     * 骨料5
     */
    private BigDecimal g5;

    /**
     * 骨料6
     */
    private BigDecimal g6;

    /**
     * 骨料7
     */
    private BigDecimal g7;

    /**
     * 骨料8
     */
    private BigDecimal g8;

    /**
     * 骨料9
     */
    private BigDecimal g9;

    /**
     * 骨料10
     */
    private BigDecimal g10;

    /**
     * 数据版本
     */
    private Integer dataVersion;

    /**
     * 数据可见 0可见 1不可见
     */
    private Integer isVisible;

    public WaterSieveSettingModel() {
    }

    public WaterSieveSettingModel(Long id, int isVisible) {
        this.id = id;
        this.isVisible = isVisible;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public BigDecimal getG1() {
        return g1;
    }

    public void setG1(BigDecimal g1) {
        this.g1 = g1;
    }

    public BigDecimal getG2() {
        return g2;
    }

    public void setG2(BigDecimal g2) {
        this.g2 = g2;
    }

    public BigDecimal getG3() {
        return g3;
    }

    public void setG3(BigDecimal g3) {
        this.g3 = g3;
    }

    public BigDecimal getG4() {
        return g4;
    }

    public void setG4(BigDecimal g4) {
        this.g4 = g4;
    }

    public BigDecimal getG5() {
        return g5;
    }

    public void setG5(BigDecimal g5) {
        this.g5 = g5;
    }

    public BigDecimal getG6() {
        return g6;
    }

    public void setG6(BigDecimal g6) {
        this.g6 = g6;
    }

    public BigDecimal getG7() {
        return g7;
    }

    public void setG7(BigDecimal g7) {
        this.g7 = g7;
    }

    public BigDecimal getG8() {
        return g8;
    }

    public void setG8(BigDecimal g8) {
        this.g8 = g8;
    }

    public BigDecimal getG9() {
        return g9;
    }

    public void setG9(BigDecimal g9) {
        this.g9 = g9;
    }

    public BigDecimal getG10() {
        return g10;
    }

    public void setG10(BigDecimal g10) {
        this.g10 = g10;
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
        return "WaterSieveSettingModel{" +
                "id=" + id +
                ", updateTime=" + updateTime +
                ", updateUser=" + updateUser +
                ", formulaId=" + formulaId +
                ", level=" + level +
                ", formulaValue=" + formulaValue +
                ", firstHigh=" + firstHigh +
                ", firstLow=" + firstLow +
                ", secondHigh=" + secondHigh +
                ", secondLow=" + secondLow +
                ", threeHigh=" + threeHigh +
                ", threeLow=" + threeLow +
                ", g1=" + g1 +
                ", g2=" + g2 +
                ", g3=" + g3 +
                ", g4=" + g4 +
                ", g5=" + g5 +
                ", g6=" + g6 +
                ", g7=" + g7 +
                ", g8=" + g8 +
                ", g9=" + g9 +
                ", g10=" + g10 +
                ", dataVersion=" + dataVersion +
                ", isVisible=" + isVisible +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        WaterSieveSettingModel that = (WaterSieveSettingModel) o;
        return Objects.equals(id, that.id) &&
                Objects.equals(updateTime, that.updateTime) &&
                Objects.equals(updateUser, that.updateUser) &&
                Objects.equals(formulaId, that.formulaId) &&
                Objects.equals(level, that.level) &&
                Objects.equals(formulaValue, that.formulaValue) &&
                Objects.equals(firstHigh, that.firstHigh) &&
                Objects.equals(firstLow, that.firstLow) &&
                Objects.equals(secondHigh, that.secondHigh) &&
                Objects.equals(secondLow, that.secondLow) &&
                Objects.equals(threeHigh, that.threeHigh) &&
                Objects.equals(threeLow, that.threeLow) &&
                Objects.equals(g1, that.g1) &&
                Objects.equals(g2, that.g2) &&
                Objects.equals(g3, that.g3) &&
                Objects.equals(g4, that.g4) &&
                Objects.equals(g5, that.g5) &&
                Objects.equals(g6, that.g6) &&
                Objects.equals(g7, that.g7) &&
                Objects.equals(g8, that.g8) &&
                Objects.equals(g9, that.g9) &&
                Objects.equals(g10, that.g10) &&
                Objects.equals(dataVersion, that.dataVersion) &&
                Objects.equals(isVisible, that.isVisible);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, updateTime, updateUser, formulaId, level, formulaValue, firstHigh, firstLow, secondHigh, secondLow, threeHigh, threeLow, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, dataVersion, isVisible);
    }
}