package com.linghang.controller;


import com.linghang.enums.SourceType;
import com.linghang.enums.Status;
import com.linghang.service.base.OrganizationService;
import com.linghang.service.base.ResourceService;
import com.linghang.service.base.RoleGroupService;
import com.linghang.service.base.RoleService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 *
 */
@RestController
public class LinkController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private ResourceService resourceService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private RoleGroupService roleGroupService;

    /**
     * 外部链接
     */
    @GetMapping("link")
    public ModelAndView adapter(String flag, HttpServletRequest httpRequest) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("403");
        String password = "1";
        if (flag == null || "".equals(flag)) {
            return mv;
        } else {
            httpRequest.setAttribute("flag", flag);
        }

        Subject currentUser = SecurityUtils.getSubject();
        // 前台传过来时应该用JS加密一次
        String minwen = new Md5Hash(password).toHex();
        UsernamePasswordToken token = new UsernamePasswordToken(flag, minwen);

        try {
            currentUser.login(token);
        } catch (Exception e) {
            mv.addObject("info", "访问权限不足！");
            return mv;
        }
        //登录成功
        if (currentUser.isAuthenticated()) {
            mv.addObject("outLink", true);
            mv.setViewName("redirect:machine/show");
        }
        return mv;
    }


    @RequestMapping("resource")
    public ModelAndView page(ModelAndView mv) {
        mv.addObject("status", Status.getJsonString());
        mv.addObject("sourceType", SourceType.getJsonString());
        mv.setViewName("admin/resourceManage1");
        return mv;
    }

    @RequestMapping("menu")
    public List<Object> menu() {
        return resourceService.getMenuList();
    }


}
