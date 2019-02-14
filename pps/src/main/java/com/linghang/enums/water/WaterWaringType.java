package com.linghang.enums.water;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 水稳超标预警
 *
 * @author xuqiang
 */
public enum WaterWaringType {
    /**
     * 全部
     */
    ALL_WARNING("全部", 0),
    //    WATER("水",1),
//    CEMENT("水泥",2),
//    AGGREGATERESULT("骨料",3),
//    SIEVERESULT("级配",4);
    FIRST_LEVEL("一级", 1),
    SECOND_ARY("二级", 2),
    THIRD_LEVEL("三级", 3);

    private String name;
    private Integer value;

    WaterWaringType(String name, int value) {
        this.name = name;
        this.value = value;
    }

    public static JSONArray getJson() {
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject;
        for (WaterWaringType waterWaringType : WaterWaringType.values()) {
            jsonObject = new JSONObject();
            jsonObject.put("name", waterWaringType.getName());
            jsonObject.put("value", waterWaringType.getValue());
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
}
