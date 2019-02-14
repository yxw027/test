package com.linghang.serversocket.carlocation.server.messageinterface;

import org.apache.mina.core.session.IoSession;

import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: AbstractMessageExplainInterface
 * @Author: wuqi
 * @Date: 2019-01-07 10:28
 * @Description: 抽象的消息处理接口
 */
public interface AbstractMessageExplainInterface {


    public abstract byte[] messageExplain(byte[] bytes, IoSession session);

    public abstract byte[] transformBytesMapToStandardFormat(Map<String, byte[]> map);

}
