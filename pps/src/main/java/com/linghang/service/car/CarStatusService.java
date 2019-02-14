package com.linghang.service.car;

import com.linghang.mapper.car.CarStatusMapper;
import com.linghang.model.car.CarStatusModel;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 2019/01/08.
 * 车辆状态 Service
 */
@Service
public class CarStatusService {

    @Autowired
    private CarStatusMapper carStatusMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.carStatusMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.carStatusMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(CarStatusModel model) {
        return model != null && this.carStatusMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<CarStatusModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<CarStatusModel> list : ListUtil.getSubList(models, 100)) {
                this.carStatusMapper.insertList(list);
            }
        } else {
            return this.carStatusMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(CarStatusModel model) {
        return model != null && this.carStatusMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public CarStatusModel selectById(Long id) {
        return id == null ? null : this.carStatusMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<CarStatusModel> selectByModel(CarStatusModel model) {
        return model == null ? new ArrayList<>(0) : this.carStatusMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(CarStatusModel model) {
        return !(model == null || model.getId() == null) && this.carStatusMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(CarStatusModel model) {
        return !(model == null || model.getId() == null) && this.carStatusMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(CarStatusModel model) {
        return !(model == null || model.getId() == null) && this.carStatusMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(CarStatusModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.carStatusMapper.insert(model) == 1;
        }
        return this.carStatusMapper.updateById(model) == 1;
    }
}