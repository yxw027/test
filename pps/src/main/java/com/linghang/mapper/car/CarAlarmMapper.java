package com.linghang.mapper.car;

import com.linghang.model.car.CarAlarmModel;

import java.util.List;

/**
 * Created by dell on 2019/01/08.
 * 车辆状态  对应车辆位置id mapper
 */
public interface CarAlarmMapper {
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
    int insert(CarAlarmModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<CarAlarmModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(CarAlarmModel model);

    /**
     * 按主键选择
     */
    CarAlarmModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<CarAlarmModel> selectByModel(CarAlarmModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(CarAlarmModel model);

    /**
     * 按主键更新
     */
    int updateById(CarAlarmModel model);
}