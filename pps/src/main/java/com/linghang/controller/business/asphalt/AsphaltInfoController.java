package com.linghang.controller.business.asphalt;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltDetailModel;
import com.linghang.model.business.asphalt.AsphaltInfoModel;
import com.linghang.model.business.asphalt.AsphaltStatisticsModel;
import com.linghang.model.business.asphalt.param.AsphaltInfoPlanModel;
import com.linghang.service.business.asphalt.AsphaltInfoService;
import com.linghang.util.ResultUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @author wuchen on 2018/12/17.
 * 沥青站基础信息 Controller
 */
@RestController
@RequestMapping("asphaltInfo")
public class AsphaltInfoController {

    @Autowired
    private AsphaltInfoService asphaltInfoService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView list(ModelAndView mv, Long orgId) {
        mv.addObject("orgId", JSON.toJSONString(orgId));
        mv.setViewName("business/asphalt/asphaltList");
        return mv;
    }

    /**
     * 跳转页面
     */
    @RequestMapping("edit")
    public ModelAndView edit(ModelAndView mv, Long asphaltId, Long orgId) {
        mv.addObject("asphaltId", JSON.toJSONString(asphaltId == null ? 0 : asphaltId));
        mv.addObject("orgId", JSON.toJSONString(orgId == null ? 0 : orgId));
        mv.setViewName("business/asphalt/asphaltInfo");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public Map<String, Object> insert(@RequestBody AsphaltInfoModel model) {
        return ResultUtil.getSuccessResultMap(this.asphaltInfoService.insert(model), "保存成功!");
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<AsphaltInfoModel> showAll(Long id) {
        AsphaltInfoModel model = new AsphaltInfoModel();
        return this.asphaltInfoService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public AsphaltInfoModel update(@RequestBody AsphaltInfoModel model) {
        if (this.asphaltInfoService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public Map<String, Object> delete(Long id) {
        if (this.asphaltInfoService.deleteById(id)) {
            return ResultUtil.getSuccessResultMap("删除成功!");
        }
        return ResultUtil.getErrorResultMap("删除失败!");
    }

    /**
     * 按前台条件选择
     */
    @RequestMapping("show")
    public PageInfo<AsphaltInfoModel> selectByOptions(KendoOptions options) {
        return this.asphaltInfoService.selectByOptions(options);
    }

    /**
     * 沥青站Id查询沥青站基本信息
     */
    @RequestMapping("getAsphaltDetail")
    public AsphaltDetailModel getAsphaltDetail(Long asphaltId) {
        return this.asphaltInfoService.getAsphaltDetail(asphaltId);
    }

    /**
     * 沥青站Id查询沥青站基本信息
     */
    @RequestMapping("getStatistical")
    public List<AsphaltStatisticsModel> getAsphaltFormulaStatistical(Long asphaltId) {
        return this.asphaltInfoService.getAsphaltFormulaStatistical(asphaltId);
    }

    /**
     * 沥青站Id查询沥青站基本信息
     */
    @RequestMapping("getAsphalt")
    public AsphaltInfoModel getAsphalt(Long asphaltId) {
        return this.asphaltInfoService.selectById(asphaltId);
    }

    /**
     * 标段Id查询沥青站集合
     */
    @RequestMapping("getAsphaltList")
    public List<AsphaltInfoPlanModel> getAsphaltList(Long orgId) {
        return this.asphaltInfoService.getAsphaltList(orgId);
    }


    /**
     * 主键查询
     *
     * @param id
     * @return
     */
    @RequestMapping("selectById")
    public AsphaltInfoModel selectById(Long id) {
        return this.asphaltInfoService.selectById(id);
    }

    /**
     * 唯一射頻卡号判断
     */
    @RequestMapping("getCardOnly")
    public AsphaltInfoModel getCardOnly(String cardMark, Long id) {
        return this.asphaltInfoService.getCardOnly(cardMark, id);
    }


}