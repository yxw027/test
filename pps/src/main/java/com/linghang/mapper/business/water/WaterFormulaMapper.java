package com.linghang.mapper.business.water;

import com.linghang.model.business.water.WaterFormulaModel;
import com.linghang.model.business.water.param.WaterFormulaSieveModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by dell on 2018/12/19.
 * 沥青配方表 mapper
 */
public interface WaterFormulaMapper {
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
    int insert(WaterFormulaModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<WaterFormulaModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(WaterFormulaModel model);

    /**
     * 按主键选择
     */
    WaterFormulaModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<WaterFormulaModel> selectByModel(WaterFormulaModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(WaterFormulaModel model);

    /**
     * 按主键更新
     */
    int updateById(WaterFormulaModel model);

    List<WaterFormulaModel> selectAll(WaterFormulaModel asphaltId);

    /**
     * 获取指定站点默认配方
     *
     * @param stationId
     * @return
     */
    WaterFormulaModel selectDefaultModel(Long stationId);

    WaterFormulaModel selectDefaultModelAndId(WaterFormulaModel model);

    /**
     * 根据配方编号查询配方信息
     *
     * @param formulaCode
     * @return
     */
    WaterFormulaModel selectByFormulaCode(@Param("formulaCode") String formulaCode, @Param("stationId") Long stationId);

    List<WaterFormulaModel> checkParamIsAvailable(WaterFormulaModel waterFormulaModel);

    List<WaterFormulaSieveModel> searchFormulaByParam(@Param("stationId") Long stationId, @Param("searchTime") String searchTime);

    List<WaterFormulaSieveModel> searchFormulaBySieveParam(@Param("stationId") Long stationId, @Param("searchTime") String searchTime);

    List<WaterFormulaSieveModel> searchFormulaByAggregateParam(@Param("stationId") Long stationId, @Param("searchTime") String searchTime);

    /**
     * 获取详情
     *
     * @param id
     * @return
     */
    WaterFormulaModel selectDetailById(@Param("id") Long id);

    /**
     * 查询配方统计信息
     *
     * @param stationId
     * @return
     */
    List<Map<String, Object>> selectStatisticByStationId(@Param("stationId") Long stationId);
}