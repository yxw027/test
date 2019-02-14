package com.linghang.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.GpsDataGroupMapper;
import com.linghang.model.GpsDataGroupModel;
import com.linghang.model.StakeGroupModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.util.ListUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by i_it on 2019/01/10.
 * 摊铺统计 Service
 */
@Service
public class GpsDataGroupService {

    @Autowired
    private GpsDataGroupMapper gpsDataGroupMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.gpsDataGroupMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.gpsDataGroupMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(GpsDataGroupModel model) {
        return model != null && this.gpsDataGroupMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<GpsDataGroupModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<GpsDataGroupModel> list : ListUtil.getSubList(models, 100)) {
                this.gpsDataGroupMapper.insertList(list);
            }
        } else {
            return this.gpsDataGroupMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(GpsDataGroupModel model) {
        return model != null && this.gpsDataGroupMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public GpsDataGroupModel selectById(Long id) {
        return id == null ? null : this.gpsDataGroupMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<GpsDataGroupModel> selectByModel(GpsDataGroupModel model) {
        return model == null ? new ArrayList<>(0) : this.gpsDataGroupMapper.selectByModel(model);
    }


    /**
     * 按模型选择
     */
    public PageInfo<GpsDataGroupModel> selectByOptions(KendoOptions options, Long orgId) {
        if (options == null || orgId == null) {
            return new PageInfo<>();
        }
        GpsDataGroupModel model = new GpsDataGroupModel();
        model.setOrgId(orgId);
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.gpsDataGroupMapper.selectByModel(model));
    }
    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(GpsDataGroupModel model) {
        return !(model == null || model.getId() == null) && this.gpsDataGroupMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(GpsDataGroupModel model) {
        return !(model == null || model.getId() == null) && this.gpsDataGroupMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(GpsDataGroupModel model) {
        return !(model == null || model.getId() == null) && this.gpsDataGroupMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(GpsDataGroupModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.gpsDataGroupMapper.insert(model) == 1;
        }
        return this.gpsDataGroupMapper.updateById(model) == 1;
    }

    /**
     * 按模型选择
     */
    public  PageInfo<GpsDataGroupModel> selectCountByModel(KendoOptions options, Long workAreaId, Date startTime, Date endTime) {
        if (options == null || workAreaId == null) {
            return new PageInfo<>();
        }
        GpsDataGroupModel model = new GpsDataGroupModel();
        model.setWorkAreaId(workAreaId);
        model.setStartTime(startTime);
        model.setEndTime(endTime);
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.gpsDataGroupMapper.selectCountByModel(model));
    }
}