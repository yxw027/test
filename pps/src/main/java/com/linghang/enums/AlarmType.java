package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * 预警类型
 */
public enum AlarmType {

    /**
     * 沥青拌合站
     */
    ASPHALT {
        @Override
        public String getString() {
            return "asphalt";
        }

        @Override
        public Integer getInteger() {
            return 1;
        }
    },

    /**
     * 水稳拌合站
     */
    WATER {
        @Override
        public String getString() {
            return "water";
        }

        @Override
        public Integer getInteger() {
            return 2;
        }
    };


    public static JSONArray getJson() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (AlarmType newsType : AlarmType.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", newsType.getString());
            jsonObject.put("value", newsType.getInteger());
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    public static Map<String, Integer> getMap() {
        HashMap<String, Integer> map = new HashMap<>();
        for (AlarmType newsType : AlarmType.values()) {
            map.put(newsType.getString(), newsType.getInteger());
        }
        return map;
    }

    public abstract String getString();

    public abstract Integer getInteger();
}
