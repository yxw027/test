package com.linghang.service.car;

import com.linghang.mapper.car.CarAlarmMapper;
import com.linghang.model.car.CarAlarmModel;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 2019/01/08.
 * 车辆状态  对应车辆位置id Service
 */
@Service
public class CarAlarmService {

    @Autowired
    private CarAlarmMapper carAlarmMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.carAlarmMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.carAlarmMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(CarAlarmModel model) {
        return model != null && this.carAlarmMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<CarAlarmModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<CarAlarmModel> list : ListUtil.getSubList(models, 100)) {
                this.carAlarmMapper.insertList(list);
            }
        } else {
            return this.carAlarmMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(CarAlarmModel model) {
        return model != null && this.carAlarmMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public CarAlarmModel selectById(Long id) {
        return id == null ? null : this.carAlarmMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<CarAlarmModel> selectByModel(CarAlarmModel model) {
        return model == null ? new ArrayList<>(0) : this.carAlarmMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(CarAlarmModel model) {
        return !(model == null || model.getId() == null) && this.carAlarmMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(CarAlarmModel model) {
        return !(model == null || model.getId() == null) && this.carAlarmMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(CarAlarmModel model) {
        return !(model == null || model.getId() == null) && this.carAlarmMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(CarAlarmModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.carAlarmMapper.insert(model) == 1;
        }
        return this.carAlarmMapper.updateById(model) == 1;
    }
}