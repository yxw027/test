package com.linghang.enums.asphalt;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 超标数据等级
 *
 * @author youp
 * @date 2018-12-17
 **/
public enum ExcessDataLevel {
    /**
     * 合格
     */
    ZERO("合格", 0),
    /**
     * 一级
     */
    ONE("一级", 1),
    /**
     * 二级
     */
    TWO("二级", 2),
    /**
     * 三级
     */
    THREE("三级", 3);

    private String text;
    private Integer value;

    ExcessDataLevel(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public static JSONArray getJson() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (ExcessDataLevel excessDataLevel : ExcessDataLevel.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", excessDataLevel.getText());
            jsonObject.put("value", excessDataLevel.getValue());
            jsonArray.add(jsonObject);
        }
        return jsonArray;
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
