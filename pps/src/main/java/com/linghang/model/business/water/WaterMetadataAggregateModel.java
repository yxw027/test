package com.linghang.model.business.water;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by dell on 2018/12/26.
 * 元数据计算结果表 Model
 *
 * @author 田朋
 */
public class WaterMetadataAggregateModel implements Serializable {
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
     * 骨料1
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal g1;

    /**
     * 骨料2
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal g2;

    /**
     * 骨料3
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal g3;

    /**
     * 骨料4
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal g4;

    /**
     * 骨料5
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal g5;

    /**
     * 骨料6
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal g6;

    /**
     * 骨料7
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal g7;

    /**
     * 骨料8
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal g8;

    /**
     * 骨料9
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal g9;

    /**
     * 骨料10
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal g10;

    /**
     * 批次
     */
    private String batchCode;

    /**
     * 骨料配比超标等级
     */
    private Integer aggregateLevel;

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
     * 超标状态
     */
    private Integer g1State = 0;

    /**
     * 超标状态
     */
    private Integer g2State = 0;

    /**
     * 超标状态
     */
    private Integer g3State = 0;

    /**
     * 超标状态
     */
    private Integer g4State = 0;

    /**
     * 超标状态
     */
    private Integer g5State = 0;

    /**
     * 超标状态
     */
    private Integer g6State = 0;

    /**
     * 超标状态
     */
    private Integer g7State = 0;

    /**
     * 超标状态
     */
    private Integer g8State = 0;

    /**
     * 超标状态
     */
    private Integer g9State = 0;

    /**
     * 超标状态
     */
    private Integer g10State = 0;

    private Integer g1Level = 0;
    private Integer g2Level = 0;
    private Integer g3Level = 0;
    private Integer g4Level = 0;
    private Integer g5Level = 0;
    private Integer g6Level = 0;
    private Integer g7Level = 0;
    private Integer g8Level = 0;
    private Integer g9Level = 0;
    private Integer g10Level = 0;

    /**
     * 生产时间
     */
    private Date time;

    /**
     * 筛孔计算版本
     */
    private Integer sieveVersion;

    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String g1Msg;

    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String g2Msg;

    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String g3Msg;

    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String g4Msg;

    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String g5Msg;

    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String g6Msg;

    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String g7Msg;

    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String g8Msg;

    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String g9Msg;

    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String g10Msg;

    /**
     * 配方model
     */
    private WaterFormulaModel formulaModel;

    /**
     * 水泥报警状态
     */
    private Integer cementState = 0;

    /**
     * 水报警状态
     */
    private Integer waterState = 0;

    /**
     * 水泥报警级别
     */
    private Integer cementLevel = 0;

    /**
     * 水报警级别
     */
    private Integer waterLevel = 0;

    /**
     * 水泥报警信息
     */
    private String cementMsg;

    /**
     * 水报警信息
     */
    private String waterMsg;

    /**
     * 骨料配置信息
     */
    private List<WaterWarningConfigModel> sieves;

    public List<WaterWarningConfigModel> getSieves() {
        return sieves;
    }

    public void setSieves(List<WaterWarningConfigModel> sieves) {
        this.sieves = sieves;
    }

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

    public WaterFormulaModel getFormulaModel() {
        return formulaModel;
    }

