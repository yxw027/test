package com.linghang.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.linghang.enums.Status;
import com.linghang.enums.TrimbleInfoBrand;
import com.linghang.enums.TrimbleInfoType;
import com.linghang.model.TrimbleInfoModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.service.TrimbleInfoService;
import com.linghang.service.base.OrganizationService;
import com.linghang.util.Util;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @author liuhao on 2018/11/01.
 * 移动端基础信息 Controller
 */
@RestController
@RequestMapping("trimble")
public class TrimbleInfoController {

    @Autowired
    private TrimbleInfoService trimbleInfoService;
    @Autowired
    private OrganizationService organizationService;


    /**
     * 跳转页面
     */
    @RequestMapping("manage")
    public ModelAndView list(ModelAndView mv) {
        mv.addObject("orgModels", JSON.toJSONString(this.organizationService.selectAll()));
        mv.addObject("status", Status.getJsonString());
        mv.addObject("brand", TrimbleInfoBrand.getJsonString());
        mv.addObject("type", TrimbleInfoType.getJsonString());
        mv.setViewName("business/trimble/trimbleManage");
        return mv;
    }

    /**
     * 跳转页面
     */
    @RequestMapping("debug")
    public ModelAndView debug(ModelAndView mv) {
        mv.setViewName("business/trimble/debug");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("trimbleInfo:insert")
    @RequestMapping("insert")
    public TrimbleInfoModel insert(@RequestBody TrimbleInfoModel model) {
        if (this.trimbleInfoService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("trimbleInfo:show")
    @RequestMapping("showByOptions")
    public PageInfo<TrimbleInfoModel> showByOptions(KendoOptions options, Long orgId) {
        return this.trimbleInfoService.selectByOptions(options, orgId);
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("trimbleInfo:show")
    @RequestMapping("showByOrgId")
    public List<TrimbleInfoModel> showByOrgId(Long orgId) {
        TrimbleInfoModel trimbleInfoModel = new TrimbleInfoModel();
        trimbleInfoModel.setOrgId(orgId);
        return this.trimbleInfoService.selectByModel(trimbleInfoModel);
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("trimbleInfo:update")
    @RequestMapping("update")
    public TrimbleInfoModel update(@RequestBody TrimbleInfoModel model) {
        if (this.trimbleInfoService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("trimbleInfo:delete")
    @RequestMapping("delete")
    public TrimbleInfoModel delete(@RequestBody TrimbleInfoModel model) {
        if (this.trimbleInfoService.deleteById(model)) {
            return model;
        }
        return null;
    }

    @RequiresPermissions("trimbleInfo:select")
    @RequestMapping("checkSn")
    public Map<String, Object> checkSn(Long id, String loginName) {
        return Util.getResultMap(this.trimbleInfoService.checkSn(id, loginName));
    }

}