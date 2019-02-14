package com.linghang.mapper.business.water;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.water.WaterWarningMessageModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lvruixing on 2018/12/19.
 * 告警信息表 mapper
 */
public interface WaterWarningMessageMapper {
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
    int insert(WaterWarningMessageModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<WaterWarningMessageModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(WaterWarningMessageModel model);

    /**
     * 按主键选择
     */
    WaterWarningMessageModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<WaterWarningMessageModel> selectByModel(WaterWarningMessageModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(WaterWarningMessageModel model);

    /**
     * 按主键更新
     */
    int updateById(WaterWarningMessageModel model);

    List<WaterWarningMessageModel> getWarningData(@Param("options") KendoOptions options, @Param("stationId") Long stationId, @Param("startTime") String startTime, @Param("endTime") String endTime, @Param("warningType") Integer warningType, @Param("dealStatus") Integer dealStatus);

    List<String> getSearchTimeMark(@Param("stationId") Long stationId);

    WaterWarningMessageModel selectByDataId(@Param("dataId") Long dataId);


}