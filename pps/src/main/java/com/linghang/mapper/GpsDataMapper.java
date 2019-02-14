package com.linghang.mapper;

import com.linghang.model.GpsDataModel;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author i_it on 2018/10/26.
 * ENH绘图数据 mapper
 */
public interface GpsDataMapper {
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
    int insert(GpsDataModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<GpsDataModel> models);

    /**
     * 按主键选择
     */
    GpsDataModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<GpsDataModel> selectByModel(GpsDataModel model);

    List<GpsDataModel> selectTest();



    /**
     * 按主键更新
     */
    int updateById(GpsDataModel model);

    /**
     * 根据条件查询数据
     *
     * @param map
     * @return
     */
    Integer selectCount(Map map);

    /**
     * 根据条件查询数据
     *
     * @param map
     * @return
     */
    List<GpsDataModel> selectByMap(Map map);

    /**
     * 根据条件查询实时数据
     *
     * @return
     */
    List<GpsDataModel> selectCurrent(GpsDataModel model);

    /**
     * 按时间选择数据
     *
     * @param carId
     * @param startTime
     * @param endTime
     * @param workAreaId
     * @return
     */
    List<GpsDataModel> selectByTime(@Param("carId") Long carId, @Param("startTime") Date startTime, @Param("endTime") Date endTime, @Param("workAreaId") Long workAreaId);

    /**
     * 根据条件查询实时数据
     *
     * @param map
     * @return
     */
    List<GpsDataModel> selectCurrentByMap(Map map);

    List<GpsDataModel> selectCurrentByEndTime(Date date);

    /**
     * 根据条件查询实时数据
     *
     * @param carId
     * @return
     */
    GpsDataModel selectLastByCarId(Long carId);

    List<GpsDataModel> selectByCarId(Long carId);

    List<GpsDataModel> selectBySid(String carId);
}