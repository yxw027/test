package com.linghang.controller.appInterface;

import com.linghang.model.business.water.WaterInfoModel;
import com.linghang.model.business.water.WaterMetaDataModel;
import com.linghang.model.business.water.WaterStaticModel;
import com.linghang.service.business.water.*;
import com.linghang.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * app端水稳拌合站接口
 *
 * @author youp
 * @date 2019-01-09
 **/
@RequestMapping("appWater")
@Controller
public class AppWaterInterfaces {
    @Autowired
    private WaterFormulaService formulaService;
    @Autowired
    private WaterMetaDataService metaDataService;
    @Autowired
    private WaterMetadataResultService resultService;
    @Autowired
    private WaterInfoService waterInfoService;
    @Autowired
    private WaterMetadataAggregateService aggregateService;

    /**
     * 获取拌合站信息
     *
     * @param id
     * @return
     */
    @RequestMapping("getWaterInfo")
    @ResponseBody
    public Map<String, Object> getWaterInfo(Long id) {
        return ResultUtil.getSuccessResultMap(waterInfoService.selectById(id));
    }
    /**
     * 获取级配数据列表
     *
     * @param options 查询参数
     * @return
     */
    @RequestMapping("getSieveList")
    @ResponseBody
    public Map<String, Object> getSieveList(WaterMetaDataModel options) {
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
    public Map<String, Object> getWeightList(WaterMetaDataModel options) {
        return ResultUtil.getSuccessResultMap(metaDataService.selectByOptions(options));
    }

    /**
     * 获取骨料配比数据列表
     *
     * @param options
     * @return
     */
    @RequestMapping("getAggregateList")
    @ResponseBody
    public Map<String, Object> getAggregateList(WaterMetaDataModel options) {
        return ResultUtil.getSuccessResultMap(aggregateService.selectByOptions(options));
    }

    /**
     * 查询时间标记
     *
     * @param stationId
     * @return
     */
    @RequestMapping("getSearchTimeMark")
    @ResponseBody
    public Map<String, Object> getSearchTimeMark(Long stationId) {
        return ResultUtil.getSuccessResultMap(metaDataService.getSearchTimeMark(stationId));
    }

    /**
     * 查询当前条件下的配方列表
     *
     * @param stationId  拌合站id
     * @param searchTime 查询时间
     * @param type       weight 重量列表 sieve级配列表 aggregate骨料列表
     * @return
     */
    @RequestMapping("searchFormulaByParam")
    @ResponseBody
    public Map<String, Object> searchFormulaByParam(Long stationId, String searchTime, String type) {
        return ResultUtil.getSuccessResultMap(formulaService.searchFormulaByParam(stationId, searchTime, type));
    }

    /**
     * 查询配方详情
     *
     * @param formulaId
     * @return
     */
    @RequestMapping("selectFormulaDetail")
    @ResponseBody
    public Map<String, Object> selectFormulaDetail(Long formulaId) {
        return ResultUtil.getSuccessResultMap(formulaService.selectDetailById(formulaId));
    }

    /**
     * 获取级配数据信息
     *
     * @param id
     * @return
     */
    @RequestMapping("getWaterGradationInfo")
    @ResponseBody
    public Map<String, Object> getWaterGradationInfo(Long id) {
        return resultService.getWaterGradationInfo(id);
    }

    /**
     * 水稳拌合站产量统计信息
     *
     * @param stationId 站点id
     * @param startTime 开始时间 yyyy-MM-dd 00:00:00
     * @param endTime   结束时间   yyyy-MM-dd 23:59:59
     * @return
     */
    @RequestMapping("productionStatistic")
    @ResponseBody
    public Map<String, Object> productionStatistic(Long stationId, String startTime, String endTime) {
        WaterInfoModel infoModel = waterInfoService.selectById(stationId);
        if (infoModel == null) {
            return ResultUtil.getErrorResultMap("站点信息错误");
        }
        WaterStaticModel model = new WaterStaticModel();
        model.setStationId(stationId);
        model.setStartTime(startTime);
        model.setEndTime(endTime);
        return ResultUtil.getSuccessResultMap(metaDataService.getStationStaticData(model));
    }
}
