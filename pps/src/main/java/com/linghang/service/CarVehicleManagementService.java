package com.linghang.service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.enums.car.CarDownloadStatus;
import com.linghang.enums.car.CarPositionFactoryEnum;
import com.linghang.mapper.CarVehicleManagementMapper;
import com.linghang.model.CarVehicleManagementModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.car.CarIdAndCarNumberModel;
import com.linghang.model.car.CarPositionAndCarMessageModel;
import com.linghang.serversocket.carlocation.server.shannxinavi.PolygonAreaDownLoadServer;
import com.linghang.service.car.CarPositionService;
import com.linghang.service.car.DlecteOrUpdateElectricFence;
import com.linghang.util.ListUtil;
import com.linghang.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 2018/12/25.
 * 车辆管理 Service
 */
@Service
public class CarVehicleManagementService implements DlecteOrUpdateElectricFence {

    @Autowired
    private CarVehicleManagementMapper carVehicleManagementMapper;

    @Autowired
    private CarPositionService carPositionService;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.carVehicleManagementMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.carVehicleManagementMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(CarVehicleManagementModel model) {
        Integer maxCarMark = this.carVehicleManagementMapper.selectMaxCarMark();
        if (maxCarMark == null) {
            maxCarMark = 1001;
        } else {
            maxCarMark = maxCarMark + 1;
        }
        model.setCarMark(maxCarMark);
        return model != null && this.carVehicleManagementMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<CarVehicleManagementModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<CarVehicleManagementModel> list : ListUtil.getSubList(models, 100)) {
                this.carVehicleManagementMapper.insertList(list);
            }
        } else {
            return this.carVehicleManagementMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(CarVehicleManagementModel model) {
        return model != null && this.carVehicleManagementMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public CarVehicleManagementModel selectById(Long id) {
        return id == null ? null : this.carVehicleManagementMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<CarVehicleManagementModel> selectByModel(CarVehicleManagementModel model) {
        return model == null ? new ArrayList<>(0) : this.carVehicleManagementMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(CarVehicleManagementModel model) {
        return !(model == null || model.getId() == null) && this.carVehicleManagementMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(CarVehicleManagementModel model) {
        return !(model == null || model.getId() == null) && this.carVehicleManagementMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(CarVehicleManagementModel model) {
        return !(model == null || model.getId() == null) && this.carVehicleManagementMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(CarVehicleManagementModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.carVehicleManagementMapper.insert(model) == 1;
        }
        return this.carVehicleManagementMapper.updateById(model) == 1;
    }

    public Boolean carMarkValidation(Long id, Integer carMark, Long orgId) {
        CarVehicleManagementModel model = new CarVehicleManagementModel();
        model.setCarMark(carMark);
        model.setOrgId(orgId);
        List<CarVehicleManagementModel> list = this.selectByModel(model);
        Boolean aBoolean = getValidation(id, list);
        if (aBoolean != null) {
            return aBoolean;
        }
        return true;

    }

    private Boolean getValidation(Long id, List<CarVehicleManagementModel> list) {
        if (list != null) {
            if (list.isEmpty()) {
                return true;
            }
            for (CarVehicleManagementModel carVehicleManagementModel : list) {
                if (id == null || !carVehicleManagementModel.getId().equals(id)) {
                    return false;
                }
            }
        }
        return null;
    }

    public CarVehicleManagementModel selectByCardMark(String rfCardNumber) {
        return carVehicleManagementMapper.selectByCardMark(rfCardNumber);
    }

    public Boolean carNumbervalidation(Long id, String carNumber) {
        CarVehicleManagementModel model = new CarVehicleManagementModel();
        model.setCarNumber(carNumber);
        List<CarVehicleManagementModel> list = this.selectByModel(model);
        Boolean aBoolean = getValidation(id, list);
        if (aBoolean != null) {
            return aBoolean;
        }
        return true;
    }

    public Boolean rfCardNumbervalidation(Long id, String rfCardNumber) {
        CarVehicleManagementModel model = new CarVehicleManagementModel();
        model.setRfCardNumber(rfCardNumber);
        List<CarVehicleManagementModel> list = this.selectByModel(model);
        Boolean aBoolean = getValidation(id, list);
        if (aBoolean != null) {
            return aBoolean;
        }
        return true;
    }

    public Boolean gpsCardNumbervalidation(Long id, String gpsCardNumber) {
        CarVehicleManagementModel model = new CarVehicleManagementModel();
        model.setGpsCardNumber(gpsCardNumber);
        List<CarVehicleManagementModel> list = this.selectByModel(model);
        Boolean aBoolean = getValidation(id, list);
        if (aBoolean != null) {
            return aBoolean;
        }
        return true;
    }

    public PageInfo<CarVehicleManagementModel> selectMoldeByOptions(Long orgId, KendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.carVehicleManagementMapper.selectMoldeByOptions(orgId, options));

    }

    public CarVehicleManagementModel selectIdByGpsCarNumber(String gpsCarNumber) {
        if ("".equals(gpsCarNumber)) {
            return new CarVehicleManagementModel();
        }
        return this.carVehicleManagementMapper.selectIdByGpsCarNumber(gpsCarNumber);
    }

    public List<CarPositionAndCarMessageModel> selectCarPositionLocus(Long orgId, Integer carType, String carNum, String tableName) {
        return this.carVehicleManagementMapper.selectCarPositionLocus(orgId, carType, carNum, tableName);
    }

    public List<CarIdAndCarNumberModel> selectCarIdAndCarNumberModel(Long orgId) {
        return this.carVehicleManagementMapper.selectCarIdAndCarNumberModel(orgId);
    }

    /**
     * 根据车牌号和gps卡号判断当前车辆返回厂家对应的权鉴码
     *
     * @param carNumber
     * @param gpsCarNumber
     * @param type
     * @return
     */
    public CarVehicleManagementModel selectCarNumberAndGpsNumber(String carNumber, String gpsCarNumber, Integer type) {
        CarVehicleManagementModel carVehicleManagementModel = this.carVehicleManagementMapper.selectCarNumberAndGpsNumber(carNumber, gpsCarNumber);
        if (carVehicleManagementModel != null) {
            carVehicleManagementModel.setData1(CarPositionFactoryEnum.getFactoryCode(type));
        }
        return carVehicleManagementModel;
    }

    public List<CarVehicleManagementModel> selectCarListByorgIdAndCarType(Long orgId, Integer carType, String selectDate, String carNum) {
        return this.carVehicleManagementMapper.selectCarListByorgIdAndCarType(orgId, carType, selectDate + " 23:59:59", carNum);
    }


    /**
     * 电子围栏下发成功，更改车辆下发状态
     *
     * @param phone
     * @return
     */
    public void updateIsIssued(String phone, Integer type) {
        if (!StringUtil.isEmpty(phone)) {
            carVehicleManagementMapper.updateIsIssued(phone, type);
        }
    }

    /**
     * 更新车辆信息,校验gps卡号是否更改
     *
     * @param model
     * @return
     */
    public boolean update(CarVehicleManagementModel model) {
        CarVehicleManagementModel old = carVehicleManagementMapper.selectById(model.getId());
        if (old != null && !old.getGpsCardNumber().equals(model.getGpsCardNumber()) && !StringUtil.isEmpty(model.getGpsCardNumber())) {
            model.setIsIssued(0);
        }
        return updateById(model);
    }


    public List<CarVehicleManagementModel> selectNeedelectronicFenceList(String gpsCarNumber) {
        List<CarVehicleManagementModel> list = new ArrayList<>();
        CarVehicleManagementModel carVehicleManagementModels = this.carVehicleManagementMapper.selectNeedelectronicFenceList(gpsCarNumber);
        if (carVehicleManagementModels == null || carVehicleManagementModels.getCarElectricFenceModel() == null || "".equals(carVehicleManagementModels.getCarElectricFenceModel().getWsg84())) {
            return list;
        }
        list.add(carVehicleManagementModels);
        return list;
    }

    public int updateCarIsIssued(List<String> list) {
        return this.carVehicleManagementMapper.updateCarIsIssued(list);
    }

    public int updateCarIsIssuedById(List<String> list) {

        return this.carVehicleManagementMapper.updateCarIsIssuedById(list);
    }


    public Integer selectMaxCarMark() {
        return this.carVehicleManagementMapper.selectMaxCarMark();
    }

    public void updateCarStatusWait(List<CarVehicleManagementModel> list) {
        carVehicleManagementMapper.updateCarStatusWait(list);
    }

    public void downloadCarElectricFence(List<Long> ids) {
        List<CarVehicleManagementModel> list = carVehicleManagementMapper.selectCarByIds(ids);
        if (!CollectionUtils.isEmpty(list)) {
            PolygonAreaDownLoadServer downLoadServer = new PolygonAreaDownLoadServer();
            downLoadServer.serverSendPolygonAreaDownLoadModel(list);
        }
    }

    @Override
    public void dlecteOrUpdateElectricFence(String gpsCarnumber) {
        if (!StringUtil.isEmpty(gpsCarnumber)) {
            carVehicleManagementMapper.updateIsIssued(gpsCarnumber, CarDownloadStatus.SUCCESS.getValue());
        }
    }

    public CarVehicleManagementModel selectGpsNumber(String gpsCarnumber) {
        return carVehicleManagementMapper.selectGpsNumber(gpsCarnumber);

    }

    public boolean verifyUnique(Long orgId) {
        return carVehicleManagementMapper.verifyUnique(orgId) > 0;
    }

    public CarVehicleManagementModel transportInfo(String carnum, String startTime, String endTime) {
        String tableName = carPositionService.getNowMonthTableName(startTime);
        return this.carVehicleManagementMapper.transportInfo(carnum, startTime, endTime, tableName);
    }
}