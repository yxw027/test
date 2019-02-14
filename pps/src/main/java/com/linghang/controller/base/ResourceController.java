package com.linghang.controller.base;

import com.linghang.enums.SourceType;
import com.linghang.enums.Status;
import com.linghang.model.base.ResourceModel;
import com.linghang.service.base.ResourceService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @author liuhao on 2017/04/26.
 * 系统资源 Controller
 */
@RestController
@RequestMapping("resource")
public class ResourceController {

    @Autowired
    private ResourceService resourceService;

    /**
     * 跳转页面
     */
    @RequiresPermissions("resource:select")
    @RequestMapping("manage")
    public ModelAndView page(ModelAndView mv) {
        mv.addObject("status", Status.getJsonString());
        mv.addObject("sourceType", SourceType.getJsonString());
        mv.setViewName("admin/resource");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("resource:insert")
    @RequestMapping("insert")
    public ResourceModel insert(@RequestBody ResourceModel model) {
        if (this.resourceService.insert(model)) {
            return model;
        }
        return null;
    }


    /**
     * 按模型选择
     */
    @RequiresPermissions("resource:show")
    @RequestMapping("show")
    public List<ResourceModel> show() {
        ResourceModel model = new ResourceModel();
        return this.resourceService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("resource:update")
    @RequestMapping("update")
    public ResourceModel update(@RequestBody ResourceModel model) {
        if (this.resourceService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("resource:update")
    @RequestMapping("updateOrder")
    public Map<String, Object> updateOrder(@RequestBody List<ResourceModel> models) {
        return this.resourceService.updateOrder(models);
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("resource:delete")
    @RequestMapping("delete")
    public ResourceModel delete(@RequestBody ResourceModel model) {
        if (this.resourceService.deleteById(model)) {
            return model;
        }
        return null;
    }

    @RequiresPermissions("resource:select")
    @RequestMapping("selectIdByRoleId")
    public List<Long> selectIdByRoleId(Long roleId) {
        return this.resourceService.selectIdByRoleId(roleId);
    }
}