package com.linghang.mapper.business.water;

import com.linghang.model.business.water.WaterSieveSettingModel;
import com.linghang.model.business.water.WaterWarningConfigModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by dell on 2018/12/19.
 * 告警设置表 mapper
 */
public interface WaterWarningConfigMapper {
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
    int insert(WaterWarningConfigModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<WaterWarningConfigModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(WaterWarningConfigModel model);

    /**
     * 按主键选择
     */
    WaterWarningConfigModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<WaterWarningConfigModel> selectByModel(WaterWarningConfigModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(WaterWarningConfigModel model);

    /**
     * 按主键更新
     */
    int updateById(WaterWarningConfigModel model);

    void updateStatusByFormulaId(@Param("formulaId") Long formulaId, @Param("isVisible") int isVisible);

    List<WaterWarningConfigModel> selectByFormulaId(@Param("formulaId") Long formulaId);

    /**
     * 获取级配配置信息
     *
     * @param formulaId
     * @param dataVersion
     * @return
     */
    List<WaterSieveSettingModel> selectByFormulaIdAndSieveVersion(@Param("formulaId") Long formulaId, @Param("dataVersion") Long dataVersion);

    List<WaterWarningConfigModel> selectByFormulaIdVersion(@Param("formulaId") Long formulaId, @Param("version") Integer version);

}