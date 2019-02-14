package com.linghang.serversocket.carlocation.shannxinavi;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: ServerSendBodyModel
 * @Author: wuqi
 * @Date: 2019-01-15 19:08
 * @Description: 服务发送信息消息体model
 */
public class ServerSendBodyModel {

    private Short flowId;
    private Short messageId;
    private Class serverClass;

    public ServerSendBodyModel() {
    }

    public ServerSendBodyModel(short flowId, short messageId, Class serverClass) {
        this.flowId = flowId;
        this.messageId = messageId;
        this.serverClass = serverClass;
    }

    public Short getFlowId() {
        return flowId;
    }

    public void setFlowId(Short flowId) {
        this.flowId = flowId;
    }

    public Short getMessageId() {
        return messageId;
    }

    public void setMessageId(Short messageId) {
        this.messageId = messageId;
    }

    public Class getServerClass() {
        return serverClass;
    }

    public void setServerClass(Class serverClass) {
        this.serverClass = serverClass;
    }
}
