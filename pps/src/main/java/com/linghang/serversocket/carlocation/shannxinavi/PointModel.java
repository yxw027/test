package com.linghang.serversocket.carlocation.shannxinavi;

import com.linghang.serversocket.carlocation.util.ByteUtil;

import java.math.BigDecimal;

import static java.lang.Math.pow;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: PointModel
 * @Author: wuqi
 * @Date: 2019-01-11 13:12
 * @Description: 电子围栏定点坐标model
 */
public class PointModel {

    /**
     * 纬度
     */
    private BigDecimal latitude;
    /**
     * 经度
     */
    private BigDecimal longitude;


    public BigDecimal getLatitude() {
        return latitude;
    }

    public void setLatitude(BigDecimal latitude) {
        this.latitude = latitude;
    }

    public BigDecimal getLongitude() {
        return longitude;
    }

    public void setLongitude(BigDecimal longitude) {
        this.longitude = longitude;
    }


    public byte[] translateModelToByteArray(){
        int tmpLatitude = new BigDecimal(pow(10, 6)).multiply(this.latitude).intValue();
        int tmpLongitude = new BigDecimal(pow(10, 6)).multiply(this.longitude).intValue();
        byte[] latitudeBytes = ByteUtil.toBytes(tmpLatitude, 4);
        byte[] longitudeBytes = ByteUtil.toBytes(tmpLongitude, 4);
        byte[] totalBytes = new byte[latitudeBytes.length + longitudeBytes.length];
        System.arraycopy(latitudeBytes, 0, totalBytes, 0, latitudeBytes.length);
        System.arraycopy(longitudeBytes, 0, totalBytes, latitudeBytes.length, longitudeBytes.length);
        return totalBytes;
    }
}
