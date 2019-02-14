package com.linghang.serversocket.carlocation.server;

import com.linghang.serversocket.carlocation.server.messageinterface.AbstractMessageExplainInterface;
import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: MessageServerHandler
 * @Author: wuqi
 * @Date: 2019-01-17 11:17
 * @Description: 车辆定位服务
 */
public class MessageServerHandler extends IoHandlerAdapter {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public void messageReceived(IoSession session, Object message) {
        byte[] bytes = (byte[]) message;
        AbstractMessageExplainInterface messageExplain = this.createMessageExplainServer(session, message);
        byte[] returnBytes = messageExplain.messageExplain(bytes, session);
        session.write(returnBytes);
    }

    /**
     * 根据当前传入的消息进行server类型选择
     * 当前只是陕西导航的服务，后期如果需要兼容其他家的还请进行扩展
     *
     * @param session
     * @param message
     * @return
     */
    private AbstractMessageExplainInterface createMessageExplainServer(IoSession session, Object message) {
        return MessageStrExplainServerFactory.createNewServer(session, message);
    }


    /**
     * 关闭与客户端的连接时会调用此方法
     *
     * @param session
     * @throws Exception
     */
    @Override
    public void sessionClosed(IoSession session) throws Exception {
        logger.info("客户端[" + session.getRemoteAddress() + "]断开连接...");
        super.sessionClosed(session);
    }


    /**
     * 服务器与客户端连接打开
     *
     * @param session
     * @throws Exception
     */
    @Override
    public void sessionOpened(IoSession session) throws Exception {
        super.sessionOpened(session);
        logger.info("客户端[" + session.getRemoteAddress() + "]打开连接...");
    }


    @Override
    public void exceptionCaught(IoSession session, Throwable cause) throws Exception {
        logger.error("客户端[" + session.getRemoteAddress() + "]异常:" + cause.getMessage());
        session.closeNow();
        super.exceptionCaught(session, cause);
    }
}
