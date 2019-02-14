package com.linghang.controller.appInterface;

import com.linghang.enums.MachineType;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.base.UserModel;
import com.linghang.model.business.asphalt.AsphaltInfoModel;
import com.linghang.model.business.water.WaterInfoModel;
import com.linghang.service.base.OrganizationService;
import com.linghang.service.base.ResourceService;
import com.linghang.service.base.UserService;
import com.linghang.service.business.asphalt.AsphaltInfoService;
import com.linghang.service.business.water.WaterInfoService;
import com.linghang.util.BeanUtil;
import com.linghang.util.ResultUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * app登录接口相关
 *
 * @author youp
 * @date 2019-01-09
 **/
@Controller
@RequestMapping("app")
public class LoginInterfaces {

    @Autowired
    private UserService userService;
    @Autowired
    private ResourceService resourceService;
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private AsphaltInfoService asphaltInfoService;
    @Autowired
    private WaterInfoService waterInfoService;

    private static final Logger LOGGER = LoggerFactory.getLogger(LoginInterfaces.class);

    /**
     * 登录接口
     *
     * @param username
     * @param password
     * @param request
     * @return
     */
    @PostMapping("login")
    @ResponseBody
    public Map<String, Object> login(String username, String password, HttpServletRequest request) {
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            return ResultUtil.getErrorResultMap("用户名或密码不能为空！");
        }
        Subject currentUser = SecurityUtils.getSubject();
        String hexpwd = new Md5Hash(password).toHex();
        UsernamePasswordToken token = new UsernamePasswordToken(username, hexpwd);
        try {
            currentUser.login(token);
        } catch (UnknownAccountException uae) {
            LOGGER.info("用户名或密码错误", uae);
            return ResultUtil.getErrorResultMap("用户名或密码错误！");
        } catch (IncorrectCredentialsException ice) {
            LOGGER.info("密码错误", ice);
            return ResultUtil.getErrorResultMap("密码错误！");
        } catch (LockedAccountException lae) {
            LOGGER.info("用户已经被锁定不能登录，请与管理员联系！", lae);
            return ResultUtil.getErrorResultMap("用户已经被锁定，请与管理员联系！！");
        } catch (ExcessiveAttemptsException eae) {
            LOGGER.info("该用户已在别处登录！", eae);
            return ResultUtil.getErrorResultMap("该用户已在别处登录！");
        } catch (AuthenticationException ae) {
            LOGGER.info("用户名或密码错误", ae);
            return ResultUtil.getErrorResultMap("用户名或密码错误，请重新输入！");
        }
        if (currentUser.isAuthenticated()) {
            UserModel userModel = (UserModel) currentUser.getPrincipal();
            if (userModel.getIsAdmin()) {
                return ResultUtil.getErrorResultMap("用户名或密码错误，请重新输入！");
            }
            Map<String, Object> res = BeanUtil.transBean2MapFormatNull(userModel, true);
            res.remove("createUserId");
            res.remove("status");
            res.remove("password");
            res.remove("softDog");
            res.remove("createUserName");
            if (userModel.getOrgId() != null) {
                OrganizationModel organizationModel = organizationService.selectById(userModel.getOrgId());
                res.put("organizationModel", BeanUtil.transBean2Map(organizationModel));
            } else {
                return ResultUtil.getErrorResultMap("登录失败，用户所属机构被删除，请重新分配！");
            }
            //查询用户可访问资源
            Map<String, Boolean> resource = resourceService.selectUserResource(userModel.getId());
            res.put("resource", resource);
            return ResultUtil.getSuccessResultMap(res);
        }
        return ResultUtil.getErrorResultMap("登录失败！");
    }

    /**
     * 获取下属管理的标段列表
     *
     * @param request
     * @return
     */
    @RequestMapping("getManagedTender")
    @ResponseBody
    public Map<String, Object> getManagedTender(HttpServletRequest request, Long userId) {
        if (userId == null) {
            return ResultUtil.getErrorResultMap("参数错误");
        }
        UserModel userModel = userService.selectById(userId);
        if (userModel == null) {
            return ResultUtil.getErrorResultMap("用户信息错误");
        }
        List<Map<String, Object>> list = organizationService.getSections(userModel.getOrgId());
        return ResultUtil.getSuccessResultMap(list);
    }


    /**
     * 获取标段下的站点
     *
     * @param request
     * @param tenderId 标段id
     * @param type     类型 {@link com.linghang.enums.MachineType}
     * @return
     */
    @RequestMapping("getManagedSite")
    @ResponseBody
    public Map<String, Object> getManagedSite(HttpServletRequest request, Long tenderId, Integer type) {
        if (type == null || tenderId == null) {
            return ResultUtil.getErrorResultMap("参数错误");
        }
        if (MachineType.SW.getInteger().equals(type)) {
            List<WaterInfoModel> list = waterInfoService.getWaterList(tenderId);
            return ResultUtil.getSuccessResultMap(list == null ? new ArrayList<>() : BeanUtil.formatBeanToKendoList(list, "id", "name"));
        } else if (MachineType.LQ.getInteger().equals(type)) {
            List<AsphaltInfoModel> list = asphaltInfoService.getByOrgId(tenderId);
            return ResultUtil.getSuccessResultMap(list == null ? new ArrayList<>() : BeanUtil.formatBeanToKendoList(list, "id", "name"));
        } else {
            return ResultUtil.getErrorResultMap("查询类型错误");
        }
    }
}
