package com.linghang.service.base;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.enums.Status;
import com.linghang.mapper.base.UserMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.base.UserModel;
import com.linghang.model.base.UserRoleLinkModel;
import com.linghang.util.Util;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;

/**
 * @author liuhao on 2018/02/05.
 * 用户 Service
 */
@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRoleLinkService userRoleLinkService;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long userId) {
        if (userId == null) {
            return false;
        }
        boolean result = this.userMapper.deleteById(userId) >= 0;
        if (result) {
            this.userRoleLinkService.deleteByModel(new UserRoleLinkModel(userId, null));
        }
        return result;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(UserModel user) {
        return user != null && this.deleteById(user.getId());
    }

    /**
     * 插入数据
     */
    public boolean insert(UserModel model) {
        if (model == null) {
            return false;
        }
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        model.setPassword(Util.DEFAULTPASSWORD);
        model.setSoftDog(Util.DEFAULTSOFTTDOG);
        model.setCreateUserId(userModel.getId());
        model.setCreateUserName(userModel.getName());
        model.setCreateTime(new Date());
        return this.userMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<UserModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        Date now = new Date();
        HashMap<String, UserModel> userModelMap = new HashMap<>(models.size());
        for (UserModel model : models) {
            model.setPassword(Util.DEFAULTPASSWORD);
            model.setSoftDog(Util.DEFAULTSOFTTDOG);
            model.setCreateUserId(userModel.getId());
            model.setCreateUserName(userModel.getName());
            model.setCreateTime(now);
            userModelMap.put(model.getLoginName(), model);
        }
        UserModel user;
        List<UserModel> userModels = this.userMapper.selectByModel(new UserModel());
        for (UserModel model : userModels) {
            if (userModelMap.containsKey(model.getLoginName())) {
                user = userModelMap.get(model.getLoginName());
                if (user.getRemark() == null) {
                    user.setRemark("用户登录名重复,已禁用");
                } else {
                    user.setRemark(user.getRemark() + "(用户登录名重复,已禁用)");
                }
                user.setStatus(Status.DISABLE.getInteger());
            }
        }
        if (models.size() > 100) {
            for (List<UserModel> list : Util.getSubList(models, 100)) {
                this.userMapper.insertList(list);
            }
        } else {
            return this.userMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 按主键选择
     */
    public UserModel selectById(Long userId) {
        return userId == null ? null : this.userMapper.selectById(userId);
    }

    /**
     * 按模型选择
     */
    public List<UserModel> selectByModel(UserModel model) {
        return model == null ? new ArrayList<>(0) : this.userMapper.selectByModel(model);
    }

    /**
     * 按前台条件选择详细信息
     *
     * @param options 前台条件
     * @param orgId   组织机构ID
     * @return 用户详细信息集合
     */
    public PageInfo<UserModel> selectDetailByOptions(KendoOptions options, Long orgId) {
        if (options == null || orgId == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize(), false);
        PageInfo<UserModel> userModelPageInfo = new PageInfo<>(this.userMapper.selectDetailByOptions(options, orgId));
        userModelPageInfo.setTotal(this.userMapper.selectCountByOptions(options, orgId));
        return userModelPageInfo;
    }


    /**
     * 按组织机构选择
     */
    public List<UserModel> selectByRoleId(Long roleId) {
        if (roleId == null) {
            return new ArrayList<>(0);
        }
        return this.userMapper.selectByRoleId(roleId);
    }

    /**
     * 按主键更新
     */
    public boolean updateById(UserModel model) {
        return !(model == null || model.getId() == null) && this.userMapper.updateById(model) == 1;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(UserModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.userMapper.insert(model) == 1;
        }
        return this.userMapper.updateById(model) == 1;
    }

    /**
     * 根据角色选择用户
     *
     * @param orgId  组织机构ID
     * @param roleId 角色ID
     */
    public List<UserModel> selectByOrgIdAndRoleId(Long orgId, Long roleId) {
        if (roleId == null) {
            return new ArrayList<>(0);
        }
        return this.userMapper.selectByOrgIdAndRoleId(orgId, roleId);
    }

    /**
     * 选择没有当前角色的用户
     *
     * @param orgId  组织机构ID
     * @param roleId 角色ID
     */
    public List<UserModel> selectByOrgIdAndNotRoleId(Long orgId, Long roleId) {
        if (roleId == null) {
            return new ArrayList<>(0);
        }
        return this.userMapper.selectByOrgIdAndNotRoleId(orgId, roleId);
    }

    /**
     * 修改用户密码
     */
    public boolean changePassword(String oldPwd, String newPwd) {
        if (StringUtils.isEmpty(oldPwd) || StringUtils.isEmpty(newPwd)) {
            return false;
        }
        UserModel userModel = (UserModel) SecurityUtils.getSubject().getPrincipal();
        if (userModel.getIsAdmin()) {
            return false;
        }
        if (!Objects.equals(userModel.getPassword(), new Md5Hash(oldPwd).toHex())) {
            return false;
        }
        userModel.setPassword(new Md5Hash(newPwd).toHex());
        userModel.setSoftDog(Base64.encodeToString(newPwd.getBytes()));
        return this.userMapper.updatePasswordById(userModel) == 1;
    }

    /**
     * 重置密码
     */
    public boolean resetPassword(UserModel model) {
        if (model == null) {
            return false;
        }
        model.setPassword(Util.DEFAULTPASSWORD);
        model.setSoftDog(Util.DEFAULTSOFTTDOG);
        return userMapper.updatePasswordById(model) == 1;
    }

    /**
     * 显示密码
     */
    public String showPassword(Long userId) {
        if (userId == null) {
            return null;
        }
        UserModel userModel = this.userMapper.selectById(userId);
        if (userModel == null) {
            return null;
        }
        return Base64.decodeToString(userModel.getSoftDog());
    }

    /**
     * 检测登录用户名是否重复
     *
     * @param id        用户ID
     * @param loginName 用户登录名
     */
    public boolean checkLoginName(Long id, String loginName) {
        if (StringUtils.isEmpty(loginName)) {
            return false;
        }
        UserModel userModel = new UserModel();
        userModel.setLoginName(loginName);
        List<UserModel> userModels = this.selectByModel(userModel);
        return userModels.size() == 1 && userModels.get(0).getId().equals(id) || userModels.size() == 0;
    }

    /**
     * 检测用户编号是否重复
     *
     * @param id     用户ID
     * @param userNo 用户登录名
     */
    public boolean checkNumber(Long id, String userNo) {
        if (StringUtils.isEmpty(userNo)) {
            return false;
        }
        UserModel userModel = new UserModel();
        userModel.setUserNo(userNo);
        List<UserModel> userModels = this.selectByModel(userModel);
        return userModels.size() == 1 && userModels.get(0).getId().equals(id) || userModels.size() == 0;
    }

    public UserModel selectByUserName(String loginName) {
        if (StringUtils.isEmpty(loginName)) {
            return null;
        }
        return this.userMapper.selectByUserName(loginName);
    }
}
