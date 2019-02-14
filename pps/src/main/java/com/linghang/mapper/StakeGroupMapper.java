package com.linghang.mapper;

import com.linghang.model.StakeGroupModel;

import java.util.List;

/**
 * Created by i_it on 2018/11/21.
 * 路段桩号表 mapper
 */
public interface StakeGroupMapper {
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
    int insert(StakeGroupModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<StakeGroupModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(StakeGroupModel model);

    /**
     * 按主键选择
     */
    StakeGroupModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<StakeGroupModel> selectByModel(StakeGroupModel model);

    /**
     * 按模型选择
     */
    List<StakeGroupModel> selectWithDetailByModel(StakeGroupModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(StakeGroupModel model);

    /**
     * 按主键更新
     */
    int updateById(StakeGroupModel model);

    /**
     * 按主键更新
     */
    int updateByNameAndOrgId(StakeGroupModel model);
}