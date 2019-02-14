package com.linghang.serversocket.carlocation.enums;

import org.apache.commons.collections.map.HashedMap;

import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: FenceAlarmEnum
 * @Author: wuqi
 * @Date: 2019-01-11 14:32
 * @Description: 围栏报警枚举
 */
public enum FenceAlarmEnum {

    TYPE_TIME{
        @Override
        public int getBitNumber() {
            return 0;
        }

        @Override
        public Boolean getWhetherAvailable(int key) {
            return key == 1 ? true:false;
        }

        @Override
        public String getKeyMsg(int key) {
            return key == 0 ? "忽略时间" : "根据时间";
        }
    },
    TYPE_SPEED{
        @Override
        public int getBitNumber() {
            return 1;
        }

        @Override
        public Boolean getWhetherAvailable(int key) {
            return key == 1 ? true:false;
        }

        @Override
        public String getKeyMsg(int key) {
            return key == 0 ? "忽略限速" : "限速";
        }
    },
    TYPE_ENTER_TO_DRIVER{
        @Override
        public int getBitNumber() {
            return 2;
        }

        @Override
        public Boolean getWhetherAvailable(int key) {
            return key == 1 ? true:false;
        }

        @Override
        public String getKeyMsg(int key) {
            return key == 0 ? "忽略进区域报警给驾驶员" : "进区域报警给驾驶员";
        }
    },
    TYPE_ENTER_TO_PLATFORM{
        @Override
        public int getBitNumber() {
            return 3;
        }

        @Override
        public Boolean getWhetherAvailable(int key) {
            return key == 1 ? true:false;
        }

        @Override
        public String getKeyMsg(int key) {
            return key == 0 ? "忽略进区域报警给平台" : "进区域报警给平台";
        }

    },
    TYPE_LEAVE_TO_DRIVER{
        @Override
        public int getBitNumber() {
            return 4;
        }

        @Override
        public Boolean getWhetherAvailable(int key) {
            return key == 1 ? true:false;
        }

        @Override
        public String getKeyMsg(int key) {
            return key == 0 ? "忽略出区域报警给驾驶员" : "出区域报警给驾驶员";
        }
    },
    TYPE_LEAVE_TO_PLATFORM{
        @Override
        public int getBitNumber() {
            return 5;
        }

        @Override
        public Boolean getWhetherAvailable(int key) {
            return key == 1 ? true:false;
        }

        @Override
        public String getKeyMsg(int key) {
            return key == 0 ? "忽略出区域报警给平台" : "出区域报警给平台";
        }

    },
    TYPE_LATITUDE_TYPE{
        @Override
        public int getBitNumber() {
            return 6;
        }

        @Override
        public Boolean getWhetherAvailable(int key) {
            return false;
        }

        @Override
        public String getKeyMsg(int key) {
            return key == 0 ? "北纬" : "南纬";
        }
    },
    TYPE_LONGITUDE_TYPE{
        @Override
        public int getBitNumber() {
            return 7;
        }

        @Override
        public Boolean getWhetherAvailable(int key) {
            return false;
        }

        @Override
        public String getKeyMsg(int key) {
            return key == 0 ? "东经" : "西经";
        }

    };

    private static Map<Integer, FenceAlarmEnum> fenceAlarmMap;

    static{
        fenceAlarmMap = new HashedMap();
        FenceAlarmEnum[] enums = FenceAlarmEnum.values();
        for (int i = 0; i < enums.length; i++) {
            fenceAlarmMap.put(enums[i].getBitNumber(), enums[i]);
        }
    }

    public static Map<Integer, FenceAlarmEnum> getFenceAlarmMap() {
        return fenceAlarmMap;
    }

    public static boolean isVisiable(int index, int bitValue) {
        FenceAlarmEnum targetEnum = fenceAlarmMap.get(index);
        if (targetEnum == null) {
            return false;
        }
        return targetEnum.getWhetherAvailable(bitValue);
    }

    /**
     * 获取当前类型所在bit位
     * @return
     */
    public abstract int getBitNumber();

    /**
     * 判定是否进行异常监控
     * 0为不监控， 1为监控， null原样显示
     * @param key
     * @return
     */
    public abstract Boolean getWhetherAvailable(int key);

    /**
     * 获取关键字所代表的说明
     * @param key
     * @return
     */
    public abstract  String getKeyMsg(int key);
}
