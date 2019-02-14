package com.linghang.mapper;

import com.linghang.model.CraftLayerLimitModel;
import com.linghang.model.CraftLayerModel;
import com.linghang.model.base.KendoOptions;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Dell on 2019/01/28.
 * 工艺层级 mapper
 */
public interface CraftLayerMapper {
    /**
     * 按主键删除
     *
     * @param id 工艺层级ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @param ids 工艺层级ID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入工艺层级数据
     *
     * @param model 工艺层级数据
     * @return 影响行数
     */
    int insert(CraftLayerModel model);

    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<CraftLayerModel> models);

    /**
     * 插入工艺层级数据,字段为空时不插入
     *
     * @param model 工艺层级数据
     * @return 影响行数
     */
    int insertSelective(CraftLayerModel model);

    /**
     * 按主键选择
     *
     * @param id 工艺层级ID
     * @return 工艺层级Model
     */
    CraftLayerModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 工艺层级集合
     */
    List<CraftLayerModel> selectByModel(CraftLayerModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @param orgId
     * @return 工艺层级集合
     */
    List<CraftLayerLimitModel> selectByOptions(@Param("options") KendoOptions options, @Param("orgId") Long orgId);

    /**
     * 按主键更新工艺层级,字段为空时不更新
     *
     * @param model 工艺层级Model
     * @return 影响行数
     */
    int updateByIdSelective(CraftLayerModel model);

    /**
     * 按主键更新工艺层级
     *
     * @param model 工艺层级Model
     * @return 影响行数
     */
    int updateById(CraftLayerModel model);
}