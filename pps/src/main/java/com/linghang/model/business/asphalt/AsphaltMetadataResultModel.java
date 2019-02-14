package com.linghang.model.business.asphalt;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author wuchen on 2018/12/17.
 * 元数据计算结果表 Model
 */
public class AsphaltMetadataResultModel implements Serializable {

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
    private Long asphaltId;


    /**
     * 配方id
     */
    private Long formulaId;
    /**
     * 筛孔设置计算版本
     */
    private Integer sieveVersion;


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
     * 错误信息
     */
    private String oilStoneMsg;

    /**
     * 沥青重量
     */
    private BigDecimal asphalt;


    /**
     * 总重量
     */
    private BigDecimal weight;


    /**
     * 筛孔1--0.075
     */
    private BigDecimal sieve1;
    /**
     * 是否合格 --0合格--1一级预警--2二级预警--3三级预警
     */
    private int sieve1State;
    /**
     * 错误消息
     */
    private String sieve1Msg;
    /**
     * 筛孔2-0.15
     */
    private BigDecimal sieve2;
    /**
     * 是否合格 --0合格--1一级预警--2二级预警--3三级预警
     */
    private int sieve2State;
    /**
     * 错误消息
     */
    private String sieve2Msg;
    /**
     * 筛孔3-0.3
     */
    private BigDecimal sieve3;
    /**
     * 是否合格 --0合格--1一级预警--2二级预警--3三级预警
     */
    private int sieve3State;
    /**
     * 错误消息
     */
    private String sieve3Msg;

    /**
     * 筛孔4-0.6
     */
    private BigDecimal sieve4;
    /**
     * 是否合格 --0合格--1一级预警--2二级预警--3三级预警
     */
    private int sieve4State;
    /**
     * 错误消息
     */
    private String sieve4Msg;

    /**
     * 筛孔5-1.18
     */
    private BigDecimal sieve5;
    /**
     * 是否合格 --0合格--1一级预警--2二级预警--3三级预警
     */
    private int sieve5State;
    /**
     * 错误消息
     */
    private String sieve5Msg;

    /**
     * 筛孔6-2.36
     */
    private BigDecimal sieve6;
    /**
     * 是否合格 --0合格--1一级预警--2二级预警--3三级预警
     */
    private int sieve6State;
    /**
     * 错误消息
     */
    private String sieve6Msg;

    /**
     * 筛孔7-4.75
     */
    private BigDecimal sieve7;
    /**
     * 是否合格 --0合格--1一级预警--2二级预警--3三级预警
     */
    private int sieve7State;
    /**
     * 错误消息
     */
    private String sieve7Msg;

    /**
     * 筛孔8-9.5
     */
    private BigDecimal sieve8;
    /**
     * 是否合格 --0合格--1一级预警--2二级预警--3三级预警
     */
    private int sieve8State;
    /**
     * 错误消息
     */
    private String sieve8Msg;

    /**
     * 筛孔9-13.2
     */
    private BigDecimal sieve9;
    /**
     * 是否合格 --0合格--1一级预警--2二级预警--3三级预警
     */
    private int sieve9State;
    /**
     * 错误消息
     */
    private String sieve9Msg;

    /**
     * 筛孔10-16
     */
    private BigDecimal sieve10;
    /**
     * 是否合格 --0合格--1一级预警--2二级预警--3三级预警
     */
    private int sieve10State;
    /**
     * 错误消息
     */
    private String sieve10Msg;

    /**
     * 筛孔11-19
     */
    private BigDecimal sieve11;
    /**
     * 是否合格 --0合格--1一级预警--2二级预警--3三级预警
     */
    private int sieve11State;
    /**
     * 错误消息
     */
    private String sieve11Msg;

    /**
     * 筛孔12-26.5
     */
    private BigDecimal sieve12;
    /**
     * 是否合格 --0合格--1一级预警--2二级预警--3三级预警
     */
    private int sieve12State;
    /**
     * 错误消息
     */
    private String sieve12Msg;

    /**
     * 筛孔13-34.5
     */
    private BigDecimal sieve13;
    /**
     * 是否合格 --0合格--1一级预警--2二级预警--3三级预警
     */
    private int sieve13State;
    /**
     * 错误消息
     */
    private String sieve13Msg;

    /**
     * 批次
     */
    private String batchCode;

