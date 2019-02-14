package com.linghang.mapper;

import com.linghang.model.CraftDetailModel;
import com.linghang.model.base.KendoOptions;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Dell on 2019/01/28.
 * 工艺明细表 mapper
 */
public interface CraftDetailMapper {
    /**
     * 按主键删除
     *
     * @param id 工艺明细表ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @param ids 工艺明细表ID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入工艺明细表数据
     *
     * @param model 工艺明细表数据
     * @return 影响行数
     */
    int insert(CraftDetailModel model);

    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<CraftDetailModel> models);

    /**
     * 插入工艺明细表数据,字段为空时不插入
     *
     * @param model 工艺明细表数据
     * @return 影响行数
     */
    int insertSelective(CraftDetailModel model);

    /**
     * 按主键选择
     *
     * @param id 工艺明细表ID
     * @return 工艺明细表Model
     */
    CraftDetailModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 工艺明细表集合
     */
    List<CraftDetailModel> selectByModel(CraftDetailModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @return 工艺明细表集合
     */
    List<CraftDetailModel> selectByOptions(@Param("options") KendoOptions options);

    /**
     * 按主键更新工艺明细表,字段为空时不更新
     *
     * @param model 工艺明细表Model
     * @return 影响行数
     */
    int updateByIdSelective(CraftDetailModel model);

    /**
     * 按主键更新工艺明细表
     *
     * @param model 工艺明细表Model
     * @return 影响行数
     */
    int updateById(CraftDetailModel model);

    int deleteByCraftId(Long craftLayerId);
}