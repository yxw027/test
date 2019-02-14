package com.linghang.mapper.car;

import com.linghang.model.car.CarClientModel;

import java.util.List;

/**
 * Created by dell on 2019/01/09.
 * 车辆信息  mapper
 */
public interface CarClientMapper {
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
    int insert(CarClientModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<CarClientModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(CarClientModel model);

    /**
     * 按主键选择
     */
    CarClientModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<CarClientModel> selectByModel(CarClientModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(CarClientModel model);

    /**
     * 按主键更新
     */
    int updateById(CarClientModel model);
}