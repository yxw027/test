package com.linghang.controller.appInterface;

import com.linghang.model.business.asphalt.param.AsphaltKendoOptions;
import com.linghang.service.business.asphalt.*;
import com.linghang.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * 沥青拌合站信息相关接口类
 *
 * @author youp
 * @date 2019-01-09
 **/
@RequestMapping("appAsphalt")
@Controller
public class AppAsphaltInterfaces {
    @Autowired
    private AsphaltInfoService infoService;
    @Autowired
    private AsphaltSieveSettingService sieveSettingService;
    @Autowired
    private AsphaltFormulaService formulaService;
    @Autowired
    private AsphaltMetadataService metadataService;
    @Autowired
    private AsphaltMetadataResultService resultService;

    /**
     * 获取拌合站id
     *
     * @param id
     * @return
     */
    @RequestMapping("getAsphaltInfo")
    @ResponseBody
    public Map<String, Object> getAsphaltInfo(Long id) {
        return ResultUtil.getSuccessResultMap(infoService.selectById(id));
    }


    /**
     * 获取级配数据列表
     *
     * @param options 查询参数
     * @return
     */
    @RequestMapping("getSieveList")
    @ResponseBody
    public Map<String, Object> getSieveList(AsphaltKendoOptions options) {
        return ResultUtil.getSuccessResultMap(resultService.selectByOptions(options));
    }

    /**
     * 重量列表
     *
     * @param options
     * @return
     */
    @RequestMapping("getWeightList")
    @ResponseBody
    public Map<String, Object> getWeightList(AsphaltKendoOptions options) {
        return ResultUtil.getSuccessResultMap(metadataService.selectByOptions(options));
    }

    /**
     * 图标分析数据
     *
     * @param asphaltId  拌合站id
     * @param searchTime 查询时间
     * @param formulaId  配方id
     * @return
     */
    @RequestMapping("echartAnalysisData")
    @ResponseBody
    public Map<String, Object> echartAnalysisData(Long asphaltId, String searchTime, Long formulaId) {
        return ResultUtil.getSuccessResultMap(resultService.echartAnalysisData(asphaltId, searchTime, formulaId));
    }


    /**
     * 获取有数据的时间
     *
     * @param asphaltId
     * @return
     */
    @RequestMapping("getSearchTimeMark")
    @ResponseBody
    public Map<String, Object> getSearchTimeMark(Long asphaltId) {
        return ResultUtil.getSuccessResultMap(metadataService.getSearchTimeMark(asphaltId));
    }

    /**
     * 查询当前条件下的配方列表
     *
     * @param asphaltId  拌合站id
     * @param searchTime
     * @param type       weight 重量列表 sieve级配列表
     * @return
     */
    @RequestMapping("searchFormulaByParam")
    @ResponseBody
    public Map<String, Object> searchFormulaByParam(Long asphaltId, String searchTime, String type) {
        return ResultUtil.getSuccessResultMap(formulaService.searchFormulaByParam(asphaltId, searchTime, type));
    }

    /**
     * 獲取配方詳細信息
     *
     * @param formulaId
     * @return
     */
    @RequestMapping("getFormulaDetail")
    @ResponseBody
    public Map<String, Object> getFormulaDetail(Long formulaId) {
        return ResultUtil.getSuccessResultMap(formulaService.getDetailById(formulaId));
    }

    /**
     * 獲取級配信息
     *
     * @param formulaId
     * @return
     */
    @RequestMapping("getSieveDetail")
    @ResponseBody
    public Map<String, Object> getSieveDetail(Long formulaId) {
        return ResultUtil.getSuccessResultMap(sieveSettingService.selectByFormulaId(formulaId));
    }

    /**
     * 获取级配曲线数据
     *
     * @param id 元数据id
     * @return
     */
    @RequestMapping("getGradationInfo")
    @ResponseBody
    public Map<String, Object> getGradationInfo(Long id) {
        return ResultUtil.getSuccessResultMap(resultService.getGradationInfo(id));
    }

    /**
     * 产量统计
     *
     * @param asphaltId 拌合站id
     * @param type      查询类型
     *                  4{总报表  time为null            year为null  startTime格式yyyy-MM-dd 00:00:00   endTime格式为yyyy-MM-dd 23:59:59}
     *                  3{月报表  time格式为yyyy-MM     year为null  startTime为null   endTime为null}
     *                  2{周报表  time格式为 w 第几周    year格式为yyyy 当前年份   startTime为null   endTime为null}
     *                  1{日报表  time格式为yyyy-MM-dd  year为null startTime为null   endTime为null}
     * @param time      查询时间        跟随type赋值
     * @param year      年份            跟随type赋值
     * @param startTime 开始时间   跟随type赋值
     * @param endTime   结束时间     跟随type赋值
     * @return
     */
    @RequestMapping("productionStatistic")
    @ResponseBody
    public Map<String, Object> productionStatistic(Long asphaltId, String time, Integer type, String year, String startTime, String endTime) {
        return ResultUtil.getSuccessResultMap(this.metadataService.dailyStatistical(asphaltId, time, type, year, startTime, endTime));
    }
}
