package com.linghang.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.GpsDataMapper;
import com.linghang.model.CarModel;
import com.linghang.model.GpsDataModel;
import com.linghang.util.DatetimeUtil;
import com.linghang.util.ListUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author by i_it on 2018/10/26.
 * ENH绘图数据 Service
 */
@Service
public class GpsDataService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 保存每辆施工车辆最后一条数据
     */
    private static Map<Long, GpsDataModel> carIdLastDataMap = new HashMap<>();

    @Autowired
    private GpsDataMapper gpsDataMapper;
    @Autowired
    private CarService carService;
    @Autowired
    private StakeService stakeService;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.gpsDataMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.gpsDataMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(GpsDataModel model) {
        boolean result = model != null && this.gpsDataMapper.insert(model) == 1;
        if (result && model.getCarId() != null && carIdLastDataMap.containsKey(model.getCarId())) {
            carIdLastDataMap.put(model.getCarId(), model);
        }
        return result;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<GpsDataModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        GpsDataModel model = models.get(models.size() - 1);
        if (model.getCarId() != null && carIdLastDataMap.containsKey(model.getCarId())) {
            carIdLastDataMap.put(model.getCarId(), model);
        }
        if (models.size() > 100) {
            for (List<GpsDataModel> list : ListUtil.getSubList(models, 100)) {
                this.gpsDataMapper.insertList(list);
            }
        } else {
            return this.gpsDataMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 按主键选择
     */
    public GpsDataModel selectById(Long id) {
        return id == null ? null : this.gpsDataMapper.selectById(id);
    }

    public List<GpsDataModel> selectTest() {
        return this.gpsDataMapper.selectTest();
    }

    /**
     * 按主键更新
     */
    public boolean updateById(GpsDataModel model) {
        return !(model == null || model.getId() == null) && this.gpsDataMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(GpsDataModel model) {
        return !(model == null || model.getId() == null) && this.gpsDataMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(GpsDataModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.gpsDataMapper.insert(model) == 1;
        }
        return this.gpsDataMapper.updateById(model) == 1;
    }


    /**
     * 查询总数
     */
    public Map<String, Object> selectCount(Map<String, Object> map) {
        Map<String, Object> resultMap = new HashMap<>(4);
        resultMap.put("result", 1);
        resultMap.put("data", this.gpsDataMapper.selectCount(map));
        resultMap.put("reload", false);
        resultMap.put("go_url", "");
        return resultMap;
    }

    /**
     * 按模型选择
     */
    public PageInfo<GpsDataModel> selectByMap(Map<String, Object> map) {
        Integer size = 5000;
        Integer page = (Integer) map.get("page");
        Long workAreaId = (Long) map.get("workAreaId");
        Integer layer = (Integer) map.get("layer");
        Date startTime = DatetimeUtil.parseDate(String.valueOf(map.get("date")));
        Date endTime = DatetimeUtil.getNextDay(startTime);
        GpsDataModel model = new GpsDataModel();
        model.setStartTime(startTime);
        model.setEndTime(endTime);
        model.setWorkAreaId(workAreaId);
        model.setLayer(layer);
        PageHelper.startPage(page, size);
        return new PageInfo<>(this.gpsDataMapper.selectByModel(model));
    }


    /**
     * 按模型选择
     */
    public PageInfo<GpsDataModel> selectCurrentDataPage(Map<String, Object> map) {
        if (!map.containsKey("workAreaId") || map.get("workAreaId") == null) {
            return new PageInfo<>();
        }
        Integer size = 5000;
        Integer page = (Integer) map.get("page");
        Long workAreaId = (Long) map.get("workAreaId");
        Date datetime = new Date();
        Date startTime = DatetimeUtil.getDateTime2Date(datetime);
        Date endTime = DatetimeUtil.getNextDay(datetime);
        GpsDataModel model = new GpsDataModel();
        model.setWorkAreaId(workAreaId);
        model.setStartTime(startTime);
        model.setEndTime(endTime);
        PageHelper.startPage(page, size);
        return new PageInfo<>(this.gpsDataMapper.selectByModel(model));
    }

    /**
     * 按模型选择
     */
    public List<GpsDataModel> selectCurrent(GpsDataModel model) {

        model.setStartTime(DatetimeUtil.getDateTime2Date(model.getStartTime() == null ? new Date() : model.getStartTime()));
        model.setEndTime(DatetimeUtil.getNextDay(model.getStartTime()));
        return this.gpsDataMapper.selectCurrent(model);

    }

    /**
     * 按车辆ID和时间段选择
     *
     * @param carId
     * @param startTime
     * @param endTime
     * @param workAreaId
     * @return
     */
    public List<GpsDataModel> selectByTime(Long carId, Date startTime, Date endTime, Long workAreaId) {
        if (startTime == null || endTime == null) {
            return new ArrayList<>();
        }
        return this.gpsDataMapper.selectByTime(carId, startTime, endTime, workAreaId);
    }

    /**
     * 选择一天的数据
     *
     * @param carId
     * @param time
     * @param workAreaId
     * @return
     */
    public List<GpsDataModel> selectOneDay(Long carId, Date time, Long workAreaId) {
        if (time == null) {
            return new ArrayList<>();
        }
        Calendar cal = Calendar.getInstance();
        cal.setTime(time);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.MILLISECOND, 0);
        cal.getTime();
        Date startTime = cal.getTime();
        Date endTime = new Date(startTime.getTime() + 3600 * 24 * 1000 - 1000);
        return this.selectByTime(carId, startTime, endTime, workAreaId);
    }

    /**
     * 按设备ID选择
     *
     * @param sid 设备ID
     * @return
     */
    public List<GpsDataModel> selectBySid(String sid) {
        if (StringUtils.isEmpty(sid)) {
            return new ArrayList<>();
        }
        return this.gpsDataMapper.selectBySid(sid);
    }

    /**
     * 按模型选择
     *
     * @param model
     * @return
     */
    public List<GpsDataModel> selectByModel(GpsDataModel model) {
        if (model == null) {
            return new ArrayList<>();
        }
        return this.gpsDataMapper.selectByModel(model);
    }


    /**
     * 按模型选择
     */
    public Map<String, Object> selectCurrentByMap(Map<String, Object> map) {
        Map<String, Object> resultMap = new HashMap();
        Integer size = 5000;
        String sid = String.valueOf(map.get("sid"));
        Long lastId = Long.parseLong(String.valueOf(map.get("last_id")));
        lastId = lastId == null ? 1525190400001L : lastId;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date startTime = null;
        try {
            startTime = format.parse(String.valueOf(map.get("startTime")));
        } catch (ParseException e) {
            e.printStackTrace();
        }

//       new Date(String.valueOf(map.get("startTime")));
        // Timestamp.valueOf(String.valueOf(map.get("startTime")));
        Long levelId = Long.parseLong(String.valueOf(map.get("levelID")));
        map.put("sid", sid);
        map.put("lastId", lastId);
        map.put("levelId", levelId);
        map.put("startTime", startTime);
        resultMap.put("result", 1);

        CarModel work = new CarModel();
        JSONObject curCar = new JSONObject();
        curCar.put("work", work);
        curCar.put("roller_layer_id", 0);
        JSONArray carList = new JSONArray();

        JSONObject data = new JSONObject();
        data.put("cur_car", curCar);

        List<GpsDataModel> gpsList = this.gpsDataMapper.selectCurrentByMap(map);
        data.put("gps_list", gpsList);
        if (gpsList.size() > 0) {
            CarModel carModel = new CarModel(gpsList.get(gpsList.size() - 1));
            carList.add(carModel);
        }
        data.put("car_list", carList);
        resultMap.put("data", data);

        resultMap.put("reload", false);
        resultMap.put("go_url", "");
        return resultMap;
    }

    public Map<String, Object> selectCurrentByEndTime() throws ParseException {
        Map<String, Object> resultMap = new HashMap();
        resultMap.put("result", 1);

        CarModel work = new CarModel();
        JSONObject curCar = new JSONObject();
        curCar.put("work", work);
        curCar.put("roller_layer_id", 0);
        JSONArray carList = new JSONArray();

        JSONObject data = new JSONObject();
        data.put("cur_car", curCar);

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = dateFormat.parse("2018-10-28");

        List<GpsDataModel> gpsList = this.gpsDataMapper.selectCurrentByEndTime(date);
        data.put("gps_list", gpsList);
        if (gpsList.size() > 0) {
            CarModel carModel = new CarModel(gpsList.get(gpsList.size() - 1));
            carList.add(carModel);
        }
        data.put("car_list", carList);
        resultMap.put("data", data);

        resultMap.put("reload", false);
        resultMap.put("go_url", "");
        return resultMap;
    }

    public Map<String, CarModel> selectCurrnetCarMap() {
        CarModel carModel = new CarModel();
        List<CarModel> carModelList = carService.selectByModel(carModel);
        Map<String, CarModel> carModelMap = new HashMap<>(4);
        carModelList.forEach(model -> {
            model.setGpsData(this.selectLastByCarId(model.getId()));
            model.setPaver_layer_id(0);
            model.setRoller_layer_id(0);
            carModelMap.put(model.getSid(), model);
        });
        return carModelMap;
    }

    /**
     * 获取车辆最后一个位置信息
     *
     * @param carId 车辆ID
     */
    public GpsDataModel selectLastByCarId(Long carId) {
        if (carIdLastDataMap.containsKey(carId)) {
            return carIdLastDataMap.get(carId);
        }
        GpsDataModel gpsDataModel = this.gpsDataMapper.selectLastByCarId(carId);
        if (gpsDataModel != null) {
            carIdLastDataMap.put(gpsDataModel.getCarId(), gpsDataModel);
            return gpsDataModel;
        }
        return null;
    }

}