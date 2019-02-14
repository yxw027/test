package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * @author liuhao on 16/4/11.
 * 性别
 */
public enum Gender {
    /**
     * 男
     */
    MALE("男", 1),
    /**
     * 女
     */
    FEMALE("女", 0);

    private String text;
    private Integer value;

    Gender(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (Gender gender : Gender.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", gender.getText());
            jsonObject.put("value", gender.getValue());
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
