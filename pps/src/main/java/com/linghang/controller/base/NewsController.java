package com.linghang.controller.base;

import com.alibaba.fastjson.JSON;
import com.linghang.enums.NewsStatus;
import com.linghang.enums.NewsType;
import com.linghang.model.base.NewsModel;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.base.UserModel;
import com.linghang.service.base.NewsService;
import com.linghang.service.base.OrganizationService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * @author liuhao on 2017/04/20.
 * 新闻表 Controller
 */
@RestController
@RequestMapping("news")
public class NewsController {

    @Autowired
    private NewsService newsService;
    @Autowired
    private OrganizationService organizationService;

    /**
     * 跳转页面
     */
    @RequestMapping("manage")
    public ModelAndView page(ModelAndView mv) {
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        List<OrganizationModel> orgModels;
        if (userModel.getIsAdmin()) {
            orgModels = this.organizationService.selectTree();
        } else {
            orgModels = this.organizationService.selectTree();
        }
        mv.addObject("status", NewsStatus.getJson());
        mv.addObject("type", NewsType.getJson());
        mv.addObject("orgTree", JSON.toJSONString(orgModels));
        mv.setViewName("admin/basicInfo/newsManage");
        return mv;
    }

    /**
     * 跳转页面
     */
    @GetMapping("editor")
    public ModelAndView editor(ModelAndView mv) {
        mv.setViewName("news/newsEditor");
        return mv;
    }

    @RequestMapping("showNews")
    public ModelAndView showNews(ModelAndView mv, Integer id) {
        this.newsService.selectById(id);
        mv.addObject("news", this.newsService.selectById(id));
        mv.setViewName("admin/basicInfo/showNews");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequiresPermissions("news:insert")
    @RequestMapping("insert")
    public NewsModel insert(@RequestBody NewsModel model) {
        if (this.newsService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequiresPermissions("news:show")
    @RequestMapping("show")
    public List<NewsModel> showAll(Long orgId) {
        if (orgId == null) {
            return new ArrayList<>(0);
        }
        NewsModel model = new NewsModel();
        model.setOrgId(orgId);
        return this.newsService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequiresPermissions("news:update")
    @RequestMapping("update")
    public NewsModel update(@RequestBody NewsModel model) {
        if (this.newsService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequiresPermissions("news:delete")
    @RequestMapping("delete")
    public NewsModel delete(@RequestBody NewsModel model) {
        if (this.newsService.deleteById(model)) {
            return model;
        }
        return null;
    }
}