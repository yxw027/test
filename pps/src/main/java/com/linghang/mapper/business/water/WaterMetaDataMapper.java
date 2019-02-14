package com.linghang.mapper.business.water;

import com.linghang.model.business.asphalt.AsphaltMetadataResultModel;
import com.linghang.model.business.transport.MaterialInformationModel;
import com.linghang.model.business.water.WaterMetaDataModel;
import com.linghang.model.business.water.WaterStaticModel;
import com.linghang.model.business.water.param.MsgDetailModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by dell on 2018/12/19.
 * 沥青元数据 mapper
 */
public interface WaterMetaDataMapper {
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
    int insert(WaterMetaDataModel model);

    List<WaterStaticModel> getStationStaticData(WaterStaticModel staticModel);

    List<Map<String, Object>> getSearchTimeMark(@Param("stationId") Long stationId);

    /**
     * 插入多条数据
     */
    int insertList(List<WaterMetaDataModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(WaterMetaDataModel model);

    /**
     * 按主键选择
     */
    WaterMetaDataModel selectById(Long id);

    List<WaterMetaDataModel> selectByOptions(@Param("options") WaterMetaDataModel waterMetaDataModel);

    /**
     * 按模型选择
     */
    List<WaterMetaDataModel> selectByModel(WaterMetaDataModel waterMetaDataModel);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(WaterMetaDataModel model);

    /**
     * 按主键更新
     */
    int updateById(WaterMetaDataModel model);

    List<WaterMetaDataModel> selectSumGroupByInfoId();

    /**
     * 查询重复数据
     *
     * @param model
     * @return
     */
    List<WaterMetaDataModel> selectRepeatData(WaterMetaDataModel model);

    /***
     * 查询站点新建配方未处理数据
     * @return
     */
    List<WaterMetaDataModel> selectByFormulaCodeAndStationId(@Param("number") String number, @Param("stationId") Long stationId, @Param("type") int type);

    /**
     * 查询时间范围内的数据
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

    MsgDetailModel selectMsgDetail(@Param("dataId") Long dataId);

    List<WaterStaticModel> getWaterStatisticalData(WaterStaticModel model);

    Map<String, Object> selectWeight(@Param("startTime") String startTime,
                                     @Param("endTime") String endTime,
                                     @Param("mixingId") Long mixingId);
    List<WaterMetaDataModel> getContinuousData(@Param("stationId") Long stationId, @Param("size") int size, @Param("dataId") Long dataId);

    Integer getWarningLevel(@Param("dataId") Long dataId);

}