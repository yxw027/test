package com.linghang.mapper.car;

import com.linghang.model.base.KendoOptions;
import com.linghang.model.car.CarAlamMessageModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by dell on 2019/01/14.
 * 车辆报警 mapper
 */
public interface CarAlamMessageMapper {
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
    int insert(CarAlamMessageModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<CarAlamMessageModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(CarAlamMessageModel model);

    /**
     * 按主键选择
     */
    CarAlamMessageModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<CarAlamMessageModel> selectByModel(CarAlamMessageModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(CarAlamMessageModel model);

    /**
     * 按主键更新
     */
    int updateById(CarAlamMessageModel model);

    List<CarAlamMessageModel> selectMoldeByOptions(@Param("orgId") Long orgId, @Param("startTime") String startTime, @Param("endTime") String endTime, @Param("alamType") Integer alamType, @Param("options") KendoOptions options);
}