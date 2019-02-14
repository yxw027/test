package com.linghang.controller.car;

import com.linghang.model.CarVehicleManagementModel;
import com.linghang.model.car.CarElectricFenceModel;
import com.linghang.service.CarVehicleManagementService;
import com.linghang.service.car.CarElectricFenceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 2019/01/02.
 * 电子围栏 Controller
 */
@RestController
@RequestMapping("carElectricFence")
public class CarElectricFenceController {
    private static final Logger LOGGER = LoggerFactory.getLogger(CarElectricFenceController.class);


    @Autowired
    private CarElectricFenceService carElectricFenceService;

    @Autowired
    private CarVehicleManagementService carVehicleManagementService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("carelectricfence");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public CarElectricFenceModel insert(@RequestBody CarElectricFenceModel model) {
        if (this.carElectricFenceService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<CarElectricFenceModel> showAll(Long orgId) {
        if (orgId == null) {
            return new ArrayList<>();
        }
        CarElectricFenceModel model = new CarElectricFenceModel();
        model.setOrgId(orgId);
        return this.carElectricFenceService.selectByModel(model);
    }

    /**
     * 查询车辆的电子围栏信息
     *
     * @param carId
     * @return
     */
    @RequestMapping("selectCarFence")
    public CarElectricFenceModel selectCarFence(Long carId) {
        CarVehicleManagementModel car = carVehicleManagementService.selectById(carId);
        if (car == null) {
            return null;
        }
        CarElectricFenceModel model = new CarElectricFenceModel();
        model.setOrgId(car.getOrgId());
        List<CarElectricFenceModel> list = this.carElectricFenceService.selectByModel(model);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        return list.get(0);
    }


    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public CarElectricFenceModel update(@RequestBody CarElectricFenceModel model) {
        if (this.carElectricFenceService.update(model)) {
            if (model.getCarElectronicFencePointModels() != null && model.getCarElectronicFencePointModels().size() > 0) {

//                try {
//                    carVehicleManagementService.downloadCarElectricFence(Arrays.asList(model.getCarMessage().split(",")).stream().map(Long::parseLong).collect(Collectors.toList()));
//                } catch (Exception e) {
//
//                }
            }

            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public CarElectricFenceModel delete(@RequestBody CarElectricFenceModel model) {
        if (this.carElectricFenceService.delete(model)) {
            return model;
        }
        return null;
    }


    @RequestMapping("verifyUnique")
    public boolean verifyUnique(Long orgId) {
        return this.carVehicleManagementService.verifyUnique(orgId);
    }
}