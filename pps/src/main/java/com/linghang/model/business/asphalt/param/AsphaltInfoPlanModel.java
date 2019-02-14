package com.linghang.model.business.asphalt.param;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.linghang.model.business.asphalt.AsphaltInfoModel;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 站点信息返回model
 *
 * @author wuchen
 */
public class AsphaltInfoPlanModel extends AsphaltInfoModel {

    /**
     * 计划产量
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal planProduction;

    /**
     * 实际产量
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Integer actualProduction;

    /**
     * 生产进度
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal productionSchedule;

    /**
     * 合格率
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private BigDecimal yield;

    /**
     * 最后生产时间
     */
    @JSONField(serialzeFeatures = SerializerFeature.WriteMapNullValue)
    private Date lastProductionTime;

    public BigDecimal getPlanProduction() {
        return planProduction;
    }

    public void setPlanProduction(BigDecimal planProduction) {
        this.planProduction = planProduction;
    }

    public Integer getActualProduction() {
        return actualProduction;
    }

    public void setActualProduction(Integer actualProduction) {
        this.actualProduction = actualProduction;
    }

    public BigDecimal getProductionSchedule() {
        return productionSchedule;
    }

    public void setProductionSchedule(BigDecimal productionSchedule) {
        this.productionSchedule = productionSchedule;
    }

    public BigDecimal getYield() {
        return yield;
    }

    public void setYield(BigDecimal yield) {
        this.yield = yield;
    }

    public Date getLastProductionTime() {
        return lastProductionTime;
    }

    public void setLastProductionTime(Date lastProductionTime) {
        this.lastProductionTime = lastProductionTime;
    }
}
