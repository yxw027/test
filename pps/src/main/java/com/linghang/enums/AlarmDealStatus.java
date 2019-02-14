package com.linghang.enums;

/**
 * 拌合站告警信息处理枚举类
 *
 * @author youp
 * @date 2019-01-15
 **/
public enum AlarmDealStatus {
    /**
     * 已处理
     */
    DEAL("已处理", 1),
    /**
     * 已审核
     */
    REVIEW("已审核", 2),
    /**
     * 已审核
     */
    APPROVAL("已审批", 3);

    private String text;
    private Integer value;

    AlarmDealStatus(String text, Integer value) {
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
