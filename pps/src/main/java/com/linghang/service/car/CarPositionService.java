package com.linghang.service.car;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.linghang.enums.car.CarAlarmMessageType;
import com.linghang.mapper.car.CarPositionMapper;
import com.linghang.model.CarVehicleManagementModel;
import com.linghang.model.car.*;
import com.linghang.serversocket.carlocation.enums.LocationAlarmEnum;
import com.linghang.serversocket.carlocation.enums.LocationStatusEnum;
import com.linghang.serversocket.carlocation.shannxinavi.Message0200Model;
import com.linghang.service.CarVehicleManagementService;
import com.linghang.util.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.awt.geom.Point2D;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by dell on 2019/01/08.
 * 车辆位置信息 Service
 */
@Service
public class CarPositionService {

    public static final double EARTH_RADIUS = 6378137.0; // 单位M
    /**
     * 车辆定位速度偏移梁
     */
    public static final Double SPEEDINTERVAL = 200.0;
    public static final BigDecimal LATITUDEANDLONGITUDEOFFSET = new BigDecimal("0.0003");
    @Autowired
    private CarAlarmService carAlarmService;
    @Autowired
    private CarStatusService carStatusService;
    @Autowired
    private CarVehicleManagementService carVehicleManagementService;
    @Autowired
    private CarPositionMapper carPositionMapper;
    @Autowired
    private CarAlamMessageService carAlamMessageService;

    private static double getRad(double d) {
        return d * Math.PI / 180.0;
    }

