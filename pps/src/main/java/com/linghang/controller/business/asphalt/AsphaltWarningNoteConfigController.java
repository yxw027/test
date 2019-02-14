package com.linghang.controller.business.asphalt;

import com.github.pagehelper.PageInfo;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltWarningNoteConfigModel;
import com.linghang.model.business.asphalt.param.WarningNoteAsphaltTreeModel;
import com.linghang.service.business.asphalt.AsphaltWarningNoteConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author wuchen on 2018/12/27.
 * 李轻沾报警短信配置 Controller
 */
@RestController
@RequestMapping("asphaltWarningNoteConfig")
public class AsphaltWarningNoteConfigController {

    @Autowired
    private AsphaltWarningNoteConfigService asphaltWarningNoteConfigService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView list(ModelAndView mv) {
        mv.setViewName("business/asphalt/warningConfig");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public AsphaltWarningNoteConfigModel insert(@RequestBody AsphaltWarningNoteConfigModel model) {
        if (this.asphaltWarningNoteConfigService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<AsphaltWarningNoteConfigModel> showAll() {
        return this.asphaltWarningNoteConfigService.selectByModel(new AsphaltWarningNoteConfigModel(null, null, null));
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public AsphaltWarningNoteConfigModel update(@RequestBody AsphaltWarningNoteConfigModel model) {
        if (this.asphaltWarningNoteConfigService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public AsphaltWarningNoteConfigModel delete(@RequestBody AsphaltWarningNoteConfigModel model) {
        if (this.asphaltWarningNoteConfigService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按前台条件选择
     */
    @RequestMapping("show")
    public PageInfo<AsphaltWarningNoteConfigModel> selectByOptions(KendoOptions options) {
        return this.asphaltWarningNoteConfigService.selectByOptions(options);
    }

    /**
     * 获取沥青站树
     */
    @RequestMapping("getAsphaltTree")
    @ResponseBody
    public List<WarningNoteAsphaltTreeModel> getAsphaltTree(Long orgId) {
        return this.asphaltWarningNoteConfigService.getAsphaltTree(orgId);
    }

    /**
     * 手机号唯一判定
     */
    @RequestMapping("getWarningPhone")
    @ResponseBody
    public AsphaltWarningNoteConfigModel getWarningPhone(String phone, Long projectId, Long id) {
        return this.asphaltWarningNoteConfigService.getWarningPhone(phone, projectId, id);
    }
}