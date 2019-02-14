package com.linghang.serversocket.carlocation.shannxinavi;

import com.linghang.serversocket.carlocation.util.HexStringUtils;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: Message0100Model
 * @Author: wuqi
 * @Date: 2019-01-07 10:08
 * @Description: 消息0100消息体
 */
public class Message0100Model {
    /**
     * 省区域code
     */
    private String province;
    /**
     * 市区域code
     */
    private String city;
    /**
     * 制造商
     */
    private String manufacture;
    /**
     * 终端型号
     */
    private String clientTypeNo;
    /**
     * 终端编号
     */
    private String clientId;
    /**
     * 车牌颜色
     */
    private String licenceColor;
    /**
     * 车牌号
     */
    private String licenceNo;

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getManufacture() {
        return manufacture;
    }

    public void setManufacture(String manufacture) {
        this.manufacture = manufacture;
    }

    public String getClientTypeNo() {
        return clientTypeNo;
    }

    public void setClientTypeNo(String clientTypeNo) {
        this.clientTypeNo = clientTypeNo;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getLicenceColor() {
        return licenceColor;
    }

    public void setLicenceColor(String licenceColor) {
        this.licenceColor = licenceColor;
    }

    public String getLicenceNo() {
        return licenceNo;
    }

    public void setLicenceNo(String licenceNo) {
        this.licenceNo = licenceNo;
    }


    private static String parseCarNo(String str) throws UnsupportedEncodingException {
        byte[] bytes = HexStringUtils.parseHexStr2Byte(str);
        return new String(bytes, "gbk");
    }

    public static Object createModelByBytes(byte[] bytes) {
        byte[] tmpBytes = new byte[1];
        tmpBytes[0] = bytes[bytes.length - 1];
        if (tmpBytes[0] == 0) {
            bytes = Arrays.copyOfRange(bytes, 0, bytes.length - 1);
        }
        Message0100Model model = new Message0100Model();
        int startIndex = 0;
        startIndex = model.setProvince(bytes, startIndex);
        startIndex = model.setCity(bytes, startIndex);
        startIndex = model.setManufacture(bytes, startIndex);
        startIndex = model.setClientTypeNo(bytes, startIndex);
        startIndex = model.setClientId(bytes, startIndex);
        startIndex = model.setLicenceColor(bytes, startIndex);
        try {
            model.setLicenceNo(bytes, startIndex);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return model;
    }

    private void setLicenceNo(byte[] bytes, int startIndex) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, startIndex, bytes.length);
        try {
            this.licenceNo = new String(tmpBytes, "gbk");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    private int setLicenceColor(byte[] bytes, int startIndex) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, startIndex, startIndex + 1);
        this.licenceColor = HexStringUtils.binary(tmpBytes, 10);
        return startIndex + tmpBytes.length;
    }

    private int setClientId(byte[] bytes, int startIndex) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, startIndex, startIndex + 7);
        this.clientId = new String(tmpBytes);
        return startIndex + tmpBytes.length;
    }

    private int setClientTypeNo(byte[] bytes, int startIndex) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, startIndex, startIndex + 20);
        this.clientTypeNo = new String(tmpBytes).replaceAll("(\0)+$", "");
        return startIndex + tmpBytes.length;
    }

    private int setManufacture(byte[] bytes, int startIndex) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, startIndex, startIndex + 5);
        this.manufacture = new String(tmpBytes);
        return startIndex + tmpBytes.length;
    }

    private int setCity(byte[] bytes, int startIndex) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, startIndex, startIndex + 2);
        this.city = HexStringUtils.binary(tmpBytes, 10);
        return startIndex + tmpBytes.length;
    }

    private int setProvince(byte[] bytes, int startIndex) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, startIndex, startIndex + 2);
        this.province = HexStringUtils.binary(tmpBytes, 10);
        return startIndex + tmpBytes.length;
    }
}
