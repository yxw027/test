package com.linghang.mapper;

import com.linghang.model.DeviceDataModel;

import java.util.List;

/**
 * @author liuhao on 2019/01/30.
 * 设备上报原始字符串 mapper
 */
public interface DeviceDataMapper {
    /**
     * 按主键删除
     *
     * @param id 设备上报原始字符串ID
     * @return 影响行数
     */
    int deleteById(Long id);

    /**
     * 按主键删除
     *
     * @param ids 设备上报原始字符串ID
     * @return 影响行数
     */
    int deleteByIds(List<Long> ids);

    /**
     * 插入设备上报原始字符串数据
     *
     * @param model 设备上报原始字符串数据
     * @return 影响行数
     */
    int insert(DeviceDataModel model);

    /**
     * 插入多条数据
     *
     * @param models 模型集合
     * @return 影响行数
     */
    int insertList(List<DeviceDataModel> models);

    /**
     * 插入设备上报原始字符串数据,字段为空时不插入
     *
     * @param model 设备上报原始字符串数据
     * @return 影响行数
     */
    int insertSelective(DeviceDataModel model);

    /**
     * 按主键选择
     *
     * @param id 设备上报原始字符串ID
     * @return 设备上报原始字符串Model
     */
    DeviceDataModel selectById(Long id);

    /**
     * 按模型选择
     *
     * @param model 模型条件
     * @return 设备上报原始字符串集合
     */
    List<DeviceDataModel> selectByModel(DeviceDataModel model);

    /**
     * 按主键更新设备上报原始字符串,字段为空时不更新
     *
     * @param model 设备上报原始字符串Model
     * @return 影响行数
     */
    int updateByIdSelective(DeviceDataModel model);

    /**
     * 按主键更新设备上报原始字符串
     *
     * @param model 设备上报原始字符串Model
     * @return 影响行数
     */
    int updateById(DeviceDataModel model);
}