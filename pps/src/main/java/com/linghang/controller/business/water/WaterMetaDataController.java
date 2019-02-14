package com.linghang.controller.business.water;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.linghang.enums.water.WaterWaringType;
import com.linghang.model.business.water.WaterMetaDataModel;
import com.linghang.model.business.water.WaterMetadataAggregateModel;
import com.linghang.model.business.water.WaterMetadataResultModel;
import com.linghang.model.business.water.WaterStaticModel;
import com.linghang.service.business.water.WaterMetaDataService;
import com.linghang.service.business.water.WaterMetadataAggregateService;
import com.linghang.service.business.water.WaterMetadataResultService;
import com.linghang.service.business.water.WaterWarningMessageService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by dell on 2018/12/19.
 * 沥青元数据 Controller
 */
@RestController
@RequestMapping("waterMetaData")
public class WaterMetaDataController {
    private static final Logger LOGGER = LoggerFactory.getLogger(WaterMetaDataController.class);


    @Autowired
    private WaterMetaDataService waterMetaDataService;

    @Autowired
    private WaterMetadataResultService resultService;

    @Autowired
    private WaterMetadataAggregateService aggregateService;

    @Autowired
    private WaterWarningMessageService waterWarningMessageService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("business/water/waterMetaData");
        return mv;
    }

    @RequestMapping("staticPage")
    public ModelAndView staticPage(ModelAndView mv) {
        mv.setViewName("business/water/waterStaticData");
        return mv;
    }

    /**
     * 获取站点统计信息
     *
     * @param staticModel
     * @return
     */
    @RequestMapping("getStationStaticData")
    public List<WaterStaticModel> getStationStaticData(WaterStaticModel staticModel) {
        return this.waterMetaDataService.getStationStaticData(staticModel);
    }


    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public WaterMetaDataModel insert(@RequestBody WaterMetaDataModel model) {
        if (this.waterMetaDataService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<WaterMetaDataModel> showAll() {
        WaterMetaDataModel model = new WaterMetaDataModel();
        return this.waterMetaDataService.selectByModel(model);
    }

    /**
     * 获取统计信息
     *
     * @param stationId
     * @param searchTime
     * @return
     */
    @RequestMapping("getCountStatistic")
    public Map<String, Object> getCountStatistic(Long stationId, String searchTime) {
        return resultService.getCountStatistic(stationId, searchTime);
    }

    /**
     * 按模型选择
     */
    @ResponseBody
    @RequestMapping("getWaterWeightDataByParams")
    public PageInfo<WaterMetaDataModel> getWaterWeightDataByParams(WaterMetaDataModel waterMetaDataModel) {
        return this.waterMetaDataService.selectByOptions(waterMetaDataModel);
    }

    /**
     * 数据级配
     */
    @RequestMapping("getWaterLevelDataByParams")
    public PageInfo<WaterMetadataResultModel> getWaterLevelDataByParams(WaterMetaDataModel metaDataModel) {
        return this.resultService.selectByOptions(metaDataModel);
    }

    /**
     * 数据骨料配比
     */
    @RequestMapping("getWaterAggregateDataByParams")
    public PageInfo<WaterMetadataAggregateModel> getWaterAggregateDataByParams(WaterMetaDataModel waterMetaDataModel) {
        return this.aggregateService.selectByOptions(waterMetaDataModel);
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public WaterMetaDataModel update(@RequestBody WaterMetaDataModel model) {
        if (this.waterMetaDataService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public WaterMetaDataModel delete(@RequestBody WaterMetaDataModel model) {
        if (this.waterMetaDataService.deleteById(model)) {
            return model;
        }
        return null;
    }

    @RequestMapping("getSearchTimeMark")
    public List<Map<String, Object>> getSearchTimeMark(Long stationId) {
        return this.waterMetaDataService.getSearchTimeMark(stationId);
    }

    /**
     * 根据重量信息ID获取对应的级配数据 曲线图
     *
     * @param dataId
     * @return
     */
    @RequestMapping("getGradationInfo")
    public WaterMetadataResultModel getGradationInfo(Long dataId) {
        return this.resultService.getGradationInfoNew(dataId);
    }

    /**
     * 接收数据
     *
     * @param model
     * @return
     */
    @RequestMapping("receiveData")
    public String receiveData(@RequestBody WaterMetaDataModel model) {
        return this.waterMetaDataService.receiveData(model);
    }

    /**
     * 测试推送数据页面
     *
     * @param mv
     * @return
     */
    @RequestMapping("sendData")
    public ModelAndView sendData(ModelAndView mv) {
        mv.setViewName("business/water/sendData");
        return mv;
    }

    // http://localhost:8085/waterMetaData/receiveData?stationId=87&formulaCode=cease&cement=12.3&water=11.0&g1=11&g2=11&g3=11&g4=11&g5=11

    /**
     * 新增配方后，处理数据库未处理的数据
     *
     * @param formulaId 配方id
     * @return
     */
    @RequestMapping("processData")
    public Map<String, Object> processData(Long formulaId) {
        return waterMetaDataService.processData(formulaId);
    }


    @RequestMapping("getWaringType")
    public JSONArray getSearchTimeMark() {
        return WaterWaringType.getJson();
    }

}