package com.linghang.mapper.base;

import com.linghang.model.base.UserOrgLinkModel;

import java.util.List;

/**
 * Created by i_it on 2018/12/14.
 * 用户组织机构权限 mapper
 */
public interface UserOrgLinkMapper {
    /**
     * 按主键删除
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入数据
     */
    int insert(UserOrgLinkModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<UserOrgLinkModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(UserOrgLinkModel model);

    /**
     * 按主键选择
     */
    UserOrgLinkModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<UserOrgLinkModel> selectByModel(UserOrgLinkModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(UserOrgLinkModel model);

    /**
     * 按主键更新
     */
    int updateById(UserOrgLinkModel model);


    /**
     * 按UserId选择
     */
    List<UserOrgLinkModel> selectByUserId(Long userId);
}