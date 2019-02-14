package com.linghang.serversocket.carlocation.server;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: ServerMessageThreadServer
 * @Author: wuqi
 * @Date: 2019-01-15 16:34
 * @Description: 服务下发线程服务
 */
public class ServerMessageThreadServer {

    private static ExecutorService pool = Executors.newFixedThreadPool(20);

    public static ExecutorService getPool() {
        return pool;
    }

}


