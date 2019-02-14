package com.linghang.enums.transport;

/**
 * 成品料运输时间表及查询类型
 */
public enum TransportTimeMarkSearchType {
    /**
     * 以组织机构为主查询
     */
    ORG("组织id", 1),
    /**
     * 以车辆为主进行查询
     */
    CAR("车辆id", 2);

    private String text;
    private Integer value;

    TransportTimeMarkSearchType(String text, Integer value) {
        this.text = text;
        this.value = value;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }
}
