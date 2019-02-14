package com.linghang.service.business.asphalt;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.business.asphalt.AsphaltPushSettingMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltPushSettingModel;
import com.linghang.util.ResultUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author wuchen on 2018/12/17.
 * 通知设置表 Service
 */
@Service
public class AsphaltPushSettingService {

    private Logger logger = LoggerFactory.getLogger(AsphaltPushSettingService.class);


    @Autowired
    private AsphaltPushSettingMapper asphaltPushSettingMapper;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.asphaltPushSettingMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.asphaltPushSettingMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(AsphaltPushSettingModel model) {
        return model != null && this.asphaltPushSettingMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public Map<String, Object> insertList(List<AsphaltPushSettingModel> models) {
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
    public boolean insertSelective(AsphaltPushSettingModel model) {
        return model != null && this.asphaltPushSettingMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public AsphaltPushSettingModel selectById(Long id) {
        return id == null ? null : this.asphaltPushSettingMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<AsphaltPushSettingModel> selectByModel(AsphaltPushSettingModel model) {
        return model == null ? new ArrayList<>(0) : this.asphaltPushSettingMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(AsphaltPushSettingModel model) {
        return !(model == null || model.getId() == null) && this.asphaltPushSettingMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(AsphaltPushSettingModel model) {
        return !(model == null || model.getId() == null) && this.asphaltPushSettingMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(AsphaltPushSettingModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<AsphaltPushSettingModel> selectByOptions(KendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.asphaltPushSettingMapper.selectByOptions(options));
    }

    public AsphaltPushSettingModel selectByAsphaltIdAndType(Long asphaltId, Integer type) {
        return asphaltPushSettingMapper.selectByAsphaltIdAndType(asphaltId, type);
    }

    /**
     * 根据站点Id查询报警配置
     *
     * @param asphaltId
     * @return
     */
    public List<AsphaltPushSettingModel> getWarningPhone(Long asphaltId) {
        return asphaltId == null ? new ArrayList<>() : asphaltPushSettingMapper.getAsphaltWarning(asphaltId, null, null);
    }
}