package com.linghang.controller.car;

import com.github.pagehelper.PageInfo;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.car.CarAlamMessageModel;
import com.linghang.service.car.CarAlamMessageService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by dell on 2019/01/14.
 * 车辆报警 Controller
 */
@RestController
@RequestMapping("carAlamMessage")
public class CarAlamMessageController {
    private static final Logger LOGGER = LoggerFactory.getLogger(CarAlamMessageController.class);


    @Autowired
    private CarAlamMessageService carAlamMessageService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("caralammessage");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("carAlamMessage:insert")
    @RequestMapping("insert")
    public CarAlamMessageModel insert(@RequestBody CarAlamMessageModel model) {
        if (this.carAlamMessageService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("carAlamMessage:showAll")
    @RequestMapping("showAll")
    public List<CarAlamMessageModel> showAll() {
        CarAlamMessageModel model = new CarAlamMessageModel();
        return this.carAlamMessageService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("carAlamMessage:update")
    @RequestMapping("update")
    public CarAlamMessageModel update(@RequestBody CarAlamMessageModel model) {
        if (this.carAlamMessageService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("carAlamMessage:delete")
    @RequestMapping("delete")
    public CarAlamMessageModel delete(@RequestBody CarAlamMessageModel model) {
        if (this.carAlamMessageService.deleteById(model)) {
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
    @RequestMapping("showAlamMessage")
    public PageInfo<CarAlamMessageModel> selectMoldeByOptions(Long orgId, String startTime, String endTime, Integer alamType, KendoOptions options) {
        return this.carAlamMessageService.selectMoldeByOptions(orgId, startTime, endTime, alamType, options);
    }
}