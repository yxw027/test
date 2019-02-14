package com.linghang.websocket;


import com.linghang.model.base.UserModel;
import org.apache.shiro.SecurityUtils;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @author liuhao
 * 消息初始化
 */
public class MyHandshakeInterceptor implements HandshakeInterceptor {

    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) {
        if (!(request instanceof ServletServerHttpRequest)) {
            return false;
        }
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
        String trimbleId = servletRequest.getServletRequest().getParameter("trimbleId");
        String machineId = servletRequest.getServletRequest().getParameter("machineId");
        if (!StringUtils.isEmpty(trimbleId)) {
            attributes.put("trimbleId", trimbleId);
            attributes.put("userInfo", userModel);
            return true;
        }
        if (!StringUtils.isEmpty(machineId)) {
            HttpSession session = servletRequest.getServletRequest().getSession(false);
            if (session == null && !MyTextWebSocketHandler.machineContainsKey(machineId)) {
                return false;
            }
            attributes.put("machineId", machineId);
            attributes.put("isControl", session != null);
            attributes.put("type", session == null ? SocketType.CLIENT.getValue() : SocketType.COMMAND.getValue());
            attributes.put("name", session == null ? SocketType.CLIENT.getText() : SocketType.COMMAND.getText());
            return true;
        }
        return false;
    }

    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception exception) {

    }

}

