package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 状态
 *
 * @author liuhao on 2015/11/20.
 */
public enum CarStatus {
    /**
     * 施工
     */
    WORK("施工", 1),

    /**
     * 转场
     */
    MOVE("转场", 0);

    private String text;
    private Integer value;

    CarStatus(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (CarStatus status : CarStatus.values()) {
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
