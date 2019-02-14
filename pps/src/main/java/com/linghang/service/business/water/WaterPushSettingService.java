package com.linghang.service.business.water;

import com.linghang.mapper.business.water.WaterPushSettingMapper;
import com.linghang.model.business.water.WaterPushSettingModel;
import com.linghang.util.ResultUtil;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by lvruixing on 2018/12/19.
 * 通知设置表 Service
 *
 * @author lvruixing
 */
@Service
public class WaterPushSettingService {

    @Autowired
    private WaterPushSettingMapper waterPushSettingMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.waterPushSettingMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.waterPushSettingMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(WaterPushSettingModel model) {
        return model != null && this.waterPushSettingMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public Map<String, Object> insertList(List<WaterPushSettingModel> models) {
        if (CollectionUtils.isEmpty(models)) {
            return ResultUtil.getErrorResultMap("参数异常!");
        }
        models.forEach(model -> {
            if (StringUtils.isEmpty(model.getId())) {
                this.insert(model);
            } else {
                this.updateByIdSelective(model);
            }
        });
        return ResultUtil.getSuccessResultMap("保存成功!");
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(WaterPushSettingModel model) {
        return model != null && this.waterPushSettingMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public WaterPushSettingModel selectById(Long id) {
        return id == null ? null : this.waterPushSettingMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<WaterPushSettingModel> selectByModel(WaterPushSettingModel model) {
        return model == null ? new ArrayList<>(0) : this.waterPushSettingMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(WaterPushSettingModel model) {
        return !(model == null || model.getId() == null) && this.waterPushSettingMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(WaterPushSettingModel model) {
        return !(model == null || model.getId() == null) && this.waterPushSettingMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(WaterPushSettingModel model) {
        return !(model == null || model.getId() == null) && this.waterPushSettingMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(WaterPushSettingModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.waterPushSettingMapper.insert(model) == 1;
        }
        return this.waterPushSettingMapper.updateById(model) == 1;
    }

    /**
     * 根据站点Id查询报警配置
     *
     * @param stationId
     * @return
     */
    public List<WaterPushSettingModel> getWarningPhone(Long stationId) {
        return stationId == null ? new ArrayList<>() : waterPushSettingMapper.getWarning(stationId, null, null);
    }

    public WaterPushSettingModel selectByStationIdAndType(Long asphaltId, Integer type) {
        return waterPushSettingMapper.selectByStationIdAndType(asphaltId, type);
    }
}