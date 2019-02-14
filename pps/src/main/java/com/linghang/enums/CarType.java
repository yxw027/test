package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 状态
 *
 * @author liuhao on 2015/11/20.
 */
public enum CarType {
    /**
     * 摊铺机
     */
    PAVERS("摊铺机", 0),

    /**
     * 胶轮
     */
    RUBBER("胶轮", 1),

    /**
     * 双钢轮
     */
    STEEL("双钢轮", 2),

    /**
     * 单钢轮
     */
    SINGLE("单钢轮", 3);

    private String text;
    private Integer value;

    CarType(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (CarType type : CarType.values()) {
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
