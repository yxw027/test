package com.linghang.model.business.asphalt;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 沥青站详细信息
 *
 * @author wuchen
 */
public class AsphaltDetailModel extends AsphaltInfoModel {

    /**
     * 最后生产时间
     */
    private Date lastProductionTime;

    /**
     * 生产批次
     */
    private Integer productionBatch;

    /**
     * 生产重量
     */
    private BigDecimal productionWeight;

    public Date getLastProductionTime() {
        return lastProductionTime;
    }

    public void setLastProductionTime(Date lastProductionTime) {
        this.lastProductionTime = lastProductionTime;
    }

    public Integer getProductionBatch() {
        return productionBatch;
    }

    public void setProductionBatch(Integer productionBatch) {
        this.productionBatch = productionBatch;
    }

    public BigDecimal getProductionWeight() {
        return productionWeight;
    }

    public void setProductionWeight(BigDecimal productionWeight) {
        this.productionWeight = productionWeight;
    }
}
