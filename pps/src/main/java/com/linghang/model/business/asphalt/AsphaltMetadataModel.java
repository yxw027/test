package com.linghang.model.business.asphalt;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author wuchen on 2018/12/17.
 * 沥青元数据 Model
 */
public class AsphaltMetadataModel implements Serializable {

    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */
    private Long id;

    private Long mixingMachineId;
    /**
     * 生产时间
     */
    private Date time;
    /**
     * 拌合开始时间
     */
    private Date startTime;
    /**
     * 拌合结束时间
     */
    private Date endTime;
    /**
     * 拌合时间
     */
    private Long mixingTime;


    /**
     * 拌合站id
     */
    private Long asphaltId;


    /**
     * 配方id
     */
    private Long formulaId;


    /**
     * 配方编码值
     */
    private String formulaCode;
    /**
     * 配方名称
     */
    private String formulaName;


    /**
     * 油石比
     */
    private BigDecimal oilStoneProportion;


    /**
     * 沥青重量
     */
    private BigDecimal asphalt;


    /**
     * 出料温度
     */
    private BigDecimal temperature;


    /**
     * 总重量
     */
    private BigDecimal weight;


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
     * 告警级别
     */
    private Integer warnLevel;


    /**
     * 沥青温度
     */
    private BigDecimal asphaltTemperature;


    /**
     * 集料温度
     */
    private BigDecimal aggregateTemperature;


    /**
     * 创建时间
     */
    private Date createTime;


    /**
     * 批次编号
     */
    private String batchCode;


    /**
     * 温度告警级别
     */
    private Integer tempLevel;
    /**
     * 沥青温度告警级别
     */
    private Integer asphaltTempLevel;
    /**
     * 集料温度告警级别
     */
    private Integer aggTempLevel;

    /**
     * 级配超标等级
     */
    private Integer gradationLevel;


    /**
     * 油石比超标等级
     */
    private Integer oilStoneLevel;


    /**
     * 骨料重量
     */
    private BigDecimal aggregateWeight;

    /**
     * 拌合温度
     */
    private BigDecimal mixingTemperature;

    private Integer mixingTempLevel;
    /**
     * 是否合格
     */
    private int isPass;

    public AsphaltMetadataModel(Long id, Date time, Long mixingTime, Long asphaltId, Long formulaId, String formulaCode, BigDecimal oilStoneProportion, BigDecimal asphalt, BigDecimal temperature, BigDecimal weight, BigDecimal g1, BigDecimal g2, BigDecimal g3, BigDecimal g4, BigDecimal g5, BigDecimal g6, BigDecimal g7, BigDecimal g8, BigDecimal g9, BigDecimal g10, BigDecimal f1, BigDecimal f2, BigDecimal f3, BigDecimal f4, BigDecimal f5, Integer warnLevel, BigDecimal asphaltTemperature, BigDecimal aggregateTemperature, Date createTime, String batchCode, Integer tempLevel, Integer gradationLevel, Integer oilStoneLevel, BigDecimal aggregateWeight) {
        this.id = id;
        this.time = time;
        this.mixingTime = mixingTime;
        this.asphaltId = asphaltId;
        this.formulaId = formulaId;
        this.formulaCode = formulaCode;
        this.oilStoneProportion = oilStoneProportion;
        this.asphalt = asphalt;
        this.temperature = temperature;
        this.weight = weight;
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
        this.warnLevel = warnLevel;
        this.asphaltTemperature = asphaltTemperature;
        this.aggregateTemperature = aggregateTemperature;
        this.createTime = createTime;
        this.batchCode = batchCode;
        this.tempLevel = tempLevel;
        this.gradationLevel = gradationLevel;
        this.oilStoneLevel = oilStoneLevel;
        this.aggregateWeight = aggregateWeight;
    }

    public AsphaltMetadataModel() {

    }

    public Integer getAsphaltTempLevel() {
        return asphaltTempLevel;
    }

    public void setAsphaltTempLevel(Integer asphaltTempLevel) {
        this.asphaltTempLevel = asphaltTempLevel;
    }

    public Integer getAggTempLevel() {
        return aggTempLevel;
    }

    public void setAggTempLevel(Integer aggTempLevel) {
        this.aggTempLevel = aggTempLevel;
    }

    public String getFormulaName() {
        return formulaName;
    }

    public void setFormulaName(String formulaName) {
        this.formulaName = formulaName;
    }

