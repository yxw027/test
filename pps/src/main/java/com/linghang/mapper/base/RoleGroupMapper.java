package com.linghang.mapper.base;

import com.linghang.model.base.RoleGroupModel;

import java.util.List;

/**
 * Created by i_it on 2018/07/13.
 * 角色组 mapper
 */
public interface RoleGroupMapper {
    /**
     * 按主键删除
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     */
    int deleteByIds(List<Long> ids);

    /**
     * 按主键批量删除角色成员关系表
     */
    int deleteUserRoleLinkByIds(List<Long> ids);

    /**
     * 插入数据
     */
    int insert(RoleGroupModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<RoleGroupModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(RoleGroupModel model);

    /**
     * 按主键选择
     */
    RoleGroupModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<RoleGroupModel> selectByModel(RoleGroupModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(RoleGroupModel model);

    /**
     * 按主键更新
     */
    int updateById(RoleGroupModel model);

    /**
     * 按主键更新
     */
    List<RoleGroupModel> selectByGroupId(Long groupId);
}