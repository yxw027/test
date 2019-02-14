package com.linghang.mapper;

import com.linghang.model.StakeModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by i_it on 2018/12/06.
 * 桩号详情列表 mapper
 */
public interface StakeMapper {
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
    int insert(StakeModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<StakeModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(StakeModel model);

    /**
     * 按主键选择
     */
    StakeModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<StakeModel> selectByModel(StakeModel model);

    /**
     * 按组ID选择
     */
    List<StakeModel> selectByGroupId(@Param("stakeGroupId") Long stakeGroupId);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(StakeModel model);

    /**
     * 按主键更新
     */
    int updateById(StakeModel model);

    /**
     * 按组主键删除
     */
    int deleteByGroupId(Long stakeGroupId);
}