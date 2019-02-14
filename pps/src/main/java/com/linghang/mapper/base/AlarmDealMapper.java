package com.linghang.mapper.base;

import com.linghang.model.base.AlarmDealModel;

import java.util.List;

/**
 * Created by dell on 2019/01/08.
 * 预警处理表 mapper
 */
public interface AlarmDealMapper {
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
    int insert(AlarmDealModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<AlarmDealModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(AlarmDealModel model);

    /**
     * 按主键选择
     */
    AlarmDealModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<AlarmDealModel> selectByModel(AlarmDealModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(AlarmDealModel model);

    /**
     * 按主键更新
     */
    int updateById(AlarmDealModel model);
}