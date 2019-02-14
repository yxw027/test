package com.linghang.model.business.asphalt;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author wuchen on 2018/12/17.
 * 筛孔设置表 Model
 */
public class AsphaltSieveSettingModel implements Serializable {

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
     * 粉料1
     */
    private BigDecimal f1;


    /**
     * 粉料2
     */
    private BigDecimal f2;


    /**
     * 粉料3
     */
    private BigDecimal f3;


    /**
     * 粉料4
     */
    private BigDecimal f4;


    /**
     * 粉料5
     */
    private BigDecimal f5;


    /**
     * 数据版本
     */
    private Integer dataVersion;


    /**
     * 数据可见 0可见 1不可见
     */
    private Integer isVisible;

    public AsphaltSieveSettingModel(Long id, Date updateTime, Long updateUser, Long formulaId, Integer level, BigDecimal formulaValue, BigDecimal firstHigh, BigDecimal firstLow, BigDecimal secondHigh, BigDecimal secondLow, BigDecimal threeHigh, BigDecimal threeLow, BigDecimal g1, BigDecimal g2, BigDecimal g3, BigDecimal g4, BigDecimal g5, BigDecimal g6, BigDecimal g7, BigDecimal g8, BigDecimal g9, BigDecimal g10, BigDecimal f1, BigDecimal f2, BigDecimal f3, BigDecimal f4, BigDecimal f5, Integer dataVersion, Integer isVisible) {
        this.id = id;
        this.updateTime = updateTime;
        this.updateUser = updateUser;
        this.formulaId = formulaId;
        this.level = level;
        this.formulaValue = formulaValue;
        this.firstHigh = firstHigh;
        this.firstLow = firstLow;
        this.secondHigh = secondHigh;
        this.secondLow = secondLow;
        this.threeHigh = threeHigh;
        this.threeLow = threeLow;
        this.g1 = g1;
        this.g2 = g2;
        this.g3 = g3;
        this.g4 = g4;
        this.g5 = g5;
        this.g6 = g6;
        this.g7 = g7;
        this.g8 = g8;
        this.g9 = g9;
        this.g10 = g10;
        this.f1 = f1;
        this.f2 = f2;
        this.f3 = f3;
        this.f4 = f4;
        this.f5 = f5;
        this.dataVersion = dataVersion;
        this.isVisible = isVisible;
    }

