package com.linghang.mapper.base;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.base.UserModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    /**
     * 按主键删除
     */
    int deleteById(Long userId);

    /**
     * 插入数据
     */
    int insert(UserModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<UserModel> models);

    /**
     * 按主键选择
     */
    UserModel selectById(Long userId);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 用户集合
     */
    List<UserModel> selectByModel(UserModel model);

    /**
     * 根据角色ID选择
     *
     * @param roleId 条件
     * @return 用户集合
     */
    List<UserModel> selectByRoleId(@Param("roleId") Long roleId);

    /**
     * 按主键更新
     */
    int updateById(UserModel model);

    /**
     * 按前台条件选择数量
     *
     * @param options 前台条件
     * @param orgId   组织机构ID
     * @return 用户
     */
    Long selectCountByOptions(@Param("options") KendoOptions options, @Param("orgId") Long orgId);

    /**
     * 按前台条件选择详细信息
     *
     * @param options 前台条件
     * @param orgId   组织机构ID
     * @return 用户详细信息集合
     */
    List<UserModel> selectDetailByOptions(@Param("options") KendoOptions options, @Param("orgId") Long orgId);

    /**
     * 按主键更新密码
     */
    int updatePasswordById(UserModel model);

    /**
     * 根据角色选择用户
     *
     * @param orgId  组织机构ID
     * @param roleId 角色ID
     */
    List<UserModel> selectByOrgIdAndRoleId(@Param("orgId") Long orgId, @Param("roleId") Long roleId);

    /**
     * 选择没有当前角色的用户
     *
     * @param orgId  组织机构ID
     * @param roleId 角色ID
     */
    List<UserModel> selectByOrgIdAndNotRoleId(@Param("orgId") Long orgId, @Param("roleId") Long roleId);

    /**
     * 根据登录名查询用户
     *
     * @param loginName
     * @return
     */
    UserModel selectByUserName(@Param("loginName") String loginName);
}