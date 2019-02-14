package com.linghang.serversocket.carlocation.server;

import com.linghang.serversocket.carlocation.server.messageinterface.AbstractMessageExplainInterface;
import com.linghang.serversocket.carlocation.server.shannxinavi.MessageStrExplainServer;
import org.apache.mina.core.session.IoSession;

import java.util.HashMap;
import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: MessageStrExplainServerFactory
 * @Author: wuqi
 * @Date: 2019-01-15 9:39
 * @Description: 消息解析工厂
 */
public class MessageStrExplainServerFactory {

    private static Map<String, AbstractMessageExplainInterface> map = new HashMap();
    //同步标识无意义
    private static Object synchFlag = new Object();

    //目前只是陕西导航的定位，所以只针对陕西导航进行了编写，后续待扩展
    public static AbstractMessageExplainInterface createNewServer(IoSession session, Object message) {
        AbstractMessageExplainInterface abstractMessageExplainInterface = null;
        synchronized (synchFlag) {
            abstractMessageExplainInterface = map.get(MessageStrExplainServer.class.getSimpleName());
            if (abstractMessageExplainInterface == null) {
                String name = MessageStrExplainServer.class.getSimpleName();
                abstractMessageExplainInterface = new MessageStrExplainServer();
                map.put(name, abstractMessageExplainInterface);
                return abstractMessageExplainInterface;
            }
            return abstractMessageExplainInterface;
        }
    }

    public static Map<String, AbstractMessageExplainInterface> getMap() {
        return map;
    }

    public static AbstractMessageExplainInterface getTargetServer(String simpleName) {
        synchronized (synchFlag) {
            if (map.get(simpleName) == null) {
                return createNewServer(null, null);
            } else {
                return map.get(simpleName);
            }
        }
    }
}
