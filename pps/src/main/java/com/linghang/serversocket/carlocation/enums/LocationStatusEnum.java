package com.linghang.serversocket.carlocation.enums;

import org.apache.commons.collections.map.HashedMap;

import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: LocationStatusEnum
 * @Author: wuqi
 * @Date: 2019-01-08 15:40
 * @Description: 定位状态报警
 */
public enum LocationStatusEnum {
    bit_0 {
        @Override
        public Integer getValue() {
            return 0;
        }

        @Override
        public String getMsgByFlagValue(Integer key) {
            return key == 0 ? "ACC关" : "ACC 开";
        }
    },
    bit_1 {
        @Override
        public Integer getValue() {
            return 1;
        }

        @Override
        public String getMsgByFlagValue(Integer key) {
            return key == 0 ? "未定位" : "定位";
        }
    },
    bit_2 {
        @Override
        public Integer getValue() {
            return 2;
        }

        @Override
        public String getMsgByFlagValue(Integer key) {
            return key == 0 ? "北纬" : "南纬";
        }
    },
    bit_3 {
        @Override
        public Integer getValue() {
            return 3;
        }

        @Override
        public String getMsgByFlagValue(Integer key) {
            return key == 0 ? "东经" : "西经";
        }
    },
    bit_4 {
        @Override
        public Integer getValue() {
            return 4;
        }

        @Override
        public String getMsgByFlagValue(Integer key) {
            return key == 0 ? "运营状态" : "停运状态";
        }
    },
    bit_5 {
        @Override
        public Integer getValue() {
            return 5;
        }

        @Override
        public String getMsgByFlagValue(Integer key) {
            return key == 0 ? "经纬度未经保密插件加密" : "经纬度已经保密插件加密";
        }
    },
    bit_10 {
        @Override
        public Integer getValue() {
            return 10;
        }

        @Override
        public String getMsgByFlagValue(Integer key) {
            return key == 0 ? "车辆油路正常" : "车辆油路断开";
        }
    },
    bit_11 {
        @Override
        public Integer getValue() {
            return 11;
        }

        @Override
        public String getMsgByFlagValue(Integer key) {
            return key == 0 ? "车辆电路正常" : "车辆电路断开";
        }
    },
    bit_12 {
        @Override
        public Integer getValue() {
            return 12;
        }

        @Override
        public String getMsgByFlagValue(Integer key) {
            return key == 0 ? "车门解锁" : "车门加锁";
        }
    };

    private static Map<Integer, Integer> allBitSizeNo;

    static {
        LocationStatusEnum[] enums = LocationStatusEnum.values();
        allBitSizeNo = new HashedMap();
        for (int i = 0; i < enums.length; i++) {
            allBitSizeNo.put(enums[i].getValue(), enums[i].getValue());
        }
    }

    public static void putParamsIntoStatusMsgMap(Map<Integer, Integer> map, Integer key, Integer value) {
        if (key == null || value == null) {
            return;
        }
        if (allBitSizeNo.get(key) != null) {
            map.put(key, value);
        }
    }

    public static String getMessage(Integer value, Integer key) {
        LocationStatusEnum[] enums = LocationStatusEnum.values();
        int n = enums.length;
        for (int i = 0; i < n; i++) {
            if (value.equals(enums[i].getValue())) {
                return enums[i].getMsgByFlagValue(key);
            }
        }
        return "";
    }

    public abstract Integer getValue();

    public abstract String getMsgByFlagValue(Integer key);

    public static Map<Integer, Integer> getAllBitSizeNo() {
        return allBitSizeNo;
    }
}
