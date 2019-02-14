package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 资源类型
 *
 * @author xiongbl
 */
public enum SourceType {

    MENU("菜单", 0),
    RESOURCE("资源", 1);

    private String text;
    private Integer value;

    SourceType(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (SourceType status : SourceType.values()) {
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
