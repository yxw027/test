package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * @author liuhao on 16/4/11.
 * 状态
 */
public enum BudgetStatus {
    /**
     * 收尾
     */
    FINISH {
        @Override
        public String getString() {
            return "收尾";
        }

        @Override
        public Integer getInteger() {
            return 2;
        }
    },

    /**
     * 报废
     */
    DISABLE {
        @Override
        public String getString() {
            return "报废";
        }

        @Override
        public Integer getInteger() {
            return 0;
        }
    };


    public static JSONArray getJson() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (BudgetStatus status : BudgetStatus.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", status.getString());
            jsonObject.put("value", status.getInteger());
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    public static Map<String, Integer> getMap() {
        HashMap<String, Integer> map = new HashMap<>();
        for (BudgetStatus status : BudgetStatus.values()) {
            map.put(status.getString(), status.getInteger());
        }
        return map;
    }

    public abstract String getString();

    public abstract Integer getInteger();
}
