package com.linghang.service.car;

import com.linghang.model.car.CarFenceRecordModel;
import com.linghang.mapper.car.CarFenceRecordMapper;
import com.linghang.util.ListUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by dell on 2019/01/11.
 * 围栏记录 Service
 */
@Service
public class CarFenceRecordService {

    @Autowired
    private CarFenceRecordMapper carFenceRecordMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.carFenceRecordMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.carFenceRecordMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(CarFenceRecordModel model) {
        return model != null && this.carFenceRecordMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<CarFenceRecordModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<CarFenceRecordModel> list : ListUtil.getSubList(models, 100)) {
                this.carFenceRecordMapper.insertList(list);
            }
        } else {
            return this.carFenceRecordMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(CarFenceRecordModel model) {
        return model != null && this.carFenceRecordMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public CarFenceRecordModel selectById(Long id) {
        return id == null ? null : this.carFenceRecordMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<CarFenceRecordModel> selectByModel(CarFenceRecordModel model) {
        return model == null ? new ArrayList<>(0) : this.carFenceRecordMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(CarFenceRecordModel model) {
        return !(model == null || model.getId() == null) && this.carFenceRecordMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(CarFenceRecordModel model) {
        return !(model == null || model.getId() == null) && this.carFenceRecordMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(CarFenceRecordModel model) {
        return !(model == null || model.getId() == null) && this.carFenceRecordMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(CarFenceRecordModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.carFenceRecordMapper.insert(model) == 1;
        }
        return this.carFenceRecordMapper.updateById(model) == 1;
    }

    public CarFenceRecordModel selctNewFenceRecord(Long electricFenceId){
        return  this.carFenceRecordMapper.selctNewFenceRecord(electricFenceId);
    }
}