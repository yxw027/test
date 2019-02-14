package com.linghang.mapper.base;

import com.linghang.model.base.NewsModel;

import java.util.List;

/**
 * @author liuhao on 2017/04/20.
 * 新闻表 mapper
 */
public interface NewsMapper {
    /**
     * 按主键删除
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     */
    int deleteByIds(List<Integer> ids);

    /**
     * 插入数据
     */
    int insert(NewsModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<NewsModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(NewsModel model);

    /**
     * 按主键选择
     */
    NewsModel selectById(Integer id);

    /**
     * 按模型选择
     */
    List<NewsModel> selectByModel(NewsModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(NewsModel model);

    /**
     * 按主键更新
     */
    int updateById(NewsModel model);
}