package com.linghang.serversocket.carlocation.enums;

import java.util.HashMap;
import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: LocationAlarmEnum
 * @Author: wuqi
 * @Date: 2019-01-08 15:10
 * @Description: 定位报警信息
 */
public enum LocationAlarmEnum {
    BIT_0(0, 1, "紧急报警，触动报警开关后触发", "收到应答后清零"),
    BIT_1(1, 1, "超速报警", "标志维持至报警条件解除"),
    BIT_2(2, 1, "疲劳驾驶", "标志维持至报警条件解除"),
    BIT_3(3, 1, "预警", "收到应答后清零"),
    BIT_4(4, 1, "GNSS 模块发生故障", "标志维持至报警条件解除 "),
    BIT_5(5, 1, "GNSS 天线未接或被剪断", "标志维持至报警条件解除"),
    BIT_6(6, 1, "GNSS 天线短路", "标志维持至报警条件解除"),
    BIT_7(7, 1, "终端主电源欠压", "标志维持至报警条件解除"),
    BIT_8(8, 1, "终端主电源掉电", "标志维持至报警条件解除"),
    BIT_9(9, 1, "终端 LCD 或显示器故障", "标志维持至报警条件解除"),
    BIT_10(10, 1, "TTS 模块故障 ", "标志维持至报警条件解除"),
    BIT_11(11, 1, "摄像头故障", "标志维持至报警条件解除"),
    BIT_12(12, 1, "保留", ""),
    BIT_13(13, 1, "保留", ""),
    BIT_14(14, 1, "保留", ""),
    BIT_15(15, 1, "保留", ""),
    BIT_16(16, 1, "保留", ""),
    BIT_17(17, 1, "保留", ""),
    BIT_18(18, 1, "当天累计驾驶超时", "标志维持至报警条件解除"),
    BIT_19(19, 1, "超时停车", "标志维持至报警条件解除"),
    BIT_20(20, 1, "进出区域", "收到应答后清零 "),
    BIT_21(21, 1, "进出路线", "收到应答后清零 "),
    BIT_22(22, 1, "路段行驶时间不足/过长", "收到应答后清零 "),
    BIT_23(23, 1, "路线偏离报警", "标志维持至报警条件解除 "),
    BIT_24(24, 1, "车辆 VSS 故障", "标志维持至报警条件解除 "),
    BIT_25(25, 1, "车辆油量异常", "标志维持至报警条件解除 "),
    BIT_26(26, 1, "车辆被盗(通过车辆防盗器)", "标志维持至报警条件解除 "),
    BIT_27(27, 1, "车辆非法点火", "收到应答后清零 "),
    BIT_28(28, 1, "车辆非法位移", "收到应答后清零 "),
    BIT_29(29, 1, "碰撞侧翻报警", "标志维持至报警条件解除"),
    BIT_30(30, 1, "保留", ""),
    BIT_31(31, 1, "保留", "");

    private Integer value;
    private Integer alarmValue;
    private String alarmMsg;
    private String cancelAlarmMsg;

    private static Map<Integer, Integer> allAlarmMap;

    static {
        LocationAlarmEnum[] locationAlarmEnums = LocationAlarmEnum.values();
        allAlarmMap = new HashMap<>();
        for (int i = 0; i < locationAlarmEnums.length; i++) {
            allAlarmMap.put(locationAlarmEnums[i].getValue(), locationAlarmEnums[i].getAlarmValue());
        }
    }

    public static String getAlarmMsg(Integer value) {
        LocationAlarmEnum[] locationAlarmEnums = LocationAlarmEnum.values();
        int n = locationAlarmEnums.length;
        for (int i = 0; i < n; i++) {
            if (value.equals(locationAlarmEnums[i].getValue())) {
                return locationAlarmEnums[i].getAlarmMsg();
            }
        }
        return "";
    }

    public static void putParamsIntoAlarmMsgMap(Map<Integer, Integer> map, Integer key, Integer value) {
        if (key == null || value == null) {
            return;
        }
        if (allAlarmMap.get(key) != null && allAlarmMap.get(key).equals(value)) {
            map.put(key, value);
        }
    }

    LocationAlarmEnum(Integer value, Integer alarmValue, String alarmMsg, String cancelAlarmMsg) {
        this.value = value;
        this.alarmValue = alarmValue;
        this.alarmMsg = alarmMsg;
        this.cancelAlarmMsg = cancelAlarmMsg;
    }


    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public Integer getAlarmValue() {
        return alarmValue;
    }

    public void setAlarmValue(Integer alarmValue) {
        this.alarmValue = alarmValue;
    }

    public String getAlarmMsg() {
        return alarmMsg;
    }

    public void setAlarmMsg(String alarmMsg) {
        this.alarmMsg = alarmMsg;
    }

    public String getCancelAlarmMsg() {
        return cancelAlarmMsg;
    }

    public void setCancelAlarmMsg(String cancelAlarmMsg) {
        this.cancelAlarmMsg = cancelAlarmMsg;
    }

    public static Map<Integer, Integer> getAllAlarmMap() {
        return allAlarmMap;
    }
}
