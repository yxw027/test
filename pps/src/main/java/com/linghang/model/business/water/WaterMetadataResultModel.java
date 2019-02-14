package com.linghang.model.business.water;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by dell on 2018/12/25.
 * 元数据计算结果表 Model
 */
public class WaterMetadataResultModel extends WaterEntity {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 拌合机id
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
     * 总重量
     */
    private BigDecimal weight;

    /**
     * 筛孔1--0.075
     */
    private BigDecimal sieve1;

    /**
     * 筛孔2-0.15
     */
    private BigDecimal sieve2;

    /**
     * 筛孔3-0.3
     */
    private BigDecimal sieve3;

    /**
     * 筛孔4-0.6
     */
    private BigDecimal sieve4;

    /**
     * 筛孔5-1.18
     */
    private BigDecimal sieve5;

    /**
     * 筛孔6-2.36
     */
    private BigDecimal sieve6;

    /**
     * 筛孔7-4.75
     */
    private BigDecimal sieve7;

    /**
     * 筛孔8-9.5
     */
    private BigDecimal sieve8;

    /**
     * 筛孔9-13.2
     */
    private BigDecimal sieve9;

    /**
     * 筛孔10-16
     */
    private BigDecimal sieve10;

    /**
     * 筛孔11-19
     */
    private BigDecimal sieve11;

    /**
     * 筛孔12-26.5
     */
    private BigDecimal sieve12;

    /**
     * 筛孔13-34.5
     */
    private BigDecimal sieve13;

    /**
     * 批次
     */
    private String batchCode;

    /**
     * 级配超标等级
     */
    private Integer gradationLevel;

    /**
     * 骨料重量
     */
    private BigDecimal aggregateWeight;

    /**
     * 是否合格 0合格-1不合格
     */
    private Integer isPass;
    /**
     * 元数据id
     */
    private Long dataId;

    /**
     * 超标信息
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String excessMsg;

    /**
     * 超标级别
     */
    private Integer sieve1State;

    /**
     * 超标级别
     */
    private Integer sieve2State;

    /**
     * 超标级别
     */
    private Integer sieve3State;

    /**
     * 超标级别
     */
    private Integer sieve4State;

    /**
     * 超标级别
     */
    private Integer sieve5State;

    /**
     * 超标级别
     */
    private Integer sieve6State;

    /**
     * 超标级别
     */
    private Integer sieve7State;

    /**
     * 超标级别
     */
    private Integer sieve8State;

    /**
     * 超标级别
     */
    private Integer sieve9State;

    /**
     * 超标级别
     */
    private Integer sieve10State;

    /**
     * 超标级别
     */
    private Integer sieve11State;

    /**
     * 超标级别
     */
    private Integer sieve12State;

    /**
     * 超标级别
     */
    private Integer sieve13State;

    /**
     * 生产时间
     */
    private Date time;

    /**
     * 筛孔计算版本
     */
    private Integer sieveVersion;

    private Integer cementLevel;
    private Integer waterLevel;


    private String sieve1Msg;

    private String sieve2Msg;

    private String sieve3Msg;

    private String sieve4Msg;

    private String sieve5Msg;

    private String sieve6Msg;

    private String sieve7Msg;

    private String sieve8Msg;

    private String sieve9Msg;

    private String sieve10Msg;

    private String sieve11Msg;

    private String sieve12Msg;

    private String sieve13Msg;

    private BigDecimal cementProportion;
    private BigDecimal waterProportion;

    private String cementMsg;
    private String waterMsg;

    private Integer maxLevel;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getFormulaCode() {
        return formulaCode;
    }