    /**
     * 温度
     */
    private BigDecimal temperature;
    /**
     * 温度超标级别
     */
    private Integer tempLevel;
    /**
     * 超标信息
     */
    private String tempMsg;
    /**
     * 沥青温度
     */
    private BigDecimal asphaltTemperature;
    /**
     * 沥青温度超标级别
     */
    private Integer asphaltTempLevel;
    /**
     * 沥青超标信息
     */
    private String asphaltTempMsg;
    /**
     * 集料温度
     */
    private BigDecimal aggTemperature;
    /**
     * 集料温度超标级别
     */
    private Integer aggTempLevel;
    /**
     * 集料超标信息
     */
    private String aggTempMsg;
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
     * 生产时间
     */
    private Date time;


    /**
     * 拌合温度
     */
    private BigDecimal mixingTemperature;
    /**
     * 拌合温度超标级别
     */
    private Integer mixingTempLevel;
    /**
     * 拌合超标信息
     */
    private String mixingTempMsg;

    /**
     *
     */
    private Integer allLevel;

    public AsphaltMetadataResultModel(Long id, Long asphaltId, Long formulaId, String formulaCode, BigDecimal oilStoneProportion, BigDecimal asphalt, BigDecimal weight, BigDecimal sieve1, BigDecimal sieve2, BigDecimal sieve3, BigDecimal sieve4, BigDecimal sieve5, BigDecimal sieve6, BigDecimal sieve7, BigDecimal sieve8, BigDecimal sieve9, BigDecimal sieve10, BigDecimal sieve11, BigDecimal sieve12, BigDecimal sieve13, String batchCode, Integer tempLevel, Integer gradationLevel, Integer oilStoneLevel, BigDecimal aggregateWeight, Integer isPass, Long dataId) {
        this.id = id;
        this.asphaltId = asphaltId;
        this.formulaId = formulaId;
        this.formulaCode = formulaCode;
        this.oilStoneProportion = oilStoneProportion;
        this.asphalt = asphalt;
        this.weight = weight;
        this.sieve1 = sieve1;
        this.sieve2 = sieve2;
        this.sieve3 = sieve3;
        this.sieve4 = sieve4;
        this.sieve5 = sieve5;
        this.sieve6 = sieve6;
        this.sieve7 = sieve7;
        this.sieve8 = sieve8;
        this.sieve9 = sieve9;
        this.sieve10 = sieve10;
        this.sieve11 = sieve11;
        this.sieve12 = sieve12;
        this.sieve13 = sieve13;
        this.batchCode = batchCode;
        this.tempLevel = tempLevel;
        this.gradationLevel = gradationLevel;
        this.oilStoneLevel = oilStoneLevel;
        this.aggregateWeight = aggregateWeight;
        this.isPass = isPass;
        this.dataId = dataId;
    }

    public AsphaltMetadataResultModel() {

    }

    public Integer getAllLevel() {
        return allLevel;
    }

    public void setAllLevel(Integer allLevel) {
        this.allLevel = allLevel;
    }

    public BigDecimal getAsphaltTemperature() {
        return asphaltTemperature;
    }

    public void setAsphaltTemperature(BigDecimal asphaltTemperature) {
        this.asphaltTemperature = asphaltTemperature;
    }

    public Integer getAsphaltTempLevel() {
        return asphaltTempLevel;
    }

    public void setAsphaltTempLevel(Integer asphaltTempLevel) {
        this.asphaltTempLevel = asphaltTempLevel;
    }

    public String getAsphaltTempMsg() {
        return asphaltTempMsg;
    }

    public void setAsphaltTempMsg(String asphaltTempMsg) {
        this.asphaltTempMsg = asphaltTempMsg;
    }

    public BigDecimal getAggTemperature() {
        return aggTemperature;
    }

    public void setAggTemperature(BigDecimal aggTemperature) {
        this.aggTemperature = aggTemperature;
    }

    public Integer getAggTempLevel() {
        return aggTempLevel;
    }

    public void setAggTempLevel(Integer aggTempLevel) {
        this.aggTempLevel = aggTempLevel;
    }

    public String getAggTempMsg() {
        return aggTempMsg;
    }

    public void setAggTempMsg(String aggTempMsg) {
        this.aggTempMsg = aggTempMsg;
    }

    public String getFormulaName() {
        return formulaName;
    }

