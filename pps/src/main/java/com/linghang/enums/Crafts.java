package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 设备工艺
 *
 * @author liuhao on 2015/11/20.
 */
public enum Crafts {
    /**
     * 摊铺
     */
    PAVE("摊铺", 0),

    /**
     * 初压
     */
    FIRST("初压", 1),

    /**
     * 复压
     */
    AGAIN("复压", 2),

    /**
     * 终压
     */
    FINISH("终压", 3);

    private String text;
    private Integer value;

    Crafts(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (Crafts crafts : Crafts.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", crafts.getText());
            jsonObject.put("value", crafts.getInteger());
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
