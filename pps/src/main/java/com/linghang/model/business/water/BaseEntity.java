package com.linghang.model.business.water;

import com.linghang.model.base.KendoOptions;

import java.io.Serializable;

/**
 * Entity基类
 *
 * @author linghang
 */
public class BaseEntity extends KendoOptions implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 搜索值
     */
    private String searchValue;

    /**
     * 搜索值
     */
    private String searchTime;

    /**
     * 请求参数
     */
    private Long orgId;

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public String getSearchTime() {
        return searchTime;
    }

    public void setSearchTime(String searchTime) {
        this.searchTime = searchTime;
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }
}
