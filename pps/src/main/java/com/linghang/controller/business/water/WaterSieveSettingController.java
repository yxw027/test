package com.linghang.controller.business.water;

import com.linghang.model.business.water.WaterSieveSettingModel;
import com.linghang.service.business.water.WaterSieveSettingService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by lvruixing on 2018/12/19.
 * 筛孔设置表 Controller
 */
@RestController
@RequestMapping("waterSieveSetting")
public class WaterSieveSettingController {
    private static final Logger LOGGER = LoggerFactory.getLogger(WaterSieveSettingController.class);


    @Autowired
    private WaterSieveSettingService waterSieveSettingService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("watersievesetting");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public WaterSieveSettingModel insert(@RequestBody WaterSieveSettingModel model) {
        if (this.waterSieveSettingService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<WaterSieveSettingModel> showAll() {
        WaterSieveSettingModel model = new WaterSieveSettingModel();
        return this.waterSieveSettingService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public WaterSieveSettingModel update(@RequestBody WaterSieveSettingModel model) {
        if (this.waterSieveSettingService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public WaterSieveSettingModel delete(@RequestBody WaterSieveSettingModel model) {
        if (this.waterSieveSettingService.deleteById(model)) {
            return model;
        }
        return null;
    }

    @RequestMapping("addList")
    public Map<String, Object> addList(@RequestBody List<WaterSieveSettingModel> list) {
        return waterSieveSettingService.addList(list);
    }
}