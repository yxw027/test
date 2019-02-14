package com.linghang.mapper.business.water;

import com.linghang.model.business.water.WaterPushSettingModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lvruixing on 2018/12/19.
 * 通知设置表 mapper
 */
public interface WaterPushSettingMapper {
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
    int insert(WaterPushSettingModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<WaterPushSettingModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(WaterPushSettingModel model);

    /**
     * 按主键选择
     */
    WaterPushSettingModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<WaterPushSettingModel> selectByModel(WaterPushSettingModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(WaterPushSettingModel model);

    /**
     * 按主键更新
     */
    int updateById(WaterPushSettingModel model);

    /**
     * 个堂区站点预警信息
     *
     * @param asphaltId
     * @param type
     * @param level
     * @return
     */
    List<WaterPushSettingModel> getWarning(@Param("stationId") Long stationId, @Param("type") Integer type, @Param("level") Integer level);

    /**
     * 查询设置的推送信息
     *
     * @param asphaltId
     * @param type
     * @return
     */
    WaterPushSettingModel selectByStationIdAndType(@Param("asphaltId") Long asphaltId, @Param("type") Integer type);
}