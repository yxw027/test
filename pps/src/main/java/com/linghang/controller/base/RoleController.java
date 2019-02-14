package com.linghang.controller.base;

import com.alibaba.fastjson.JSON;
import com.linghang.enums.Status;
import com.linghang.model.base.RoleModel;
import com.linghang.model.base.RoleResourceLinkModel;
import com.linghang.model.base.UserRoleLinkModel;
import com.linghang.service.base.*;
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
 * @author liuhao on 2017/05/10.
 * 角色 Controller
 */
@RestController
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;
    @Autowired
    private ResourceService resourceService;
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private UserRoleLinkService userRoleLinkService;
    @Autowired
    private RoleResourceLinkService roleResourceLinkService;
    @Autowired
    private RoleGroupService roleGroupService;

    /**
     * 跳转页面
     */
    @RequestMapping("manage")
    public ModelAndView manage(ModelAndView mv) {
        mv.addObject("resourceTree", JSON.toJSONString(resourceService.getTreeDate()));
        mv.addObject("orgTreeData", JSON.toJSONString(organizationService.selectAllTree()));
        mv.addObject("roleTree", JSON.toJSONString(this.roleGroupService.selectAllToTreeList()));
        mv.addObject("status", Status.getJsonString());
        mv.setViewName("admin/role");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("role:insert")
    @RequestMapping("insert")
    public RoleModel insert(@RequestBody RoleModel model) {
        if (this.roleService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("role:show")
    @RequestMapping("show")
    public List<RoleModel> show() {
        RoleModel model = new RoleModel();
        return this.roleService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("role:update")
    @RequestMapping("update")
    public RoleModel update(@RequestBody RoleModel model) {
        if (this.roleService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("role:delete")
    @RequestMapping("delete")
    public RoleModel delete(@RequestBody RoleModel model) {
        if (this.roleService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("role:update")
    @RequestMapping("changeUserRole")
    public Map<String, Object> changeUserRole(@RequestBody Map<String, List<UserRoleLinkModel>> map) {
        if (this.userRoleLinkService.deleteVerifyList(map.get("delLinkModels"))) {
            return Util.getResultMap(this.userRoleLinkService.insertVerifyList(map.get("saveLinkModels")));
        }
        return Util.getResultMap(false);
    }

    /**
     * 删除当前角色的资源
     *
     * @param roleId 角色ID
     */
    @RequiresPermissions("role:update")
    @RequestMapping("deleteRoleLinks")
    public Map<String, Object> deleteRoleLinks(Long roleId) {
        return Util.getResultMap(this.roleResourceLinkService.deleteByRoleId(roleId));
    }

    /**
     * 更新当前角色的资源
     */
    @RequiresPermissions("role:update")
    @RequestMapping("updateRoleLinks")
    public Map<String, Object> updateRoleLinks(@RequestBody List<RoleResourceLinkModel> models) {
        return Util.getResultMap(this.roleResourceLinkService.updateRoleLinks(models));
    }
}