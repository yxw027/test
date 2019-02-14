package com.linghang.serversocket.carlocation.shannxinavi;

import com.linghang.serversocket.carlocation.util.HexStringUtils;

import java.util.Arrays;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: Message0001Model
 * @Author: wuqi
 * @Date: 2019-01-15 10:55
 * @Description: 0001终端通用应答model
 */
public class Message0001Model {
    /**
     * 应答流水号：对应平台的消息的流水号
     */
    private Short flowId;
    /**
     * 应答ID：对应的平台消息ID
     */
    private Short messageId;
    /**
     * 结果：
     * 0：成功/确认；
     * 1：失败；
     * 2：消息有误；
     * 3：不支持
     */
    private Byte result;

    public static Object createModelByBytes(byte[] bytes) {
        Message0001Model model = new Message0001Model();
        model.setFlowId(bytes);
        model.setMessageId(bytes);
        model.setResult(bytes);
        return model;
    }

    public Short getFlowId() {
        return flowId;
    }

    private void setFlowId(byte[] bytes) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 0, 2);
        this.flowId = Short.parseShort(HexStringUtils.binary(tmpBytes, 10));
    }

    public void setFlowId(Short flowId) {
        this.flowId = flowId;
    }

    public Short getMessageId() {
        return messageId;
    }

    private void setMessageId(byte[] bytes) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 2, 4);
        this.messageId = Short.parseShort(HexStringUtils.toHexString(tmpBytes));
    }

    public void setMessageId(Short messageId) {
        this.messageId = messageId;
    }

    public Byte getResult() {
        return result;
    }

    private void setResult(byte[] bytes) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 4, bytes.length);
        this.result = Byte.parseByte(HexStringUtils.binary(tmpBytes, 10));
    }

    public void setResult(Byte result) {
        this.result = result;
    }
}
