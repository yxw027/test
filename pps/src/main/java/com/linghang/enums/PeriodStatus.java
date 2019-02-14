package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * 工期状态
 *
 * @author liuhao on 2015/11/20.
 */
public enum PeriodStatus {
    /**
     * 无流程数据
     */
    NONE {
        @Override
        public String getString() {
            return "无流程数据";
        }

        @Override
        public Integer getInteger() {
            return -1;
        }
    },

    /**
     * 待审核
     */
    CHECK {
        @Override
        public String getString() {
            return "待审核";
        }

        @Override
        public Integer getInteger() {
            return 0;
        }
    },

    /**
     * 待处理
     */
    EXECUTE {
        @Override
        public String getString() {
            return "待处理";
        }

        @Override
        public Integer getInteger() {
            return 1;
        }
    },

    /**
     * 待审批
     */
    APPROVED {
        @Override
        public String getString() {
            return "待审批";
        }

        @Override
        public Integer getInteger() {
            return 2;
        }
    },

    /**
     * 已批复
     */
    CONFIRM {
        @Override
        public String getString() {
            return "待批复";
        }

        @Override
        public Integer getInteger() {
            return 3;
        }
    },

    /**
     * 已批复
     */
    CONFIRMED {
        @Override
        public String getString() {
            return "已批复";
        }

        @Override
        public Integer getInteger() {
            return 4;
        }
    };

    public static JSONArray getJson() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (PeriodStatus status : PeriodStatus.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", status.getString());
            jsonObject.put("value", status.getInteger());
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    public static Map<String, Integer> getMap() {
        HashMap<String, Integer> map = new HashMap<>();
        for (PeriodStatus status : PeriodStatus.values()) {
            map.put(status.getString(), status.getInteger());
        }
        return map;
    }

    public abstract String getString();

    public abstract Integer getInteger();
}
