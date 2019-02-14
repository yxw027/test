package com.linghang.mapper.business.water;

import com.linghang.model.business.water.WaterSieveSettingModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by lvruixing on 2018/12/19.
 * 筛孔设置表 mapper
 */
public interface WaterSieveSettingMapper {
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
    int insert(WaterSieveSettingModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<WaterSieveSettingModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(WaterSieveSettingModel model);

    /**
     * 按主键选择
     */
    WaterSieveSettingModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<WaterSieveSettingModel> selectByModel(WaterSieveSettingModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(WaterSieveSettingModel model);

    /**
     * 按主键更新
     */
    int updateById(WaterSieveSettingModel model);

    List<WaterSieveSettingModel> selectByFormulaId(@Param("formulaId") Long formulaId);

    /**
     * 更新上一个版本信息为不可见
     *
     * @param formulaId
     * @return 影响行数
     */
    int updateBeforeVersionVisible(@Param("formulaId") Long formulaId);

    /**
     * 获取级配配置信息
     *
     * @param formulaId
     * @param dataVersion
     * @return
     */
    List<WaterSieveSettingModel> selectByFormulaIdAndSieveVersion(@Param("formulaId") Long formulaId, @Param("dataVersion") Long dataVersion);
}