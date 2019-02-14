package com.linghang.mapper.base;

import com.linghang.model.base.ResourceModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author liuhao on 2017/04/26.
 * 系统资源 mapper
 */
public interface ResourceMapper {
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
    int insert(ResourceModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<ResourceModel> models);

    /**
     * 按主键选择
     */
    ResourceModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<ResourceModel> selectByModel(ResourceModel model);


    /**
     * 按主键更新
     */
    int updateById(ResourceModel model);

    List<String> selectResourceByRoleId(Long roleId);

    List<String> selectResourceByUserId(Long userId);

    /**
     * 更新所有子节点状态
     */
    int updateStatusByRootId(ResourceModel model);

    List<Long> selectIdByRoleId(Long roleId);

    /**
     * 按登录人获取菜单
     */
    List<ResourceModel> getMenuList(@Param("userId") Long userId);
}