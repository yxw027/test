package com.linghang.websocket;

import com.alibaba.fastjson.JSON;
import com.linghang.MinaConfig;
import com.linghang.model.base.UserModel;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.util.*;

/**
 * @author liuhao
 * 消息处理
 */
@Component
public class MyTextWebSocketHandler extends TextWebSocketHandler {

    private static final String DATE_FORMAT = "HH:mm:ss.SSS";
    /**
     * concurrent包的线程安全Set，用来存放每个客户端对应的WebSocketSession对象
     */
    private static Map<String, List<WebSocketSession>> sessions = new HashMap<>(7);

    private static Map<String, Map<String, WebSocketSession>> machineSessions = new HashMap<>(7);
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private MinaConfig minaConfig;

    public static boolean containsKey(String machineId) {
        return sessions.containsKey(machineId);
    }

    public static boolean machineContainsKey(String machineId) {
        return machineSessions.containsKey(machineId);
    }

    /**
     * 成功建立连接
     *
     * @param session 用户的session
     * @throws Exception 抛出对应异常
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String trimbleId = (String) session.getAttributes().get("trimbleId");
        String machineId = (String) session.getAttributes().get("machineId");
        UserModel userModel = (UserModel) session.getAttributes().get("userInfo");
        if (!StringUtils.isEmpty(trimbleId)) {
            if (!sessions.containsKey(trimbleId)) {
                sessions.put(trimbleId, new ArrayList<>(7));
            }
            sessions.get(trimbleId).add(session);
            HashMap<String, Object> map = new HashMap<>(3);
            map.put("sender", "Server");
            map.put("time", new Date());
            map.put("message", "用户[" + userModel.getName() + "]进入服务器...");
            String s = JSON.toJSONStringWithDateFormat(map, DATE_FORMAT);
            for (WebSocketSession webSocketSession : sessions.get(trimbleId)) {
                if (!session.equals(webSocketSession)) {
                    webSocketSession.sendMessage(new TextMessage(s));
                }
            }
        }
        if (!StringUtils.isEmpty(machineId)) {
            if (machineSessions.containsKey(machineId)) {
                Map<String, WebSocketSession> webSocketSessions = machineSessions.get(machineId);
                WebSocketSession mapSession = webSocketSessions.get(session.getAttributes().get("name").toString());
                if (mapSession != null) {
                    mapSession.close();
                }
                webSocketSessions.put(session.getAttributes().get("name").toString(), session);
            } else {
                Map<String, WebSocketSession> map = new HashMap<>(2);
                map.put(session.getAttributes().get("name").toString(), session);
                machineSessions.put(machineId, map);
            }
            boolean isControl = (boolean) session.getAttributes().get("isControl");
            if (isControl) {
                HashMap<String, Object> map = new HashMap<>(3);
                map.put("sender", "Server");
                map.put("time", new Date());
                map.put("message", "您已接入频道,请等待拌合站端接入...");
                String s = JSON.toJSONStringWithDateFormat(map, "HH:mm:ss.SSS");
                session.sendMessage(new TextMessage(s));
            }
        }
    }


    /**
     * 在UI在用js调用websocket.send()时候，会调用该方法
     */
    @Override
    protected void handleTextMessage(WebSocketSession session,
                                     TextMessage message) throws Exception {
        String trimbleId = (String) session.getAttributes().get("trimbleId");
        String machineId = (String) session.getAttributes().get("machineId");
        if (!sessions.containsKey(trimbleId) && !machineSessions.containsKey(machineId)) {
            session.close();
        }
        if (!StringUtils.isEmpty(trimbleId) && sessions.containsKey(trimbleId)) {
            List<WebSocketSession> sessionList = sessions.get(trimbleId);
            HashMap<String, Object> map = new HashMap<>(3);
            map.put("sender", session.getLocalAddress());
            map.put("time", new Date());
            map.put("content", message.getPayload());
            String s = JSON.toJSONStringWithDateFormat(map, DATE_FORMAT);
            TextMessage textMessage = new TextMessage(s);
            for (WebSocketSession webSocketSession : sessionList) {
                if (!session.equals(webSocketSession)) {
                    webSocketSession.sendMessage(textMessage);
                }
            }
            Map<Long, IoSession> minaSessions = minaConfig.getDataAcceptor().getManagedSessions();
            for (IoSession value : minaSessions.values()) {
                value.write(message.getPayload());
            }
        }
        if (!StringUtils.isEmpty(machineId) && machineSessions.containsKey(machineId)) {
            boolean senderIsControl = (boolean) session.getAttributes().get("isControl");
            Map<String, WebSocketSession> sessionMap = machineSessions.get(machineId);
            if (senderIsControl) {
                WebSocketSession client = sessionMap.get(SocketType.CLIENT.getText());
                if (client != null) {
                    if (client.isOpen()) {
                        client.sendMessage(message);
                    } else {
                        removeSession(client);
                    }
                }
                HashMap<String, Object> map = new HashMap<>(3);
                map.put("sender", session.getAttributes().get("name"));
                map.put("time", new Date());
                map.put("message", message.getPayload());
                String s = JSON.toJSONStringWithDateFormat(map, "HH:mm:ss.SSS");
                session.sendMessage(new TextMessage(s));
            } else {
                WebSocketSession command = sessionMap.get(SocketType.COMMAND.getText());
                if (command != null && command.isOpen()) {
                    HashMap<String, Object> map = new HashMap<>(3);
                    map.put("sender", session.getAttributes().get("name"));
                    map.put("time", new Date());
                    map.put("message", message.getPayload());
                    String s = JSON.toJSONStringWithDateFormat(map, "HH:mm:ss.SSS");
                    command.sendMessage(new TextMessage(s));
                } else {
                    removeSession(session);
                }
            }
        }

    }

    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        removeSession(session);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        removeSession(session);
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

