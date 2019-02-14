package com.linghang.controller.business.asphalt;

import com.github.pagehelper.PageInfo;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltSieveSettingModel;
import com.linghang.service.business.asphalt.AsphaltSieveSettingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @author wuchen on 2018/12/17.
 * 筛孔设置表 Controller
 */
@RestController
@RequestMapping("asphaltSieveSetting")
public class AsphaltSieveSettingController {

    @Autowired
    private AsphaltSieveSettingService asphaltSieveSettingService;

    /**
     * 跳转页面
     */
    @RequestMapping("list")
    public ModelAndView list(ModelAndView mv) {
        mv.setViewName("asphaltsievesetting");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public AsphaltSieveSettingModel insert(@RequestBody AsphaltSieveSettingModel model) {
        if (this.asphaltSieveSettingService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 批量插入
     *
     * @param list
     * @return
     */
    @RequestMapping("addList")
    public Map<String, Object> addList(@RequestBody List<AsphaltSieveSettingModel> list) {
        return asphaltSieveSettingService.addList(list);
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<AsphaltSieveSettingModel> showAll(Long formulaId) {
        return this.asphaltSieveSettingService.selectByModel(formulaId);
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public AsphaltSieveSettingModel update(@RequestBody AsphaltSieveSettingModel model) {
        if (this.asphaltSieveSettingService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public AsphaltSieveSettingModel delete(@RequestBody AsphaltSieveSettingModel model) {
        if (this.asphaltSieveSettingService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按前台条件选择
     */
    @RequestMapping("show")
    public PageInfo<AsphaltSieveSettingModel> selectByOptions(KendoOptions options) {
        return this.asphaltSieveSettingService.selectByOptions(options);
    }
}