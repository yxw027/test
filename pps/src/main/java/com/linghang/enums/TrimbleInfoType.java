package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 天宝主板类型
 *
 * @author liuhao on 2018/11/01.
 */
public enum TrimbleInfoType {
    /**
     * 基站
     */
    STATION("基站", 0),

    /**
     * 移动端
     */
    MOBILE("移动端", 1);

    private String text;
    private Integer value;

    TrimbleInfoType(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (TrimbleInfoType type : TrimbleInfoType.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", type.getText());
            jsonObject.put("value", type.getInteger());
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
