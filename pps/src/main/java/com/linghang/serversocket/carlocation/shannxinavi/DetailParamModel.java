package com.linghang.serversocket.carlocation.shannxinavi;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: DetailParamModel
 * @Author: wuqi
 * @Date: 2019-01-16 14:37
 * @Description: 终端参数明细
 */
public class DetailParamModel {
    private Integer paramId;
    private Byte paramLen;
    private byte[] paramValue;

    public Integer getParamId() {
        return paramId;
    }

    public void setParamId(Integer paramId) {
        this.paramId = paramId;
    }

    public Byte getParamLen() {
        return paramLen;
    }

    public void setParamLen(Byte paramLen) {
        this.paramLen = paramLen;
    }

    public byte[] getParamValue() {
        return paramValue;
    }

    public void setParamValue(byte[] paramValue) {
        this.paramValue = paramValue;
    }
}
