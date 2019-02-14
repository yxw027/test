package com.linghang.security;

import com.linghang.enums.Status;
import com.linghang.model.base.UserModel;
import com.linghang.service.base.ResourceService;
import com.linghang.service.base.UserService;
import com.linghang.util.Util;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * @author liuhao on 2015/11/25.
 * shiro Realm
 */
public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;
    @Autowired
    private ResourceService resourceService;

    /**
     * 验证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String loginName = token.getPrincipal().toString();
        if (StringUtils.isEmpty(loginName)) {
            throw new AccountException("用户名不能为空");
        }
        UserModel userModel = new UserModel();
        userModel.setLoginName(loginName);
        List<UserModel> userModels = this.userService.selectByModel(userModel);
        if (userModels.size() != 1) {
            throw new LockedAccountException("没有找到该帐号");
        }
        userModel = userModels.get(0);
        if (Status.DISABLE.getInteger().equals(userModel.getStatus())) {
            throw new LockedAccountException("该账户已禁用.请联系管理员");
        }
        if (userModel.getIsAdmin()) {
            userModel.setOrgId(Util.ADMINORGID);
        }
        return new SimpleAuthenticationInfo(userModel, userModel.getPassword(), getName());
    }

    /**
     * 授权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        UserModel loginModel = (UserModel) principalCollection.getPrimaryPrincipal();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        if (loginModel.getIsAdmin() != null && loginModel.getIsAdmin()) {
            info.addStringPermission("*:*");
            return info;
        }
        List<String> permissionList = this.resourceService.selectResourceByUserId(loginModel.getId());
        info.addStringPermissions(permissionList);
        return info;
    }

}
