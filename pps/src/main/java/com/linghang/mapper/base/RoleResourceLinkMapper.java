package com.linghang.mapper.base;

import com.linghang.model.base.RoleResourceLinkModel;

import java.util.List;

/**
 * @author liuhao on 2017/08/04.
 * 角色资源链接表 mapper
 */
public interface RoleResourceLinkMapper {

    /**
     * 插入多条数据
     */
    int insertList(List<RoleResourceLinkModel> models);

    /**
     * 按模型选择
     */
    List<RoleResourceLinkModel> selectByModel(RoleResourceLinkModel model);

    /**
     * 按主键更新
     */
    int updateById(RoleResourceLinkModel model);

    /**
     * 删除角色数据
     */
    int deleteByRoleId(Long roleId);
}