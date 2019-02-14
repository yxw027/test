package com.linghang.serversocket.carlocation.server;

import java.util.HashMap;
import java.util.Map;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: FlowIdFactory
 * @Author: wuqi
 * @Date: 2019-01-15 10:30
 * @Description: 消息id流水号
 */
public class FlowIdFactory {

    private static Map<String, Short> map = new HashMap<>();


    public static Short createFlowId(String phoneNo) {
        synchronized (map) {
            Short id = null;
            if (map.get(phoneNo) == null) {
                id = 0;
                map.put(phoneNo, id);
                return id;
            }
            id = map.get(phoneNo);
            id++;
            return id;
        }
    }

}