    public AsphaltSieveSettingModel() {

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

    public BigDecimal getF1() {
        return f1;
    }

    public void setF1(BigDecimal f1) {
        this.f1 = f1;
    }

    public BigDecimal getF2() {
        return f2;
    }

    public void setF2(BigDecimal f2) {
        this.f2 = f2;
    }

    public BigDecimal getF3() {
        return f3;
    }

    public void setF3(BigDecimal f3) {
        this.f3 = f3;
    }

    public BigDecimal getF4() {
        return f4;
    }

    public void setF4(BigDecimal f4) {
        this.f4 = f4;
    }

    public BigDecimal getF5() {
        return f5;
    }

    public void setF5(BigDecimal f5) {
        this.f5 = f5;
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
        sb.append(", updateTime=").append(updateTime);
        sb.append(", updateUser=").append(updateUser);
        sb.append(", formulaId=").append(formulaId);
        sb.append(", level=").append(level);
        sb.append(", formulaValue=").append(formulaValue);
        sb.append(", firstHigh=").append(firstHigh);
        sb.append(", firstLow=").append(firstLow);
        sb.append(", secondHigh=").append(secondHigh);
        sb.append(", secondLow=").append(secondLow);
        sb.append(", threeHigh=").append(threeHigh);
        sb.append(", threeLow=").append(threeLow);
        sb.append(", g1=").append(g1);
        sb.append(", g2=").append(g2);
        sb.append(", g3=").append(g3);
        sb.append(", g4=").append(g4);
        sb.append(", g5=").append(g5);
        sb.append(", g6=").append(g6);
        sb.append(", g7=").append(g7);
        sb.append(", g8=").append(g8);
        sb.append(", g9=").append(g9);
        sb.append(", g10=").append(g10);
        sb.append(", f1=").append(f1);
        sb.append(", f2=").append(f2);
        sb.append(", f3=").append(f3);
        sb.append(", f4=").append(f4);
        sb.append(", f5=").append(f5);
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
        AsphaltSieveSettingModel other = (AsphaltSieveSettingModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()))
                && (this.getUpdateUser() == null ? other.getUpdateUser() == null : this.getUpdateUser().equals(other.getUpdateUser()))
                && (this.getFormulaId() == null ? other.getFormulaId() == null : this.getFormulaId().equals(other.getFormulaId()))
                && (this.getLevel() == null ? other.getLevel() == null : this.getLevel().equals(other.getLevel()))
                && (this.getFormulaValue() == null ? other.getFormulaValue() == null : this.getFormulaValue().equals(other.getFormulaValue()))
                && (this.getFirstHigh() == null ? other.getFirstHigh() == null : this.getFirstHigh().equals(other.getFirstHigh()))
                && (this.getFirstLow() == null ? other.getFirstLow() == null : this.getFirstLow().equals(other.getFirstLow()))
                && (this.getSecondHigh() == null ? other.getSecondHigh() == null : this.getSecondHigh().equals(other.getSecondHigh()))
                && (this.getSecondLow() == null ? other.getSecondLow() == null : this.getSecondLow().equals(other.getSecondLow()))
                && (this.getThreeHigh() == null ? other.getThreeHigh() == null : this.getThreeHigh().equals(other.getThreeHigh()))
                && (this.getThreeLow() == null ? other.getThreeLow() == null : this.getThreeLow().equals(other.getThreeLow()))
                && (this.getG1() == null ? other.getG1() == null : this.getG1().equals(other.getG1()))
                && (this.getG2() == null ? other.getG2() == null : this.getG2().equals(other.getG2()))
                && (this.getG3() == null ? other.getG3() == null : this.getG3().equals(other.getG3()))
                && (this.getG4() == null ? other.getG4() == null : this.getG4().equals(other.getG4()))
                && (this.getG5() == null ? other.getG5() == null : this.getG5().equals(other.getG5()))
                && (this.getG6() == null ? other.getG6() == null : this.getG6().equals(other.getG6()))
                && (this.getG7() == null ? other.getG7() == null : this.getG7().equals(other.getG7()))
                && (this.getG8() == null ? other.getG8() == null : this.getG8().equals(other.getG8()))
                && (this.getG9() == null ? other.getG9() == null : this.getG9().equals(other.getG9()))
                && (this.getG10() == null ? other.getG10() == null : this.getG10().equals(other.getG10()))
                && (this.getF1() == null ? other.getF1() == null : this.getF1().equals(other.getF1()))
                && (this.getF2() == null ? other.getF2() == null : this.getF2().equals(other.getF2()))
                && (this.getF3() == null ? other.getF3() == null : this.getF3().equals(other.getF3()))
                && (this.getF4() == null ? other.getF4() == null : this.getF4().equals(other.getF4()))
                && (this.getF5() == null ? other.getF5() == null : this.getF5().equals(other.getF5()))
                && (this.getDataVersion() == null ? other.getDataVersion() == null : this.getDataVersion().equals(other.getDataVersion()))
                && (this.getIsVisible() == null ? other.getIsVisible() == null : this.getIsVisible().equals(other.getIsVisible()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        result = prime * result + ((getUpdateUser() == null) ? 0 : getUpdateUser().hashCode());
        result = prime * result + ((getFormulaId() == null) ? 0 : getFormulaId().hashCode());
        result = prime * result + ((getLevel() == null) ? 0 : getLevel().hashCode());
        result = prime * result + ((getFormulaValue() == null) ? 0 : getFormulaValue().hashCode());
        result = prime * result + ((getFirstHigh() == null) ? 0 : getFirstHigh().hashCode());
        result = prime * result + ((getFirstLow() == null) ? 0 : getFirstLow().hashCode());
        result = prime * result + ((getSecondHigh() == null) ? 0 : getSecondHigh().hashCode());
        result = prime * result + ((getSecondLow() == null) ? 0 : getSecondLow().hashCode());
        result = prime * result + ((getThreeHigh() == null) ? 0 : getThreeHigh().hashCode());
        result = prime * result + ((getThreeLow() == null) ? 0 : getThreeLow().hashCode());
        result = prime * result + ((getG1() == null) ? 0 : getG1().hashCode());
        result = prime * result + ((getG2() == null) ? 0 : getG2().hashCode());
        result = prime * result + ((getG3() == null) ? 0 : getG3().hashCode());
        result = prime * result + ((getG4() == null) ? 0 : getG4().hashCode());
        result = prime * result + ((getG5() == null) ? 0 : getG5().hashCode());
        result = prime * result + ((getG6() == null) ? 0 : getG6().hashCode());
        result = prime * result + ((getG7() == null) ? 0 : getG7().hashCode());
        result = prime * result + ((getG8() == null) ? 0 : getG8().hashCode());
        result = prime * result + ((getG9() == null) ? 0 : getG9().hashCode());
        result = prime * result + ((getG10() == null) ? 0 : getG10().hashCode());
        result = prime * result + ((getF1() == null) ? 0 : getF1().hashCode());
        result = prime * result + ((getF2() == null) ? 0 : getF2().hashCode());
        result = prime * result + ((getF3() == null) ? 0 : getF3().hashCode());
        result = prime * result + ((getF4() == null) ? 0 : getF4().hashCode());
        result = prime * result + ((getF5() == null) ? 0 : getF5().hashCode());
        result = prime * result + ((getDataVersion() == null) ? 0 : getDataVersion().hashCode());
        result = prime * result + ((getIsVisible() == null) ? 0 : getIsVisible().hashCode());
        return result;
    }
}