    /**
     * 两坐标（经纬度）之间距离计算
     * GD/BD地图采用此算法
     *
     * @param startLng 起点坐标经度
     * @param startLat 起点坐标纬度
     * @param endLng   终点坐标经度
     * @param endLat   终点坐标纬度
     * @return 起点坐标与终点坐标的距离 单位:m
     */
    public static double getGreatCircleDistance(double startLng, double startLat, double endLng, double endLat) {
        double radLat1 = getRad(startLat);
        double radLat2 = getRad(endLat);
        double dy = radLat1 - radLat2;
        double dx = getRad(startLng) - getRad(endLng);
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(dy / 2), 2) + Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(dx / 2), 2)));
        s = s * EARTH_RADIUS;
        s = Math.round(s * 10000) / 10000.0;
        return s;
    }

    /**
     * 校验当前月份的表是否存在，不存在则创建表
     *
     * @return
     */
    public void checkNowMonthTableIsExist() {
        String tableName = getNowMonthTableName(null);
        carPositionMapper.checkNowMonthTableIsExist(tableName);
    }

    /**
     * 查询表名称--默认本月
     *
     * @param time 查询时间 为null表示为当月
     * @return
     */
    public String getNowMonthTableName(String time) {
        String month = DatetimeUtil.formatDate(new Date(), "yyyyMM");
        if (!StringUtil.isEmpty(time)) {
            Date date = DatetimeUtil.parseString2Date(time, "yyyy-MM-dd");
            if (date != null) {
                month = DatetimeUtil.formatDate(date, "yyyyMM");
            }
        }
        StringBuffer tableName = new StringBuffer();
        tableName.append("imp_car_position_").append(month);
        return tableName.toString();
    }

    /**
     * 按主键选择
     */
    public CarPositionModel selectById(Long id) {
        return id == null ? null : this.carPositionMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<CarPositionModel> selectByModel(CarPositionModel model) {
        return model == null ? new ArrayList<>(0) : this.carPositionMapper.selectByModel(model);
    }

    /**
     * 插入车辆位置 和车辆状态
     */
    public void insertCarPositionAndCarAlarm(String gpsCarNumber, Message0200Model message0200Model) {
        String tableName = getNowMonthTableName(null);
        checkNowMonthTableIsExist();
        refreshSpeed(gpsCarNumber, message0200Model, tableName);
        CarVehicleManagementModel carVehicleManagementModel = carVehicleManagementService.selectIdByGpsCarNumber(gpsCarNumber);
        CarPositionModel carPositionModel = getCarPositionModel(message0200Model, carVehicleManagementModel);
        carPositionModel.setTableName(tableName);
        this.carPositionMapper.insert(carPositionModel);
        Long positionId = carPositionModel.getId();
        if (carVehicleManagementModel.getCarElectricFenceModel() != null && !StringUtils.isEmpty(carVehicleManagementModel.getCarElectricFenceModel().getWsg84())) {
            insertAlamMessage(message0200Model, carVehicleManagementModel, positionId);
        }
        insertSpeedAlamMessage(message0200Model, carVehicleManagementModel, positionId);
        List<CarStatusModel> carStatusModels = getCarStatusModels(message0200Model, positionId);
        this.carStatusService.insertList(carStatusModels);
    }

    private void refreshSpeed(String gpsCarNumber, Message0200Model message0200Model, String tableName) {
        if (message0200Model == null || StringUtils.isEmpty(gpsCarNumber)) {
            return;
        }
        //1.速度存在，直接返回
        if (message0200Model.getSpeed() != null && message0200Model.getSpeed().compareTo(BigDecimal.ZERO) != 0) {
            return;
        }
        //2.速度不存在，进行相应运算
        if (message0200Model.getSpeed() == null || message0200Model.getSpeed().compareTo(BigDecimal.ZERO) == 0) {
            CarPositionModel carPositionModel = this.carPositionMapper.selectNowPositionByGpsCardNumber(gpsCarNumber, tableName);
            if (carPositionModel != null) {
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    double time = (double) (sdf.parse(message0200Model.getTime()).getTime() - sdf.parse(carPositionModel.getLocationTime()).getTime()) / 1000;
                    double speed = GpsUtils.getSpeed(carPositionModel.getXlabe().doubleValue(),
                            carPositionModel.getYlabe().doubleValue(), message0200Model.getLatitude().doubleValue(),
                            message0200Model.getLongitude().doubleValue(), time);
                    message0200Model.setSpeed(new BigDecimal(speed).setScale(3, BigDecimal.ROUND_HALF_UP));
                    return;
                } catch (Exception e) {
                    return;
                }
            }
        }
    }

    private boolean determineIfTheCurrentLocationIsValid(CarPositionModel oldCarPositionModel, Message0200Model message0200Model) {
        if (oldCarPositionModel == null) {
            return true;
        }
//        //如果当前速度间隔大于等于 5KM/H 认为当前车辆运动
//        if (message0200Model.getSpeed().compareTo(SPEEDINTERVAL) == 1) {
//            return true;
//        }
        /**
         * 判断经度是否改变
         */
        boolean precisionOffset = false;
        if (oldCarPositionModel.getXlabe().subtract(message0200Model.getLatitude()).abs().compareTo(LATITUDEANDLONGITUDEOFFSET) >= 0) {
            precisionOffset = true;
        }
        boolean latitudeShift = false;
        if (oldCarPositionModel.getYlabe().subtract(message0200Model.getLongitude()).abs().compareTo(LATITUDEANDLONGITUDEOFFSET) >= 0) {
            latitudeShift = true;
        }
        if (precisionOffset && latitudeShift) {
            return true;
        }
        return false;
    }

    /**
     * 获取报警信息model
     *
     * @param message0200Model
     * @param positionId
     * @return
     */
    private List<CarAlarmModel> getCarAlarmModels(Message0200Model message0200Model, Long positionId) {
        List<CarAlarmModel> carAlarmModels = new ArrayList<>();
        CarAlarmModel carAlarmModel = null;
        Map<Integer, Integer> alarmMsgs = message0200Model.getAlarmMsgs();
        for (Map.Entry<Integer, Integer> entry : alarmMsgs.entrySet()) {
            carAlarmModel = new CarAlarmModel();
            carAlarmModel.setPositionId(positionId);
            carAlarmModel.setAlarmType(entry.getValue());
            carAlarmModel.setAlarmMessage(LocationAlarmEnum.getAlarmMsg(entry.getKey()));
            carAlarmModels.add(carAlarmModel);
        }
        return carAlarmModels;
    }

    /**
     * 获取车辆状态model
     *
     * @param message0200Model
     * @param positionId
     * @return
     */
    private List<CarStatusModel> getCarStatusModels(Message0200Model message0200Model, Long positionId) {
        List<CarStatusModel> carStatusModels = new ArrayList<>();
        Map<Integer, Integer> statusMsgs = message0200Model.getStatusMsgs();
        CarStatusModel carStatusModel = null;
        for (Map.Entry<Integer, Integer> entry : statusMsgs.entrySet()) {
            carStatusModel = new CarStatusModel();
            carStatusModel.setPositionId(positionId);
            carStatusModel.setCarStatus(entry.getKey());
            carStatusModel.setStatusMessage(LocationStatusEnum.getMessage(entry.getKey(), entry.getValue()));
            carStatusModel.setStatusKey(entry.getValue());
            carStatusModels.add(carStatusModel);
        }
        return carStatusModels;
    }

    /**
     * 车辆 车辆位置model
     *
     * @param message0200Model
     * @return
     */
    private CarPositionModel getCarPositionModel(Message0200Model message0200Model, CarVehicleManagementModel carVehicleManagementModel) {
        CarPositionModel carPositionModel = new CarPositionModel();
        carPositionModel.setCarnum(carVehicleManagementModel.getCarNumber());
        carPositionModel.setXlabe(message0200Model.getLatitude());
        carPositionModel.setYlabe(message0200Model.getLongitude());
        carPositionModel.setLocationTime(message0200Model.getTime());
        carPositionModel.setSpeed(message0200Model.getSpeed());
        carPositionModel.setDirection(Integer.parseInt(message0200Model.getForward()));
        return carPositionModel;
    }

    /**
     * @param lat
     * @param longitu
     * @return
     * @url http://lbsyun.baidu.com/index.php?title=webapi/guide/webservice-geocoding-abroad
     */
    private ResultModel getBaiduAddressMolde(String lat, String longitu) {
        String loccAddress = "";
        loccAddress = BaiduApiUtil.getLocationFromlatitudeAndLongitude(lat, longitu);
        return JSON.parseObject(loccAddress, ResultModel.class);
    }

    public List<CarPositionAndCarMessageModel> selectCarPositionLocus(Long orgId, Integer carType, String carNum) {
        String tableName = getNowMonthTableName(null);
        return this.carVehicleManagementService.selectCarPositionLocus(orgId, carType, carNum, tableName);
    }


    public List<CarVehicleManagementModel> selectCarListByorgIdAndCarType(Long orgId, Integer carType, String selectDate, String carNum) {
        return this.carVehicleManagementService.selectCarListByorgIdAndCarType(orgId, carType, selectDate, carNum);
    }

    public List<CarPositionModel> selectCarPositionHistory(String carNumber, String startTime, String endTime) {
        String tableName = getNowMonthTableName(startTime);
        return carPositionMapper.selectCarPositionHistory(carNumber, startTime, endTime, tableName);
    }


    /**
     * 插入围栏报警信息
     */
    public void insertAlamMessage(Message0200Model message0200Model, CarVehicleManagementModel carVehicleManagementModel, Long positionId) {
        List<WSG84> list = JSON.parseObject(carVehicleManagementModel.getCarElectricFenceModel().getWsg84(), new TypeReference<List<WSG84>>() {
        });
        Point2D.Double aDouble = getaDouble(message0200Model);
        List<Point2D.Double> doubleList = getDoubles(list);
        if (IsInPolygonUitl.isInPolygon(aDouble, doubleList)) {
            CarAlamMessageModel carAlamMessageModel = new CarAlamMessageModel(carVehicleManagementModel, message0200Model);
            carAlamMessageModel.setAlamType(CarAlarmMessageType.WEB_IN_FTHEBOX_ALARM.getAlamMessageType());
            carAlamMessageService.insert(carAlamMessageModel);
            CarAlarmModel carAlarmModel = new CarAlarmModel();
            carAlarmModel.setPositionId(positionId);
            carAlarmModel.setAlarmMessage("区域内");
            carAlarmModel.setAlarmType(20);
            this.carAlarmService.insert(carAlarmModel);
        } else {
            CarAlamMessageModel carAlamMessageModel = new CarAlamMessageModel(carVehicleManagementModel, message0200Model);
            carAlamMessageModel.setAlamType(CarAlarmMessageType.WEB_OUTO_FTHEBOX_ALARM.getAlamMessageType());
            carAlamMessageService.insert(carAlamMessageModel);
            CarAlarmModel carAlarmModel = new CarAlarmModel();
            carAlarmModel.setPositionId(positionId);
            carAlarmModel.setAlarmMessage("区域外");
            carAlarmModel.setAlarmType(20);
            this.carAlarmService.insert(carAlarmModel);
        }
    }

    private Point2D.Double getaDouble(Message0200Model message0200Model) {
        Point2D.Double aDouble = new Point2D.Double();
        aDouble.setLocation(message0200Model.getLongitude().doubleValue(), message0200Model.getLatitude().doubleValue());
        return aDouble;
    }

    private List<Point2D.Double> getDoubles(List<WSG84> list) {
        List<Point2D.Double> doubleList = new ArrayList<>();
        Point2D.Double bDouble;
        for (WSG84 wsg84 : list) {
            bDouble = new Point2D.Double();
            bDouble.setLocation(Double.parseDouble(wsg84.getXlabe()), Double.parseDouble(wsg84.getYlabe()));
            doubleList.add(bDouble);
        }
        return doubleList;
    }

    public void insertSpeedAlamMessage(Message0200Model message0200Model, CarVehicleManagementModel carVehicleManagementModel, long positionId) {
        if (message0200Model.getSpeed().compareTo(new BigDecimal(carVehicleManagementModel.getData2())) == 1) {
            CarAlamMessageModel carAlamMessageModel = new CarAlamMessageModel(carVehicleManagementModel, message0200Model);
            carAlamMessageModel.setAlamType(CarAlarmMessageType.SPEED_ALARM.getAlamMessageType());
            carAlamMessageService.insert(carAlamMessageModel);
            CarAlarmModel carAlarmModel = new CarAlarmModel();
            carAlarmModel.setPositionId(positionId);
            carAlarmModel.setAlarmMessage("超速报警");
            carAlarmModel.setAlarmType(2);
            this.carAlarmService.insert(carAlarmModel);
        }
    }


    public List<CarPositionModel> selectCarTop10PositionLocus(String carNumber) {
        String tableName = getNowMonthTableName(null);
        return this.carPositionMapper.selectCarTop10PositionLocus(carNumber, tableName);
    }
    /**
     * 查询车辆的实时位置
     *
     * @param carId
     * @return
     */
    public CarPositionModel selectNowPositionByCarId(Long carId) {
        String tableName = getNowMonthTableName(null);
        return carPositionMapper.selectNowPositionByCarId(carId, tableName);
    }
}