package com.linghang.task;

import com.linghang.model.car.DeleteElectricfenceModel;
import com.linghang.serversocket.carlocation.server.shannxinavi.PolygonAreaDownLoadServer;
import com.linghang.service.CarVehicleManagementService;
import com.linghang.service.car.DeleteElectricfenceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: DownloadMessageTask
 * @Author: wuqi
 * @Date: 2019-01-14 9:24
 * @Description: 下发电子围栏
 */
@Component
public class DownloadMessageTask {

    @Autowired
    private CarVehicleManagementService carVehicleManagementService;

    @Autowired
    private DeleteElectricfenceService deleteElectricfenceService;

    /**
     * 定时下发电子围栏信息
     */
//    @Scheduled(cron = "*/5 * * * * ?")
    public void deleteMessage(List<DeleteElectricfenceModel> list) {
        PolygonAreaDownLoadServer downLoadServer = new PolygonAreaDownLoadServer();
        if (!CollectionUtils.isEmpty(list)) {
            downLoadServer.serverSendDeletePolygonAreaDownLoadModel(list);
        }
    }

}
