package com.linghang.mapper.car;

import com.linghang.model.car.CarElectricFenceModel;

import java.util.List;

/**
 * Created by dell on 2019/01/02.
 * 电子围栏 mapper
 */
public interface CarElectricFenceMapper {
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
    int insert(CarElectricFenceModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<CarElectricFenceModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(CarElectricFenceModel model);

    /**
     * 按主键选择
     */
    CarElectricFenceModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<CarElectricFenceModel> selectByModel(CarElectricFenceModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(CarElectricFenceModel model);

    /**
     * 按主键更新
     */
    int updateById(CarElectricFenceModel model);

    Integer selectMaxMark();

    Integer queryWhetherTheCurrentVehicleIsAssociatedWithTheFence(String carId);
}