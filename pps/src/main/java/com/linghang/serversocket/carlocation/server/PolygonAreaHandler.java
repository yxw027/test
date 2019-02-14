package com.linghang.serversocket.carlocation.server;

import com.linghang.model.CarVehicleManagementModel;
import com.linghang.serversocket.carlocation.server.shannxinavi.PolygonAreaDownLoadServer;
import com.linghang.serversocket.carlocation.util.ApplicationContextProvider;
import com.linghang.service.CarVehicleManagementService;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: PolygonAreaHandler
 * @Author: wuqi
 * @Date: 2019-01-15 16:52
 * @Description:
 */
public class PolygonAreaHandler implements Runnable {

    private String phoneNo;

    public PolygonAreaHandler(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    @Override
    public void run() {
        CarVehicleManagementService carVehicleManagementService = ApplicationContextProvider.getBean(CarVehicleManagementService.class);
        List<CarVehicleManagementModel> list = carVehicleManagementService.selectNeedelectronicFenceList(phoneNo);
        PolygonAreaDownLoadServer downLoadServer = new PolygonAreaDownLoadServer();
        if (!CollectionUtils.isEmpty(list)) {
            downLoadServer.serverSendPolygonAreaDownLoadModel(list);
        }
    }
}
