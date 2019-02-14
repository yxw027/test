package com.linghang.mapper.base;

import com.linghang.model.base.AnnexModel;

import java.util.List;

/**
 * Created by dell on 2019/01/09.
 * 附件信息表 mapper
 */
public interface AnnexMapper {
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
    int insert(AnnexModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<AnnexModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(AnnexModel model);

    /**
     * 按主键选择
     */
    AnnexModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<AnnexModel> selectByModel(AnnexModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(AnnexModel model);

    /**
     * 按主键更新
     */
    int updateById(AnnexModel model);

    List<AnnexModel> selectAnnexByIds(String[] idsArray);

}