package com.linghang.controller.base;


import com.linghang.model.base.RoleGroupModel;
import com.linghang.service.base.RoleGroupService;
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
 * Created by i_it on 2018/07/13.
 * 角色组 Controller
 */
@RestController
@RequestMapping("roleGroup")
public class RoleGroupController {
    private static final Logger LOGGER = LoggerFactory.getLogger(RoleGroupController.class);


    @Autowired
    private RoleGroupService roleGroupService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("rolegroup");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("roleGroup:insert")
    @RequestMapping("insert")
    public RoleGroupModel insert(@RequestBody RoleGroupModel model) {
        if (this.roleGroupService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("roleGroup:showAll")
    @RequestMapping("showAll")
    public List<RoleGroupModel> showAll() {
        RoleGroupModel model = new RoleGroupModel();
        return this.roleGroupService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("roleGroup:update")
    @RequestMapping("update")
    public RoleGroupModel update(@RequestBody RoleGroupModel model) {
        if (this.roleGroupService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("roleGroup:delete")
    @RequestMapping("delete")
    public RoleGroupModel delete(@RequestBody RoleGroupModel model) {
        if (this.roleGroupService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("roleGroup:show")
    @RequestMapping("roleTree")
    public List<Object> roleTree() {
        return this.roleGroupService.selectAllToTreeList();
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("roleGroup:delete")
    @RequestMapping("deleteUserRoleLinkByIds")
    public boolean deleteUserRoleLinkByIds(@RequestBody List<Long> ids) {
        return this.roleGroupService.deleteUserRoleLinkByIds(ids);
    }
}