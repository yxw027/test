package com.linghang.service.car;

import com.linghang.enums.car.CarDownloadStatus;
import com.linghang.mapper.car.DeleteElectricfenceMapper;
import com.linghang.model.CarVehicleManagementModel;
import com.linghang.model.car.DeleteElectricfenceModel;
import com.linghang.service.CarVehicleManagementService;
import com.linghang.util.ListUtil;
import com.linghang.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 2019/01/15.
 * 电子围栏删除 Service
 */
@Service
public class DeleteElectricfenceService implements DlecteOrUpdateElectricFence {

    @Autowired
    private DeleteElectricfenceMapper deleteElectricfenceMapper;

    @Autowired
    private CarVehicleManagementService carVehicleManagementService;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.deleteElectricfenceMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.deleteElectricfenceMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(DeleteElectricfenceModel model) {
        return model != null && this.deleteElectricfenceMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<DeleteElectricfenceModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<DeleteElectricfenceModel> list : ListUtil.getSubList(models, 100)) {
                this.deleteElectricfenceMapper.insertList(list);
            }
        } else {
            return this.deleteElectricfenceMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(DeleteElectricfenceModel model) {
        return model != null && this.deleteElectricfenceMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public DeleteElectricfenceModel selectById(Long id) {
        return id == null ? null : this.deleteElectricfenceMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<DeleteElectricfenceModel> selectByModel(DeleteElectricfenceModel model) {
        return model == null ? new ArrayList<>(0) : this.deleteElectricfenceMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(DeleteElectricfenceModel model) {
        return !(model == null || model.getId() == null) && this.deleteElectricfenceMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(DeleteElectricfenceModel model) {
        return !(model == null || model.getId() == null) && this.deleteElectricfenceMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(DeleteElectricfenceModel model) {
        return !(model == null || model.getId() == null) && this.deleteElectricfenceMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(DeleteElectricfenceModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.deleteElectricfenceMapper.insert(model) == 1;
        }
        return this.deleteElectricfenceMapper.updateById(model) == 1;
    }

    public List<DeleteElectricfenceModel> selectNeedDeleteCar() {
        return this.deleteElectricfenceMapper.selectNeedDeleteCar();
    }

    public List<DeleteElectricfenceModel> selectNeedDeleteById(List<DeleteElectricfenceModel> deleteElectricfenceModels) {
        return this.deleteElectricfenceMapper.selectNeedDeleteById(deleteElectricfenceModels);
    }

    public void deleteByGpsCarNumber(String gpsCarnumber) {
        CarVehicleManagementModel carVehicleManagementModel = carVehicleManagementService.selectCarNumberAndGpsNumber("", gpsCarnumber, null);
        this.deleteElectricfenceMapper.deleteByCarId(carVehicleManagementModel.getId());
    }

    @Override
    public void dlecteOrUpdateElectricFence(String gpsCarnumber) {
        if (!StringUtil.isEmpty(gpsCarnumber)) {
            CarVehicleManagementModel carVehicleManagementModel = carVehicleManagementService.selectGpsNumber(gpsCarnumber);
            this.deleteElectricfenceMapper.deleteByCarId(carVehicleManagementModel.getId());
            carVehicleManagementService.updateIsIssued(gpsCarnumber, CarDownloadStatus.FAIL.getValue());
        }
    }
}