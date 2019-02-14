package com.linghang.mapper.business.asphalt;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltWarningMessageModel;
import com.linghang.model.business.asphalt.param.WeeModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author wuchen on 2018/12/17.
 * 告警信息表 mapper
 */
public interface AsphaltWarningMessageMapper {
    /**
     * 插入告警信息表数据
     *
     * @param model 告警信息表数据
     * @return 影响行数
     */
    int insert(AsphaltWarningMessageModel model);

    /**
     * 按主键选择
     *
     * @param id 告警信息表ID
     * @return 告警信息表Model
     */
    AsphaltWarningMessageModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 告警信息表集合
     */
    List<AsphaltWarningMessageModel> selectByModel(AsphaltWarningMessageModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @return 告警信息表集合
     */
    List<AsphaltWarningMessageModel> selectByOptions(@Param("options") KendoOptions options);

    int updateByModel(AsphaltWarningMessageModel model1);

    List<AsphaltWarningMessageModel> getWarningData(@Param("options") KendoOptions options, @Param("asphaltId") Long asphaltId, @Param("startTime") String startTime, @Param("endTime") String endTime, @Param("warningType") Integer warningType, @Param("dealStatus") Integer dealStatus);

    List<WeeModel> getFormulas(@Param("asphaltId") Long asphaltId, @Param("startTime") String startTime, @Param("endTime") String endTime, @Param("warningType") Integer warningType, @Param("dealStatus") Integer dealStatus);
}