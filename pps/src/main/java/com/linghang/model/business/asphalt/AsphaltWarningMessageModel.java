package com.linghang.model.business.asphalt;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.io.Serializable;
import java.util.Date;

/**
 * @author wuchen on 2018/12/17.
 * 告警信息表 Model
 */
public class AsphaltWarningMessageModel implements Serializable {

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
     * 生产时间
     */
    private Date productionTime;

    /**
     * 总超标等级
     */
    private Integer allLevel;


    /**
     * 告警内容
     */
    private String content;


    /**
     * 分类
     */
    private String type;

    /**
     * 油石比超标结果
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer oilStoneResult;
    /**
     * 超标信息
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String oilStoneMsg;
    /**
     * 级配超标结果
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer sieveResult;
    /**
     * 级配超标信息
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String sieveMsg;

    /**
     * 温度超标级别
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer tempResult;
    /**
     * 温度超标信息
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String tempMsg;
    /**
     * 集料温度超标级别
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer aggTempResult;
    /**
     * 集料温度超标信息
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String aggTempMsg;
    /**
     * 沥青温度超标级别
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer asphaltTempResult;
    /**
     * 沥青温度超标信息
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String asphaltTempMsg;

    /**
     * 沥青温度超标级别
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer mixingTempResult;
    /**
     * 沥青温度超标信息
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private String mixingTempMsg;
    /**
     * 拌合站id
     */
    private Long asphaltId;

    /**
     * 配方名称
     */
    private String formulaCode;

    /**
     * 配方名称
     */
    private String formulaId;


    private Integer dealStatus;

    private Integer sendFlag;

    private String returnKey;


    public AsphaltWarningMessageModel(Long id, Long dataId, Date createTime, String content, String type, Integer oilStoneResult, Integer sieveResult, Integer tempResult, Long asphaltId) {
        this.id = id;
        this.dataId = dataId;
        this.createTime = createTime;
        this.content = content;
        this.type = type;
        this.oilStoneResult = oilStoneResult;
        this.sieveResult = sieveResult;
        this.tempResult = tempResult;
        this.asphaltId = asphaltId;
    }

    public AsphaltWarningMessageModel() {

    }

    public Integer getMixingTempResult() {
        return mixingTempResult;
    }

    public void setMixingTempResult(Integer mixingTempResult) {
        this.mixingTempResult = mixingTempResult;
    }

    public String getMixingTempMsg() {
        return mixingTempMsg;
    }

