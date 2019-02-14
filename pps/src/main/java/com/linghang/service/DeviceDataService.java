package com.linghang.service;

import com.linghang.mapper.DeviceDataMapper;
import com.linghang.model.DeviceDataModel;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author liuhao on 2019/01/30.
 * 设备上报原始字符串 Service
 */
@Service
public class DeviceDataService {


    @Autowired
    private DeviceDataMapper deviceDataMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.deviceDataMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.deviceDataMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(DeviceDataModel model) {
        return model != null && this.deviceDataMapper.insert(model) == 1;
    }

    /**
     * 插入数据
     */
    public boolean insert(String content) {
        if (StringUtils.isEmpty(content)) {
            return false;
        }
        DeviceDataModel deviceDataModel = new DeviceDataModel();
        deviceDataModel.setContent(content);
        deviceDataModel.setTime(new Date());
        return this.deviceDataMapper.insert(deviceDataModel) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<DeviceDataModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<DeviceDataModel> list : ListUtil.getSubList(models, 100)) {
                this.deviceDataMapper.insertList(list);
            }
        } else {
            return this.deviceDataMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(DeviceDataModel model) {
        return model != null && this.deviceDataMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public DeviceDataModel selectById(Long id) {
        return id == null ? null : this.deviceDataMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<DeviceDataModel> selectByModel(DeviceDataModel model) {
        return model == null ? new ArrayList<>(0) : this.deviceDataMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(DeviceDataModel model) {
        return !(model == null || model.getId() == null) && this.deviceDataMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(DeviceDataModel model) {
        return !(model == null || model.getId() == null) && this.deviceDataMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(DeviceDataModel model) {
        return model != null && this.deleteById(model.getId());
    }

}