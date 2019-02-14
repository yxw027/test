package com.linghang.model.car;

import com.linghang.model.CarVehicleManagementModel;

/**
 * @description: 车辆位置信息 和车辆信息
 * @author: xuqiang
 * @createDate: 2019-01-10 09:40
 **/
public class CarPositionAndCarMessageModel extends CarVehicleManagementModel {

    private CarPositionModel carPositionModel;


    private CarElectricFenceModel carElectricFenceModel;

    @Override
    public CarElectricFenceModel getCarElectricFenceModel() {
        return carElectricFenceModel;
    }

    @Override
    public void setCarElectricFenceModel(CarElectricFenceModel carElectricFenceModel) {
        this.carElectricFenceModel = carElectricFenceModel;
    }

    public CarPositionModel getCarPositionModel() {
        return carPositionModel;
    }

    public void setCarPositionModel(CarPositionModel carPositionModel) {
        this.carPositionModel = carPositionModel;
    }
}
