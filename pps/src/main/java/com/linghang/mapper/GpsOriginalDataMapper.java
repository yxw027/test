package com.linghang.mapper;

import com.linghang.model.GpsDataModel;

import java.util.List;

/**
 * @author liuhao on 2019/01/30.
 * 原始gps数据 mapper
 */
public interface GpsOriginalDataMapper {
    /**
     * 按主键删除
     *
     * @param id 原始gps数据ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @param ids 原始gps数据ID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入原始gps数据数据
     *
     * @param model 原始gps数据数据
     * @return 影响行数
     */
    int insert(GpsDataModel model);

    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<GpsDataModel> models);

    /**
     * 插入原始gps数据数据,字段为空时不插入
     *
     * @param model 原始gps数据数据
     * @return 影响行数
     */
    int insertSelective(GpsDataModel model);

    /**
     * 按主键选择
     *
     * @param id 原始gps数据ID
     * @return 原始gps数据Model
     */
    GpsDataModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 原始gps数据集合
     */
    List<GpsDataModel> selectByModel(GpsDataModel model);

    /**
     * 按主键更新原始gps数据,字段为空时不更新
     *
     * @param model 原始gps数据Model
     * @return 影响行数
     */
    int updateByIdSelective(GpsDataModel model);

    /**
     * 按主键更新原始gps数据
     *
     * @param model 原始gps数据Model
     * @return 影响行数
     */
    int updateById(GpsDataModel model);
}