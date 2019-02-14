package com.linghang.mapper.business.water;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.water.WaterWarningNoteConfigModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lvruixing on 2019/01/02.
 * 李轻沾报警短信配置 mapper
 */
public interface WaterWarningNoteConfigMapper {
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
    int insert(WaterWarningNoteConfigModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<WaterWarningNoteConfigModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(WaterWarningNoteConfigModel model);

    /**
     * 按主键选择
     */
    WaterWarningNoteConfigModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<WaterWarningNoteConfigModel> selectByModel(WaterWarningNoteConfigModel model);

    List<WaterWarningNoteConfigModel> selectByOptions(@Param("options") KendoOptions options, @Param("projectId") Long projectId);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(WaterWarningNoteConfigModel model);

    /**
     * 按主键更新
     */
    int updateById(WaterWarningNoteConfigModel model);

    List<WaterWarningNoteConfigModel> getPhone(@Param("stationId") String stationId, @Param("level") Integer level);

    WaterWarningNoteConfigModel getWarningPhone(@Param("phone") String phone, @Param("projectId") Long projectId);
}