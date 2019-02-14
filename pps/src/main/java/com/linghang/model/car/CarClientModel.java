package com.linghang.model.car;

import com.linghang.serversocket.carlocation.shannxinavi.Message0100Model;

import java.io.Serializable;

/**
 * Created by dell on 2019/01/09.
 * 车辆信息  Model
 */
public class CarClientModel extends Message0100Model implements Serializable {
    /**
     * 版本号
     */
    private static final long serialVersionUID = 1L;

    /**
     * 主键无意义
     */
    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}