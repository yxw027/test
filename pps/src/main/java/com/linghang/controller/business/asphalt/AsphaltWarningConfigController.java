package com.linghang.controller.business.asphalt;

import com.github.pagehelper.PageInfo;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltWarningConfigModel;
import com.linghang.service.business.asphalt.AsphaltWarningConfigService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author wuchen on 2018/12/17.
 * 告警设置表 Controller
 */
@RestController
@RequestMapping("asphaltWarningConfig")
public class AsphaltWarningConfigController {

    @Autowired
    private AsphaltWarningConfigService asphaltWarningConfigService;

    /**
     * 跳转页面
     */
    @RequestMapping("list")
    public ModelAndView list(ModelAndView mv) {
        mv.setViewName("asphaltwarningconfig");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public AsphaltWarningConfigModel insert(@RequestBody AsphaltWarningConfigModel model) {
        if (this.asphaltWarningConfigService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<AsphaltWarningConfigModel> showAll() {
        AsphaltWarningConfigModel model = new AsphaltWarningConfigModel();
        return this.asphaltWarningConfigService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public AsphaltWarningConfigModel update(@RequestBody AsphaltWarningConfigModel model) {
        if (this.asphaltWarningConfigService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public AsphaltWarningConfigModel delete(@RequestBody AsphaltWarningConfigModel model) {
        if (this.asphaltWarningConfigService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按前台条件选择
     */
    @RequestMapping("show")
    public PageInfo<AsphaltWarningConfigModel> selectByOptions(KendoOptions options) {
        return this.asphaltWarningConfigService.selectByOptions(options);
    }
}