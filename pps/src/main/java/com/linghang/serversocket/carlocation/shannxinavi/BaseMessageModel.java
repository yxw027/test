package com.linghang.serversocket.carlocation.shannxinavi;


import com.linghang.serversocket.carlocation.util.HexStringUtils;
import org.apache.mina.core.session.IoSession;

import java.util.Arrays;
import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: Message0100Model
 * @Author: wuqi
 * @Date: 2019-01-07 9:50
 * @Description: 消息0100mode
 */
public class BaseMessageModel {

    private String messageId;
    private MessageParamBodyModel messageParamBodyModel;
    private String phoneNo;
    private String flowId;
    private MessagePackageExplainModel messagePackageExplainModel;
    private Object messageBody;
    private String flag;
    private IoSession ioSession;
    private Integer alarmType;

    public BaseMessageModel() {
    }

    public BaseMessageModel(String messageId, short flowId) {
        this.messageId = messageId;
        this.flowId = flowId + "";
    }

    public String getMessageId() {
        return messageId;
    }

    public void setMessageId(String messageId) {
        this.messageId = messageId;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getFlowId() {
        return flowId;
    }

    public void setFlowId(String flowId) {
        this.flowId = flowId;
    }

    public MessagePackageExplainModel getMessagePackageExplainModel() {
        return messagePackageExplainModel;
    }

    public void setMessagePackageExplainModel(MessagePackageExplainModel messagePackageExplainModel) {
        this.messagePackageExplainModel = messagePackageExplainModel;
    }

    public Object getMessageBody() {
        return messageBody;
    }

    public void setMessageBody(Object messageBody) {
        this.messageBody = messageBody;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public void setFlag(byte[] bytes) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, bytes.length - 1, bytes.length);
        this.flag = HexStringUtils.toHexString(tmpBytes);
    }

    public MessageParamBodyModel getMessageParamBodyModel() {
        return messageParamBodyModel;
    }

    public void setMessageParamBodyModel(MessageParamBodyModel messageParamBodyModel) {
        this.messageParamBodyModel = messageParamBodyModel;
    }

    public void setMessageId(byte[] bytes, Map<String, byte[]> map) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 0, 2);
        map.put("messageId", tmpBytes);
        String tmpId = HexStringUtils.binary(tmpBytes, 16);
        int size = tmpId.length();
        while (size < 4) {
            tmpId = "0" + tmpId;
            size++;
        }
        this.messageId = tmpId;
    }

    public void setPhoneNo(byte[] bytes, Map<String, byte[]> map) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 4, 10);
        map.put("phoneNo", tmpBytes);
        this.phoneNo = HexStringUtils.bcd2Str(tmpBytes);
    }

    public void setFlowId(byte[] bytes, Map<String, byte[]> map) {
        byte[] tmpBytes = Arrays.copyOfRange(bytes, 10, 12);
        map.put("flowId", tmpBytes);
        this.flowId = HexStringUtils.binary(tmpBytes, 10);
    }

    public byte[] getLeftBytes(byte[] bytes) {
        return Arrays.copyOfRange(bytes, 12, 12 + this.getMessageParamBodyModel().getMessageLen());
    }

    public IoSession getIoSession() {
        return ioSession;
    }

    public void setIoSession(IoSession ioSession) {
        this.ioSession = ioSession;
    }

    public Integer getAlarmType() {
        return alarmType;
    }

    public void setAlarmType(Integer alarmType) {
        this.alarmType = alarmType;
    }
}
