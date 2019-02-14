package com.linghang.mapper.business.asphalt;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltSieveSettingModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author wuchen on 2018/12/17.
 * 筛孔设置表 mapper
 */
public interface AsphaltSieveSettingMapper {
    /**
     * 按主键删除
     *
     * @param id 筛孔设置表ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @param ids 筛孔设置表ID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入筛孔设置表数据
     *
     * @param model 筛孔设置表数据
     * @return 影响行数
     */
    int insert(AsphaltSieveSettingModel model);

    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<AsphaltSieveSettingModel> models);

    /**
     * 插入筛孔设置表数据,字段为空时不插入
     *
     * @param model 筛孔设置表数据
     * @return 影响行数
     */
    int insertSelective(AsphaltSieveSettingModel model);

    /**
     * 按主键选择
     *
     * @param id 筛孔设置表ID
     * @return 筛孔设置表Model
     */
    AsphaltSieveSettingModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 筛孔设置表集合
     */
    List<AsphaltSieveSettingModel> selectByModel(AsphaltSieveSettingModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @return 筛孔设置表集合
     */
    List<AsphaltSieveSettingModel> selectByOptions(@Param("options") KendoOptions options);

    /**
     * 按主键更新筛孔设置表,字段为空时不更新
     *
     * @param model 筛孔设置表Model
     * @return 影响行数
     */
    int updateByIdSelective(AsphaltSieveSettingModel model);

    /**
     * 按主键更新筛孔设置表
     *
     * @param model 筛孔设置表Model
     * @return 影响行数
     */
    int updateById(AsphaltSieveSettingModel model);

    /**
     * 根据配方id查询筛孔设置
     *
     * @param formulaId
     * @return
     */
    List<AsphaltSieveSettingModel> selectByFormulaId(@Param("formulaId") Long formulaId);

    /**
     * 更新上一个版本信息为不可见
     *
     * @param formulaId
     * @return 影响行数
     */
    int updateBeforeVersionVisible(@Param("formulaId") Long formulaId);
}