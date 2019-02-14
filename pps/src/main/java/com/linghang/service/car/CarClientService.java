package com.linghang.service.car;

import com.linghang.mapper.car.CarClientMapper;
import com.linghang.model.car.CarClientModel;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dell on 2019/01/09.
 * 车辆信息  Service
 */
@Service
public class CarClientService {

    @Autowired
    private CarClientMapper carClientMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.carClientMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.carClientMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(CarClientModel model) {
        return model != null && this.carClientMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<CarClientModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<CarClientModel> list : ListUtil.getSubList(models, 100)) {
                this.carClientMapper.insertList(list);
            }
        } else {
            return this.carClientMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(CarClientModel model) {
        return model != null && this.carClientMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public CarClientModel selectById(Long id) {
        return id == null ? null : this.carClientMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<CarClientModel> selectByModel(CarClientModel model) {
        return model == null ? new ArrayList<>(0) : this.carClientMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(CarClientModel model) {
        return !(model == null || model.getId() == null) && this.carClientMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(CarClientModel model) {
        return !(model == null || model.getId() == null) && this.carClientMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(CarClientModel model) {
        return !(model == null || model.getId() == null) && this.carClientMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(CarClientModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.carClientMapper.insert(model) == 1;
        }
        return this.carClientMapper.updateById(model) == 1;
    }
}