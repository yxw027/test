package com.linghang.mapper.car;

import com.linghang.model.car.CarPositionModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by dell on 2019/01/08.
 * 车辆位置信息 mapper
 */
public interface CarPositionMapper {
    /**
     * 插入数据
     */
    int insert(CarPositionModel model);
    /**
     * 按主键选择
     */
    CarPositionModel selectById(Long id);
    /**
     * 按模型选择
     */
    List<CarPositionModel> selectByModel(CarPositionModel model);

    List<CarPositionModel> selectCarPositionHistory(@Param("carNumber") String carNumber,
                                                    @Param("startTime") String startTime,
                                                    @Param("endTime") String endTime,
                                                    @Param("tableName") String tableName);

    /**
     * 校验当前表是否存在,不存在则创建
     * @param tableName
     * @return
     */
    int checkNowMonthTableIsExist(@Param("tableName") String tableName);

    CarPositionModel selectnewTrack(@Param("carNumber") String carNumber, @Param("tableName") String nowMonthTableName);

    /**
     * 查询当前车辆最最新得10条记录
     *
     * @param carNumber
     * @param tableName
     * @return
     */

    List<CarPositionModel> selectCarTop10PositionLocus(@Param("carNumber") String carNumber, @Param("tableName") String tableName);

    CarPositionModel selectNowPositionByCarId(@Param("carId") Long carId, @Param("tableName") String tableName);

    CarPositionModel selectNowPositionByGpsCardNumber(@Param("gpsCardNumber") String gpsCardNumber, @Param("tableName") String tableName);
}