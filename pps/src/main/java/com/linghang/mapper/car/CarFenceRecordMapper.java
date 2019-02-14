package com.linghang.mapper.car;

import com.linghang.model.car.CarFenceRecordModel;

import java.util.Date;
import java.util.List;

/**
 * Created by dell on 2019/01/11.
 * 围栏记录 mapper
 */
public interface CarFenceRecordMapper {
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
    int insert(CarFenceRecordModel model);
    /**
     * 插入多条数据
     */
    int insertList(List<CarFenceRecordModel> models);
    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(CarFenceRecordModel model);
    /**
     * 按主键选择
     */
    CarFenceRecordModel selectById(Long id);
    /**
     * 按模型选择
     */
    List<CarFenceRecordModel> selectByModel(CarFenceRecordModel model);
    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(CarFenceRecordModel model);
    /**
     * 按主键更新
     */
    int updateById(CarFenceRecordModel model);

    CarFenceRecordModel selctNewFenceRecord(Long electricFenceId);


}