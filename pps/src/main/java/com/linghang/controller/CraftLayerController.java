package com.linghang.controller;

import com.github.pagehelper.PageInfo;
import com.linghang.enums.CarType;
import com.linghang.enums.Crafts;
import com.linghang.enums.Layer;
import com.linghang.model.CraftLayerLimitModel;
import com.linghang.model.CraftLayerModel;
import com.linghang.model.CraftLayerParamModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.service.CraftLayerService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * 工艺设置
 *
 * @author Dell on 2019/01/28.
 * 工艺层级 Controller
 */
@RestController
@RequestMapping("craftLayer")
public class CraftLayerController {

    @Autowired
    private CraftLayerService craftLayerService;

    /**
     * 跳转页面
     */
    @RequestMapping("list")
    public ModelAndView list(ModelAndView mv) {
        mv.addObject("carType", CarType.getJsonString());
        mv.addObject("craftsEnum", Crafts.getJsonString());
        mv.addObject("layerEnum", Layer.getJsonString());
        mv.setViewName("business/craftLayer");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("craftLayer:addCraftLayer")
    @RequestMapping("addCraftLayer")
    public Map<String, Object> addCraftLayer(@RequestBody CraftLayerParamModel model) {
        return this.craftLayerService.addCraftLayer(model);
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("craftLayer:showAll")
    @RequestMapping("showAll")
    public List<CraftLayerModel> showAll() {
        CraftLayerModel model = new CraftLayerModel();
        return this.craftLayerService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("craftLayer:update")
    @RequestMapping("update")
    public CraftLayerModel update(@RequestBody CraftLayerModel model) {
        if (this.craftLayerService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("craftLayer:delete")
    @RequestMapping("delete")
    public boolean delete(@RequestBody CraftLayerModel model) {
        return craftLayerService.delete(model);
    }

    /**
     * 按前台条件选择
     */
    @RequiresPermissions("craftLayer:select")
    @RequestMapping("show")
    public PageInfo<CraftLayerLimitModel> selectByOptions(KendoOptions options, Long orgId) {
        return this.craftLayerService.selectByOptions(options, orgId);
    }
}