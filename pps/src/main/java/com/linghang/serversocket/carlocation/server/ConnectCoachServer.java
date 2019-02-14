package com.linghang.serversocket.carlocation.server;

import com.linghang.serversocket.carlocation.shannxinavi.BaseMessageModel;
import com.linghang.serversocket.carlocation.shannxinavi.ServerSendBodyModel;
import org.apache.commons.collections.map.HashedMap;
import org.apache.mina.core.session.IoSession;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: ConnectCoachServer
 * @Author: wuqi
 * @Date: 2019-01-12 9:38
 * @Description: 通讯连接缓存服务
 */
public class ConnectCoachServer {


    private static Map<String, IoSession> nettyClientServerMap;
    private static Map<String, Map<Short, ServerSendBodyModel>> serverSendToMap;
    private static Integer lockFlag = 0;

    static {
        nettyClientServerMap = new HashedMap();
        serverSendToMap = new HashMap();
    }

    public static Map<String, IoSession> getNettyClientServerMap() {
        return nettyClientServerMap;
    }

    public static Map<String, Map<Short, ServerSendBodyModel>> getServerSendToMap() {
        return serverSendToMap;
    }

    public static void putSendMessageModelToServerSendMap(String phoneNo, BaseMessageModel model, Class serverClass) {
        Map<Short, ServerSendBodyModel> map = null;
        synchronized (lockFlag) {
            map = serverSendToMap.get(phoneNo);
            if (map == null) {
                map = new LinkedHashMap<>();
                ServerSendBodyModel serverSendBodyModel = new ServerSendBodyModel(Short.parseShort(model.getFlowId())
                        , Short.parseShort(model.getMessageId()), serverClass);
                map.put(Short.parseShort(model.getFlowId()), serverSendBodyModel);
                serverSendToMap.put(phoneNo, map);
                return;
            }
            ServerSendBodyModel serverSendBodyModel = new ServerSendBodyModel(Short.parseShort(model.getFlowId())
                    , Short.parseShort(model.getMessageId()), serverClass);
            map.put(Short.parseShort(model.getFlowId()), serverSendBodyModel);
        }
    }
}
