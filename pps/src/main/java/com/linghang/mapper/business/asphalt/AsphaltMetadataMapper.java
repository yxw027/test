package com.linghang.mapper.business.asphalt;

import com.linghang.model.business.asphalt.AsphaltMetadataModel;
import com.linghang.model.business.asphalt.AsphaltStatisticsReportModel;
import com.linghang.model.business.asphalt.param.AsphaltKendoOptions;
import com.linghang.model.business.asphalt.param.WeeModel;
import com.linghang.model.business.transport.MaterialInformationModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author wuchen on 2018/12/17.
 * 沥青元数据 mapper
 */
public interface AsphaltMetadataMapper {
    /**
     * 按主键删除
     *
     * @param id 沥青元数据ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @param ids 沥青元数据ID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入沥青元数据数据
     *
     * @param model 沥青元数据数据
     * @return 影响行数
     */
    int insert(AsphaltMetadataModel model);

    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<AsphaltMetadataModel> models);

    /**
     * 插入沥青元数据数据,字段为空时不插入
     *
     * @param model 沥青元数据数据
     * @return 影响行数
     */
    int insertSelective(AsphaltMetadataModel model);

    /**
     * 按主键选择
     *
     * @param id 沥青元数据ID
     * @return 沥青元数据Model
     */
    AsphaltMetadataModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 沥青元数据集合
     */
    List<AsphaltMetadataModel> selectByModel(AsphaltMetadataModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @return 沥青元数据集合
     */
    List<AsphaltMetadataModel> selectByOptions(@Param("options") AsphaltKendoOptions options);

    /**
     * 按主键更新沥青元数据,字段为空时不更新
     *
     * @param model 沥青元数据Model
     * @return 影响行数
     */
    int updateByIdSelective(AsphaltMetadataModel model);

    /**
     * 按主键更新沥青元数据
     *
     * @param model 沥青元数据Model
     * @return 影响行数
     */
    int updateById(AsphaltMetadataModel model);

    /**
     * 统计报表查询
     *
     * @param map 沥青站Id , 查询时间 , 类型(1:日报表 2:周报表 3:月报表) , 年份
     * @return
     */
    List<AsphaltStatisticsReportModel> dailyStatistical(Map<String, Object> map);

    /**
     * 获取周
     *
     * @param asphaltId
     * @param year
     * @return
     */
    List<WeeModel> getWeek(@Param("asphaltId") Long asphaltId, @Param("year") String year);

    /**
     * 查询重复数据
     *
     * @param model
     * @return
     */
    List<AsphaltMetadataModel> selectRepeatData(AsphaltMetadataModel model);

    /**
     * 查询有数据的日期
     *
     * @param asphaltId
     * @return
     */
    List<Map<String, Object>> getSearchTimeMark(@Param("asphaltId") Long asphaltId);

    /***
     * 查询站点新建配方未处理数据
     * @param asphaltNo
     * @param asphaltId
     * @return
     */
    List<AsphaltMetadataModel> selectByFormulaCodeAndAsphaltId(@Param("asphaltNo") String asphaltNo, @Param("asphaltId") Long asphaltId);

    /**
     * 获取 月 年
     *
     * @param asphaltId
     */
    List<String> getSearchTimeMonthMark(@Param("asphaltId") Long asphaltId, @Param("type") Integer type);

    /**
     * 查询范围内的数据
     *
     * @param startTime
     * @param endTime
     * @param mixingId
     * @return
     */
    List<MaterialInformationModel> selectDataByTime(@Param("startTime") String startTime,
                                                    @Param("endTime") String endTime,
                                                    @Param("mixingId") Long mixingId);

    /**
     * 根据id查询数据
     *
     * @param list
     * @return
     */
    List<Map<String, Object>> selectDataByIds(List<String> list);

    /**
     * 查询拌合站时间段内的生产重量
     *
     * @param startTime
     * @param endTime
     * @param mixingId
     * @return
     */
    Map<String, Object> selectWeight(@Param("startTime") String startTime,
                                     @Param("endTime") String endTime,
                                     @Param("mixingId") Long mixingId);
}