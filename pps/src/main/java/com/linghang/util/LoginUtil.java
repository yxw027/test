package com.linghang.util;

import com.linghang.model.base.OrganizationModel;
import com.linghang.model.base.UserModel;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

public class LoginUtil {

    /**
     * 获取系统当前登录帐户
     *
     * @return
     */
    public static UserModel getLoginUser() {
        //获取当前登录帐户
        Subject subject = SecurityUtils.getSubject();
        UserModel principal = (UserModel) subject.getPrincipal();
        return principal;

    }

    /**
     * 获取当前项目
     *
     * @return
     */
    public static OrganizationModel getCurrentProject() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        Object object = request.getSession().getAttribute("currentProject");
        return object == null ? new OrganizationModel() : (OrganizationModel) request.getSession().getAttribute("currentProject");
    }

}
