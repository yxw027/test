package com.linghang.controller.business.water;

import com.linghang.model.business.water.WaterPushSettingModel;
import com.linghang.service.business.water.WaterPushSettingService;
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
 * 通知设置表 Controller
 */
@RestController
@RequestMapping("waterPushSetting")
public class WaterPushSettingController {
    private static final Logger LOGGER = LoggerFactory.getLogger(WaterPushSettingController.class);


    @Autowired
    private WaterPushSettingService waterPushSettingService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("waterpushsetting");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public WaterPushSettingModel insert(@RequestBody WaterPushSettingModel model) {
        if (this.waterPushSettingService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<WaterPushSettingModel> showAll() {
        WaterPushSettingModel model = new WaterPushSettingModel();
        return this.waterPushSettingService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public WaterPushSettingModel update(@RequestBody WaterPushSettingModel model) {
        if (this.waterPushSettingService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public WaterPushSettingModel delete(@RequestBody WaterPushSettingModel model) {
        if (this.waterPushSettingService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 批量插入
     */
    @RequestMapping("insertList")
    public Map<String, Object> insertList(@RequestBody List<WaterPushSettingModel> models) {
        return this.waterPushSettingService.insertList(models);
    }

    /**
     * 获取站点预警信息
     */
    @RequestMapping("getWarningPhone")
    public List<WaterPushSettingModel> getWarningPhone(Long stationId) {
        return this.waterPushSettingService.getWarningPhone(stationId);
    }
}