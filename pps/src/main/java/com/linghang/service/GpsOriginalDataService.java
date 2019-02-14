package com.linghang.service;

import com.linghang.mapper.GpsOriginalDataMapper;
import com.linghang.model.GpsDataModel;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author liuhao on 2019/01/30.
 * 原始gps数据 Service
 */
@Service
public class GpsOriginalDataService {

    @Autowired
    private GpsOriginalDataMapper gpsOriginalDataMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.gpsOriginalDataMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.gpsOriginalDataMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(GpsDataModel model) {
        return model != null && this.gpsOriginalDataMapper.insert(model) == 1;
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
        if (models.size() > 100) {
            for (List<GpsDataModel> list : ListUtil.getSubList(models, 100)) {
                this.gpsOriginalDataMapper.insertList(list);
            }
        } else {
            return this.gpsOriginalDataMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(GpsDataModel model) {
        return model != null && this.gpsOriginalDataMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public GpsDataModel selectById(Long id) {
        return id == null ? null : this.gpsOriginalDataMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<GpsDataModel> selectByModel(GpsDataModel model) {
        return model == null ? new ArrayList<>(0) : this.gpsOriginalDataMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(GpsDataModel model) {
        return !(model == null || model.getId() == null) && this.gpsOriginalDataMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(GpsDataModel model) {
        return !(model == null || model.getId() == null) && this.gpsOriginalDataMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(GpsDataModel model) {
        return model != null && this.deleteById(model.getId());
    }

}