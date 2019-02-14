package com.linghang.model.business.water;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by dell on 2018/12/19.
 * 沥青配方表 Model
 */
public class WaterFormulaModel extends WaterEntity implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private Long id;

    /**
     * 配方编号
     */
    private String number;

    /**
     * 配方名称
     */
    private String name;

    /**
     * 摊铺层级
     */
    private Long pavingLevel;

    /**
     * 计划产量
     */
    private BigDecimal planOutput;

    /**
     * 配方状态--0启用-1禁用
     */
    private Integer status;

    /**
     * 沥青拌合站id
     */
    private Long stationId;

    /**
     * 备注
     */
    private String remarks;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 更新人
     */
    private Long updateUser;

    /**
     * 数据版本
     */
    private Integer dataVersion;

    /**
     * 数据可见 0可见-1不可见
     */
    private Integer isVisible;

    /**
     * 0默认 1非默认
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer type;

    public WaterFormulaModel() {
    }

    public WaterFormulaModel(Long id, int notVisible) {
        super();
        this.id = id;
        this.isVisible = notVisible;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Long getPavingLevel() {
        return pavingLevel;
    }

    public void setPavingLevel(Long pavingLevel) {
        this.pavingLevel = pavingLevel;
    }

    public BigDecimal getPlanOutput() {
        return planOutput;
    }

    public void setPlanOutput(BigDecimal planOutput) {
        this.planOutput = planOutput;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getStationId() {
        return stationId;
    }

    public void setStationId(Long stationId) {
        this.stationId = stationId;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
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

}