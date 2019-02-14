package com.linghang.enums.water;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 水稳告警设置类型
 *
 * @author youp
 * @date 2018-12-17
 **/
public enum WaterWarningConfigType {
    /**
     * 级配
     */
    CEMENT("水泥", "cement"),
    /**
     * 骨配
     */
    WATER("水", "water"),
    G1("骨料1", "g1"),
    G2("骨料2", "g2"),
    G3("骨料3", "g3"),
    G4("骨料4", "g4"),
    G5("骨料5", "g5"),
    G6("骨料6", "g6"),
    G7("骨料7", "g7"),
    G8("骨料8", "g8"),
    G9("骨料9", "g9"),
    G10("骨料10", "g10");


    private String text;
    private String value;

    WaterWarningConfigType(String text, String value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (WaterWarningConfigType config : WaterWarningConfigType.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", config.getText());
            jsonObject.put("value", config.getValue());
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

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
