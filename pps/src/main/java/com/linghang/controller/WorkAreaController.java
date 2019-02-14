package com.linghang.controller;

import com.linghang.enums.Layer;
import com.linghang.model.WorkAreaModel;
import com.linghang.service.WorkAreaService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by i_it on 2019/01/08.
 * 工区表 Controller
 */
@RestController
@RequestMapping("workArea")
public class WorkAreaController {
    private static final Logger LOGGER = LoggerFactory.getLogger(WorkAreaController.class);


    @Autowired
    private WorkAreaService workAreaService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.addObject("layerMap", Layer.getMapJsonString());
        mv.setViewName("business/workArea");
        return mv;
    }

    /**
     * 跳转页面
     */
    @RequestMapping("selectWorkArea")
    public ModelAndView cWorkArea(ModelAndView mv) {
        mv.addObject("layerMap", Layer.getMapJsonString());
        mv.setViewName("business/draw/workAreaSelect");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("workArea:insert")
    @RequestMapping("insert")
    public WorkAreaModel insert(@RequestBody WorkAreaModel model) {
        if (this.workAreaService.insert(model)) {

            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("workArea:showAll")
    @RequestMapping("showAll")
    public List<WorkAreaModel> showAll() {
        WorkAreaModel model = new WorkAreaModel();
        return this.workAreaService.selectByModel(model);
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("workArea:show")
    @RequestMapping("show")
    public List<WorkAreaModel> show(Long orgId) {
        if (orgId == null) {
            return new ArrayList<>();
        }
        WorkAreaModel model = new WorkAreaModel();
        model.setOrgId(orgId);
        return this.workAreaService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("workArea:update")
    @RequestMapping("update")
    public WorkAreaModel update(@RequestBody WorkAreaModel model) {
        if (this.workAreaService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("workArea:delete")
    @RequestMapping("delete")
    public WorkAreaModel delete(@RequestBody WorkAreaModel model) {
        if (this.workAreaService.deleteById(model)) {
            return model;
        }
        return null;
    }
}