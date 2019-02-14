package com.linghang.controller;

import com.github.pagehelper.PageInfo;
import com.linghang.enums.Layer;
import com.linghang.model.GpsDataGroupModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.service.GpsDataGroupService;

import java.util.Date;
import java.util.List;

import com.linghang.util.DatetimeUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.xml.crypto.Data;

/**
 * Created by i_it on 2019/01/10.
 * 摊铺统计 Controller
 */
@RestController
@RequestMapping("gpsDataGroup")
public class GpsDataGroupController {
    private static final Logger LOGGER = LoggerFactory.getLogger(GpsDataGroupController.class);


    @Autowired
    private GpsDataGroupService gpsDataGroupService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        Date datatime = new Date();
        mv.addObject("startTime", DatetimeUtil.getDate(DatetimeUtil.plusDay(datatime, -30)));
        mv.addObject("endTime", DatetimeUtil.getDate(datatime));
        mv.addObject("layerMap", Layer.getMapJsonString());
        mv.setViewName("business/draw/gpsDataGroup");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("gpsDataGroup:insert")
    @RequestMapping("insert")
    public GpsDataGroupModel insert(@RequestBody GpsDataGroupModel model) {
        if (this.gpsDataGroupService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("gpsDataGroup:showAll")
    @RequestMapping("showAll")
    public List<GpsDataGroupModel> showAll() {
        GpsDataGroupModel model = new GpsDataGroupModel();
        return this.gpsDataGroupService.selectByModel(model);
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("gpsDataGroup:show")
    @RequestMapping("show")
    public PageInfo<GpsDataGroupModel> show(KendoOptions options, Long workAreaId, Date startTime, Date endTime) {
        return this.gpsDataGroupService.selectCountByModel(options,workAreaId, startTime, endTime);
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("gpsDataGroup:update")
    @RequestMapping("update")
    public GpsDataGroupModel update(@RequestBody GpsDataGroupModel model) {
        if (this.gpsDataGroupService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("gpsDataGroup:delete")
    @RequestMapping("delete")
    public GpsDataGroupModel delete(@RequestBody GpsDataGroupModel model) {
        if (this.gpsDataGroupService.deleteById(model)) {
            return model;
        }
        return null;
    }
}