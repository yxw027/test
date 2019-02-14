package com.linghang.serversocket.carlocation.shannxinavi;


import com.linghang.serversocket.carlocation.enums.DataEncryptionEnums;
import com.linghang.serversocket.carlocation.util.HexStringUtils;

import java.util.Arrays;
import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: MessageParamBodyModel
 * @Author: wuqi
 * @Date: 2019-01-07 10:51
 * @Description: 消息体参数model
 */
public class MessageParamBodyModel {

    private String messageStr;
    private Integer messageLen;
    private Integer dataEncryptionType;
    private Integer dividePackageFLag;

    public String getMessageStr() {
        return messageStr;
    }

    public void setMessageStr(String messageStr) {
        this.messageStr = messageStr;
    }

    public Integer getMessageLen() {
        return messageLen;
    }

    public void setMessageLen(Integer messageLen) {
        this.messageLen = messageLen;
    }

    public Integer getDataEncryptionType() {
        return dataEncryptionType;
    }

    public void setDataEncryptionType(Integer dataEncryptionType) {
        this.dataEncryptionType = dataEncryptionType;
    }

    public Integer getDividePackageFLag() {
        return dividePackageFLag;
    }

    public void setDividePackageFLag(Integer dividePackageFLag) {
        this.dividePackageFLag = dividePackageFLag;
    }


    public static MessageParamBodyModel createMessageParamBodyModelByBytes(byte[] bytes, Map<String, byte[]> map) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 2, 4);
        map.put("messageParam", tmpBytes);
        MessageParamBodyModel model = new MessageParamBodyModel();
        model.setMessageStr(HexStringUtils.toHexStringByNumber(tmpBytes));
        String str2Byte = HexStringUtils.binary(tmpBytes, 2);
        String initSixteenZero = "0000000000000000";
        str2Byte = initSixteenZero.substring(0, initSixteenZero.length() - str2Byte.length()) + str2Byte;
        /**
         * 15-14保留
         * 13分包
         * 12-10数据加密
         * 9-0消息体长度
         */
        String saveStr = str2Byte.substring(0, 2);
        Integer dividePackage = Integer.parseInt(str2Byte.substring(2, 3));
        String codeSec = str2Byte.substring(3, 6);
        String messageLenStr = str2Byte.substring(6);
        model.setDividePackageFLag(dividePackage);
        if ("000".equals(codeSec)) {
            model.setDataEncryptionType(null);
        } else if (codeSec.endsWith("1")) {
            model.setDataEncryptionType(DataEncryptionEnums.TYPE_RSA.getVal());
        }
        model.setMessageLen(Integer.valueOf(messageLenStr, 2));
        return model;
    }
}
