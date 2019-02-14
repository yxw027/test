package com.linghang.model.business.water;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by dell on 2018/12/19.
 * 沥青元数据 Model
 *
 * @author dell
 */
public class WaterMetaDataModel extends WaterEntity {
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
     * 请求参数
     */
    private Date startTime;

    /**
     * 请求参数
     */
    private Date endTime;

    /**
     * 拌合时长
     */
    private Long mixTime;

    /**
     * 水稳站id
     */
    private Long stationId;

    /**
     * 配方id
     */
    private Long formulaId;

    /**
     * 配方编码值
     */
    private String formulaCode;

    /**
     * 水泥
     */
    private BigDecimal cement;

    /**
     * 水
     */
    private BigDecimal water;

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
     * 告警级别
     */
    private Integer warnLevel;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 批次编号
     */
    private String batchCode;

    /**
     * 重量
     */
    private BigDecimal weight;
    /**
     * 配方信息
     */
    private WaterFormulaModel formulaModel;

    /*
    水泥比
     */
    private BigDecimal cementProportion;

    /*
    水比
     */
    private BigDecimal waterProportion;

    /**
     * 是否合格 0合格-1不合格
     */
    private Integer isPass;

    /**
     * 水泥报警级别
     */
    private Integer cementLevel;

    /**
     * 水报警级别
     */
    private Integer waterLevel;

    /**
     * 筛孔计算版本
     */
    private Integer sieveVersion;

    /**
     * 数据计算版本
     */
    private Integer dataVersion;

    private Integer allLevel;

    public Integer getAllLevel() {
        return allLevel;
    }

    public void setAllLevel(Integer allLevel) {
        this.allLevel = allLevel;
    }

    public Integer getDataVersion() {
        return dataVersion;
    }

    public void setDataVersion(Integer dataVersion) {
        this.dataVersion = dataVersion;
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

    public Long getMixTime() {
        return mixTime;
    }

    public void setMixTime(Long mixTime) {
        this.mixTime = mixTime;
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

    public Long getStationId() {
        return stationId;
    }

    public void setStationId(Long stationId) {
        this.stationId = stationId;
    }

    public Long getFormulaId() {
        return formulaId;
    }

    public void setFormulaId(Long formulaId) {
        this.formulaId = formulaId;
    }

    public BigDecimal getCement() {
        return cement;
    }

    public void setCement(BigDecimal cement) {
        this.cement = cement;
    }

    public BigDecimal getWater() {
        return water;
    }

    public void setWater(BigDecimal water) {
        this.water = water;
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

    public Integer getWarnLevel() {
        return warnLevel;
    }

    public void setWarnLevel(Integer warnLevel) {
        this.warnLevel = warnLevel;
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

    public BigDecimal getWeight() {
        return weight;
    }

    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }

    @Override
    public WaterFormulaModel getFormulaModel() {
        return formulaModel;
    }

    @Override
    public void setFormulaModel(WaterFormulaModel formulaModel) {
        this.formulaModel = formulaModel;
    }

    public Long getMixingMachineId() {
        return mixingMachineId;
    }

    public void setMixingMachineId(Long mixingMachineId) {
        this.mixingMachineId = mixingMachineId;
    }

    public String getFormulaCode() {
        return formulaCode;
    }

    public void setFormulaCode(String formulaCode) {
        this.formulaCode = formulaCode;
    }

    public Integer getIsPass() {
        return isPass;
    }

    public void setIsPass(Integer isPass) {
        this.isPass = isPass;
    }

    public BigDecimal getCementProportion() {
        return cementProportion;
    }

    public void setCementProportion(BigDecimal cementProportion) {
        this.cementProportion = cementProportion;
    }

    public BigDecimal getWaterProportion() {
        return waterProportion;
    }

    public void setWaterProportion(BigDecimal waterProportion) {
        this.waterProportion = waterProportion;
    }

    public Integer getCementLevel() {
        return cementLevel;
    }

    public void setCementLevel(Integer cementLevel) {
        this.cementLevel = cementLevel;
    }

    public Integer getWaterLevel() {
        return waterLevel;
    }

    public void setWaterLevel(Integer waterLevel) {
        this.waterLevel = waterLevel;
    }

    public Integer getSieveVersion() {
        return sieveVersion;
    }

    public void setSieveVersion(Integer sieveVersion) {
        this.sieveVersion = sieveVersion;
    }

    @Override
    public String toString() {
        return "WaterMetaDataModel{" +
                "id=" + id +
                ", mixingMachineId=" + mixingMachineId +
                ", time=" + time +
                ", mixTime=" + mixTime +
                ", stationId=" + stationId +
                ", formulaId=" + formulaId +
                ", formulaCode='" + formulaCode + '\'' +
                ", cement=" + cement +
                ", water=" + water +
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
                ", warnLevel=" + warnLevel +
                ", createTime=" + createTime +
                ", batchCode='" + batchCode + '\'' +
                ", weight=" + weight +
                ", formulaModel=" + formulaModel +
                ", isPass=" + isPass +
                '}';
    }
}