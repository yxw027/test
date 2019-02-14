package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * @author liuhao on 16/4/11.
 * 新闻状态
 */
public enum NewsStatus {

    /**
     * 编辑
     */
    EDITING {
        @Override
        public String getString() {
            return "编辑";
        }

        @Override
        public Integer getInteger() {
            return 1;
        }
    },

    /**
     * 发布
     */
    FINISH {
        @Override
        public String getString() {
            return "发布";
        }

        @Override
        public Integer getInteger() {
            return 2;
        }
    },

    /**
     * 废弃
     */
    DISABLE {
        @Override
        public String getString() {
            return "废弃";
        }

        @Override
        public Integer getInteger() {
            return 0;
        }
    };


    public static JSONArray getJson() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (NewsStatus status : NewsStatus.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", status.getString());
            jsonObject.put("value", status.getInteger());
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    public static Map<String, Integer> getMap() {
        HashMap<String, Integer> map = new HashMap<>();
        for (NewsStatus status : NewsStatus.values()) {
            map.put(status.getString(), status.getInteger());
        }
        return map;
    }

    public abstract String getString();

    public abstract Integer getInteger();
}
