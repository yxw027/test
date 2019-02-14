package com.linghang.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.linghang.model.StakeGroupModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.service.StakeGroupService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by i_it on 2018/11/21.
 * 路段桩号表 Controller
 */
@RestController
@RequestMapping("stakeGroup")
public class StakeGroupController {
    private static final Logger LOGGER = LoggerFactory.getLogger(StakeGroupController.class);


    @Autowired
    private StakeGroupService stakeGroupService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("business/stakeGroup");
        return mv;
    }

    /**
     * 跳转页面
     */
    @RequestMapping("showStakeInMap")
    public ModelAndView showStakeInMap(ModelAndView mv, Long orgId) {
        mv.setViewName("business/tender/showStakeInMap");
        mv.addObject("stakeGroupList", JSON.toJSONString(stakeGroupService.selectStakeGroupList(orgId)));
        return mv;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("stakeGroup:insert")
    @RequestMapping("insert")
    public StakeGroupModel insert(@RequestBody StakeGroupModel model) {
        if (this.stakeGroupService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("stakeGroup:showAll")
    @RequestMapping("showAll")
    public List<StakeGroupModel> showAll() {
        StakeGroupModel model = new StakeGroupModel();
        return this.stakeGroupService.selectByModel(model);
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("stakeGroup:show")
    @RequestMapping("show")
    public PageInfo<StakeGroupModel> show(KendoOptions options, Long orgId) {
        return this.stakeGroupService.selectByOptions(options, orgId);
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("stakeGroup:update")
    @RequestMapping("update")
    public StakeGroupModel update(@RequestBody StakeGroupModel model) {
        if (this.stakeGroupService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("stakeGroup:delete")
    @RequestMapping("delete")
    public StakeGroupModel delete(@RequestBody StakeGroupModel model) {
        if (this.stakeGroupService.deleteById(model)) {
            return model;
        }
        return null;
    }


    /**
     * 导入
     */
    @RequiresPermissions("stakeGroup:importFile")
    @RequestMapping("importFile")
    public Map<String, Object> importFile(@RequestParam("file") MultipartFile file, Long orgId, HttpServletRequest request) {
        return stakeGroupService.uploadFileExcel(file, orgId);
    }

    @RequiresPermissions("stakeGroup:show")
    @RequestMapping("list")
    public List<StakeGroupModel> list(Long orgId, Integer level) {
        return stakeGroupService.selectStakeGroupList(orgId);
    }


}