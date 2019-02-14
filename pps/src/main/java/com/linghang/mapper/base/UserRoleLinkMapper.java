package com.linghang.mapper.base;

import com.linghang.model.base.UserRoleLinkModel;

import java.util.List;

/**
 * @author liuhao on 2017/05/17.
 * 用户权限关联 mapper
 */
public interface UserRoleLinkMapper {
    /**
     * 按主键删除
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     */
    int deleteByIds(List<Long> ids);

    /**
     * 按模型删除
     */
    int deleteByModel(UserRoleLinkModel model);

    /**
     * 插入数据
     */
    int insert(UserRoleLinkModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<UserRoleLinkModel> models);

    /**
     * 按主键选择
     */
    UserRoleLinkModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<UserRoleLinkModel> selectByModel(UserRoleLinkModel model);

    /**
     * 按主键更新
     */
    int updateById(UserRoleLinkModel model);
}