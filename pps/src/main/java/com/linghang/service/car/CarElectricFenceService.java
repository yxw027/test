package com.linghang.service.car;

import com.alibaba.fastjson.JSON;
import com.linghang.mapper.car.CarElectricFenceMapper;
import com.linghang.model.car.CarElectricFenceModel;
import com.linghang.model.car.CarFenceRecordModel;
import com.linghang.model.car.DeleteElectricfenceModel;
import com.linghang.service.CarVehicleManagementService;
import com.linghang.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;

/**
 * Created by dell on 2019/01/02.
 * 电子围栏 Service
 */
@Service
public class CarElectricFenceService {

    @Autowired
    private CarElectricFenceMapper carElectricFenceMapper;
    @Autowired
    private CarVehicleManagementService carVehicleManagementService;

    @Autowired
    private  CarFenceRecordService carFenceRecordService;

    @Autowired
    private DeleteElectricfenceService deleteElectricfenceService;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.carElectricFenceMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.carElectricFenceMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(CarElectricFenceModel model) {
        selectMaxMark(model);
        return model != null && this.carElectricFenceMapper.insert(model) == 1;
    }

    private synchronized void selectMaxMark(CarElectricFenceModel model) {
        Integer maxMark = this.carElectricFenceMapper.selectMaxMark();
        if (maxMark == null) {
            model.setElectricFencemark(1);
        } else {
            model.setElectricFencemark(maxMark + 1);
        }
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(CarElectricFenceModel model) {
        return model != null && this.carElectricFenceMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public CarElectricFenceModel selectById(Long id) {
        return id == null ? null : this.carElectricFenceMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<CarElectricFenceModel> selectByModel(CarElectricFenceModel model) {
        return model == null ? new ArrayList<>(0) : this.carElectricFenceMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(CarElectricFenceModel model) {
        return !(model == null || model.getId() == null) && this.carElectricFenceMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(CarElectricFenceModel model) {
        if (model.getCarElectronicFencePointModels()!=null && model.getCarElectronicFencePointModels().size()>0){
           model.setFancePosition(JSON.toJSONString(model.getCarElectronicFencePointModels()));
           model.setWsg84(JSON.toJSONString(model.getWsg84s()));
            insertFenceRecordHistory(model);
            carVehicleManagementService.updateCarIsIssuedById(Arrays.asList(model.getCarMessage().split(",")));
        }
        return !(model == null || model.getId() == null) && this.carElectricFenceMapper.updateById(model) == 1;
    }

    /**
     * 插入围栏历时信息表
     * @param model
     */
    public void insertFenceRecordHistory(CarElectricFenceModel model){
        CarFenceRecordModel carFenceRecordModel=new CarFenceRecordModel();
        Date nowDate=new Date();
        carFenceRecordModel.setElectricFenceId(model.getId());
        carFenceRecordModel.setFancePosition( model.getFancePosition());
        carFenceRecordModel.setPointCenter(model.getPointCenter());
        carFenceRecordModel.setWsg84(model.getWsg84());
        carFenceRecordModel.setStartTime(nowDate);
        carFenceRecordModel.setCarMessage(model.getCarMessage());
        CarFenceRecordModel carFenceRecordModel1 = this.carFenceRecordService.selctNewFenceRecord(model.getId());
        if (carFenceRecordModel1!=null){
            carFenceRecordModel1.setEndTime(nowDate);
            carFenceRecordService.updateById(carFenceRecordModel1);
        }
        Calendar calendar=Calendar.getInstance();
        calendar.set(Calendar.YEAR, calendar.get(Calendar.YEAR) + 10);
        Date endTime = calendar.getTime();
        carFenceRecordModel.setEndTime(endTime);
        carFenceRecordService.insert(carFenceRecordModel);
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(CarElectricFenceModel model) {
        return !(model == null || model.getId() == null) && this.carElectricFenceMapper.deleteById(model.getId()) >= 0;
    }


    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(CarElectricFenceModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.carElectricFenceMapper.insert(model) == 1;
        }
        return this.carElectricFenceMapper.updateById(model) == 1;
    }

    /**
     * 电子围栏更新判断车辆是否更换，更新车辆下发状态
     *
     * @param model
     * @return
     */
    public boolean update(CarElectricFenceModel model) {
        if (model.getCarElectronicFencePointModels() == null) {
            CarElectricFenceModel old = carElectricFenceMapper.selectById(model.getId());
            if (!StringUtils.isEmpty(old.getWsg84())) {
                String[] cars = model.getCarMessage().split(",");
                String[] oldCar = old.getCarMessage().split(",");
                //更改车辆状态
                delectOrupdate(cars, oldCar, model, old.getElectricFencemark());
            }
        }
        return updateById(model);
    }
    /**
     * 当更新车辆围栏时判断当前围栏车辆 和 历史围栏车辆 当新增车辆和历时车辆相同时进行 更新
     * 不一样时进行时
     */

    public void delectOrupdate(String[] cars, String[] oldCar, CarElectricFenceModel model, Integer electricFencemark) {
        List<String> carList = Arrays.asList(cars);
        List<String> oldCarList = Arrays.asList(oldCar);
        needDelete(model, electricFencemark, carList, oldCarList);
        needUpdate(carList, oldCarList);
    }

    /**
     * 判断 新传进来的车是是否在历时围栏 不存在进行更新
     *
     * @param carList
     * @param oldCarList
     */
    private void needUpdate(List<String> carList, List<String> oldCarList) {
        Set<String> needUpdate = new HashSet<String>();
        for (int i = 0; i < carList.size(); i++) {
            if (!oldCarList.contains(carList.get(i))) {
                needUpdate.add(carList.get(i));
            }
        }
        if (needUpdate.size() > 0) {
            carVehicleManagementService.updateCarIsIssuedById(new ArrayList<String>(needUpdate));
//            try {
//                carVehicleManagementService.downloadCarElectricFence(new ArrayList<String>(needUpdate).stream().map(Long::parseLong).collect(Collectors.toList()));
//            } catch (Exception e) {
//
//            }

        }
    }

    /**
     * 当判断 历时车辆 不在 当前传进来的车辆 时进行 删除
     *
     * @param model
     * @param electricFencemark
     * @param carList
     * @param oldCarList
     */
    private void needDelete(CarElectricFenceModel model, Integer electricFencemark, List<String> carList, List<String> oldCarList) {
        Set<String> needDelectList = new HashSet<String>();
        for (int i = 0; i < oldCarList.size(); i++) {
            if (!carList.contains(oldCarList.get(i))) {
                if (queryWhetherTheCurrentVehicleIsAssociatedWithTheFence(oldCarList.get(i)) > 0) {
                    needDelectList.add(oldCarList.get(i));
                }
            }
    }
        if (needDelectList.size() > 0) {
            model.setElectricFencemark(electricFencemark);
            this.deleteElectricfenceServiceByCarId(model, new ArrayList<String>(needDelectList));
        }
    }

    /**
     * 删除后更新车辆
     *
     * @param model
     * @return
     */
    public boolean delete(CarElectricFenceModel model) {

        CarElectricFenceModel old = carElectricFenceMapper.selectById(model.getId());
        if (!StringUtil.isEmpty(old.getCarMessage()) && !StringUtil.isEmpty(old.getWsg84())) {
            String[] cars = model.getCarMessage().split(",");
            //更改车辆状态

            carVehicleManagementService.updateCarIsIssued(Arrays.asList(cars));

            deleteElectricfenceServiceByCarId(model, Arrays.asList(cars));

        }
        return deleteById(old);
    }

    public void deleteElectricfenceServiceByCarId(CarElectricFenceModel model, List<String> stringList) {
        List<DeleteElectricfenceModel> deleteElectricfenceModelList = new ArrayList<>();
        int n = stringList.size();
        DeleteElectricfenceModel deleteElectricfenceModel = null;
        for (int i = 0; i < n; i++) {
            deleteElectricfenceModel = new DeleteElectricfenceModel();
            deleteElectricfenceModel.setCarId(stringList.get(i));
            deleteElectricfenceModel.setElectricFenceMark(model.getElectricFencemark());
            deleteElectricfenceModel.setNumberOfRegions(0);
            deleteElectricfenceModelList.add(deleteElectricfenceModel);
        }
        deleteElectricfenceService.insertList(deleteElectricfenceModelList);
//        try {
//            List<DeleteElectricfenceModel> deleteElectricfenceModelList1 = deleteElectricfenceService.selectNeedDeleteById(deleteElectricfenceModelList);
//            DownloadMessageTask downloadMessageTask = new DownloadMessageTask();
//            downloadMessageTask.deleteMessage(deleteElectricfenceModelList1);
//        } catch (Exception e) {
//
//        }

    }

    /**
     * 查询当前车辆是否关联围栏
     *
     * @param carId
     * @return
     */
    public Integer queryWhetherTheCurrentVehicleIsAssociatedWithTheFence(String carId) {
        return this.carElectricFenceMapper.queryWhetherTheCurrentVehicleIsAssociatedWithTheFence(carId);
    }
}