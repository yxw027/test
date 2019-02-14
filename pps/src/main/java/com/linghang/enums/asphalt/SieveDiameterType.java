package com.linghang.enums.asphalt;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * 筛孔直径分类
 *
 * @author youp
 * @date 2018-12-17
 **/
public enum SieveDiameterType {
    /**
     * 筛孔0.075mm直径
     */
    SIEVE1("0.075", 1),
    SIEVE2("0.15", 2),
    SIEVE3("0.3", 3),
    SIEVE4("0.6", 4),
    SIEVE5("1.18", 5),
    SIEVE6("2.36", 6),
    SIEVE7("4.75", 7),
    SIEVE8("9.5", 8),
    SIEVE9("13.2", 9),
    SIEVE10("16", 10),
    SIEVE11("19", 11),
    SIEVE12("26.5", 12),
    SIEVE13("31.5", 13);

    private String text;
    private Integer value;

    SieveDiameterType(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (SieveDiameterType type : SieveDiameterType.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", type.getText());
            jsonObject.put("value", type.getValue());
            jsonArray.add(jsonObject);
        }
        return jsonArray.toJSONString();
    }

    public static Map<Integer, String> getMap() {
        HashMap<Integer, String> map = new HashMap<>();
        for (SieveDiameterType type : SieveDiameterType.values()) {
            map.put(type.getValue(), type.getText());
        }
        return map;
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

    public static String getTextByValue(Integer value) {
        return getMap().get(value);
    }
}
