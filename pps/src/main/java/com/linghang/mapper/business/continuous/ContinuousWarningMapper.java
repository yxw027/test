package com.linghang.mapper.business.continuous;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.continuous.ContinuousWarningModel;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * @author wuchen on 2019/01/28.
 */
public interface ContinuousWarningMapper {
    /**
     * 按主键删除
     *
     * @param id nullID
     * @return 影响行数
     */
    int deleteById(Long id);
    /**
     * 按主键删除
     *
     * @param ids nullID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);
    /**
     * 插入null数据
     *
     * @param model null数据
     * @return 影响行数
     */
    int insert(ContinuousWarningModel model);
    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<ContinuousWarningModel> models);
    /**
     * 插入null数据,字段为空时不插入
     *
     * @param model null数据
     * @return 影响行数
     */
    int insertSelective(ContinuousWarningModel model);
    /**
     * 按主键选择
     *
     * @param id nullID
     * @return nullModel
     */
    ContinuousWarningModel selectById(Long id);
    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return null集合
     */
    List<ContinuousWarningModel> selectByModel(ContinuousWarningModel model);
    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @return null集合
     */
    List<ContinuousWarningModel> selectByOptions(@Param("options") KendoOptions options);
    /**
     * 按主键更新null,字段为空时不更新
     *
     * @param model nullModel
     * @return 影响行数
     */
    int updateByIdSelective(ContinuousWarningModel model);
    /**
     * 按主键更新null
     *
     * @param model nullModel
     * @return 影响行数
     */
    int updateById(ContinuousWarningModel model);

    List<ContinuousWarningModel> selectByProjectId(ContinuousWarningModel model);
}