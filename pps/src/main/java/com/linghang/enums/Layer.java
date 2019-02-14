package com.linghang.enums;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author xiongbl
 * 层面
 */
public enum Layer {

    CUSHION("垫层", 1),
    SUBBASE("底基层", 2),
    LOWEST_LEVEL("下基层", 3),
    UPPER_LEVEL("上基层", 4),
    LOWER_LAYER("下面层", 5),
    MIDDLE_LAYER("中面层", 6),
    UPPER_LAYER("上面层", 7);


    private String text;
    private Integer value;

    Layer(String text, int value) {
        this.text = text;
        this.value = value;
    }

    public static String getJsonString() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (Layer gender : Layer.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", gender.getText());
            jsonObject.put("value", gender.getValue());
            jsonArray.add(jsonObject);
        }
        return jsonArray.toJSONString();
    }

    public static String getMapJsonString(){
        List list = new ArrayList();
        Map<Object, Object> map = new HashMap<>();
        for (Layer gender : Layer.values()) {
            JSONObject jsonObject;
            jsonObject = new JSONObject();
            jsonObject.put("text", gender.getText());
            jsonObject.put("value", gender.getValue());
            list.add(jsonObject);
            map.put(gender.getValue(), gender.getText());
        }
        map.put("_list",list);
        return JSON.toJSONString(map);
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
