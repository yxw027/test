package com.linghang.controller.business.water;

import com.linghang.model.business.water.WaterWarningConfigModel;
import com.linghang.service.business.water.WaterWarningConfigService;
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
 * Created by dell on 2018/12/19.
 * 告警设置表 Controller
 */
@RestController
@RequestMapping("waterWarningConfig")
public class WaterWarningConfigController {
    private static final Logger LOGGER = LoggerFactory.getLogger(WaterWarningConfigController.class);


    @Autowired
    private WaterWarningConfigService waterWarningConfigService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("business/water/waterwarningconfig");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public WaterWarningConfigModel insert(@RequestBody WaterWarningConfigModel model) {
        if (this.waterWarningConfigService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<WaterWarningConfigModel> showAll() {
        WaterWarningConfigModel model = new WaterWarningConfigModel();
        return this.waterWarningConfigService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public WaterWarningConfigModel update(@RequestBody WaterWarningConfigModel model) {
        if (this.waterWarningConfigService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public WaterWarningConfigModel delete(@RequestBody WaterWarningConfigModel model) {
        if (this.waterWarningConfigService.deleteById(model)) {
            return model;
        }
        return null;
    }
}