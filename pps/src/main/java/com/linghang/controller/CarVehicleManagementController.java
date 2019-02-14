package com.linghang.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.linghang.model.CarVehicleManagementModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.car.CarIdAndCarNumberModel;
import com.linghang.service.CarVehicleManagementService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * Created by dell on 2018/12/25.
 * 车辆管理 Controller
 */
@RestController
@RequestMapping("carVehicleManagement")
public class CarVehicleManagementController {
    private static final Logger LOGGER = LoggerFactory.getLogger(CarVehicleManagementController.class);


    @Autowired
    private CarVehicleManagementService carVehicleManagementService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("business/car/carvehiclemanagement");
        return mv;
    }

    /**
     * 跳转页面
     */
    @RequestMapping("carMonitor")
    public ModelAndView carMonitor(ModelAndView mv) {
        mv.setViewName("business/car/carMonitor");
        return mv;
    }

    /**
     * 跳转页面
     */
    @RequestMapping("electricFence")
    public ModelAndView electricFence(ModelAndView mv) {
        mv.setViewName("business/car/electricFence");
        return mv;
    }

    /**
     * 跳转页面
     */
    @RequestMapping("trackPlayback")
    public ModelAndView trackPlayback(ModelAndView mv) {
        mv.setViewName("business/car/trackPlayback");
        return mv;
    }

    /**
     * 跳转页面
     */
    @RequestMapping("transportOrbit")
    public ModelAndView transportOrbit(ModelAndView mv, String carnum, String startTime, String endTime) {
        mv.addObject("transportOrbit", JSON.toJSONString(this.carVehicleManagementService.transportInfo(carnum, startTime, endTime)));
        mv.setViewName("business/car/transportOrbit");
        return mv;
    }

    /**
     * 跳转页面
     */
    @RequestMapping("warning")
    public ModelAndView warning(ModelAndView mv) {
        mv.setViewName("business/car/warning");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public CarVehicleManagementModel insert(@RequestBody CarVehicleManagementModel model) {
        model.setAddTime(new Date());
        model.setIsIssued(0);
        if (this.carVehicleManagementService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 根据前台过滤条件查询
     *
     * @param orgId
     * @param options
     * @return
     */
    @RequestMapping("showAll")
    public PageInfo<CarVehicleManagementModel> selectMoldeByOptions(Long orgId, KendoOptions options) {
        return this.carVehicleManagementService.selectMoldeByOptions(orgId, options);
    }

    @RequestMapping("selectCarVehicleManagementModel")
    public List<CarVehicleManagementModel> selectCarVehicleManagementModel(Long orgId) {
        CarVehicleManagementModel carVehicleManagementModel = new CarVehicleManagementModel();
        carVehicleManagementModel.setOrgId(orgId);
        return this.carVehicleManagementService.selectByModel(carVehicleManagementModel);

    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public CarVehicleManagementModel update(@RequestBody CarVehicleManagementModel model) {
        if (this.carVehicleManagementService.update(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public CarVehicleManagementModel delete(@RequestBody CarVehicleManagementModel model) {
        if (this.carVehicleManagementService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 验证车辆标识在当前标段下唯一
     *
     * @param id
     * @param carMark
     * @param orgId
     * @return
     */
    @RequestMapping("carMarkValidation")
    public Boolean carMarkValidation(Long id, Integer carMark, Long orgId) {
        return this.carVehicleManagementService.carMarkValidation(id, carMark, orgId);
    }

    /**
     * 验证当前车牌号是否为一
     *
     * @param id
     * @param carNumber
     * @return
     */
    @RequestMapping("carNumbervalidation")
    public Boolean carNumbervalidation(Long id, String carNumber) {
        return this.carVehicleManagementService.carNumbervalidation(id, carNumber);
    }

    /**
     * 验证当前射频号是否为一
     *
     * @param id
     * @param rfCardNumber
     * @return
     */
    @RequestMapping("rfCardNumbervalidation")
    public Boolean rfCardNumbervalidation(Long id, String rfCardNumber) {
        return this.carVehicleManagementService.rfCardNumbervalidation(id, rfCardNumber);
    }

    /**
     * gps 卡号验证
     *
     * @param id
     * @param gpsCardNumber
     * @return
     */
    @RequestMapping("gpsCardNumbervalidation")
    public Boolean gpsCardNumbervalidation(Long id, String gpsCardNumber) {
        return this.carVehicleManagementService.gpsCardNumbervalidation(id, gpsCardNumber);
    }

    @RequestMapping("carIdAndCarNumber")
    public List<CarIdAndCarNumberModel> selectCarIdAndCarNumberModel(Long orgId) {
        return this.carVehicleManagementService.selectCarIdAndCarNumberModel(orgId);
    }


    /**
     * 下发电子围栏
     *
     * @param ids 下发的车辆id
     * @return
     */
    @RequestMapping("downloadCarElectricFence")
    public void downloadCarElectricFence(List<Long> ids) {
        this.carVehicleManagementService.downloadCarElectricFence(ids);
    }
}