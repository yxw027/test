package com.linghang.mapper;

import com.linghang.model.TrimbleInfoModel;
import com.linghang.model.base.KendoOptions;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author liuhao on 2018/11/01.
 * 移动端基础信息 mapper
 */
public interface TrimbleInfoMapper {
    /**
     * 按主键删除
     *
     * @param id 移动端基础信息ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @param ids 移动端基础信息ID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入移动端基础信息数据
     *
     * @param model 移动端基础信息数据
     * @return 影响行数
     */
    int insert(TrimbleInfoModel model);

    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<TrimbleInfoModel> models);

    /**
     * 按主键选择
     *
     * @param id 移动端基础信息ID
     * @return 移动端基础信息Model
     */
    TrimbleInfoModel selectById(String id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 移动端基础信息集合
     */
    List<TrimbleInfoModel> selectByModel(TrimbleInfoModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @param orgId   组织机构ID
     * @return 移动端基础信息集合
     */
    List<TrimbleInfoModel> selectByOptions(@Param("options") KendoOptions options, @Param("orgId") Long orgId);

    /**
     * 按主键更新移动端基础信息,字段为空时不更新
     *
     * @param model 移动端基础信息Model
     * @return 影响行数
     */
    int updateByIdSelective(TrimbleInfoModel model);

    /**
     * 按主键更新移动端基础信息
     *
     * @param model 移动端基础信息Model
     * @return 影响行数
     */
    int updateById(TrimbleInfoModel model);
}