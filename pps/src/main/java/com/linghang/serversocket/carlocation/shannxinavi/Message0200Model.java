package com.linghang.serversocket.carlocation.shannxinavi;

import com.linghang.serversocket.carlocation.enums.LocationAlarmEnum;
import com.linghang.serversocket.carlocation.enums.LocationStatusEnum;
import com.linghang.serversocket.carlocation.util.HexStringUtils;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: Message0200Model
 * @Author: wuqi
 * @Date: 2019-01-08 14:51
 * @Description: 实时位置信息
 */
public class Message0200Model {

    /**
     * 报警信息map
     */
    private Map<Integer, Integer> alarmMsgs;
    /**
     * 状态信息map
     */
    private Map<Integer, Integer> statusMsgs;
    /**
     * 纬度
     */
    private BigDecimal latitude;
    /**
     * 经度
     */
    private BigDecimal longitude;
    /**
     * 高程
     */
    private BigDecimal altitude;
    /**
     * 速度
     */
    private BigDecimal speed;
    /**
     * 方向
     */
    private String forward;
    /**
     * 时间
     */
    private String time;

    public static Object createModelByBytes(byte[] bytes) {
        Message0200Model model = new Message0200Model();
        model.setAlarmMsgs(bytes);
        model.setStatusMsgs(bytes);
        model.setLatitude(bytes);
        model.setLongitude(bytes);
        model.setAltitude(bytes);
        model.setSpeed(bytes);
        model.setForward(bytes);
        model.setTime(bytes);
        return model;
    }

    public Map<Integer, Integer> getAlarmMsgs() {
        return alarmMsgs;
    }

    //解析报警信息
    private void setAlarmMsgs(byte[] bytes) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 0, 4);
        String bitStr = HexStringUtils.byteArrayToBinary(tmpBytes);
        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < bitStr.length(); i++) {
            list.add(Integer.valueOf(bitStr.charAt(i) + ""));
        }
        Collections.reverse(list);
        Map<Integer, Integer> map = new HashMap();
        for (int i = 0; i < list.size(); i++) {
            LocationAlarmEnum.putParamsIntoAlarmMsgMap(map, i, list.get(i));
        }
        this.setAlarmMsgs(map);
    }

    public void setAlarmMsgs(Map<Integer, Integer> alarmMsgs) {
        this.alarmMsgs = alarmMsgs;
    }

    public Map<Integer, Integer> getStatusMsgs() {
        return statusMsgs;
    }

    //解析状态信息
    private void setStatusMsgs(byte[] bytes) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 4, 8);
        String bitStr = HexStringUtils.byteArrayToBinary(tmpBytes);
        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < bitStr.length(); i++) {
            list.add(Integer.valueOf(bitStr.charAt(i) + ""));
        }
        Collections.reverse(list);
        Map<Integer, Integer> map = new HashMap();
        for (int i = 0; i < list.size(); i++) {
            LocationStatusEnum.putParamsIntoStatusMsgMap(map, i, list.get(i));
        }
        this.setStatusMsgs(map);
    }

    public void setStatusMsgs(Map<Integer, Integer> statusMsgs) {
        this.statusMsgs = statusMsgs;
    }

    public BigDecimal getLongitude() {
        return longitude;
    }

    //解析经度信息
    private void setLongitude(byte[] bytes) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 12, 16);
        this.longitude = new BigDecimal(HexStringUtils.binary(tmpBytes, 10)).divide(new BigDecimal(1000000));
    }

    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }

    public BigDecimal getLatitude() {
        return latitude;
    }

    //解析纬度信息
    private void setLatitude(byte[] bytes) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 8, 12);
        this.latitude = new BigDecimal(HexStringUtils.binary(tmpBytes, 10)).divide(new BigDecimal(1000000));
    }

    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
    }

    public BigDecimal getAltitude() {
        return altitude;
    }

    private void setAltitude(byte[] bytes) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 16, 18);
        this.altitude = new BigDecimal(HexStringUtils.binary(tmpBytes, 10));
    }

    public void setAltitude(BigDecimal altitude) {
        this.altitude = altitude;
    }

    public BigDecimal getSpeed() {
        return speed;
    }

    private void setSpeed(byte[] bytes) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 18, 20);
        this.speed = new BigDecimal(HexStringUtils.binary(tmpBytes, 10)).divide(new BigDecimal(10));
    }

    public void setSpeed(BigDecimal speed) {
        this.speed = speed;
    }

    public String getForward() {
        return forward;
    }

    private void setForward(byte[] bytes) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 20, 22);
        this.forward = HexStringUtils.binary(tmpBytes, 10);
    }

    public void setForward(String forward) {
        this.forward = forward;
    }

    public String getTime() {
        return time;
    }

    private void setTime(byte[] bytes) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 22, 28);
        String hexTime = HexStringUtils.toHexString(tmpBytes);
        String year = new SimpleDateFormat("yyyy").format(new Date()).substring(0, new SimpleDateFormat("yyyy").format(new Date()).length() - 2) + hexTime.substring(0, 2);
        String month = hexTime.substring(2, 4);
        String day = hexTime.substring(4, 6);
        String hour = hexTime.substring(6, 8);
        String minute = hexTime.substring(8, 10);
        String second = hexTime.substring(10, 12);
        this.time = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
    }

    public void setTime(String time) {
        this.time = time;
    }


}
