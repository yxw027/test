package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 状态
 *
 * @author liuhao on 2015/11/20.
 */
public enum TrimbleInfoBrand {
    /**
     * ENH
     */
    ENH("ENH", 0),

    /**
     * 领航
     */
    LINGHANG("领航", 1),

    /**
     * 华测
     */
    HUACE("华测", 2);

    private String text;
    private Integer value;

    TrimbleInfoBrand(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (TrimbleInfoBrand brand : TrimbleInfoBrand.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", brand.getText());
            jsonObject.put("value", brand.getInteger());
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
