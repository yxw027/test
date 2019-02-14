package com.linghang.controller.business.water;

import com.alibaba.fastjson.JSON;
import com.linghang.model.business.water.WaterInfoModel;
import com.linghang.service.business.water.WaterInfoService;
import com.linghang.util.ResultUtil;
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
 * 沥青站基础信息 Controller
 */
@RestController
@RequestMapping("waterInfo")
public class WaterInfoController {
    private static final Logger LOGGER = LoggerFactory.getLogger(WaterInfoController.class);


    @Autowired
    private WaterInfoService waterInfoService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv, Long orgId) {
        mv.addObject("orgId", JSON.toJSONString(orgId));
        mv.setViewName("business/water/waterInfo");
        return mv;
    }

    /**
     * 编辑页面
     */
    @RequestMapping("edit")
    public ModelAndView edit(ModelAndView mv, Long stationId, Long orgId) {
        mv.addObject("stationId", JSON.toJSONString(stationId == null ? 0 : stationId));
        mv.addObject("orgId", JSON.toJSONString(orgId == null ? 0 : orgId));
        mv.setViewName("business/water/waterInfoEdit");
        return mv;
    }

    /**
     * 插入数据
     */

    @RequestMapping("insert")
    public Map<String, Object> insert(@RequestBody WaterInfoModel model) {
        return ResultUtil.getSuccessResultMap(this.waterInfoService.insert(model), "保存成功!");
    }

    /**
     * 按模型选择
     */
    @RequestMapping("show")
    public List<WaterInfoModel> show(@RequestBody WaterInfoModel model) {
        return this.waterInfoService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public WaterInfoModel update(@RequestBody WaterInfoModel model) {
        if (this.waterInfoService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public boolean delete(Long id) {
        return this.waterInfoService.deleteById(id);
    }

    /**
     * 按组织机构获取
     */
    @RequestMapping("selectByOrgId")
    public List<WaterInfoModel> selectByOrgId(Long orgId) {
        return this.waterInfoService.getWaterList(orgId);
    }

    @RequestMapping("selectById")
    public WaterInfoModel selectById(Long id) {
        return this.waterInfoService.selectById(id);
    }

    /**
     * 唯一射頻卡号判断
     */
    @RequestMapping("getCardOnly")
    public WaterInfoModel getCardOnly(String cardMark, Long id) {
        return this.waterInfoService.getCardOnly(cardMark, id);
    }


}