package com.linghang.mapper;

import com.linghang.model.WorkAreaModel;

import java.util.List;

/**
 * Created by i_it on 2019/01/08.
 * 工区表 mapper
 */
public interface WorkAreaMapper {
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
    int insert(WorkAreaModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<WorkAreaModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(WorkAreaModel model);

    /**
     * 按主键选择
     */
    WorkAreaModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<WorkAreaModel> selectByModel(WorkAreaModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(WorkAreaModel model);

    /**
     * 按主键更新
     */
    int updateById(WorkAreaModel model);
}