package com.linghang.model.business.water;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.linghang.model.business.water.param.MsgDetailModel;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by lvruixing on 2018/12/19.
 * 告警信息表 Model
 */
public class WaterWarningMessageModel extends BaseEntity {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 数据id
     */
    private Long dataId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 告警内容
     */
    private String content;

    private String type;

    /**
     * 水泥
     */
    private BigDecimal cement;

    /**
     * 总重量
     */
    private BigDecimal totalWeight;

    /**
     * 水稳拌合站id
     */
    private Long stationId;

    /**
     * 水泥报警状态
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer cementResult;

    /**
     * 水泥报警信息
     */
    private String cementMsg;

    /**
     * 水
     */
    private BigDecimal water;

    /**
     * 水报警状态
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer waterResult;

    /**
     * 水报警信息
     */
    private String waterMsg;

    /**
     * 配方Id
     */
    private Long formulaId;

    /**
     * 配方名称
     */
    private String formulaName;

    /**
     * 骨料报警状态
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer aggregateResult;

    /**
     * 级配报警状态
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer sieveResult;

    /**
     * 数据时间
     */
    private Date dataTime;

    private Integer version;

    private Integer excessLevel;

    private MsgDetailModel aggregateDetail;

    private WaterInfoModel stationDetail;

    private Integer dealStatus;

    private Integer sendFlag;

    private String returnKey;

    private List<WaterWarningConfigModel> configDetail;

    public Integer getExcessLevel() {
        return excessLevel;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public void setExcessLevel(Integer excessLevel) {
        this.excessLevel = excessLevel;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getDataId() {
        return dataId;
    }

    public void setDataId(Long dataId) {
        this.dataId = dataId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Long getStationId() {
        return stationId;
    }

    public void setStationId(Long stationId) {
        this.stationId = stationId;
    }

    public BigDecimal getCement() {
        return cement;
    }

    public void setCement(BigDecimal cement) {
        this.cement = cement;
    }

    public BigDecimal getTotalWeight() {
        return totalWeight;
    }

    public void setTotalWeight(BigDecimal totalWeight) {
        this.totalWeight = totalWeight;
    }

    public Integer getCementResult() {
        return cementResult;
    }

    public void setCementResult(Integer cementResult) {
        this.cementResult = cementResult;
    }

    public String getCementMsg() {
        return cementMsg;
    }

    public void setCementMsg(String cementMsg) {
        this.cementMsg = cementMsg;
    }

    public BigDecimal getWater() {
        return water;
    }

    public void setWater(BigDecimal water) {
        this.water = water;
    }

    public Integer getWaterResult() {
        return waterResult;
    }

    public void setWaterResult(Integer waterResult) {
        this.waterResult = waterResult;
    }

    public String getWaterMsg() {
        return waterMsg;
    }

    public void setWaterMsg(String waterMsg) {
        this.waterMsg = waterMsg;
    }

    public Long getFormulaId() {
        return formulaId;
    }

    public void setFormulaId(Long formulaId) {
        this.formulaId = formulaId;
    }

    public String getFormulaName() {
        return formulaName;
    }

    public void setFormulaName(String formulaName) {
        this.formulaName = formulaName;
    }

    public Integer getAggregateResult() {
        return aggregateResult;
    }

    public void setAggregateResult(Integer aggregateResult) {
        this.aggregateResult = aggregateResult;
    }

    public Integer getSieveResult() {
        return sieveResult;
    }

    public void setSieveResult(Integer sieveResult) {
        this.sieveResult = sieveResult;
    }

    public Date getDataTime() {
        return dataTime;
    }

    public void setDataTime(Date dataTime) {
        this.dataTime = dataTime;
    }

    public MsgDetailModel getAggregateDetail() {
        return aggregateDetail;
    }

    public void setAggregateDetail(MsgDetailModel aggregateDetail) {
        this.aggregateDetail = aggregateDetail;
    }

    public WaterInfoModel getStationDetail() {
        return stationDetail;
    }

    public void setStationDetail(WaterInfoModel stationDetail) {
        this.stationDetail = stationDetail;
    }

    public List<WaterWarningConfigModel> getConfigDetail() {
        return configDetail;
    }

    public void setConfigDetail(List<WaterWarningConfigModel> configDetail) {
        this.configDetail = configDetail;
    }

    public Integer getDealStatus() {
        return dealStatus;
    }

    public void setDealStatus(Integer dealStatus) {
        this.dealStatus = dealStatus;
    }

    public Integer getSendFlag() {
        return sendFlag;
    }

    public void setSendFlag(Integer sendFlag) {
        this.sendFlag = sendFlag;
    }

    public String getReturnKey() {
        return returnKey;
    }

    public void setReturnKey(String returnKey) {
        this.returnKey = returnKey;
    }

    @Override
    public String toString() {
        return "WaterWarningMessageModel{" +
                "id=" + id +
                ", dataId=" + dataId +
                ", createTime=" + createTime +
                ", content='" + content + '\'' +
                ", type='" + type + '\'' +
                ", cement=" + cement +
                ", totalWeight=" + totalWeight +
                ", stationId=" + stationId +
                ", cementResult=" + cementResult +
                ", cementMsg='" + cementMsg + '\'' +
                ", water=" + water +
                ", waterResult=" + waterResult +
                ", waterMsg='" + waterMsg + '\'' +
                ", formulaId=" + formulaId +
                ", formulaName='" + formulaName + '\'' +
                ", aggregateResult=" + aggregateResult +
                ", sieveResult=" + sieveResult +
                ", dataTime=" + dataTime +
                ", version=" + version +
                ", excessLevel=" + excessLevel +
                ", aggregateDetail=" + aggregateDetail +
                ", stationDetail=" + stationDetail +
                ", dealStatus=" + dealStatus +
                ", sendFlag=" + sendFlag +
                ", returnKey='" + returnKey + '\'' +
                ", configDetail=" + configDetail +
                '}';
    }
}