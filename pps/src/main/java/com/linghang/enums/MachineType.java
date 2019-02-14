package com.linghang.enums;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * 拌合站类型枚举
 *
 * @author wuchen
 * @date 2018/4/19
 */
public enum MachineType {
    /**
     * 水稳拌合站
     */

    SW {
        @Override
        public String getString() {
            return "水稳拌合站";
        }

        @Override
        public Integer getInteger() {
            return 1;
        }
    },

    /**
     * 混凝土拌合站
     */
    HNT {
        @Override
        public String getString() {
            return "混凝土拌合站";
        }

        @Override
        public Integer getInteger() {
            return 2;
        }
    },
    /**
     * 沥青拌合站
     */
    LQ {
        @Override
        public String getString() {
            return "沥青拌合站";
        }

        @Override
        public Integer getInteger() {
            return 3;
        }
    };


    public static JSONArray getJson() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (MachineType status : MachineType.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("text", status.getString());
            jsonObject.put("value", status.getInteger());
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    public static Map<String, Integer> getMap() {
        HashMap<String, Integer> map = new HashMap<>();
        for (MachineType status : MachineType.values()) {
            map.put(status.getString(), status.getInteger());
        }
        return map;
    }

    public static MachineType getTypeEnum(Integer value) {
        for (MachineType machineType : MachineType.values()) {
            if (value.equals(machineType.getInteger())) {
                return machineType;
            }
        }
        return null;
    }

    public abstract String getString();

    public abstract Integer getInteger();
}
