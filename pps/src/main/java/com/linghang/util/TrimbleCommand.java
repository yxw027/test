package com.linghang.util;

import org.apache.mina.core.buffer.IoBuffer;

import java.nio.charset.StandardCharsets;

/**
 * @author liuhao
 * 天宝命令工具类
 */
public class TrimbleCommand {

    /**
     * 通道中info属性的key
     */
    public static final String ATTR_INFOMODEL = "infoModel";
    /**
     * 获取主板信息
     */
    public static final byte[] CMD_RECEIVER_INFO = new byte[]{0x2, 0x0, 0x6, 0x0, 0x6, 0x3};
//    public static final byte[] receiverInfoCmd2 = byte[] receiverInfoCmd = new byte[]{0x2, 0x0, 0x4A, 0x1, 0x1, 0x4C, 0x3};


    /**
     * 获取天宝板卡序列号
     */
    public static String getSerialNumber(Object message) {
        if (!(message instanceof IoBuffer)) {
            return null;
        }
        IoBuffer ioBuffer = (IoBuffer) message;
        byte[] bytes = new byte[ioBuffer.limit()];
        ioBuffer.get(bytes);
        if (bytes[0] != 0x2 || bytes[2] != 0x7 || bytes.length < 4) {
            return null;
        }
        String s = new String(bytes, StandardCharsets.US_ASCII);
        return s.substring(49, 59).trim();
    }

    public static String getSerialNumber(byte[] bytes) {
        if (bytes[0] != 0x2 || bytes[2] != 0x7 || bytes.length < 4) {
            return null;
        }
        String s = new String(bytes, StandardCharsets.US_ASCII);
        return s.substring(49, 59).trim();
    }

    /**
     * 调试端口退出命令
     *
     * @param message
     * @return
     */
    public static boolean isExitCommand(Object message) {
        if (!(message instanceof IoBuffer)) {
            return false;
        }
        IoBuffer ioBuffer = (IoBuffer) message;
        if (ioBuffer.limit() != 1) {
            return false;
        }
        byte[] bytes = new byte[ioBuffer.limit()];
        ioBuffer.get(bytes);
        return bytes[0] == 3;

    }

    public static boolean isExitCommand(byte[] message) {
        return message.length == 1 && message[0] == 3;
    }


}