    private void removeSession(WebSocketSession session) throws Exception {
        String trimbleId = (String) session.getAttributes().get("trimbleId");
        String machineId = (String) session.getAttributes().get("machineId");
        if (!sessions.containsKey(trimbleId) && !machineSessions.containsKey(machineId)) {
            session.close();
        }
        if (sessions.containsKey(trimbleId)) {
            List<WebSocketSession> sessionList = sessions.get(trimbleId);
            if (sessionList.size() == 1) {
                session.close();
                sessions.remove(trimbleId);
            } else {
                sessionList.remove(session);
                session.close();

                HashMap<String, Object> map = new HashMap<>(3);
                map.put("sender", "Server");
                map.put("time", new Date());
                map.put("message", "客户端[" + session.getLocalAddress() + "]已离开.....");
                String s = JSON.toJSONStringWithDateFormat(map, DATE_FORMAT);
                TextMessage textMessage = new TextMessage(s);
                for (WebSocketSession webSocketSession : sessionList) {
                    webSocketSession.sendMessage(textMessage);
                }
            }
        }
        if (machineSessions.containsKey(machineId)) {
            if (!machineSessions.containsKey(machineId)) {
                session.close();
            }
            boolean isControl = (boolean) session.getAttributes().get("isControl");
            Map<String, WebSocketSession> sessionMap = machineSessions.get(machineId);
            if (isControl) {
                for (WebSocketSession webSocketSession : sessionMap.values()) {
                    webSocketSession.close();
                }
                machineSessions.remove(machineId);
            } else {
                sessionMap.remove(session.getAttributes().get("type").toString());
                session.close();
                WebSocketSession command = sessionMap.get(SocketType.COMMAND.getText());
                if (command != null && command.isOpen()) {
                    HashMap<String, Object> map = new HashMap<>(3);
                    map.put("sender", "Server");
                    map.put("time", new Date());
                    map.put("message", "拌合站客户端[" + machineId + "]已离开.....");
                    String s = JSON.toJSONStringWithDateFormat(map, "HH:mm:ss.SSS");
                    command.sendMessage(new TextMessage(s));
                }
            }
        }

    }

    public void clientSay(String trimbleId, String msg) {
        if (!sessions.containsKey(trimbleId) && !machineSessions.containsKey(trimbleId)) {
            return;
        }
        if (sessions.containsKey(trimbleId)) {
            List<WebSocketSession> sessionList = sessions.get(trimbleId);
            HashMap<String, Object> map = new HashMap<>(3);
            map.put("sender", trimbleId);
            map.put("time", new Date());
            map.put("message", msg);
            String s = JSON.toJSONStringWithDateFormat(map, DATE_FORMAT);
            TextMessage textMessage = new TextMessage(s);
            try {
                for (WebSocketSession webSocketSession : sessionList) {
                    webSocketSession.sendMessage(textMessage);
                }
            } catch (IOException e) {
                logger.error(e.toString());
            }
        }
        if (machineSessions.containsKey(trimbleId)) {
            Map<String, WebSocketSession> sessionMap = machineSessions.get(trimbleId);
            WebSocketSession session = sessionMap.get(SocketType.COMMAND.getText());
            if (session == null) {
                return;
            }
            HashMap<String, Object> map = new HashMap<>(3);
            map.put("sender", SocketType.CLIENT.getText());
            map.put("time", new Date());
            map.put("message", msg);
            String s = JSON.toJSONStringWithDateFormat(map, "HH:mm:ss.SSS");
            try {
                session.sendMessage(new TextMessage(s));
            } catch (Exception e) {
                logger.info("webSocket写入错误:", e);
            }
        }

    }
}
