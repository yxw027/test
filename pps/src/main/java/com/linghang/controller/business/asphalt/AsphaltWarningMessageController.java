package com.linghang.controller.business.asphalt;

import com.github.pagehelper.PageInfo;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltWarningMessageModel;
import com.linghang.model.business.asphalt.param.WeeModel;
import com.linghang.service.business.asphalt.AsphaltWarningMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author wuchen on 2018/12/17.
 * 告警信息表 Controller
 */
@RestController
@RequestMapping("asphaltWarningMessage")
public class AsphaltWarningMessageController {

    @Autowired
    private AsphaltWarningMessageService asphaltWarningMessageService;

    /**
     * 跳转页面
     */
    @RequestMapping("list")
    public ModelAndView list(ModelAndView mv) {
        mv.setViewName("business/asphalt/warningMsg");
        return mv;
    }

    /**
     * 按前台条件选择
     */
    @RequestMapping("show")
    public PageInfo<AsphaltWarningMessageModel> selectByOptions(KendoOptions options) {
        return this.asphaltWarningMessageService.selectByOptions(options);
    }

    /**
     * 获取图标分析数据
     *
     * @param asphaltId
     * @return
     */
    @RequestMapping("getWarningData")
    public PageInfo<AsphaltWarningMessageModel> getWarningData(Long asphaltId, KendoOptions options, String startTime, String endTime, Integer warningType, Integer dealStatus) {
        return asphaltWarningMessageService.getWarningData(options, asphaltId, startTime, endTime, warningType, dealStatus);
    }

    /**
     * 获取图标分析数据
     *
     * @param asphaltId
     * @return
     */
    @RequestMapping("getFormulas")
    public List<WeeModel> getFormulas(Long asphaltId, String startTime, String endTime, Integer warningType, Integer dealStatus) {
        return asphaltWarningMessageService.getFormulas(asphaltId, startTime, endTime, warningType, dealStatus);
    }

}