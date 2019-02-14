package com.linghang.serversocket.carlocation.server.messageinterface;

import com.linghang.model.CarVehicleManagementModel;
import com.linghang.model.car.DeleteElectricfenceModel;

import java.util.List;

/**
 * @Copyright (C), 2018-2019, Shaanxi Navigation Software Technology Co.,Ltd
 * @FileName: AbstractMsgdownLoadInterface
 * @Author: wuqi
 * @Date: 2019-01-11 16:31
 * @Description: 抽象数据下穿接口
 */
public interface AbstractMsgdownLoadInterface {

    public abstract void serverSendPolygonAreaDownLoadModel(List<CarVehicleManagementModel> model);

    public abstract void deletePolygonArea(List<DeleteElectricfenceModel> models);
}
