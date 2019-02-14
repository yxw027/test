package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * @author liuhao on 16/4/11.
 * 新闻状态
 */
public enum NewsType {

    /**
     * 新闻
     */
    NEWS {
        @Override
        public String getString() {
            return "新闻";
        }

        @Override
        public Integer getInteger() {
            return 1;
        }
    },

    /**
     * 技术交底
     */
    TECHNOLOGY {
        @Override
        public String getString() {
            return "技术交底";
        }

        @Override
        public Integer getInteger() {
            return 2;
        }
    };


    public static JSONArray getJson() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (NewsType newsType : NewsType.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", newsType.getString());
            jsonObject.put("value", newsType.getInteger());
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    public static Map<String, Integer> getMap() {
        HashMap<String, Integer> map = new HashMap<>();
        for (NewsType newsType : NewsType.values()) {
            map.put(newsType.getString(), newsType.getInteger());
        }
        return map;
    }

    public abstract String getString();

    public abstract Integer getInteger();
}
