package com.linghang.serversocket.carlocation.util;

import java.util.List;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: ByteUtil
 * @Author: wuqi
 * @Date: 2019-01-09 11:01
 * @Description: 字节操作工具类
 */
public class ByteUtil {

    public static byte createXORCodeByBytes(byte[] bytes) {
        int tmpByte = bytes[0];
        for (int i = 1; i < bytes.length; i++) {
            tmpByte = tmpByte ^ bytes[i];
        }
        return (byte) tmpByte;
    }

    public static byte createXORCodeByBytes(List<Byte> list) {
        int tmpByte = list.get(0);
        for (int i = 1; i < list.size(); i++) {
            tmpByte = tmpByte ^ list.get(i);
        }
        return (byte) tmpByte;
    }

    public static byte[] short2byte(short s) {
        byte[] b = new byte[2];
        for (int i = 0; i < 2; i++) {
            //因为byte占4个字节，所以要计算偏移量
            int offset = 16 - (i + 1) * 8;
            //把16位分为2个8位进行分别存储
            b[i] = (byte) ((s >> offset) & 0xff);
        }
        return b;
    }

    /**
     * 正数表现正常，负数方面未测试
     * @param value
     * @param len
     * @return
     */
    public static byte[] toBytes(long value, int len) {
        byte[] valueBytes = new byte[len];
        for (int i = 0;i < len;i++) {
            valueBytes[i] = (byte) (value >>> 8 * (len - i - 1));
        }
        return valueBytes;
    }



}
