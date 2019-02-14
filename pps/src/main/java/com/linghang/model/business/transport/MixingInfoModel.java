package com.linghang.model.business.transport;

import java.io.Serializable;

/**
 * 拌合站信息表
 *
 * @author youp
 * @date 2019-01-03
 **/
public class MixingInfoModel implements Serializable {
    private static final long serialVersionUID = 2137461248868770827L;
    /**
     * 拌合站id
     */
    private String id;
    /**
     * 拌合站名称
     */
    private String name;
    /**
     * 拌合站类型
     */
    private Integer type;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
