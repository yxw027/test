package com.linghang.controller;

import com.linghang.model.StakeModel;
import com.linghang.service.StakeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by i_it on 2018/12/06.
 * 桩号详情列表 Controller
 */
@RestController
@RequestMapping("stake")
public class StakeController {
    private static final Logger LOGGER = LoggerFactory.getLogger(StakeController.class);


    @Autowired
    private StakeService stakeService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("stake");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("stake:insert")
    @RequestMapping("insert")
    public StakeModel insert(@RequestBody StakeModel model) {
        if (this.stakeService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("stake:showAll")
    @RequestMapping("showAll")
    public List<StakeModel> showAll() {
        StakeModel model = new StakeModel();
        return this.stakeService.selectByModel(model);
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("stake:show")
    @RequestMapping("show")
    public List<StakeModel> show(Long groupId) {
        StakeModel model = new StakeModel();
        model.setStakeGroupId(groupId);
        return this.stakeService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("stake:update")
    @RequestMapping("update")
    public StakeModel update(@RequestBody StakeModel model) {
        if (this.stakeService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("stake:delete")
    @RequestMapping("delete")
    public StakeModel delete(@RequestBody StakeModel model) {
        if (this.stakeService.deleteById(model)) {
            return model;
        }
        return null;
    }
}