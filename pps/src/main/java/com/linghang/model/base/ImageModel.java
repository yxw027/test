package com.linghang.model.base;


/**
 * @author liuhao on 2016/11/14.
 * 图片 实体类
 */
public class ImageModel {

    private String name;

    private String type;

    private Long size;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }
}