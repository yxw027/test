package com.linghang.controller.business.water;

import com.alibaba.fastjson.JSON;
import com.linghang.model.business.water.WaterFormulaModel;
import com.linghang.model.business.water.param.WaterFormulaSieveModel;
import com.linghang.service.business.water.WaterFormulaService;
import com.linghang.service.business.water.WaterInfoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * Created by dell on 2018/12/19.
 * 沥青配方表 Controller
 */
@RestController
@RequestMapping("waterFormula")
public class WaterFormulaController {
    private static final Logger LOGGER = LoggerFactory.getLogger(WaterFormulaController.class);


    @Autowired
    private WaterFormulaService waterFormulaService;

    @Autowired
    private WaterInfoService waterInfoService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv, Long stationId, Long bidId) {
        mv.addObject("stationId", JSON.toJSONString(stationId));
        mv.addObject("bidId", JSON.toJSONString(bidId));
        mv.setViewName("business/water/waterFormula");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public WaterFormulaModel insert(@RequestBody WaterFormulaModel model) {
        if (this.waterFormulaService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<WaterFormulaModel> showAll(Long stationId) {
        return this.waterFormulaService.selectAll(stationId);
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public WaterFormulaModel update(@RequestBody WaterFormulaModel model) {
        if (this.waterFormulaService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public WaterFormulaModel delete(@RequestBody WaterFormulaModel model) {
        this.waterFormulaService.updateIsAvailable(model);
        return model;
    }

    /**
     * 骨料配置
     *
     * @param formulaId
     * @return
     */
    @RequestMapping("getWaterInfoByFormulaId")
    public WaterFormulaSieveModel getWaterInfoByFormulaId(Long formulaId, String aggregateName) {
        return this.waterFormulaService.getWaterInfoByFormulaId(formulaId, aggregateName);
    }

    /**
     * 获取级配设置
     *
     * @param formulaId
     * @return
     */
    @RequestMapping("getWaterFormulaSieveByFormulaId")
    public WaterFormulaSieveModel getWaterFormulaSieveByFormulaId(Long formulaId) {
        return this.waterFormulaService.getWaterFormulaSieveByFormulaId(formulaId);
    }

    /**
     * 新增页面跳转
     *
     * @param mv
     * @return
     */
    @RequestMapping("detail")
    public ModelAndView formulaDetail(ModelAndView mv, Long dataId, Long bidId, Long stationId, String readyOnly) {
        mv.addObject("dataId", JSON.toJSONString(dataId));
        mv.addObject("bidId", JSON.toJSONString(bidId));
        mv.addObject("stationId", JSON.toJSONString(stationId));
        mv.addObject("stationInfo", JSON.toJSONString(waterInfoService.selectById(stationId)));
        mv.addObject("readyOnly", JSON.toJSONString(readyOnly));
        mv.setViewName("business/water/waterFormulaDetail");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("addFormula")
    public Map<String, Object> addFormula(@RequestBody Map<String, String> map) {
        return this.waterFormulaService.addFormula(map);
    }

    @RequestMapping("searchFormulaByParam")
    public List<WaterFormulaSieveModel> searchFormulaByParam(Long stationId, String searchTime, String type) {
        return this.waterFormulaService.searchFormulaByParam(stationId, searchTime, type);
    }

}