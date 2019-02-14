package com.linghang.controller.business.water;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.linghang.enums.asphalt.ExcessDataLevel;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.water.WaterWarningMessageModel;
import com.linghang.service.business.water.WaterWarningMessageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by lvruixing on 2018/12/19.
 * 告警信息表 Controller
 */
@RestController
@RequestMapping("waterWarningMessage")
public class WaterWarningMessageController {
    private static final Logger LOGGER = LoggerFactory.getLogger(WaterWarningMessageController.class);


    @Autowired
    private WaterWarningMessageService waterWarningMessageService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.addObject("excessDataLevel", JSON.toJSONString(ExcessDataLevel.getJson()));
        mv.setViewName("business/water/waterWarningMessage");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public WaterWarningMessageModel insert(@RequestBody WaterWarningMessageModel model) {
        if (this.waterWarningMessageService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("show")
    public List<WaterWarningMessageModel> show(WaterWarningMessageModel messageModel) {
        return this.waterWarningMessageService.selectByModel(messageModel);
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public WaterWarningMessageModel update(@RequestBody WaterWarningMessageModel model) {
        if (this.waterWarningMessageService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public WaterWarningMessageModel delete(@RequestBody WaterWarningMessageModel model) {
        if (this.waterWarningMessageService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 获取超标数据
     *
     * @param stationId
     * @return
     */
    @RequestMapping("getWarningData")
    public PageInfo<WaterWarningMessageModel> getWarningData(Long stationId, KendoOptions options, String startTime, String endTime, Integer warningType, Integer dealStatus) {
        return waterWarningMessageService.getWarningData(options, stationId, startTime, endTime, warningType, dealStatus);
    }

    @RequestMapping("getSearchTimeMark")
    public List<String> getSearchTimeMark(Long stationId) {
        return this.waterWarningMessageService.getSearchTimeMark(stationId);
    }

}