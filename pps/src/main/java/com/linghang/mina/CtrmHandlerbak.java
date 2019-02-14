package com.linghang.mina;

import com.linghang.model.TrimbleInfoModel;
import com.linghang.service.TrimbleInfoService;
import com.linghang.util.TrimbleCommand;
import com.linghang.websocket.MyTextWebSocketHandler;
import org.apache.mina.core.service.IoHandlerAdapter;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;

/**
 * @author liuhao
 * 差分信号处理
 */
public class CtrmHandlerbak extends IoHandlerAdapter {

    private static Map<Long, Map<String, IoSession>> sessionMap = new HashMap<>();
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    private TrimbleInfoService trimbleInfoService = new TrimbleInfoService();

    @Autowired
    private MyTextWebSocketHandler textWebSocketHandler;

    /**
     * 从端口接受消息，会响应此方法来对消息进行处理
     *
     * @param session
     * @param message
     * @throws Exception
     */
    @Override
    public void messageReceived(IoSession session, Object message) {
        byte[] messageBytes = (byte[]) message;
        System.out.println(new String(messageBytes));
        if (TrimbleCommand.isExitCommand(messageBytes)) {
            session.closeNow();
            return;
        }
//        if (!session.containsAttribute(TrimbleCommand.ATTR_INFOMODEL)) {
//            String serialNumber = TrimbleCommand.getSerialNumber(messageBytes);
//            if (serialNumber == null) {
//                return;
//            }
//            TrimbleInfoModel infoModel = trimbleInfoService.selectById(serialNumber);
//            if (infoModel == null) {
//                return;
//            }
//            if (infoModel.getGroupId() == null) {
//                return;
//            }
//            session.setAttribute(TrimbleCommand.ATTR_INFOMODEL, infoModel);
//            if (!sessionMap.containsKey(infoModel.getGroupId())) {
//                sessionMap.put(infoModel.getGroupId(), new HashMap<>(5));
//            }
//            sessionMap.get(infoModel.getGroupId()).put(infoModel.getId(), session);
//        }
//        TrimbleInfoModel infoModel = (TrimbleInfoModel) session.getAttribute(TrimbleCommand.ATTR_INFOMODEL);
//        if (!TrimbleInfoType.STATION.getInteger().equals(infoModel.getType())) {
//            return;
//        }
//        logger.info("差分客户端[{}]发送了差分数据...", infoModel.getName());
//        for (IoSession ioSession : sessionMap.get(infoModel.getGroupId()).values()) {
//            if (!ioSession.isConnected()) {
//                sessionMap.get(infoModel.getGroupId()).remove(infoModel.getId());
//                continue;
//            }
//            if (session.equals(ioSession)) {
//                continue;
//            }
//            ioSession.write(messageBytes);
//        }

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
//            logger.error("差分客户端[{}]断开连接...", infoModel.getName());
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
        //session.write(IoBuffer.wrap(TrimbleCommand.CMD_RECEIVER_INFO));
        session.write(TrimbleCommand.CMD_RECEIVER_INFO);
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
//            logger.error("差分客户端[{}]异常:[{}]", infoModel.getName(), cause.getMessage());
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
        if (!session.containsAttribute(TrimbleCommand.ATTR_INFOMODEL)) {
            return;
        }
        TrimbleInfoModel infoModel = (TrimbleInfoModel) session.getAttribute(TrimbleCommand.ATTR_INFOMODEL);
//        if (infoModel.getGroupId() == null) {
//            return;
//        }
//        if (!sessionMap.containsKey(infoModel.getGroupId())) {
//            return;
//        }
//        sessionMap.get(infoModel.getGroupId()).remove(infoModel.getId());
    }

}
