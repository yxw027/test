package com.linghang.serversocket.carlocation.shannxinavi;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: Message0102Model
 * @Author: wuqi
 * @Date: 2019-01-08 13:57
 * @Description: 0x0102消息体model
 */
public class Message0102Model {

    private String msgInfo;

    public String getMsgInfo() {
        return msgInfo;
    }

    public void setMsgInfo(String msgInfo) {
        this.msgInfo = msgInfo;
    }

    public static Object createModelByBytes(byte[] bytes) {
        Message0102Model model = new Message0102Model();
        model.setMsgInfo(new String(bytes));
        return model;
    }
}