    public void setFormulaModel(WaterFormulaModel formulaModel) {
        this.formulaModel = formulaModel;
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

    public String getBatchCode() {
        return batchCode;
    }

    public void setBatchCode(String batchCode) {
        this.batchCode = batchCode == null ? null : batchCode.trim();
    }

    public Integer getAggregateLevel() {
        return aggregateLevel;
    }

    public void setAggregateLevel(Integer aggregateLevel) {
        this.aggregateLevel = aggregateLevel;
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

    public Integer getG1State() {
        return g1State;
    }

    public void setG1State(Integer g1State) {
        this.g1State = g1State;
    }

    public Integer getG2State() {
        return g2State;
    }

    public void setG2State(Integer g2State) {
        this.g2State = g2State;
    }

    public Integer getG3State() {
        return g3State;
    }

    public void setG3State(Integer g3State) {
        this.g3State = g3State;
    }

    public Integer getG4State() {
        return g4State;
    }

    public void setG4State(Integer g4State) {
        this.g4State = g4State;
    }

    public Integer getG5State() {
        return g5State;
    }

    public void setG5State(Integer g5State) {
        this.g5State = g5State;
    }

    public Integer getG6State() {
        return g6State;
    }

    public void setG6State(Integer g6State) {
        this.g6State = g6State;
    }

    public Integer getG7State() {
        return g7State;
    }

    public void setG7State(Integer g7State) {
        this.g7State = g7State;
    }

    public Integer getG8State() {
        return g8State;
    }

    public void setG8State(Integer g8State) {
        this.g8State = g8State;
    }

    public Integer getG9State() {
        return g9State;
    }

    public void setG9State(Integer g9State) {
        this.g9State = g9State;
    }

    public Integer getG10State() {
        return g10State;
    }

    public void setG10State(Integer g10State) {
        this.g10State = g10State;
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

    public String getG1Msg() {
        return g1Msg;
    }

    public void setG1Msg(String g1Msg) {
        this.g1Msg = g1Msg == null ? null : g1Msg.trim();
    }

    public String getG2Msg() {
        return g2Msg;
    }

    public void setG2Msg(String g2Msg) {
        this.g2Msg = g2Msg == null ? null : g2Msg.trim();
    }

    public String getG3Msg() {
        return g3Msg;
    }

    public void setG3Msg(String g3Msg) {
        this.g3Msg = g3Msg == null ? null : g3Msg.trim();
    }

    public String getG4Msg() {
        return g4Msg;
    }

    public void setG4Msg(String g4Msg) {
        this.g4Msg = g4Msg == null ? null : g4Msg.trim();
    }

    public String getG5Msg() {
        return g5Msg;
    }

    public void setG5Msg(String g5Msg) {
        this.g5Msg = g5Msg == null ? null : g5Msg.trim();
    }

    public String getG6Msg() {
        return g6Msg;
    }

    public void setG6Msg(String g6Msg) {
        this.g6Msg = g6Msg == null ? null : g6Msg.trim();
    }

    public String getG7Msg() {
        return g7Msg;
    }

    public void setG7Msg(String g7Msg) {
        this.g7Msg = g7Msg == null ? null : g7Msg.trim();
    }

    public String getG8Msg() {
        return g8Msg;
    }

    public void setG8Msg(String g8Msg) {
        this.g8Msg = g8Msg == null ? null : g8Msg.trim();
    }

    public String getG9Msg() {
        return g9Msg;
    }

    public void setG9Msg(String g9Msg) {
        this.g9Msg = g9Msg == null ? null : g9Msg.trim();
    }

    public String getG10Msg() {
        return g10Msg;
    }

    public void setG10Msg(String g10Msg) {
        this.g10Msg = g10Msg == null ? null : g10Msg.trim();
    }

    public Integer getG1Level() {
        return g1Level;
    }

    public void setG1Level(Integer g1Level) {
        this.g1Level = g1Level;
    }

    public Integer getG2Level() {
        return g2Level;
    }

    public void setG2Level(Integer g2Level) {
        this.g2Level = g2Level;
    }

    public Integer getG3Level() {
        return g3Level;
    }

    public void setG3Level(Integer g3Level) {
        this.g3Level = g3Level;
    }

    public Integer getG4Level() {
        return g4Level;
    }

    public void setG4Level(Integer g4Level) {
        this.g4Level = g4Level;
    }

    public Integer getG5Level() {
        return g5Level;
    }

    public void setG5Level(Integer g5Level) {
        this.g5Level = g5Level;
    }

    public Integer getG6Level() {
        return g6Level;
    }

    public void setG6Level(Integer g6Level) {
        this.g6Level = g6Level;
    }

    public Integer getG7Level() {
        return g7Level;
    }

    public void setG7Level(Integer g7Level) {
        this.g7Level = g7Level;
    }

    public Integer getG8Level() {
        return g8Level;
    }

    public void setG8Level(Integer g8Level) {
        this.g8Level = g8Level;
    }

    public Integer getG9Level() {
        return g9Level;
    }

    public void setG9Level(Integer g9Level) {
        this.g9Level = g9Level;
    }

    public Integer getG10Level() {
        return g10Level;
    }

    public void setG10Level(Integer g10Level) {
        this.g10Level = g10Level;
    }

    public Integer getCementState() {
        return cementState;
    }

    public void setCementState(Integer cementState) {
        this.cementState = cementState;
    }

    public Integer getWaterState() {
        return waterState;
    }

    public void setWaterState(Integer waterState) {
        this.waterState = waterState;
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

    public String getCementMsg() {
        return cementMsg;
    }

    public void setCementMsg(String cementMsg) {
        this.cementMsg = cementMsg;
    }

    public String getWaterMsg() {
        return waterMsg;
    }

    public void setWaterMsg(String waterMsg) {
        this.waterMsg = waterMsg;
    }

    @Override
    public String toString() {
        return "WaterMetadataAggregateModel{" +
                "id=" + id +
                ", stationId=" + stationId +
                ", formulaId=" + formulaId +
                ", formulaCode='" + formulaCode + '\'' +
                ", cement=" + cement +
                ", water=" + water +
                ", weight=" + weight +
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
                ", batchCode='" + batchCode + '\'' +
                ", aggregateLevel=" + aggregateLevel +
                ", aggregateWeight=" + aggregateWeight +
                ", isPass=" + isPass +
                ", dataId=" + dataId +
                ", excessMsg='" + excessMsg + '\'' +
                ", g1State=" + g1State +
                ", g2State=" + g2State +
                ", g3State=" + g3State +
                ", g4State=" + g4State +
                ", g5State=" + g5State +
                ", g6State=" + g6State +
                ", g7State=" + g7State +
                ", g8State=" + g8State +
                ", g9State=" + g9State +
                ", g10State=" + g10State +
                ", time=" + time +
                ", sieveVersion=" + sieveVersion +
                ", g1Msg='" + g1Msg + '\'' +
                ", g2Msg='" + g2Msg + '\'' +
                ", g3Msg='" + g3Msg + '\'' +
                ", g4Msg='" + g4Msg + '\'' +
                ", g5Msg='" + g5Msg + '\'' +
                ", g6Msg='" + g6Msg + '\'' +
                ", g7Msg='" + g7Msg + '\'' +
                ", g8Msg='" + g8Msg + '\'' +
                ", g9Msg='" + g9Msg + '\'' +
                ", g10Msg='" + g10Msg + '\'' +
                ", formulaModel='" + formulaModel + '\'' +
                ", sieves=" + sieves +
                '}';
    }

}