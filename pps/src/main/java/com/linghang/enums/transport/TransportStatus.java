package com.linghang.enums.transport;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * 运输过程状态
 *
 * @author wuchen
 * @date 2018/4/19
 */
public enum TransportStatus {
    /**
     * 接料中
     */
    RECEIVING {
        @Override
        public String getString() {
            return "接料中";
        }

        @Override
        public Integer getInteger() {
            return 1;
        }
    },

    /**
     * 运输中
     */
    RUNNING {
        @Override
        public String getString() {
            return "运输中";
        }

        @Override
        public Integer getInteger() {
            return 2;
        }
    },
    /**
     * 下料中
     */
    CUTTING {
        @Override
        public String getString() {
            return "下料中";
        }

        @Override
        public Integer getInteger() {
            return 3;
        }
    },
    /**
     * 结束
     */
    END {
        @Override
        public String getString() {
            return "结束";
        }

        @Override
        public Integer getInteger() {
            return 4;
        }
    },
    ERROR {
        @Override
        public String getString() {
            return "异常数据";
        }

        @Override
        public Integer getInteger() {
            return 5;
        }
    };


    public static JSONArray getJson() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (TransportStatus status : TransportStatus.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", status.getString());
            jsonObject.put("value", status.getInteger());
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    public static Map<String, Integer> getMap() {
        HashMap<String, Integer> map = new HashMap<>();
        for (TransportStatus status : TransportStatus.values()) {
            map.put(status.getString(), status.getInteger());
        }
        return map;
    }

    public static TransportStatus getTypeEnum(Integer value) {
        for (TransportStatus machineType : TransportStatus.values()) {
            if (value.equals(machineType.getInteger())) {
                return machineType;
            }
        }
        return null;
    }

    public abstract String getString();

    public abstract Integer getInteger();
}
