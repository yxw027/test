package com.linghang.enums.asphalt;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 数据删除状态
 *
 * @author youp
 * @date 2018-12-19
 **/
public enum DataDeleteStatus {
    /**
     * 数据正常
     */
    NORMAL("正常", 0),
    /**
     * 数据已删除
     */
    DELETE("删除", 1);
    private String text;
    private Integer value;

    DataDeleteStatus(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (DataDeleteStatus status : DataDeleteStatus.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", status.getText());
            jsonObject.put("value", status.getValue());
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

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }
}
