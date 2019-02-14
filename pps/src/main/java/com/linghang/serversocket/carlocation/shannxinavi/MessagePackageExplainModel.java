package com.linghang.serversocket.carlocation.shannxinavi;

import java.util.Arrays;
import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: MessagePackageModel
 * @Author: wuqi
 * @Date: 2019-01-07 9:54
 * @Description: 消息包信息参数
 */
public class MessagePackageExplainModel {

    private Integer messagePackageNo;
    private Integer packageIndex;

    public Integer getMessagePackageNo() {
        return messagePackageNo;
    }

    public void setMessagePackageNo(Integer messagePackageNo) {
        this.messagePackageNo = messagePackageNo;
    }

    public Integer getPackageIndex() {
        return packageIndex;
    }

    public void setPackageIndex(Integer packageIndex) {
        this.packageIndex = packageIndex;
    }


    public static MessagePackageExplainModel createMessageParamBodyModelByBytes(byte[] leftBytes, Map<String, byte[]> map) {
        byte[] messagePackageNo = Arrays.copyOfRange(leftBytes, 0, 1);
        byte[] packageIndex = Arrays.copyOfRange(leftBytes, 1, 2);
        map.put("messagePackage", leftBytes);
        MessagePackageExplainModel model = new MessagePackageExplainModel();
        model.setMessagePackageNo(Integer.valueOf(new String(messagePackageNo)));
        model.setPackageIndex(Integer.valueOf(new String(packageIndex)));
        return model;
    }
}
