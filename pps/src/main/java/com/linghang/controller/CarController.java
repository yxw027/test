package com.linghang.controller;

import com.github.pagehelper.PageInfo;
import com.linghang.enums.CarStatus;
import com.linghang.enums.CarType;
import com.linghang.enums.Crafts;
import com.linghang.model.CarModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.service.CarService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * @author by i_it on 2018/11/21.
 * 摊铺压路车辆 Controller
 */
@RestController
@RequestMapping("car")
public class CarController {

    @Autowired
    private CarService carService;

    /**
     * 跳转页面
     */
    @RequestMapping("manage")
    public ModelAndView manage(ModelAndView mv) {
        mv.addObject("catType", CarType.getJsonString());
        mv.addObject("status", CarStatus.getJsonString());
        mv.addObject("crafts", Crafts.getJsonString());
        mv.setViewName("business/car/carManage");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("car:insert")
    @RequestMapping("insert")
    public CarModel insert(@RequestBody CarModel model) {
        model.setWorkTime(new Date());
        if (this.carService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("car:show")
    @RequestMapping("showAll")
    public List<CarModel> showAll() {
        CarModel model = new CarModel();
        return this.carService.selectByModel(model);
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("car:show")
    @RequestMapping("show")
    public List<CarModel> show() {
        CarModel model = new CarModel();
        return this.carService.selectByModel(model);
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("car:show")
    @RequestMapping("showByOptions")
    public PageInfo<CarModel> showByOptions(KendoOptions options, Long orgId) {
        return this.carService.selectByOptions(options, orgId);
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("car:update")
    @RequestMapping("update")
    public CarModel update(@RequestBody CarModel model) {
        if (this.carService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("car:delete")
    @RequestMapping("delete")
    public CarModel delete(@RequestBody CarModel model) {
        if (this.carService.deleteById(model)) {
            return model;
        }
        return null;
    }
}