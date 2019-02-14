package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * @author xiongbl.
 * 考勤人员状态
 */
public enum UserState {
    /**
     * 在职
     */
    WORKING("在职", "01"),
    /**
     * 离职
     */
    LEAVE("离职", "02");

    private String text;
    private String value;

    UserState(String text, String value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (UserState gender : UserState.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", gender.getText());
            jsonObject.put("value", gender.getValue());
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
