package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public enum AsphaltReportType {
    /**
     * 日报表
     */
    DAY("日报表", 1),

    /**
     * 周报表
     */
    WEEK("周报表", 2),

    /**
     * 月报表
     */
    MONTH("月报表", 3);


    private String text;
    private Integer value;

    AsphaltReportType(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (AsphaltReportType status : AsphaltReportType.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", status.getText());
            jsonObject.put("value", status.getInteger());
            jsonArray.add(jsonObject);
        }
        return jsonArray.toJSONString();
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getInteger() {
        return value;
    }

    public void setInteger(Integer value) {
        this.value = value;
    }
}
