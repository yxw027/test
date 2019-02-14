package com.linghang.serversocket.carlocation.server;

import com.linghang.serversocket.carlocation.server.shannxinavi.PolygonAreaDownLoadServer;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: MachineResetHandler
 * @Author: wuqi
 * @Date: 2019-01-18 14:10
 * @Description: 机器复位处理
 */
public class MachineResetHandler implements Runnable {
    private String phoneNo;

    public MachineResetHandler(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    @Override
    public void run() {
        new PolygonAreaDownLoadServer().machineReset(phoneNo);
    }
}
