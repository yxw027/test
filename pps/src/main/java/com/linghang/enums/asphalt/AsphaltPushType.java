package com.linghang.enums.asphalt;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 沥青告警推送类型
 *
 * @author youp 2018-12-17
 */
public enum AsphaltPushType {
    /**
     * 即时报警
     */
    IMMEDIATE("即时报警", 1),
    /**
     * 统计报警
     */
    STATISTIC("统计报警", 2),
    /**
     * 开关机报警
     */
    SWITCH("开关机报警", 3);

    private String text;
    private Integer value;

    AsphaltPushType(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (AsphaltPushType type : AsphaltPushType.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", type.getText());
            jsonObject.put("value", type.getValue());
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
