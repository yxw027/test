package com.linghang.controller.business.water;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.param.WarningNoteAsphaltTreeModel;
import com.linghang.model.business.water.WaterWarningNoteConfigModel;
import com.linghang.service.business.water.WaterWarningNoteConfigService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by lvruixing on 2019/01/02.
 * 李轻沾报警短信配置 Controller
 */
@RestController
@RequestMapping("waterWarningNoteConfig")
public class WaterWarningNoteConfigController {
    private static final Logger LOGGER = LoggerFactory.getLogger(WaterWarningNoteConfigController.class);


    @Autowired
    private WaterWarningNoteConfigService waterWarningNoteConfigService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("business/water/waterWarningConfig");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public WaterWarningNoteConfigModel insert(@RequestBody WaterWarningNoteConfigModel model) {
        if (this.waterWarningNoteConfigService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<WaterWarningNoteConfigModel> showAll(KendoOptions options, Long orgId) {
        return this.waterWarningNoteConfigService.selectByModel(options, orgId);
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public WaterWarningNoteConfigModel update(@RequestBody WaterWarningNoteConfigModel model) {
        if (this.waterWarningNoteConfigService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public WaterWarningNoteConfigModel delete(@RequestBody WaterWarningNoteConfigModel model) {
        if (this.waterWarningNoteConfigService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 获取水稳站tree
     */
    @RequestMapping("getTree")
    @ResponseBody
    public List<WarningNoteAsphaltTreeModel> getTree(Long orgId) {
        return this.waterWarningNoteConfigService.getTree(orgId);
    }

    @RequestMapping("getWarningPhone")
    @ResponseBody
    public WaterWarningNoteConfigModel getWarningPhone(String phone, Long projectId) {
        return this.waterWarningNoteConfigService.getWarningPhone(phone, projectId);
    }
}