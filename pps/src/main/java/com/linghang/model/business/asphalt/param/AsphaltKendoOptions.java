package com.linghang.model.business.asphalt.param;

import com.linghang.model.base.KendoOptions;

/**
 * 增加查询时间
 *
 * @author youp
 * @date 2018-12-20
 **/
public class AsphaltKendoOptions extends KendoOptions {
    /**
     * 查询时间
     */
    private String searchTime;
    private String asphaltId;

    public String getSearchTime() {
        return searchTime;
    }

    public void setSearchTime(String searchTime) {
        this.searchTime = searchTime;
    }

    public String getAsphaltId() {
        return asphaltId;
    }

    public void setAsphaltId(String asphaltId) {
        this.asphaltId = asphaltId;
    }
}
