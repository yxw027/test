package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * @author wuchen
 */

public enum WarningLevel {

    /**
     * 低级超标
     */
    LOWER("低级", 1),
    /**
     * 中级超标
     */
    MIDDLE("中级", 2),
    /**
     * 高级超标
     */
    HIGH("高级", 3);

    private String text;
    private Integer value;

    WarningLevel(String text, Integer value) {
        this.text = text;
        this.value = value;
    }

    public static JSONArray getJson() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (WarningLevel warningLevel : WarningLevel.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", warningLevel.getText());
            jsonObject.put("value", warningLevel.getValue());
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    public static Map<Integer, String> getMap() {
        HashMap<Integer, String> map = new HashMap<>();
        for (WarningLevel warningLevel : WarningLevel.values()) {
            map.put(warningLevel.getValue(), warningLevel.getText());
        }
        return map;
    }

    public static String getKey(Integer value){
        return getMap().get(value);
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
