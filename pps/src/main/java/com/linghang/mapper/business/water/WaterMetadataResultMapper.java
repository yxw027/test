package com.linghang.mapper.business.water;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.water.WaterMetaDataModel;
import com.linghang.model.business.water.WaterMetadataResultModel;
import com.linghang.model.business.water.param.WaterMetadataResultParamMolde;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by lvruixing on 2018/12/19.
 * 元数据计算结果表 mapper
 */
public interface WaterMetadataResultMapper {
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
    int insert(WaterMetadataResultModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<WaterMetadataResultModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(WaterMetadataResultModel model);

    /**
     * 按主键选择
     */
    WaterMetadataResultModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<WaterMetadataResultModel> selectByModel(WaterMetadataResultModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(WaterMetadataResultModel model);

    /**
     * 按主键更新
     */
    int updateById(WaterMetadataResultModel model);

    List<Map<String, Object>> getCountStatistic(@Param("stationId") Long stationId, @Param("searchTime") String searchTime);

    List<WaterMetadataResultModel> selectByOptions(@Param("options") WaterMetaDataModel metaDataModel);

    List<WaterMetadataResultModel> getWarningData(@Param("options") KendoOptions options, @Param("stationId") Long stationId, @Param("startTime") String startTime, @Param("endTime") String endTime, @Param("warningType") Integer warningType);

    WaterMetadataResultParamMolde getGradationInfo(Long id);
}