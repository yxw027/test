package com.linghang.mina;

import com.linghang.model.TrimbleInfoModel;
import com.linghang.util.TrimbleCommand;
import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * @author liuhao
 * 差分信号处理
 */
public class CtrmHandler extends IoHandlerAdapter {

    private static Map<Long, IoSession> sessionMap = new HashMap<>();
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 从端口接受消息，会响应此方法来对消息进行处理
     *
     * @param ioSession
     * @param message
     * @throws Exception
     */
    @Override
    public void messageReceived(IoSession ioSession, Object message) {
        for (IoSession session : sessionMap.values()) {
            if (ioSession.equals(session)) {
                continue;
            }
            session.write(message);
        }
//        logger.info("[{}]发送差分数据...", ioSession.getRemoteAddress());
    }

    /**
     * 向客服端发送消息后会调用此方法
     * @param session
     * @param message
     * @throws Exception
     */
//    @Override
//    public void messageSent(IoSession session, Object message) throws Exception {
//        super.messageSent(session, message);
////      session.close(true);//加上这句话实现短连接的效果，向客户端成功发送数据后断开连接
//        System.out.println("服务器发送消息成功...");
//    }

    /**
     * 关闭与客户端的连接时会调用此方法
     *
     * @param session
     * @throws Exception
     */
    @Override
    public void sessionClosed(IoSession session) throws Exception {
        super.sessionClosed(session);
        if (session.containsAttribute(TrimbleCommand.ATTR_INFOMODEL)) {
            TrimbleInfoModel infoModel = (TrimbleInfoModel) session.getAttribute(TrimbleCommand.ATTR_INFOMODEL);
            logger.error("差分客户端[{}]断开连接...", infoModel.getRemark());
        } else {
            logger.error("差分客户端[{}]断开连接...", session.getRemoteAddress());
        }
        removeSession(session);
    }

    /**
     * 服务器与客户端创建连接
     *
     * @param session
     * @throws Exception
     */
    @Override
    public void sessionCreated(IoSession session) throws Exception {
        super.sessionCreated(session);
        logger.info("差分客户端[" + session.getRemoteAddress() + "]创建连接...");
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
        logger.info("差分客户端[" + session.getRemoteAddress() + "]打开连接...");
        sessionMap.put(session.getId(), session);
        //session.write(IoBuffer.wrap(TrimbleCommand.CMD_RECEIVER_INFO));
        //session.write(TrimbleCommand.CMD_RECEIVER_INFO);
    }

//    @Override
//    public void sessionIdle(IoSession session, IdleStatus status) {
//        super.sessionIdle(session, status);
//        logger.info("客户端[" + session.getRemoteAddress() + "]进入空闲状态...");
//    }

    @Override
    public void exceptionCaught(IoSession session, Throwable cause) throws Exception {
        super.exceptionCaught(session, cause);
        if (session.containsAttribute(TrimbleCommand.ATTR_INFOMODEL)) {
            TrimbleInfoModel infoModel = (TrimbleInfoModel) session.getAttribute(TrimbleCommand.ATTR_INFOMODEL);
            logger.error("差分客户端[{}]异常:[{}]", infoModel.getRemark(), cause.getMessage());
        } else {
            logger.error("差分客户端[{}]异常:[{}]", session.getRemoteAddress(), cause.getMessage());
        }
//        if (!(cause instanceof IllegalArgumentException)) {
//            removeSession(session);
//        }
    }

    /**
     * 移除通道
     *
     * @param session
     */
    private void removeSession(IoSession session) {
        session.closeNow();
        sessionMap.remove(session.getId());
    }

}
