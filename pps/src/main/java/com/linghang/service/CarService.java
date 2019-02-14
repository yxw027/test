package com.linghang.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.CarMapper;
import com.linghang.model.CarModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.util.ListUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author by i_it on 2018/11/21.
 * 摊铺压路车辆 Service
 */
@Service
public class CarService {

    private static Map<String, CarModel> deviceIdMap = new HashMap<>();
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private CarMapper carMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.carMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.carMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(CarModel model) {
        return model != null && this.carMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<CarModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<CarModel> list : ListUtil.getSubList(models, 100)) {
                this.carMapper.insertList(list);
            }
        } else {
            return this.carMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(CarModel model) {
        return model != null && this.carMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public CarModel selectById(Long id) {
        return id == null ? null : this.carMapper.selectById(id);
    }

    /**
     * 按设备主键选择
     */
    public CarModel selectBySid(String deviceId) {
        if (StringUtils.isEmpty(deviceId)) {
            return null;
        }
        if (deviceIdMap.containsKey(deviceId)) {
            return deviceIdMap.get(deviceId);
        }
        CarModel sqlModel = new CarModel();
        sqlModel.setSid(deviceId);
        List<CarModel> carModels = this.selectByModel(sqlModel);
        if (carModels.isEmpty()) {
            logger.warn("未找到设备[{}]相关联施工车辆,请检查车辆信息.", deviceId);
            return null;
        } else {
            if (carModels.size() == 1) {
                deviceIdMap.put(carModels.get(0).getSid(), carModels.get(0));
                return carModels.get(0);
            } else {
                logger.warn("设备[{}]绑定多个车辆,请检查车辆信息.", deviceId);
            }
        }
        return null;
    }

    /**
     * 按模型选择
     */
    public List<CarModel> selectByModel(CarModel model) {
        return model == null ? new ArrayList<>(0) : this.carMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(CarModel model) {
        return !(model == null || model.getId() == null) && this.carMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(CarModel model) {
        boolean result = !(model == null || model.getId() == null) && this.carMapper.updateById(model) == 1;
        if (result && !StringUtils.isEmpty(model.getSid()) && deviceIdMap.containsKey(model.getSid())) {
            deviceIdMap.put(model.getSid(), model);
        }
        return result;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(CarModel model) {
        if (model == null) {
            return false;
        }
        if (!StringUtils.isEmpty(model.getSid())) {
            deviceIdMap.remove(model.getSid());
        }
        return model.getId() != null && this.carMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<CarModel> selectByOptions(KendoOptions options, Long orgId) {
        if (options == null || orgId == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.carMapper.selectByOptions(options, orgId));
    }

    /**
     * 按模型选择
     */
    public List<CarModel> selectByGpsDataGroupId(Long gpsDataGroupId) {
        return gpsDataGroupId == null ? new ArrayList<>(0) : this.carMapper.selectByGpsDataGroupId(gpsDataGroupId);
    }
}