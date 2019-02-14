package com.linghang.mapper.business.asphalt;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltWarningConfigModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author wuchen on 2018/12/17.
 * 告警设置表 mapper
 */
public interface AsphaltWarningConfigMapper {
    /**
     * 按主键删除
     *
     * @param id 告警设置表ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @param ids 告警设置表ID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入告警设置表数据
     *
     * @param model 告警设置表数据
     * @return 影响行数
     */
    int insert(AsphaltWarningConfigModel model);

    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<AsphaltWarningConfigModel> models);

    /**
     * 插入告警设置表数据,字段为空时不插入
     *
     * @param model 告警设置表数据
     * @return 影响行数
     */
    int insertSelective(AsphaltWarningConfigModel model);

    /**
     * 按主键选择
     *
     * @param id 告警设置表ID
     * @return 告警设置表Model
     */
    AsphaltWarningConfigModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 告警设置表集合
     */
    List<AsphaltWarningConfigModel> selectByModel(AsphaltWarningConfigModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @return 告警设置表集合
     */
    List<AsphaltWarningConfigModel> selectByOptions(@Param("options") KendoOptions options);

    /**
     * 按主键更新告警设置表,字段为空时不更新
     *
     * @param model 告警设置表Model
     * @return 影响行数
     */
    int updateByIdSelective(AsphaltWarningConfigModel model);

    /**
     * 按主键更新告警设置表
     *
     * @param model 告警设置表Model
     * @return 影响行数
     */
    int updateById(AsphaltWarningConfigModel model);

    /**
     * 查询配方所属的告警信息列表
     *
     * @param formulaId
     * @return
     */
    List<AsphaltWarningConfigModel> selectByFormulaId(Long formulaId);

    /**
     * 更新数据不可见
     *
     * @param id
     * @return
     */
    int updateUnIsVisible(Long id);
}