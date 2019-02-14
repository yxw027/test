package com.linghang.mapper.business.asphalt;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltMetadataModel;
import com.linghang.model.business.asphalt.AsphaltMetadataResultModel;
import com.linghang.model.business.asphalt.param.AsphaltKendoOptions;
import com.linghang.model.business.asphalt.param.AsphaltMetadataResultParamModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author wuchen on 2018/12/17.
 * 元数据计算结果表 mapper
 */
public interface AsphaltMetadataResultMapper {
    /**
     * 按主键删除
     *
     * @param id 元数据计算结果表ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @param ids 元数据计算结果表ID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入元数据计算结果表数据
     *
     * @param model 元数据计算结果表数据
     * @return 影响行数
     */
    int insert(AsphaltMetadataResultModel model);

    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<AsphaltMetadataResultModel> models);

    /**
     * 插入元数据计算结果表数据,字段为空时不插入
     *
     * @param model 元数据计算结果表数据
     * @return 影响行数
     */
    int insertSelective(AsphaltMetadataResultModel model);

    /**
     * 按主键选择
     *
     * @param id 元数据计算结果表ID
     * @return 元数据计算结果表Model
     */
    AsphaltMetadataResultModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 元数据计算结果表集合
     */
    List<AsphaltMetadataResultModel> selectByModel(AsphaltMetadataResultModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @return 元数据计算结果表集合
     */
    List<AsphaltMetadataResultParamModel> selectByOptions(@Param("options") AsphaltKendoOptions options);

    /**
     * 按主键更新元数据计算结果表,字段为空时不更新
     *
     * @param model 元数据计算结果表Model
     * @return 影响行数
     */
    int updateByIdSelective(AsphaltMetadataResultModel model);

    /**
     * 按主键更新元数据计算结果表
     *
     * @param model 元数据计算结果表Model
     * @return 影响行数
     */
    int updateById(AsphaltMetadataResultModel model);

    /**
     * 根据元数据id查询级配信息
     *
     * @param id
     * @return
     */
    AsphaltMetadataResultParamModel getGradationInfo(Long id);

    /**
     * 查询图表分析数据
     *
     * @param asphaltId
     * @param searchTime
     * @param formulaId
     * @return
     */
    List<AsphaltMetadataModel> selectAnalysisData(@Param("asphaltId") Long asphaltId,
                                                  @Param("searchTime") String searchTime,
                                                  @Param("formulaId") Long formulaId);

    /**
     * 查询统计信息
     *
     * @param asphaltId
     * @param searchTime
     * @param formulaId
     * @param type
     * @return
     */
    List<Map<String, Object>> getCountStatistic(@Param("asphaltId") Long asphaltId,
                                                @Param("searchTime") String searchTime,
                                                @Param("formulaId") Long formulaId,
                                                @Param("type") Long type);


    List<AsphaltMetadataResultModel> getWarningData(@Param("options") KendoOptions options, @Param("asphaltId") Long asphaltId, @Param("startTime") String startTime, @Param("endTime") String endTime, @Param("warningType") Integer warningType);

    List<AsphaltMetadataResultModel> getContinuousData( @Param("asphaltId") Long asphaltId, @Param("size") int size);

    List<AsphaltMetadataResultModel> getContinuousLevelData( @Param("asphaltId") Long asphaltId, @Param("size") int size);
}