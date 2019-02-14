package com.linghang.mapper;

import com.linghang.model.GpsDataGroupModel;
import java.util.List;

/**
 * Created by i_it on 2019/01/10.
 * 摊铺统计 mapper
 */
public interface GpsDataGroupMapper {
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
    int insert(GpsDataGroupModel model);
    /**
     * 插入多条数据
     */
    int insertList(List<GpsDataGroupModel> models);
    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(GpsDataGroupModel model);
    /**
     * 按主键选择
     */
    GpsDataGroupModel selectById(Long id);
    /**
     * 按模型选择
     */
    List<GpsDataGroupModel> selectByModel(GpsDataGroupModel model);
    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(GpsDataGroupModel model);
    /**
     * 按主键更新
     */
    int updateById(GpsDataGroupModel model);

    /**
     * 按模型选择
     */
    List<GpsDataGroupModel> selectCountByModel(GpsDataGroupModel model);
}