    public int getIsPass() {
        return isPass;
    }

    public void setIsPass(int isPass) {
        this.isPass = isPass;
    }

    public Long getMixingMachineId() {
        return mixingMachineId;
    }

    public void setMixingMachineId(Long mixingMachineId) {
        this.mixingMachineId = mixingMachineId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Long getMixingTime() {
        return mixingTime;
    }

    public void setMixingTime(Long mixingTime) {
        this.mixingTime = mixingTime;
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

    public Long getAsphaltId() {
        return asphaltId;
    }

    public void setAsphaltId(Long asphaltId) {
        this.asphaltId = asphaltId;
    }

    public Long getFormulaId() {
        return formulaId;
    }

    public void setFormulaId(Long formulaId) {
        this.formulaId = formulaId;
    }

    public String getFormulaCode() {
        return formulaCode;
    }

    public void setFormulaCode(String formulaCode) {
        this.formulaCode = formulaCode == null ? null : formulaCode.trim();
    }

    public BigDecimal getOilStoneProportion() {
        return oilStoneProportion;
    }

    public void setOilStoneProportion(BigDecimal oilStoneProportion) {
        this.oilStoneProportion = oilStoneProportion;
    }

    public BigDecimal getAsphalt() {
        return asphalt;
    }

    public void setAsphalt(BigDecimal asphalt) {
        this.asphalt = asphalt;
    }

    public BigDecimal getTemperature() {
        return temperature;
    }

    public void setTemperature(BigDecimal temperature) {
        this.temperature = temperature;
    }

    public BigDecimal getWeight() {
        return weight;
    }

    public void setWeight(BigDecimal weight) {
        this.weight = weight;
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

    public Integer getWarnLevel() {
        return warnLevel;
    }

    public void setWarnLevel(Integer warnLevel) {
        this.warnLevel = warnLevel;
    }

    public BigDecimal getAsphaltTemperature() {
        return asphaltTemperature;
    }

    public void setAsphaltTemperature(BigDecimal asphaltTemperature) {
        this.asphaltTemperature = asphaltTemperature;
    }

    public BigDecimal getAggregateTemperature() {
        return aggregateTemperature;
    }

    public void setAggregateTemperature(BigDecimal aggregateTemperature) {
        this.aggregateTemperature = aggregateTemperature;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getBatchCode() {
        return batchCode;
    }

    public void setBatchCode(String batchCode) {
        this.batchCode = batchCode == null ? null : batchCode.trim();
    }

    public Integer getTempLevel() {
        return tempLevel;
    }

    public void setTempLevel(Integer tempLevel) {
        this.tempLevel = tempLevel;
    }

    public Integer getGradationLevel() {
        return gradationLevel;
    }

    public void setGradationLevel(Integer gradationLevel) {
        this.gradationLevel = gradationLevel;
    }

    public Integer getOilStoneLevel() {
        return oilStoneLevel;
    }

    public void setOilStoneLevel(Integer oilStoneLevel) {
        this.oilStoneLevel = oilStoneLevel;
    }

    public BigDecimal getAggregateWeight() {
        return aggregateWeight;
    }

    public void setAggregateWeight(BigDecimal aggregateWeight) {
        this.aggregateWeight = aggregateWeight;
    }


    public BigDecimal getMixingTemperature() {
        return mixingTemperature;
    }

    public void setMixingTemperature(BigDecimal mixingTemperature) {
        this.mixingTemperature = mixingTemperature;
    }

    public Integer getMixingTempLevel() {
        return mixingTempLevel;
    }

    public void setMixingTempLevel(Integer mixingTempLevel) {
        this.mixingTempLevel = mixingTempLevel;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", time=").append(time);
        sb.append(", mixingTime=").append(mixingTime);
        sb.append(", asphaltId=").append(asphaltId);
        sb.append(", formulaId=").append(formulaId);
        sb.append(", formulaCode=").append(formulaCode);
        sb.append(", oilStoneProportion=").append(oilStoneProportion);
        sb.append(", asphalt=").append(asphalt);
        sb.append(", temperature=").append(temperature);
        sb.append(", weight=").append(weight);
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
        sb.append(", warnLevel=").append(warnLevel);
        sb.append(", asphaltTemperature=").append(asphaltTemperature);
        sb.append(", aggregateTemperature=").append(aggregateTemperature);
        sb.append(", createTime=").append(createTime);
        sb.append(", batchCode=").append(batchCode);
        sb.append(", tempLevel=").append(tempLevel);
        sb.append(", gradationLevel=").append(gradationLevel);
        sb.append(", oilStoneLevel=").append(oilStoneLevel);
        sb.append(", aggregateWeight=").append(aggregateWeight);
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
        AsphaltMetadataModel other = (AsphaltMetadataModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getTime() == null ? other.getTime() == null : this.getTime().equals(other.getTime()))
                && (this.getMixingTime() == null ? other.getMixingTime() == null : this.getMixingTime().equals(other.getMixingTime()))
                && (this.getAsphaltId() == null ? other.getAsphaltId() == null : this.getAsphaltId().equals(other.getAsphaltId()))
                && (this.getFormulaId() == null ? other.getFormulaId() == null : this.getFormulaId().equals(other.getFormulaId()))
                && (this.getFormulaCode() == null ? other.getFormulaCode() == null : this.getFormulaCode().equals(other.getFormulaCode()))
                && (this.getOilStoneProportion() == null ? other.getOilStoneProportion() == null : this.getOilStoneProportion().equals(other.getOilStoneProportion()))
                && (this.getAsphalt() == null ? other.getAsphalt() == null : this.getAsphalt().equals(other.getAsphalt()))
                && (this.getTemperature() == null ? other.getTemperature() == null : this.getTemperature().equals(other.getTemperature()))
                && (this.getWeight() == null ? other.getWeight() == null : this.getWeight().equals(other.getWeight()))
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
                && (this.getWarnLevel() == null ? other.getWarnLevel() == null : this.getWarnLevel().equals(other.getWarnLevel()))
                && (this.getAsphaltTemperature() == null ? other.getAsphaltTemperature() == null : this.getAsphaltTemperature().equals(other.getAsphaltTemperature()))
                && (this.getAggregateTemperature() == null ? other.getAggregateTemperature() == null : this.getAggregateTemperature().equals(other.getAggregateTemperature()))
                && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
                && (this.getBatchCode() == null ? other.getBatchCode() == null : this.getBatchCode().equals(other.getBatchCode()))
                && (this.getTempLevel() == null ? other.getTempLevel() == null : this.getTempLevel().equals(other.getTempLevel()))
                && (this.getGradationLevel() == null ? other.getGradationLevel() == null : this.getGradationLevel().equals(other.getGradationLevel()))
                && (this.getOilStoneLevel() == null ? other.getOilStoneLevel() == null : this.getOilStoneLevel().equals(other.getOilStoneLevel()))
                && (this.getAggregateWeight() == null ? other.getAggregateWeight() == null : this.getAggregateWeight().equals(other.getAggregateWeight()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getTime() == null) ? 0 : getTime().hashCode());
        result = prime * result + ((getMixingTime() == null) ? 0 : getMixingTime().hashCode());
        result = prime * result + ((getAsphaltId() == null) ? 0 : getAsphaltId().hashCode());
        result = prime * result + ((getFormulaId() == null) ? 0 : getFormulaId().hashCode());
        result = prime * result + ((getFormulaCode() == null) ? 0 : getFormulaCode().hashCode());
        result = prime * result + ((getOilStoneProportion() == null) ? 0 : getOilStoneProportion().hashCode());
        result = prime * result + ((getAsphalt() == null) ? 0 : getAsphalt().hashCode());
        result = prime * result + ((getTemperature() == null) ? 0 : getTemperature().hashCode());
        result = prime * result + ((getWeight() == null) ? 0 : getWeight().hashCode());
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
        result = prime * result + ((getWarnLevel() == null) ? 0 : getWarnLevel().hashCode());
        result = prime * result + ((getAsphaltTemperature() == null) ? 0 : getAsphaltTemperature().hashCode());
        result = prime * result + ((getAggregateTemperature() == null) ? 0 : getAggregateTemperature().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getBatchCode() == null) ? 0 : getBatchCode().hashCode());
        result = prime * result + ((getTempLevel() == null) ? 0 : getTempLevel().hashCode());
        result = prime * result + ((getGradationLevel() == null) ? 0 : getGradationLevel().hashCode());
        result = prime * result + ((getOilStoneLevel() == null) ? 0 : getOilStoneLevel().hashCode());
        result = prime * result + ((getAggregateWeight() == null) ? 0 : getAggregateWeight().hashCode());
        return result;
    }
}