package com.linghang.mapper.business.water;

import com.linghang.model.business.water.WaterMetaDataModel;
import com.linghang.model.business.water.WaterMetadataAggregateModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by dell on 2018/12/26.
 * 元数据计算结果表 mapper
 */
public interface WaterMetadataAggregateMapper {
    /**
     * 按主键删除
     */
    int deleteById(Long id);

    List<WaterMetadataAggregateModel> selectByOptions(@Param("options") WaterMetaDataModel metaDataModel);

    /**
     * 按主键删除
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入数据
     */
    int insert(WaterMetadataAggregateModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<WaterMetadataAggregateModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(WaterMetadataAggregateModel model);

    /**
     * 按主键选择
     */
    WaterMetadataAggregateModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<WaterMetadataAggregateModel> selectByModel(WaterMetadataAggregateModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(WaterMetadataAggregateModel model);

    /**
     * 按主键更新
     */
    int updateById(WaterMetadataAggregateModel model);

    int updateByDataId(WaterMetadataAggregateModel model);
}