package com.linghang.mapper.car;

import com.linghang.model.car.DeleteElectricfenceModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by dell on 2019/01/15.
 * 电子围栏删除 mapper
 */
public interface DeleteElectricfenceMapper {
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
    int insert(DeleteElectricfenceModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<DeleteElectricfenceModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(DeleteElectricfenceModel model);

    /**
     * 按主键选择
     */
    DeleteElectricfenceModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<DeleteElectricfenceModel> selectByModel(DeleteElectricfenceModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(DeleteElectricfenceModel model);

    /**
     * 按主键更新
     */
    int updateById(DeleteElectricfenceModel model);


    List<DeleteElectricfenceModel> selectNeedDeleteCar();

    List<DeleteElectricfenceModel> selectNeedDeleteById(List<DeleteElectricfenceModel> ids);

    int deleteByCarId(@Param("carId") Long carId);
}