    public void setFormulaName(String formulaName) {
        this.formulaName = formulaName;
    }

    public String getOilStoneMsg() {
        return oilStoneMsg;
    }

    public void setOilStoneMsg(String oilStoneMsg) {
        this.oilStoneMsg = oilStoneMsg;
    }

    public String getTempMsg() {
        return tempMsg;
    }

    public void setTempMsg(String tempMsg) {
        this.tempMsg = tempMsg;
    }

    public BigDecimal getTemperature() {
        return temperature;
    }

    public void setTemperature(BigDecimal temperature) {
        this.temperature = temperature;
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

    public String getExcessMsg() {
        return excessMsg;
    }

    public void setExcessMsg(String excessMsg) {
        this.excessMsg = excessMsg;
    }

    public int getSieve1State() {
        return sieve1State;
    }

    public void setSieve1State(int sieve1State) {
        this.sieve1State = sieve1State;
    }

    public int getSieve2State() {
        return sieve2State;
    }

    public void setSieve2State(int sieve2State) {
        this.sieve2State = sieve2State;
    }

    public int getSieve3State() {
        return sieve3State;
    }

    public void setSieve3State(int sieve3State) {
        this.sieve3State = sieve3State;
    }

    public int getSieve4State() {
        return sieve4State;
    }

    public void setSieve4State(int sieve4State) {
        this.sieve4State = sieve4State;
    }

    public int getSieve5State() {
        return sieve5State;
    }

    public void setSieve5State(int sieve5State) {
        this.sieve5State = sieve5State;
    }

    public int getSieve6State() {
        return sieve6State;
    }

    public void setSieve6State(int sieve6State) {
        this.sieve6State = sieve6State;
    }

    public int getSieve7State() {
        return sieve7State;
    }

    public void setSieve7State(int sieve7State) {
        this.sieve7State = sieve7State;
    }

    public int getSieve8State() {
        return sieve8State;
    }

    public void setSieve8State(int sieve8State) {
        this.sieve8State = sieve8State;
    }

    public int getSieve9State() {
        return sieve9State;
    }

    public void setSieve9State(int sieve9State) {
        this.sieve9State = sieve9State;
    }

    public int getSieve10State() {
        return sieve10State;
    }

    public void setSieve10State(int sieve10State) {
        this.sieve10State = sieve10State;
    }

    public int getSieve11State() {
        return sieve11State;
    }

    public void setSieve11State(int sieve11State) {
        this.sieve11State = sieve11State;
    }

    public int getSieve12State() {
        return sieve12State;
    }

    public void setSieve12State(int sieve12State) {
        this.sieve12State = sieve12State;
    }

    public int getSieve13State() {
        return sieve13State;
    }

    public void setSieve13State(int sieve13State) {
        this.sieve13State = sieve13State;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getSieve1Msg() {
        return sieve1Msg;
    }

    public void setSieve1Msg(String sieve1Msg) {
        this.sieve1Msg = sieve1Msg;
    }

    public String getSieve2Msg() {
        return sieve2Msg;
    }

    public void setSieve2Msg(String sieve2Msg) {
        this.sieve2Msg = sieve2Msg;
    }

    public String getSieve3Msg() {
        return sieve3Msg;
    }

    public void setSieve3Msg(String sieve3Msg) {
        this.sieve3Msg = sieve3Msg;
    }

    public String getSieve4Msg() {
        return sieve4Msg;
    }

    public void setSieve4Msg(String sieve4Msg) {
        this.sieve4Msg = sieve4Msg;
    }

    public String getSieve5Msg() {
        return sieve5Msg;
    }

    public void setSieve5Msg(String sieve5Msg) {
        this.sieve5Msg = sieve5Msg;
    }

    public String getSieve6Msg() {
        return sieve6Msg;
    }

    public void setSieve6Msg(String sieve6Msg) {
        this.sieve6Msg = sieve6Msg;
    }

    public String getSieve7Msg() {
        return sieve7Msg;
    }

    public void setSieve7Msg(String sieve7Msg) {
        this.sieve7Msg = sieve7Msg;
    }

    public String getSieve8Msg() {
        return sieve8Msg;
    }

    public void setSieve8Msg(String sieve8Msg) {
        this.sieve8Msg = sieve8Msg;
    }

    public String getSieve9Msg() {
        return sieve9Msg;
    }

    public void setSieve9Msg(String sieve9Msg) {
        this.sieve9Msg = sieve9Msg;
    }

    public String getSieve10Msg() {
        return sieve10Msg;
    }

    public void setSieve10Msg(String sieve10Msg) {
        this.sieve10Msg = sieve10Msg;
    }

    public String getSieve11Msg() {
        return sieve11Msg;
    }

    public void setSieve11Msg(String sieve11Msg) {
        this.sieve11Msg = sieve11Msg;
    }

    public String getSieve12Msg() {
        return sieve12Msg;
    }

    public void setSieve12Msg(String sieve12Msg) {
        this.sieve12Msg = sieve12Msg;
    }

    public String getSieve13Msg() {
        return sieve13Msg;
    }

    public void setSieve13Msg(String sieve13Msg) {
        this.sieve13Msg = sieve13Msg;
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

    public String getMixingTempMsg() {
        return mixingTempMsg;
    }

    public void setMixingTempMsg(String mixingTempMsg) {
        this.mixingTempMsg = mixingTempMsg;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", asphaltId=").append(asphaltId);
        sb.append(", formulaId=").append(formulaId);
        sb.append(", formulaCode=").append(formulaCode);
        sb.append(", oilStoneProportion=").append(oilStoneProportion);
        sb.append(", asphalt=").append(asphalt);
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
        sb.append(", tempLevel=").append(tempLevel);
        sb.append(", gradationLevel=").append(gradationLevel);
        sb.append(", oilStoneLevel=").append(oilStoneLevel);
        sb.append(", aggregateWeight=").append(aggregateWeight);
        sb.append(", isPass=").append(isPass);
        sb.append(", dataId=").append(dataId);
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
        AsphaltMetadataResultModel other = (AsphaltMetadataResultModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getAsphaltId() == null ? other.getAsphaltId() == null : this.getAsphaltId().equals(other.getAsphaltId()))
                && (this.getFormulaId() == null ? other.getFormulaId() == null : this.getFormulaId().equals(other.getFormulaId()))
                && (this.getFormulaCode() == null ? other.getFormulaCode() == null : this.getFormulaCode().equals(other.getFormulaCode()))
                && (this.getOilStoneProportion() == null ? other.getOilStoneProportion() == null : this.getOilStoneProportion().equals(other.getOilStoneProportion()))
                && (this.getAsphalt() == null ? other.getAsphalt() == null : this.getAsphalt().equals(other.getAsphalt()))
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
                && (this.getTempLevel() == null ? other.getTempLevel() == null : this.getTempLevel().equals(other.getTempLevel()))
                && (this.getGradationLevel() == null ? other.getGradationLevel() == null : this.getGradationLevel().equals(other.getGradationLevel()))
                && (this.getOilStoneLevel() == null ? other.getOilStoneLevel() == null : this.getOilStoneLevel().equals(other.getOilStoneLevel()))
                && (this.getAggregateWeight() == null ? other.getAggregateWeight() == null : this.getAggregateWeight().equals(other.getAggregateWeight()))
                && (this.getIsPass() == null ? other.getIsPass() == null : this.getIsPass().equals(other.getIsPass()))
                && (this.getDataId() == null ? other.getDataId() == null : this.getDataId().equals(other.getDataId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getAsphaltId() == null) ? 0 : getAsphaltId().hashCode());
        result = prime * result + ((getFormulaId() == null) ? 0 : getFormulaId().hashCode());
        result = prime * result + ((getFormulaCode() == null) ? 0 : getFormulaCode().hashCode());
        result = prime * result + ((getOilStoneProportion() == null) ? 0 : getOilStoneProportion().hashCode());
        result = prime * result + ((getAsphalt() == null) ? 0 : getAsphalt().hashCode());
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
        result = prime * result + ((getTempLevel() == null) ? 0 : getTempLevel().hashCode());
        result = prime * result + ((getGradationLevel() == null) ? 0 : getGradationLevel().hashCode());
        result = prime * result + ((getOilStoneLevel() == null) ? 0 : getOilStoneLevel().hashCode());
        result = prime * result + ((getAggregateWeight() == null) ? 0 : getAggregateWeight().hashCode());
        result = prime * result + ((getIsPass() == null) ? 0 : getIsPass().hashCode());
        result = prime * result + ((getDataId() == null) ? 0 : getDataId().hashCode());
        return result;
    }
}