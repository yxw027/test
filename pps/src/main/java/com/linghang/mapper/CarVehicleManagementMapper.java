package com.linghang.mapper;

import com.linghang.model.CarVehicleManagementModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.car.CarIdAndCarNumberModel;
import com.linghang.model.car.CarPositionAndCarMessageModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by dell on 2018/12/25.
 * 车辆管理 mapper
 */
public interface CarVehicleManagementMapper {
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
    int insert(CarVehicleManagementModel model);

    /**
     * 插入多条数据
     */
    int insertList(List<CarVehicleManagementModel> models);

    /**
     * 插入数据,字段为空时不插入
     */
    int insertSelective(CarVehicleManagementModel model);

    /**
     * 按主键选择
     */
    CarVehicleManagementModel selectById(Long id);

    /**
     * 按模型选择
     */
    List<CarVehicleManagementModel> selectByModel(CarVehicleManagementModel model);

    /**
     * 按主键更新,字段为空时不更新
     */
    int updateByIdSelective(CarVehicleManagementModel model);

    /**
     * 按主键更新
     */
    int updateById(CarVehicleManagementModel model);

    /**
     * 根据射频卡号查询车辆信息
     *
     * @param rfCardNumber
     * @return
     */
    CarVehicleManagementModel selectByCardMark(@Param("rfCardNumber") String rfCardNumber);

    List<CarVehicleManagementModel> selectMoldeByOptions(@Param("orgId") Long orgId, @Param("options") KendoOptions options);

    CarVehicleManagementModel selectIdByGpsCarNumber(@Param("gpsCarNumber") String gpsCarNumber);

    List<CarPositionAndCarMessageModel> selectCarPositionLocus(@Param("orgId") Long orgId, @Param("carType") Integer carType,
                                                               @Param("carNum") String carNum, @Param("tableName") String tableName);

    List<CarIdAndCarNumberModel> selectCarIdAndCarNumberModel(@Param("orgId") Long orgId);

    /**
     * 只查询车的信息
     *
     * @param orgId
     * @param carType
     * @return
     */
    List<CarVehicleManagementModel> selectCarListByorgIdAndCarType(@Param("orgId") Long orgId, @Param("carType") Integer carType, @Param("selectDate") String selectDate, @Param("carNum") String carNum);

    CarVehicleManagementModel selectCarNumberAndGpsNumber(@Param("carNumber") String carNumber, @Param("gpsCarNumber") String gpsCarNumber);

    /**
     * 更新下发状态
     *
     * @param phone
     * @param type
     * @return
     */
    int updateIsIssued(@Param("phone") String phone, @Param("type") Integer type);

    CarVehicleManagementModel selectNeedelectronicFenceList(@Param("gpsCarNumber") String gpsCarNumber);


    Integer selectMaxCarMark();

    /**
     * 更新车辆状态
     *
     * @param list
     * @return
     */
    int updateCarIsIssued(List<String> list);

    /**
     * 更新状态为等待确认
     *
     * @param list
     * @return
     */
    int updateCarStatusWait(List<CarVehicleManagementModel> list);

    /**
     * 根据id查询车辆信息
     *
     * @param ids
     * @return
     */
    List<CarVehicleManagementModel> selectCarByIds(List<Long> ids);

    CarVehicleManagementModel selectGpsNumber(@Param("gpsCarnumber") String gpsCarnumber);

    int updateCarIsIssuedById(List<String> list);

    Integer verifyUnique(@Param("orgId") Long orgId);

    CarVehicleManagementModel transportInfo(@Param("carnum") String carnum, @Param("startTime") String startTime, @Param("endTime") String endTime, @Param("tableName") String tableName);
}