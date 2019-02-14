package com.linghang.controller.base;

import com.linghang.model.base.UserOrgLinkModel;
import com.linghang.service.base.UserOrgLinkService;
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
 * Created by i_it on 2018/12/14.
 * 用户组织机构权限 Controller
 */
@RestController
@RequestMapping("userOrgLink")
public class UserOrgLinkController {
    private static final Logger LOGGER = LoggerFactory.getLogger(UserOrgLinkController.class);


    @Autowired
    private UserOrgLinkService userOrgLinkService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("userorglink");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("userOrgLink:insert")
    @RequestMapping("insert")
    public UserOrgLinkModel insert(@RequestBody UserOrgLinkModel model) {
        if (this.userOrgLinkService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("userOrgLink:showAll")
    @RequestMapping("showAll")
    public List<UserOrgLinkModel> showAll() {
        UserOrgLinkModel model = new UserOrgLinkModel();
        return this.userOrgLinkService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("userOrgLink:update")
    @RequestMapping("update")
    public UserOrgLinkModel update(@RequestBody UserOrgLinkModel model) {
        if (this.userOrgLinkService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("userOrgLink:delete")
    @RequestMapping("delete")
    public UserOrgLinkModel delete(@RequestBody UserOrgLinkModel model) {
        if (this.userOrgLinkService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按组织机构ID选择
     */
    @RequiresPermissions("userOrgLink:show")
    @RequestMapping("selectByUserId")
    public List<UserOrgLinkModel> selectByUserId(Long userId) {
        return this.userOrgLinkService.selectByUserId(userId);
    }
}