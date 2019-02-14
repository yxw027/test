package com.linghang.mapper.business.asphalt;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltWarningNoteConfigModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author wuchen on 2018/12/27.
 * 沥青站报警短信配置 mapper
 */
public interface AsphaltWarningNoteConfigMapper {
    /**
     * 按主键删除
     *
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入李轻沾报警短信配置数据
     *
     * @return 影响行数
     */
    int insert(AsphaltWarningNoteConfigModel model);

    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<AsphaltWarningNoteConfigModel> models);

    /**
     * @return 影响行数
     */
    int insertSelective(AsphaltWarningNoteConfigModel model);

    /**
     * 按主键选择
     *
     * @return 李轻沾报警短信配置Model
     */
    AsphaltWarningNoteConfigModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 李轻沾报警短信配置集合
     */
    List<AsphaltWarningNoteConfigModel> selectByModel(AsphaltWarningNoteConfigModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     */
    List<AsphaltWarningNoteConfigModel> selectByOptions(@Param("options") KendoOptions options);

    /**
     * @return 影响行数
     */
    int updateByIdSelective(AsphaltWarningNoteConfigModel model);

    /**
     * @return 影响行数
     */
    int updateById(AsphaltWarningNoteConfigModel model);

    AsphaltWarningNoteConfigModel getWarningPhone(@Param("phone") String phone, @Param("projectId") Long projectId);

    List<AsphaltWarningNoteConfigModel> getAsphaltPhone(@Param("asphaltId") String asphaltId, @Param("level") Integer level);
}