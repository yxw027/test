package com.linghang.enums.asphalt;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 沥青告警设置类型
 *
 * @author youp
 * @date 2018-12-17
 **/
public enum AsphaltWarningConfigType {
    /**
     * 出料温度
     */
    TEMPERATURE("出料温度", 1),
    /**
     * 集料温度
     */
    AGGTEMPERATURE("集料温度", 3),
    /**
     * 沥青温度
     */
    ASPHALTTEMPERATURE("沥青温度", 4),
    /**
     * 油石比
     */
    OILSTONERATIO("油石比", 2),

    /**
     * 拌合温度
     */
    MIXINGTEMPERATURE("拌合温度", 5);

    private String text;
    private Integer value;

    AsphaltWarningConfigType(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (AsphaltWarningConfigType config : AsphaltWarningConfigType.values()) {
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

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }
}