    public void setFormulaCode(String formulaCode) {
        this.formulaCode = formulaCode == null ? null : formulaCode.trim();
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

    public BigDecimal getWeight() {
        return weight;
    }

    public void setWeight(BigDecimal weight) {
        this.weight = weight;
    }

    public BigDecimal getSieve1() {
        return sieve1;
    }

    public void setSieve1(BigDecimal sieve1) {
        this.sieve1 = sieve1;
    }

    public BigDecimal getSieve2() {
        return sieve2;
    }

    public void setSieve2(BigDecimal sieve2) {
        this.sieve2 = sieve2;
    }

    public BigDecimal getSieve3() {
        return sieve3;
    }

    public void setSieve3(BigDecimal sieve3) {
        this.sieve3 = sieve3;
    }

    public BigDecimal getSieve4() {
        return sieve4;
    }

    public void setSieve4(BigDecimal sieve4) {
        this.sieve4 = sieve4;
    }

    public BigDecimal getSieve5() {
        return sieve5;
    }

    public void setSieve5(BigDecimal sieve5) {
        this.sieve5 = sieve5;
    }

    public BigDecimal getSieve6() {
        return sieve6;
    }

    public void setSieve6(BigDecimal sieve6) {
        this.sieve6 = sieve6;
    }

    public BigDecimal getSieve7() {
        return sieve7;
    }

    public void setSieve7(BigDecimal sieve7) {
        this.sieve7 = sieve7;
    }

    public BigDecimal getSieve8() {
        return sieve8;
    }

    public void setSieve8(BigDecimal sieve8) {
        this.sieve8 = sieve8;
    }

    public BigDecimal getSieve9() {
        return sieve9;
    }

    public void setSieve9(BigDecimal sieve9) {
        this.sieve9 = sieve9;
    }

    public BigDecimal getSieve10() {
        return sieve10;
    }

    public void setSieve10(BigDecimal sieve10) {
        this.sieve10 = sieve10;
    }

    public BigDecimal getSieve11() {
        return sieve11;
    }

    public void setSieve11(BigDecimal sieve11) {
        this.sieve11 = sieve11;
    }

    public BigDecimal getSieve12() {
        return sieve12;
    }

    public void setSieve12(BigDecimal sieve12) {
        this.sieve12 = sieve12;
    }

    public BigDecimal getSieve13() {
        return sieve13;
    }

    public void setSieve13(BigDecimal sieve13) {
        this.sieve13 = sieve13;
    }

    public String getBatchCode() {
        return batchCode;
    }

    public void setBatchCode(String batchCode) {
        this.batchCode = batchCode == null ? null : batchCode.trim();
    }

    public Integer getGradationLevel() {
        return gradationLevel;
    }

    public void setGradationLevel(Integer gradationLevel) {
        this.gradationLevel = gradationLevel;
    }

    public BigDecimal getAggregateWeight() {
        return aggregateWeight;
    }

    public void setAggregateWeight(BigDecimal aggregateWeight) {
        this.aggregateWeight = aggregateWeight;
    }

    public Integer getIsPass() {
        return isPass;
    }

    public void setIsPass(Integer isPass) {
        this.isPass = isPass;
    }

    public Long getDataId() {
        return dataId;
    }

    public void setDataId(Long dataId) {
        this.dataId = dataId;
    }

    public String getExcessMsg() {
        return excessMsg;
    }

    public void setExcessMsg(String excessMsg) {
        this.excessMsg = excessMsg == null ? null : excessMsg.trim();
    }

    public Integer getSieve1State() {
        return sieve1State;
    }

    public void setSieve1State(Integer sieve1State) {
        this.sieve1State = sieve1State;
    }

    public Integer getSieve2State() {
        return sieve2State;
    }

    public void setSieve2State(Integer sieve2State) {
        this.sieve2State = sieve2State;
    }

    public Integer getSieve3State() {
        return sieve3State;
    }

    public void setSieve3State(Integer sieve3State) {
        this.sieve3State = sieve3State;
    }

    public Integer getSieve4State() {
        return sieve4State;
    }

    public void setSieve4State(Integer sieve4State) {
        this.sieve4State = sieve4State;
    }

    public Integer getSieve5State() {
        return sieve5State;
    }

    public void setSieve5State(Integer sieve5State) {
        this.sieve5State = sieve5State;
    }

    public Integer getSieve6State() {
        return sieve6State;
    }

    public void setSieve6State(Integer sieve6State) {
        this.sieve6State = sieve6State;
    }

    public Integer getSieve7State() {
        return sieve7State;
    }

    public void setSieve7State(Integer sieve7State) {
        this.sieve7State = sieve7State;
    }

    public Integer getSieve8State() {
        return sieve8State;
    }

    public void setSieve8State(Integer sieve8State) {
        this.sieve8State = sieve8State;
    }

    public Integer getSieve9State() {
        return sieve9State;
    }

    public void setSieve9State(Integer sieve9State) {
        this.sieve9State = sieve9State;
    }

    public Integer getSieve10State() {
        return sieve10State;
    }

    public void setSieve10State(Integer sieve10State) {
        this.sieve10State = sieve10State;
    }

    public Integer getSieve11State() {
        return sieve11State;
    }

    public void setSieve11State(Integer sieve11State) {
        this.sieve11State = sieve11State;
    }

    public Integer getSieve12State() {
        return sieve12State;
    }

    public void setSieve12State(Integer sieve12State) {
        this.sieve12State = sieve12State;
    }

    public Integer getSieve13State() {
        return sieve13State;
    }

    public void setSieve13State(Integer sieve13State) {
        this.sieve13State = sieve13State;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getSieveVersion() {
        return sieveVersion;
    }

    public void setSieveVersion(Integer sieveVersion) {
        this.sieveVersion = sieveVersion;
    }

    public String getSieve1Msg() {
        return sieve1Msg;
    }

    public void setSieve1Msg(String sieve1Msg) {
        this.sieve1Msg = sieve1Msg == null ? null : sieve1Msg.trim();
    }

    public String getSieve2Msg() {
        return sieve2Msg;
    }

    public void setSieve2Msg(String sieve2Msg) {
        this.sieve2Msg = sieve2Msg == null ? null : sieve2Msg.trim();
    }

    public String getSieve3Msg() {
        return sieve3Msg;
    }

    public void setSieve3Msg(String sieve3Msg) {
        this.sieve3Msg = sieve3Msg == null ? null : sieve3Msg.trim();
    }

    public String getSieve4Msg() {
        return sieve4Msg;
    }

    public void setSieve4Msg(String sieve4Msg) {
        this.sieve4Msg = sieve4Msg == null ? null : sieve4Msg.trim();
    }

    public String getSieve5Msg() {
        return sieve5Msg;
    }

    public void setSieve5Msg(String sieve5Msg) {
        this.sieve5Msg = sieve5Msg == null ? null : sieve5Msg.trim();
    }

    public String getSieve6Msg() {
        return sieve6Msg;
    }

    public void setSieve6Msg(String sieve6Msg) {
        this.sieve6Msg = sieve6Msg == null ? null : sieve6Msg.trim();
    }

    public String getSieve7Msg() {
        return sieve7Msg;
    }

    public void setSieve7Msg(String sieve7Msg) {
        this.sieve7Msg = sieve7Msg == null ? null : sieve7Msg.trim();
    }

    public String getSieve8Msg() {
        return sieve8Msg;
    }

    public void setSieve8Msg(String sieve8Msg) {
        this.sieve8Msg = sieve8Msg == null ? null : sieve8Msg.trim();
    }

    public String getSieve9Msg() {
        return sieve9Msg;
    }

    public void setSieve9Msg(String sieve9Msg) {
        this.sieve9Msg = sieve9Msg == null ? null : sieve9Msg.trim();
    }

    public String getSieve10Msg() {
        return sieve10Msg;
    }

    public void setSieve10Msg(String sieve10Msg) {
        this.sieve10Msg = sieve10Msg == null ? null : sieve10Msg.trim();
    }

    public String getSieve11Msg() {
        return sieve11Msg;
    }

    public void setSieve11Msg(String sieve11Msg) {
        this.sieve11Msg = sieve11Msg == null ? null : sieve11Msg.trim();
    }

    public String getSieve12Msg() {
        return sieve12Msg;
    }

    public void setSieve12Msg(String sieve12Msg) {
        this.sieve12Msg = sieve12Msg == null ? null : sieve12Msg.trim();
    }

    public String getSieve13Msg() {
        return sieve13Msg;
    }

    public void setSieve13Msg(String sieve13Msg) {
        this.sieve13Msg = sieve13Msg == null ? null : sieve13Msg.trim();
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

    public String getCementMsg() {
        return cementMsg;
    }

    public void setCementMsg(String cementMsg) {
        this.cementMsg = cementMsg;
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

    public String getWaterMsg() {
        return waterMsg;
    }

    public void setWaterMsg(String waterMsg) {
        this.waterMsg = waterMsg;
    }

    public Integer getMaxLevel() {
        return maxLevel;
    }

    public void setMaxLevel(Integer maxLevel) {
        this.maxLevel = maxLevel;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", stationId=").append(stationId);
        sb.append(", formulaId=").append(formulaId);
        sb.append(", formulaCode=").append(formulaCode);
        sb.append(", cement=").append(cement);
        sb.append(", water=").append(water);
        sb.append(", weight=").append(weight);
        sb.append(", sieve1=").append(sieve1);
        sb.append(", sieve2=").append(sieve2);
        sb.append(", sieve3=").append(sieve3);
        sb.append(", sieve4=").append(sieve4);
        sb.append(", sieve5=").append(sieve5);
        sb.append(", sieve6=").append(sieve6);
        sb.append(", sieve7=").append(sieve7);
        sb.append(", sieve8=").append(sieve8);
        sb.append(", sieve9=").append(sieve9);
        sb.append(", sieve10=").append(sieve10);
        sb.append(", sieve11=").append(sieve11);
        sb.append(", sieve12=").append(sieve12);
        sb.append(", sieve13=").append(sieve13);
        sb.append(", batchCode=").append(batchCode);
        sb.append(", gradationLevel=").append(gradationLevel);
        sb.append(", aggregateWeight=").append(aggregateWeight);
        sb.append(", isPass=").append(isPass);
        sb.append(", dataId=").append(dataId);
        sb.append(", excessMsg=").append(excessMsg);
        sb.append(", sieve1State=").append(sieve1State);
        sb.append(", sieve2State=").append(sieve2State);
        sb.append(", sieve3State=").append(sieve3State);
        sb.append(", sieve4State=").append(sieve4State);
        sb.append(", sieve5State=").append(sieve5State);
        sb.append(", sieve6State=").append(sieve6State);
        sb.append(", sieve7State=").append(sieve7State);
        sb.append(", sieve8State=").append(sieve8State);
        sb.append(", sieve9State=").append(sieve9State);
        sb.append(", sieve10State=").append(sieve10State);
        sb.append(", sieve11State=").append(sieve11State);
        sb.append(", sieve12State=").append(sieve12State);
        sb.append(", sieve13State=").append(sieve13State);
        sb.append(", time=").append(time);
        sb.append(", sieveVersion=").append(sieveVersion);
        sb.append(", sieve1Msg=").append(sieve1Msg);
        sb.append(", sieve2Msg=").append(sieve2Msg);
        sb.append(", sieve3Msg=").append(sieve3Msg);
        sb.append(", sieve4Msg=").append(sieve4Msg);
        sb.append(", sieve5Msg=").append(sieve5Msg);
        sb.append(", sieve6Msg=").append(sieve6Msg);
        sb.append(", sieve7Msg=").append(sieve7Msg);
        sb.append(", sieve8Msg=").append(sieve8Msg);
        sb.append(", sieve9Msg=").append(sieve9Msg);
        sb.append(", sieve10Msg=").append(sieve10Msg);
        sb.append(", sieve11Msg=").append(sieve11Msg);
        sb.append(", sieve12Msg=").append(sieve12Msg);
        sb.append(", sieve13Msg=").append(sieve13Msg);
        sb.append(", formulaModel=").append(super.getFormulaModel());
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
        WaterMetadataResultModel other = (WaterMetadataResultModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getStationId() == null ? other.getStationId() == null : this.getStationId().equals(other.getStationId()))
                && (this.getFormulaId() == null ? other.getFormulaId() == null : this.getFormulaId().equals(other.getFormulaId()))
                && (this.getFormulaCode() == null ? other.getFormulaCode() == null : this.getFormulaCode().equals(other.getFormulaCode()))
                && (this.getCement() == null ? other.getCement() == null : this.getCement().equals(other.getCement()))
                && (this.getWater() == null ? other.getWater() == null : this.getWater().equals(other.getWater()))
                && (this.getWeight() == null ? other.getWeight() == null : this.getWeight().equals(other.getWeight()))
                && (this.getSieve1() == null ? other.getSieve1() == null : this.getSieve1().equals(other.getSieve1()))
                && (this.getSieve2() == null ? other.getSieve2() == null : this.getSieve2().equals(other.getSieve2()))
                && (this.getSieve3() == null ? other.getSieve3() == null : this.getSieve3().equals(other.getSieve3()))
                && (this.getSieve4() == null ? other.getSieve4() == null : this.getSieve4().equals(other.getSieve4()))
                && (this.getSieve5() == null ? other.getSieve5() == null : this.getSieve5().equals(other.getSieve5()))
                && (this.getSieve6() == null ? other.getSieve6() == null : this.getSieve6().equals(other.getSieve6()))
                && (this.getSieve7() == null ? other.getSieve7() == null : this.getSieve7().equals(other.getSieve7()))
                && (this.getSieve8() == null ? other.getSieve8() == null : this.getSieve8().equals(other.getSieve8()))
                && (this.getSieve9() == null ? other.getSieve9() == null : this.getSieve9().equals(other.getSieve9()))
                && (this.getSieve10() == null ? other.getSieve10() == null : this.getSieve10().equals(other.getSieve10()))
                && (this.getSieve11() == null ? other.getSieve11() == null : this.getSieve11().equals(other.getSieve11()))
                && (this.getSieve12() == null ? other.getSieve12() == null : this.getSieve12().equals(other.getSieve12()))
                && (this.getSieve13() == null ? other.getSieve13() == null : this.getSieve13().equals(other.getSieve13()))
                && (this.getBatchCode() == null ? other.getBatchCode() == null : this.getBatchCode().equals(other.getBatchCode()))
                && (this.getGradationLevel() == null ? other.getGradationLevel() == null : this.getGradationLevel().equals(other.getGradationLevel()))
                && (this.getAggregateWeight() == null ? other.getAggregateWeight() == null : this.getAggregateWeight().equals(other.getAggregateWeight()))
                && (this.getIsPass() == null ? other.getIsPass() == null : this.getIsPass().equals(other.getIsPass()))
                && (this.getDataId() == null ? other.getDataId() == null : this.getDataId().equals(other.getDataId()))
                && (this.getExcessMsg() == null ? other.getExcessMsg() == null : this.getExcessMsg().equals(other.getExcessMsg()))
                && (this.getSieve1State() == null ? other.getSieve1State() == null : this.getSieve1State().equals(other.getSieve1State()))
                && (this.getSieve2State() == null ? other.getSieve2State() == null : this.getSieve2State().equals(other.getSieve2State()))
                && (this.getSieve3State() == null ? other.getSieve3State() == null : this.getSieve3State().equals(other.getSieve3State()))
                && (this.getSieve4State() == null ? other.getSieve4State() == null : this.getSieve4State().equals(other.getSieve4State()))
                && (this.getSieve5State() == null ? other.getSieve5State() == null : this.getSieve5State().equals(other.getSieve5State()))
                && (this.getSieve6State() == null ? other.getSieve6State() == null : this.getSieve6State().equals(other.getSieve6State()))
                && (this.getSieve7State() == null ? other.getSieve7State() == null : this.getSieve7State().equals(other.getSieve7State()))
                && (this.getSieve8State() == null ? other.getSieve8State() == null : this.getSieve8State().equals(other.getSieve8State()))
                && (this.getSieve9State() == null ? other.getSieve9State() == null : this.getSieve9State().equals(other.getSieve9State()))
                && (this.getSieve10State() == null ? other.getSieve10State() == null : this.getSieve10State().equals(other.getSieve10State()))
                && (this.getSieve11State() == null ? other.getSieve11State() == null : this.getSieve11State().equals(other.getSieve11State()))
                && (this.getSieve12State() == null ? other.getSieve12State() == null : this.getSieve12State().equals(other.getSieve12State()))
                && (this.getSieve13State() == null ? other.getSieve13State() == null : this.getSieve13State().equals(other.getSieve13State()))
                && (this.getTime() == null ? other.getTime() == null : this.getTime().equals(other.getTime()))
                && (this.getSieveVersion() == null ? other.getSieveVersion() == null : this.getSieveVersion().equals(other.getSieveVersion()))
                && (this.getSieve1Msg() == null ? other.getSieve1Msg() == null : this.getSieve1Msg().equals(other.getSieve1Msg()))
                && (this.getSieve2Msg() == null ? other.getSieve2Msg() == null : this.getSieve2Msg().equals(other.getSieve2Msg()))
                && (this.getSieve3Msg() == null ? other.getSieve3Msg() == null : this.getSieve3Msg().equals(other.getSieve3Msg()))
                && (this.getSieve4Msg() == null ? other.getSieve4Msg() == null : this.getSieve4Msg().equals(other.getSieve4Msg()))
                && (this.getSieve5Msg() == null ? other.getSieve5Msg() == null : this.getSieve5Msg().equals(other.getSieve5Msg()))
                && (this.getSieve6Msg() == null ? other.getSieve6Msg() == null : this.getSieve6Msg().equals(other.getSieve6Msg()))
                && (this.getSieve7Msg() == null ? other.getSieve7Msg() == null : this.getSieve7Msg().equals(other.getSieve7Msg()))
                && (this.getSieve8Msg() == null ? other.getSieve8Msg() == null : this.getSieve8Msg().equals(other.getSieve8Msg()))
                && (this.getSieve9Msg() == null ? other.getSieve9Msg() == null : this.getSieve9Msg().equals(other.getSieve9Msg()))
                && (this.getSieve10Msg() == null ? other.getSieve10Msg() == null : this.getSieve10Msg().equals(other.getSieve10Msg()))
                && (this.getSieve11Msg() == null ? other.getSieve11Msg() == null : this.getSieve11Msg().equals(other.getSieve11Msg()))
                && (this.getSieve12Msg() == null ? other.getSieve12Msg() == null : this.getSieve12Msg().equals(other.getSieve12Msg()))
                && (this.getSieve13Msg() == null ? other.getSieve13Msg() == null : this.getSieve13Msg().equals(other.getSieve13Msg()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getStationId() == null) ? 0 : getStationId().hashCode());
        result = prime * result + ((getFormulaId() == null) ? 0 : getFormulaId().hashCode());
        result = prime * result + ((getFormulaCode() == null) ? 0 : getFormulaCode().hashCode());
        result = prime * result + ((getCement() == null) ? 0 : getCement().hashCode());
        result = prime * result + ((getWater() == null) ? 0 : getWater().hashCode());
        result = prime * result + ((getWeight() == null) ? 0 : getWeight().hashCode());
        result = prime * result + ((getSieve1() == null) ? 0 : getSieve1().hashCode());
        result = prime * result + ((getSieve2() == null) ? 0 : getSieve2().hashCode());
        result = prime * result + ((getSieve3() == null) ? 0 : getSieve3().hashCode());
        result = prime * result + ((getSieve4() == null) ? 0 : getSieve4().hashCode());
        result = prime * result + ((getSieve5() == null) ? 0 : getSieve5().hashCode());
        result = prime * result + ((getSieve6() == null) ? 0 : getSieve6().hashCode());
        result = prime * result + ((getSieve7() == null) ? 0 : getSieve7().hashCode());
        result = prime * result + ((getSieve8() == null) ? 0 : getSieve8().hashCode());
        result = prime * result + ((getSieve9() == null) ? 0 : getSieve9().hashCode());
        result = prime * result + ((getSieve10() == null) ? 0 : getSieve10().hashCode());
        result = prime * result + ((getSieve11() == null) ? 0 : getSieve11().hashCode());
        result = prime * result + ((getSieve12() == null) ? 0 : getSieve12().hashCode());
        result = prime * result + ((getSieve13() == null) ? 0 : getSieve13().hashCode());
        result = prime * result + ((getBatchCode() == null) ? 0 : getBatchCode().hashCode());
        result = prime * result + ((getGradationLevel() == null) ? 0 : getGradationLevel().hashCode());
        result = prime * result + ((getAggregateWeight() == null) ? 0 : getAggregateWeight().hashCode());
        result = prime * result + ((getIsPass() == null) ? 0 : getIsPass().hashCode());
        result = prime * result + ((getDataId() == null) ? 0 : getDataId().hashCode());
        result = prime * result + ((getExcessMsg() == null) ? 0 : getExcessMsg().hashCode());
        result = prime * result + ((getSieve1State() == null) ? 0 : getSieve1State().hashCode());
        result = prime * result + ((getSieve2State() == null) ? 0 : getSieve2State().hashCode());
        result = prime * result + ((getSieve3State() == null) ? 0 : getSieve3State().hashCode());
        result = prime * result + ((getSieve4State() == null) ? 0 : getSieve4State().hashCode());
        result = prime * result + ((getSieve5State() == null) ? 0 : getSieve5State().hashCode());
        result = prime * result + ((getSieve6State() == null) ? 0 : getSieve6State().hashCode());
        result = prime * result + ((getSieve7State() == null) ? 0 : getSieve7State().hashCode());
        result = prime * result + ((getSieve8State() == null) ? 0 : getSieve8State().hashCode());
        result = prime * result + ((getSieve9State() == null) ? 0 : getSieve9State().hashCode());
        result = prime * result + ((getSieve10State() == null) ? 0 : getSieve10State().hashCode());
        result = prime * result + ((getSieve11State() == null) ? 0 : getSieve11State().hashCode());
        result = prime * result + ((getSieve12State() == null) ? 0 : getSieve12State().hashCode());
        result = prime * result + ((getSieve13State() == null) ? 0 : getSieve13State().hashCode());
        result = prime * result + ((getTime() == null) ? 0 : getTime().hashCode());
        result = prime * result + ((getSieveVersion() == null) ? 0 : getSieveVersion().hashCode());
        result = prime * result + ((getSieve1Msg() == null) ? 0 : getSieve1Msg().hashCode());
        result = prime * result + ((getSieve2Msg() == null) ? 0 : getSieve2Msg().hashCode());
        result = prime * result + ((getSieve3Msg() == null) ? 0 : getSieve3Msg().hashCode());
        result = prime * result + ((getSieve4Msg() == null) ? 0 : getSieve4Msg().hashCode());
        result = prime * result + ((getSieve5Msg() == null) ? 0 : getSieve5Msg().hashCode());
        result = prime * result + ((getSieve6Msg() == null) ? 0 : getSieve6Msg().hashCode());
        result = prime * result + ((getSieve7Msg() == null) ? 0 : getSieve7Msg().hashCode());
        result = prime * result + ((getSieve8Msg() == null) ? 0 : getSieve8Msg().hashCode());
        result = prime * result + ((getSieve9Msg() == null) ? 0 : getSieve9Msg().hashCode());
        result = prime * result + ((getSieve10Msg() == null) ? 0 : getSieve10Msg().hashCode());
        result = prime * result + ((getSieve11Msg() == null) ? 0 : getSieve11Msg().hashCode());
        result = prime * result + ((getSieve12Msg() == null) ? 0 : getSieve12Msg().hashCode());
        result = prime * result + ((getSieve13Msg() == null) ? 0 : getSieve13Msg().hashCode());
        return result;
    }
}