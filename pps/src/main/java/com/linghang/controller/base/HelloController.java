package com.linghang.controller.base;


import com.linghang.MinaConfig;
import com.linghang.model.base.OrganizationModel;
import com.linghang.service.base.OrganizationService;
import com.linghang.service.base.ResourceService;
import org.apache.mina.core.service.IoAcceptor;
import org.apache.mina.core.session.IoSession;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liuhao
 * 根路径请求Controller
 */
@RestController
public class HelloController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private ResourceService resourceService;
    @Autowired
    private MinaConfig minaConfig;

    /**
     * 用户验证
     *
     * @param username   用户登录名
     * @param password   密码
     * @param rememberMe 记住我
     */
    @PostMapping("login")
    public Map<String, Object> login(String username, String password, boolean rememberMe, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>(1);
        map.put("success", false);
        Subject currentUser = SecurityUtils.getSubject();
        password = new Md5Hash(password).toHex();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        token.setRememberMe(rememberMe);
        try {
            currentUser.login(token);
        } catch (UnknownAccountException uae) {
            logger.info(uae.getMessage());
            map.put("info", "您输入的用户名或密码错误！");
            return map;
        } catch (IncorrectCredentialsException ice) {
            logger.info(ice.getMessage());
            map.put("info", "您输入的用户名或密码错误！");
            return map;
        } catch (LockedAccountException lae) {
            logger.info(lae.getMessage());
            map.put("info", "此用户已经被锁定，无法登录！");
            return map;
        } catch (DisabledAccountException lae) {
            logger.info(lae.getMessage());
            map.put("info", "此用户已经被禁用，无法登录！");
            return map;
        } catch (ExcessiveAttemptsException eae) {
            logger.info(eae.getMessage());
            map.put("info", "您输入的错误次数过多！");
            return map;
        } catch (AuthenticationException ae) {
            logger.info(ae.getMessage());
            map.put("info", "您输入的用户名或密码错误！");
            return map;
        }
        map.put("success", currentUser.isAuthenticated());
        List<OrganizationModel> list = organizationService.getCurrentProject();
        organizationService.setSelectedProject(list != null && list.size() > 0 ? list.get(0) : new OrganizationModel(), request);
        request.getSession().setAttribute("changeProject", list != null && list.size() > 1 ? true : false);
        request.getSession().setAttribute("menus", resourceService.getMenuList());
        SavedRequest savedRequest = WebUtils.getSavedRequest(request);
        map.put("requestURI", savedRequest != null ? savedRequest.getRequestURI() : "/");
        return map;
    }

    /**
     * 登录页面
     */
    @GetMapping("login")
    public ModelAndView login(ModelAndView mv) {
        mv.setViewName("login");
        return mv;
    }

    /**
     * 系统首页
     */
    @GetMapping({"index", "/"})
    public ModelAndView index(ModelAndView modelAndView) {
        modelAndView.setViewName("index");
        return modelAndView;
    }

    /**
     * 系统首页
     */
    @GetMapping("index1")
    public ModelAndView index1(ModelAndView modelAndView) {
        modelAndView.setViewName("index1");
        return modelAndView;
    }

    /**
     * 注册页
     */
    @GetMapping("register")
    public ModelAndView register(ModelAndView modelAndView) {
        modelAndView.setViewName("register");
        return modelAndView;
    }

    /**
     * 忘记密码
     */
    @GetMapping("forgotPassword")
    public ModelAndView forgotPassword(ModelAndView modelAndView) {
        modelAndView.setViewName("forgotPassword");
        return modelAndView;
    }

    /**
     * 个人设置
     */
    @GetMapping("profile")
    public ModelAndView profile(ModelAndView modelAndView) {
        modelAndView.setViewName("profile");
        return modelAndView;
    }

    /**
     * 404页面
     */
    @GetMapping("notFound")
    public ModelAndView notFound(ModelAndView modelAndView) {
        modelAndView.setViewName("404");
        return modelAndView;
    }

    /**
     * 500页面
     */
    @GetMapping("serverError")
    public ModelAndView serverError(ModelAndView modelAndView) {
        modelAndView.setViewName("500");
        return modelAndView;
    }

    @GetMapping("dataList")
    public String dataList() {
        IoAcceptor ctrmAcceptor = minaConfig.getDataAcceptor();
        Map<Long, IoSession> managedSessions = ctrmAcceptor.getManagedSessions();
        StringBuilder aa = new StringBuilder();
        for (IoSession value : managedSessions.values()) {
            aa.append(value.getRemoteAddress()).append("\r\n");
        }
        return aa.toString();
    }

}
