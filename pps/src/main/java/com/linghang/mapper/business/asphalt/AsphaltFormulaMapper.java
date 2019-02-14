package com.linghang.mapper.business.asphalt;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltFormulaModel;
import com.linghang.model.business.asphalt.param.AsphaltFormulaParamModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author wuchen on 2018/12/17.
 * 沥青配方表 mapper
 */
public interface AsphaltFormulaMapper {
    /**
     * 按主键删除
     *
     * @param id 沥青配方表ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @param ids 沥青配方表ID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入沥青配方表数据
     *
     * @param model 沥青配方表数据
     * @return 影响行数
     */
    int insert(AsphaltFormulaModel model);

    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<AsphaltFormulaModel> models);

    /**
     * 插入沥青配方表数据,字段为空时不插入
     *
     * @param model 沥青配方表数据
     * @return 影响行数
     */
    int insertSelective(AsphaltFormulaModel model);

    /**
     * 按主键选择
     *
     * @param id 沥青配方表ID
     * @return 沥青配方表Model
     */
    AsphaltFormulaModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 沥青配方表集合
     */
    List<AsphaltFormulaModel> selectByModel(AsphaltFormulaModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @return 沥青配方表集合
     */
    List<AsphaltFormulaModel> selectByOptions(@Param("options") KendoOptions options);

    /**
     * 按主键更新沥青配方表,字段为空时不更新
     *
     * @param model 沥青配方表Model
     * @return 影响行数
     */
    int updateByIdSelective(AsphaltFormulaModel model);

    /**
     * 按主键更新沥青配方表
     *
     * @param model 沥青配方表Model
     * @return 影响行数
     */
    int updateById(AsphaltFormulaModel model);

    /**
     * 根据配方编号查询配方信息
     *
     * @param formulaCode
     * @param asphaltId
     * @return
     */
    AsphaltFormulaModel selectByFormulaCode(@Param("formulaCode") String formulaCode, @Param("asphaltId") Long asphaltId);

    /**
     * 查询所有配方
     *
     * @param asphaltId
     * @return
     */
    List<AsphaltFormulaParamModel> selectAll(AsphaltFormulaParamModel asphaltId);

    /**
     * 更新数据为不可见
     *
     * @param model
     * @return
     */
    int updateUnVisible(AsphaltFormulaModel model);

    /**
     * 主键查询
     *
     * @param id
     * @return
     */
    AsphaltFormulaParamModel getById(Long id);

    /**
     * 获取详情--配方信息+油石比、温度配置信息
     *
     * @param id
     * @return
     */
    AsphaltFormulaParamModel getDetailById(Long id);

    /**
     * 查询站点下的配方列表
     *
     * @param asphaltId
     * @return
     */
    List<Map<String, Object>> getFormulaByAsphaltId(Long asphaltId);

    /**
     * 跟新级配设置的id
     *
     * @param id
     * @param oldId
     * @return
     */
    int updateAsphaltSieveSetting(@Param("newId") Long id, @Param("oldId") Long oldId);

    /**
     * 更新旧的版本不可见
     *
     * @param oldId
     * @return
     */
    int updateAsphaltSieveSettingVisible(@Param("oldId") Long oldId);

    List<AsphaltFormulaParamModel> searchFormulaByParam(@Param("asphaltId") Long asphaltId, @Param("searchTime") String searchTime);

    List<AsphaltFormulaParamModel> searchFormulaBySieveParam(@Param("asphaltId") Long asphaltId, @Param("searchTime") String searchTime);

    /**
     * 查询拌合站下配方统计信息
     *
     * @param stationId
     * @return
     */
    List<Map<String, Object>> selectStatisticByStationId(@Param("stationId") Long stationId);
}