package com.linghang.enums.asphalt;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 沥青预警类型
 *
 * @author wuchen
 */
public enum AsphaltWarningType {

    /**
     * 沥青预警类型
     */
    ALL_WARNING("全部", 0),
    TEMP_WARNING("一级", 1),
    GRADINGWARNING("二级", 2),
    OILSTONE_WARNING("三级", 3);


    private String name;
    private Integer value;

    AsphaltWarningType(String name, int value) {
        this.name = name;
        this.value = value;
    }

    public static JSONArray getJson() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (AsphaltWarningType approvalType : AsphaltWarningType.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("name", approvalType.getName());
            jsonObject.put("value", approvalType.getValue());
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    /**
     * 类型是否存在
     *
     * @param value
     * @return
     */
    public static boolean isIn(Integer value) {
        boolean b = false;
        for (AsphaltWarningType approvalType : AsphaltWarningType.values()) {
            if (approvalType.getValue().equals(value)) {
                b = true;
            }
        }
        return b;
    }

}
