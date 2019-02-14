package com.linghang.serversocket.carlocation.enums;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: MachineParamEnum
 * @Author: wuqi
 * @Date: 2019-01-16 13:43
 * @Description: 终端参数设置
 */
public enum MachineParamEnum {
    TYPE_HEART_TIME(0x0001, 4),
    TYPE_TCP_OVERTIME(0x0002, 4),
    TYPE_TCP_RETRY_TIMES(0x0003, 4),
    TYPE_UDP_OVERTIME(0x0004, 4),
    TYPE_UDP_RETRY_TIMES(0x0005, 4),
    TYPE_SMS_OVERTIME(0x0006, 4),
    TYPE_SMS_RETRY_TIMES(0x0007, 4),
    TYPE_APN_OR_PPP(0x0010, -1),
    TYPE_SERVER_WIFI_USERNAME(0x0011, -1),
    TYPE_SERVER_WIFI_PASSWORD(0x0012, -1),
    TYPE_SERVER_IP(0x0013, -1),
    TYPE_BACKUP_APN(0x0014, -1),
    TYPE_INFLEXION_COMPLETION_ANGLE(0x0030, 4);


    private int paramId;
    private int byteSize;

    MachineParamEnum(int paramId, int byteSize) {
        this.paramId = paramId;
        this.byteSize = byteSize;
    }

    public int getParamId() {
        return paramId;
    }

    public void setParamId(int paramId) {
        this.paramId = paramId;
    }

    public int getByteSize() {
        return byteSize;
    }

    public void setByteSize(int byteSize) {
        this.byteSize = byteSize;
    }
}
