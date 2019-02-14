package com.linghang.controller.business.asphalt;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltFormulaModel;
import com.linghang.model.business.asphalt.param.AsphaltFormulaParamModel;
import com.linghang.model.business.asphalt.param.AsphaltFormulaSieveModel;
import com.linghang.model.business.asphalt.param.FormulaInfoModel;
import com.linghang.service.business.asphalt.AsphaltFormulaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @author wuchen on 2018/12/17.
 * 沥青配方管理 Controller
 */
@RestController
@RequestMapping("asphaltFormula")
public class AsphaltFormulaController {

    @Autowired
    private AsphaltFormulaService asphaltFormulaService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView list(ModelAndView mv, Long asphaltId, Long bidId) {
        mv.addObject("asphaltId", JSON.toJSONString(asphaltId));
        mv.addObject("bidId", JSON.toJSONString(bidId));
        mv.setViewName("business/asphalt/formula");
        return mv;
    }

    /**
     * 新增页面跳转
     *
     * @param mv
     * @return
     */
    @RequestMapping("formulaDetail")
    public ModelAndView formulaDetail(ModelAndView mv, Long dataId, Long asphaltId, Long bidId, String readyOnly) {
        mv.addObject("dataId", JSON.toJSONString(dataId));
        mv.addObject("bidId", JSON.toJSONString(bidId));
        mv.addObject("asphaltId", JSON.toJSONString(asphaltId));
        mv.addObject("readyOnly", JSON.toJSONString(readyOnly));
        mv.setViewName("business/asphalt/formulaDetail");
        return mv;
    }

    /**
     * 跳转总览页面
     */
    @RequestMapping("index")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("business/asphalt/index");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("addFormula")
    public Map<String, Object> addFormula(@RequestBody FormulaInfoModel model) {
        return this.asphaltFormulaService.addFormula(model);
    }

    /**
     * 查询数据
     *
     * @param id
     * @return
     */
    @RequestMapping("getById")
    public Map<String, Object> getById(Long id) {
        return this.asphaltFormulaService.getById(id);
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<AsphaltFormulaParamModel> showAll(Long asphaltId) {
        return this.asphaltFormulaService.selectAll(asphaltId);
    }

    @RequestMapping("searchFormulaByParam")
    public List<AsphaltFormulaParamModel> searchFormulaByParam(Long asphaltId, String searchTime, String type) {
        return this.asphaltFormulaService.searchFormulaByParam(asphaltId, searchTime, type);
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public AsphaltFormulaModel update(@RequestBody AsphaltFormulaModel model) {
        if (this.asphaltFormulaService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public AsphaltFormulaModel delete(@RequestBody AsphaltFormulaModel model) {
        if (this.asphaltFormulaService.updateUnVisible(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按前台条件选择
     */
    @RequestMapping("show")
    public PageInfo<AsphaltFormulaModel> selectByOptions(KendoOptions options) {
        return this.asphaltFormulaService.selectByOptions(options);
    }

    /**
     * 根据配方id查询站点信息及配方筛孔设置信息
     *
     * @param formulaId
     * @return
     */
    @RequestMapping("getAsphaltInfoByFormulaId")
    public AsphaltFormulaSieveModel getAsphaltInfoByFormulaId(Long formulaId) {
        return this.asphaltFormulaService.getAsphaltInfoByFormulaId(formulaId);
    }

    /**
     * 获取详细信息
     *
     * @param formulaId
     * @return
     */
    @RequestMapping("getDetailById")
    public AsphaltFormulaParamModel getDetailById(Long formulaId) {
        return this.asphaltFormulaService.getDetailById(formulaId);
    }


    /**
     * 获取站点下的配方列表
     *
     * @return
     */
    @RequestMapping("getFormulaByAsphaltId")
    public List<Map<String, Object>> getFormulaByAsphaltId(Long asphaltId) {
        return asphaltFormulaService.getFormulaByAsphaltId(asphaltId);
    }
}