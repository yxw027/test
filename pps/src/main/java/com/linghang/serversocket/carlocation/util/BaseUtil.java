package com.linghang.serversocket.carlocation.util;

import com.linghang.serversocket.carlocation.server.ConnectCoachServer;
import org.apache.mina.core.session.IoSession;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: BaseUtil
 * @Author: wuqi
 * @Date: 2019-01-16 14:54
 * @Description:
 */
public class BaseUtil {

    public static final int areaId = 1;

    public static String leftPushZeroToPhone12N0(String phoneNo) {
        while (phoneNo.length() < 12) {
            phoneNo = "0" + phoneNo;
        }
        return phoneNo;
    }

    /**
     * 下发电子围栏
     *
     * @param bytes
     * @param phoneNo
     */
    public static void downLoadMessage(byte[] bytes, String phoneNo) {
        IoSession session = ConnectCoachServer.getNettyClientServerMap().get(phoneNo);
        session.write(bytes);
    }
}
