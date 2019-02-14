package com.linghang.mapper.business.asphalt;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltPushSettingModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author wuchen on 2018/12/17.
 * 通知设置表 mapper
 */
public interface AsphaltPushSettingMapper {
    /**
     * 按主键删除
     *
     * @param id 通知设置表ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @param ids 通知设置表ID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入通知设置表数据
     *
     * @param model 通知设置表数据
     * @return 影响行数
     */
    int insert(AsphaltPushSettingModel model);

    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<AsphaltPushSettingModel> models);

    /**
     * 插入通知设置表数据,字段为空时不插入
     *
     * @param model 通知设置表数据
     * @return 影响行数
     */
    int insertSelective(AsphaltPushSettingModel model);

    /**
     * 按主键选择
     *
     * @param id 通知设置表ID
     * @return 通知设置表Model
     */
    AsphaltPushSettingModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 通知设置表集合
     */
    List<AsphaltPushSettingModel> selectByModel(AsphaltPushSettingModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @return 通知设置表集合
     */
    List<AsphaltPushSettingModel> selectByOptions(@Param("options") KendoOptions options);

    /**
     * 按主键更新通知设置表,字段为空时不更新
     *
     * @param model 通知设置表Model
     * @return 影响行数
     */
    int updateByIdSelective(AsphaltPushSettingModel model);

    /**
     * 按主键更新通知设置表
     *
     * @param model 通知设置表Model
     * @return 影响行数
     */
    int updateById(AsphaltPushSettingModel model);

    /**
     * 查询设置的推送信息
     *
     * @param asphaltId
     * @param type
     * @return
     */
    AsphaltPushSettingModel selectByAsphaltIdAndType(@Param("asphaltId") Long asphaltId, @Param("type") Integer type);

    /**
     * 个堂区站点预警信息
     *
     * @param asphaltId
     * @param type
     * @param level
     * @return
     */
    List<AsphaltPushSettingModel> getAsphaltWarning(@Param("asphaltId") Long asphaltId, @Param("type") Integer type, @Param("level") Integer level);
}