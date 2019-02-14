package com.linghang.mapper.base;

import com.linghang.model.base.RoleModel;

import java.util.List;

/**
 * @author liuhao on 2017/05/10.
 * 角色 mapper
 */
public interface RoleMapper {
    /**
     * 按主键删除
     *
     * @param id 角色Id
     * @return 数据库影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入数据
     */
    int insert(RoleModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<RoleModel> models);

    /**
     * 按主键选择
     */
    RoleModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<RoleModel> selectByModel(RoleModel model);

    /**
     * 按角色组ID选择
     */
    List<RoleModel> selectByGroupId(Long groupId);

    /**
     * 按主键更新
     */
    int updateById(RoleModel model);
}