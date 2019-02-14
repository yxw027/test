package com.linghang.enums.car;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: CarDownloadStatus
 * @Author: wuqi
 * @Date: 2019-01-14 14:48
 * @Description: 车辆下发电子围栏状态
 */
public enum CarDownloadStatus {
    /**
     * 成功
     */
    SUCCESS("success", 1),
    /**
     * 失败
     */
    FAIL("fail", 0),
    /**
     * 等待确认
     */
    WAIT("wait", 2);

    private String text;
    private Integer value;

    CarDownloadStatus(String text, Integer value) {
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
