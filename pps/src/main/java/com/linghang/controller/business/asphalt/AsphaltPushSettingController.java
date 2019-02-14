package com.linghang.controller.business.asphalt;

import com.github.pagehelper.PageInfo;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltPushSettingModel;
import com.linghang.service.business.asphalt.AsphaltPushSettingService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @author wuchen on 2018/12/17.
 * 通知设置表 Controller
 */
@RestController
@RequestMapping("asphaltPushSetting")
public class AsphaltPushSettingController {

    @Autowired
    private AsphaltPushSettingService asphaltPushSettingService;

    /**
     * 跳转页面
     */
    @RequestMapping("list")
    public ModelAndView list(ModelAndView mv) {
        mv.setViewName("asphaltpushsetting");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public AsphaltPushSettingModel insert(@RequestBody AsphaltPushSettingModel model) {
        if (this.asphaltPushSettingService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<AsphaltPushSettingModel> showAll() {
        AsphaltPushSettingModel model = new AsphaltPushSettingModel();
        return this.asphaltPushSettingService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public AsphaltPushSettingModel update(@RequestBody AsphaltPushSettingModel model) {
        if (this.asphaltPushSettingService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public AsphaltPushSettingModel delete(@RequestBody AsphaltPushSettingModel model) {
        if (this.asphaltPushSettingService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按前台条件选择
     */
    @RequestMapping("show")
    public PageInfo<AsphaltPushSettingModel> selectByOptions(KendoOptions options) {
        return this.asphaltPushSettingService.selectByOptions(options);
    }

    /**
     * 按前台条件选择
     */
    @RequestMapping("insertList")
    public Map<String, Object> selectByOptions(@RequestBody List<AsphaltPushSettingModel> models) {
        return this.asphaltPushSettingService.insertList(models);
    }


    /**
     * 获取站点预警信息
     */
    @RequestMapping("getWarningPhone")
    public List<AsphaltPushSettingModel> getWarningPhone(Long asphaltId) {
        return this.asphaltPushSettingService.getWarningPhone(asphaltId);
    }
}