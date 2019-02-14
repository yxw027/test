package com.linghang.controller.car;

import com.linghang.model.CarVehicleManagementModel;
import com.linghang.model.car.CarPositionAndCarMessageModel;
import com.linghang.model.car.CarPositionModel;
import com.linghang.model.car.DeleteElectricfenceModel;
import com.linghang.service.CarVehicleManagementService;
import com.linghang.service.car.CarPositionService;
import com.linghang.service.car.DeleteElectricfenceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @description: 车辆位置信息
 * @author: xuqiang
 * @createDate: 2019-01-10 08:59
 **/
@RestController
@RequestMapping("carPosition")
public class CarPositionController {
    private static final Logger LOGGER = LoggerFactory.getLogger(CarPositionController.class);

    @Autowired
    private CarPositionService carPositionService;

    @Autowired
    private CarVehicleManagementService carVehicleManagementService;

    @Autowired
    private DeleteElectricfenceService deleteElectricfenceService;

    /**
     *根据 组织机构 和车辆类型 查询车辆最新位置信息
     * @param orgId
     * @param carType
     * @return
     */
    @RequestMapping("carPositionLocus")
    public List<CarPositionAndCarMessageModel> selectCarPositionLocus(Long orgId, Integer carType, String carNum) {
        return this.carPositionService.selectCarPositionLocus(orgId, carType, carNum);
    }
    @RequestMapping("carList")
    public List<CarVehicleManagementModel> selectCarListByorgIdAndCarType(Long orgId, Integer carType, String selectDate, String carNum) {
        return this.carPositionService.selectCarListByorgIdAndCarType(orgId, carType, selectDate, carNum);
    }

    @RequestMapping("carPositionHistory")
    public List<CarPositionModel> selectCarPositionHistory(String carNumber, String startTime, String endTime) {
        return  this.carPositionService.selectCarPositionHistory(carNumber,startTime,endTime);
    }

//    @RequestMapping("selectNeedelectronicFenceList")
//    public List<CarVehicleManagementModel> selectNeedelectronicFenceList() {
////        return this.carVehicleManagementService.selectNeedelectronicFenceList();
//    }

    /**
     * 查询车的最新19条记录
     *
     * @param carNumber
     * @return
     */
    @RequestMapping("carTop10PositionLocus")
    public List<CarPositionModel> selectCarTop10PositionLocus(String carNumber) {
        if (carNumber == null || "".equals(carNumber)) {
            return new ArrayList<>();
        }
        return this.carPositionService.selectCarTop10PositionLocus(carNumber);
    }

    @RequestMapping("selectNeedDeleteCar")
    public List<DeleteElectricfenceModel> selectNeedDeleteCar() {
        return deleteElectricfenceService.selectNeedDeleteCar();
    }

    /**
     * 查询车辆的实时位置
     *
     * @param carId
     * @return
     */
    @RequestMapping("selectNowPositionByCarId")
    public CarPositionModel selectNowPositionByCarId(Long carId) {
        return carPositionService.selectNowPositionByCarId(carId);
    }

}
