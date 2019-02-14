package com.linghang.mapper.car;

import com.linghang.model.car.CarStatusModel;

import java.util.List;

/**
 * Created by dell on 2019/01/08.
 * 车辆状态 mapper
 */
public interface CarStatusMapper {
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
    int insert(CarStatusModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<CarStatusModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(CarStatusModel model);

    /**
     * 按主键选择
     */
    CarStatusModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<CarStatusModel> selectByModel(CarStatusModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(CarStatusModel model);

    /**
     * 按主键更新
     */
    int updateById(CarStatusModel model);
}