    public void setMixingTempMsg(String mixingTempMsg) {
        this.mixingTempMsg = mixingTempMsg;
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

    public Integer getAggTempResult() {
        return aggTempResult;
    }

    public void setAggTempResult(Integer aggTempResult) {
        this.aggTempResult = aggTempResult;
    }

    public String getAggTempMsg() {
        return aggTempMsg;
    }

    public void setAggTempMsg(String aggTempMsg) {
        this.aggTempMsg = aggTempMsg;
    }

    public Integer getAsphaltTempResult() {
        return asphaltTempResult;
    }

    public void setAsphaltTempResult(Integer asphaltTempResult) {
        this.asphaltTempResult = asphaltTempResult;
    }

    public String getAsphaltTempMsg() {
        return asphaltTempMsg;
    }

    public void setAsphaltTempMsg(String asphaltTempMsg) {
        this.asphaltTempMsg = asphaltTempMsg;
    }

    public String getFormulaId() {
        return formulaId;
    }

    public void setFormulaId(String formulaId) {
        this.formulaId = formulaId;
    }

    public Date getProductionTime() {
        return productionTime;
    }

    public void setProductionTime(Date productionTime) {
        this.productionTime = productionTime;
    }

    public Integer getAllLevel() {
        return allLevel;
    }

    public void setAllLevel(Integer allLevel) {
        this.allLevel = allLevel;
    }

    public String getFormulaCode() {
        return formulaCode;
    }

    public void setFormulaCode(String formulaCode) {
        this.formulaCode = formulaCode;
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

    public Integer getOilStoneResult() {
        return oilStoneResult;
    }

    public void setOilStoneResult(Integer oilStoneResult) {
        this.oilStoneResult = oilStoneResult;
    }

    public String getOilStoneMsg() {
        return oilStoneMsg;
    }

    public void setOilStoneMsg(String oilStoneMsg) {
        this.oilStoneMsg = oilStoneMsg;
    }

    public Integer getSieveResult() {
        return sieveResult;
    }

    public void setSieveResult(Integer sieveResult) {
        this.sieveResult = sieveResult;
    }

    public String getSieveMsg() {
        return sieveMsg;
    }

    public void setSieveMsg(String sieveMsg) {
        this.sieveMsg = sieveMsg;
    }

    public String getTempMsg() {
        return tempMsg;
    }

    public void setTempMsg(String tempMsg) {
        this.tempMsg = tempMsg;
    }

    public Integer getTempResult() {
        return tempResult;
    }

    public void setTempResult(Integer tempResult) {
        this.tempResult = tempResult;
    }

    public Long getAsphaltId() {
        return asphaltId;
    }

    public void setAsphaltId(Long asphaltId) {
        this.asphaltId = asphaltId;
    }

    @Override
    public String toString() {
        return "AsphaltWarningMessageModel{" +
                "id=" + id +
                ", dataId=" + dataId +
                ", createTime=" + createTime +
                ", productionTime=" + productionTime +
                ", allLevel=" + allLevel +
                ", content='" + content + '\'' +
                ", type='" + type + '\'' +
                ", oilStoneResult=" + oilStoneResult +
                ", oilStoneMsg='" + oilStoneMsg + '\'' +
                ", sieveResult=" + sieveResult +
                ", sieveMsg='" + sieveMsg + '\'' +
                ", tempResult=" + tempResult +
                ", tempMsg='" + tempMsg + '\'' +
                ", aggTempResult=" + aggTempResult +
                ", aggTempMsg='" + aggTempMsg + '\'' +
                ", asphaltTempResult=" + asphaltTempResult +
                ", asphaltTempMsg='" + asphaltTempMsg + '\'' +
                ", asphaltId=" + asphaltId +
                ", formulaCode='" + formulaCode + '\'' +
                ", formulaId='" + formulaId + '\'' +
                ", dealStatus=" + dealStatus +
                ", sendFlag=" + sendFlag +
                ", returnKey='" + returnKey + '\'' +
                '}';
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
        AsphaltWarningMessageModel other = (AsphaltWarningMessageModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getDataId() == null ? other.getDataId() == null : this.getDataId().equals(other.getDataId()))
                && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
                && (this.getContent() == null ? other.getContent() == null : this.getContent().equals(other.getContent()))
                && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
                && (this.getOilStoneResult() == null ? other.getOilStoneResult() == null : this.getOilStoneResult().equals(other.getOilStoneResult()))
                && (this.getSieveResult() == null ? other.getSieveResult() == null : this.getSieveResult().equals(other.getSieveResult()))
                && (this.getTempResult() == null ? other.getTempResult() == null : this.getTempResult().equals(other.getTempResult()))
                && (this.getAsphaltId() == null ? other.getAsphaltId() == null : this.getAsphaltId().equals(other.getAsphaltId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getDataId() == null) ? 0 : getDataId().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getContent() == null) ? 0 : getContent().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getOilStoneResult() == null) ? 0 : getOilStoneResult().hashCode());
        result = prime * result + ((getSieveResult() == null) ? 0 : getSieveResult().hashCode());
        result = prime * result + ((getTempResult() == null) ? 0 : getTempResult().hashCode());
        result = prime * result + ((getAsphaltId() == null) ? 0 : getAsphaltId().hashCode());
        return result;
    }
}