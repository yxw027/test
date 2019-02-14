package com.linghang.service.business.water;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.business.water.WaterWarningMessageMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.water.WaterWarningMessageModel;
import com.linghang.util.Constant;
import com.linghang.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lvruixing on 2018/12/19.
 * 告警信息表 Service
 *
 * @author lvruixing
 */
@Service
public class WaterWarningMessageService {

    @Autowired
    private WaterWarningMessageMapper waterWarningMessageMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.waterWarningMessageMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.waterWarningMessageMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(WaterWarningMessageModel model) {
        return model != null && this.waterWarningMessageMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<WaterWarningMessageModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > Constant.NUM_ONE_HUNDRED) {
            for (List<WaterWarningMessageModel> list : ListUtil.getSubList(models, Constant.NUM_ONE_HUNDRED)) {
                this.waterWarningMessageMapper.insertList(list);
            }
        } else {
            return this.waterWarningMessageMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(WaterWarningMessageModel model) {
        return model != null && this.waterWarningMessageMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public WaterWarningMessageModel selectById(Long id) {
        return id == null ? null : this.waterWarningMessageMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<WaterWarningMessageModel> selectByModel(WaterWarningMessageModel model) {
        return model == null ? new ArrayList<>(0) : this.waterWarningMessageMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(WaterWarningMessageModel model) {
        return !(model == null || model.getId() == null) && this.waterWarningMessageMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(WaterWarningMessageModel model) {
        return !(model == null || model.getId() == null) && this.waterWarningMessageMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(WaterWarningMessageModel model) {
        return !(model == null || model.getId() == null) && this.waterWarningMessageMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(WaterWarningMessageModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.waterWarningMessageMapper.insert(model) == 1;
        }
        return this.waterWarningMessageMapper.updateById(model) == 1;
    }

    public PageInfo<WaterWarningMessageModel> getWarningData(KendoOptions options, Long stationId, String startTime, String endTime, Integer warningType, Integer dealStatus) {
        if (options == null || stationId == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.waterWarningMessageMapper.getWarningData(options, stationId, startTime, endTime, warningType, dealStatus));

    }

    public List<String> getSearchTimeMark(Long stationId) {
        return waterWarningMessageMapper.getSearchTimeMark(stationId);

    }

    public WaterWarningMessageModel selectByDataId(Long dataId) {
        return waterWarningMessageMapper.selectByDataId(dataId);
    }
}