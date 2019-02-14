package com.linghang.mapper;

import com.linghang.model.CarModel;
import com.linghang.model.base.KendoOptions;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

/**
 * Created by i_it on 2018/11/21.
 * 摊铺压路车辆 mapper
 */
public interface CarMapper {
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
    int insert(CarModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<CarModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(CarModel model);

    /**
     * 按主键选择
     */
    CarModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<CarModel> selectByModel(CarModel model);

    /**
     * 按前台条件选择
     *
     * @param options 前台条件
     * @param orgId   组织机构ID
     * @return 摊铺压路车辆集合
     */
    List<CarModel> selectByOptions(@Param("options") KendoOptions options, @Param("orgId") Long orgId);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(CarModel model);

    /**
     * 按主键更新
     */
    int updateById(CarModel model);


    /**
     * 按数据组选择
     */
    List<CarModel> selectByGpsDataGroupId(@Param("gpsDataGroupId") Long gpsDataGroupId);
}