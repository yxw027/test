package com.linghang.controller.business.asphalt;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.linghang.enums.asphalt.AsphaltWarningType;
import com.linghang.enums.asphalt.ExcessDataLevel;
import com.linghang.model.business.asphalt.AsphaltMetadataModel;
import com.linghang.model.business.asphalt.AsphaltStatisticsReportModel;
import com.linghang.model.business.asphalt.param.AsphaltKendoOptions;
import com.linghang.model.business.asphalt.param.WeeModel;
import com.linghang.service.business.asphalt.AsphaltMetadataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @author wuchen on 2018/12/17.
 * 沥青元数据 Controller
 */
@RestController
@RequestMapping("asphaltMetadata")
public class AsphaltMetadataController {

    @Autowired
    private AsphaltMetadataService asphaltMetadataService;

    /**
     * 实时数据页面跳转
     */
    @RequestMapping("today")
    public ModelAndView list(ModelAndView mv) {
        mv.setViewName("business/asphalt/today");
        return mv;
    }

    /**
     * 报表页面跳转
     */
    @RequestMapping("report")
    public ModelAndView report(ModelAndView mv) {
        mv.setViewName("business/asphalt/AsphaltReport");
        return mv;
    }

    /**
     * 统计页面
     */
    @RequestMapping("statistical")
    public ModelAndView statistical(ModelAndView mv) {
        mv.setViewName("business/asphalt/statistical");
        return mv;
    }

    /**
     * 统计页面
     */
    @RequestMapping("warning")
    public ModelAndView warning(ModelAndView mv) {
        mv.addObject("excessDataLevel", JSON.toJSONString(ExcessDataLevel.getJson()));
        mv.setViewName("business/asphalt/warning");
        return mv;
    }


    /**
     * 测试推送数据页面
     *
     * @param mv
     * @return
     */
    @RequestMapping("sendData")
    public ModelAndView sendData(ModelAndView mv) {
        mv.setViewName("business/asphalt/sendData");
        return mv;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<AsphaltMetadataModel> showAll() {
        AsphaltMetadataModel model = new AsphaltMetadataModel();
        return this.asphaltMetadataService.selectByModel(model);
    }

    /**
     * 按前台条件选择
     */
    @RequestMapping("show")
    public PageInfo<AsphaltMetadataModel> selectByOptions(AsphaltKendoOptions options) {
        return this.asphaltMetadataService.selectByOptions(options);
    }

    /**
     * 接收数据
     *
     * @param model
     * @return
     */
    @RequestMapping("receiveData")
    public String receiveData(@RequestBody AsphaltMetadataModel model) {
        return this.asphaltMetadataService.receiveData(model);
    }

    /**
     * 接收数据
     *
     * @return
     */
    @RequestMapping("dailyStatistical")
    public List<AsphaltStatisticsReportModel> dailyStatistical(Long asphaltId, String time, Integer type, String year, String startTime, String endTime) {
        return this.asphaltMetadataService.dailyStatistical(asphaltId, time, type, year, startTime, endTime);
    }

    /**
     * 接收数据
     */
    @RequestMapping("getWeek")
    public List<WeeModel> getWeek(Long asphaltId, String year) {
        return this.asphaltMetadataService.getWeek(asphaltId, year);
    }

    /**
     * 查询有数据的日期
     *
     * @param asphaltId
     * @return
     */
    @RequestMapping("getSearchTimeMark")
    public List<Map<String, Object>> getSearchTimeMark(Long asphaltId) {
        return this.asphaltMetadataService.getSearchTimeMark(asphaltId);
    }

    /**
     * 新增配方后，处理数据库未处理的数据
     *
     * @param formulaId 配方id
     * @return
     */
    @RequestMapping("processData")
    public Map<String, Object> processData(Long formulaId) {
        return asphaltMetadataService.processData(formulaId);
    }

    /**
     * 查询月有数据的日期
     *
     * @param asphaltId
     * @return
     */
    @RequestMapping("getSearchTimeMonthMark")
    public List<String> getSearchTimeMonthMark(Long asphaltId) {
        return this.asphaltMetadataService.getSearchTimeMonthMark(asphaltId, 1);
    }

    /**
     * 查询月有数据的日期
     *
     * @param asphaltId
     * @return
     */
    @RequestMapping("getSearchTimeYearMark")
    public List<String> getSearchTimeYearMark(Long asphaltId) {
        return this.asphaltMetadataService.getSearchTimeMonthMark(asphaltId, 2);
    }

    @RequestMapping("insert")
    public String insert(@RequestBody String json) {
        if (StringUtils.isEmpty(json)) {
            return "fail";
        }
        return "success";
    }

    /**
     * 获取预警级别
     *
     * @return
     */
    @RequestMapping("getWaringType")
    public JSONArray getSearchTimeMark() {
        return AsphaltWarningType.getJson();
    }
}