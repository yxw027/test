package com.linghang;


import com.linghang.websocket.MyHandshakeInterceptor;
import com.linghang.websocket.MyTextWebSocketHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

/**
 * @author liuhao
 * 消息配置
 */
@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    @Autowired
    MyTextWebSocketHandler myTextWebSocketHandler;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(myTextWebSocketHandler, "/ws").addInterceptors(new MyHandshakeInterceptor()).setAllowedOrigins("*");
        registry.addHandler(myTextWebSocketHandler, "/ws").addInterceptors(new MyHandshakeInterceptor()).setAllowedOrigins("*").withSockJS().setHeartbeatTime(10000L);
    }


}
