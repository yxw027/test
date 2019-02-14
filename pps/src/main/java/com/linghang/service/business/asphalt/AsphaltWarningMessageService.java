package com.linghang.service.business.asphalt;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.business.asphalt.AsphaltWarningMessageMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltWarningMessageModel;
import com.linghang.model.business.asphalt.param.WeeModel;
import com.linghang.util.DatetimeUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wuchen on 2018/12/17.
 * 告警信息表 Service
 */
@Service
public class AsphaltWarningMessageService {

    private Logger logger = LoggerFactory.getLogger(AsphaltWarningMessageService.class);


    @Autowired
    private AsphaltWarningMessageMapper asphaltWarningMessageMapper;

    /**
     * 插入数据
     */
    public boolean insert(AsphaltWarningMessageModel model) {
        return model != null && this.asphaltWarningMessageMapper.insert(model) == 1;
    }

    /**
     * 按主键选择
     */
    public AsphaltWarningMessageModel selectById(Long id) {
        return id == null ? null : this.asphaltWarningMessageMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<AsphaltWarningMessageModel> selectByModel(AsphaltWarningMessageModel model) {
        return model == null ? new ArrayList<>(0) : this.asphaltWarningMessageMapper.selectByModel(model);
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<AsphaltWarningMessageModel> selectByOptions(KendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.asphaltWarningMessageMapper.selectByOptions(options));
    }

    public PageInfo<AsphaltWarningMessageModel> getWarningData(KendoOptions options, Long asphaltId, String startTime, String endTime, Integer warningType, Integer dealStatus) {
        if (options == null || asphaltId == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.asphaltWarningMessageMapper.getWarningData(options, asphaltId, startTime, endTime, warningType, dealStatus));

    }

    public List<WeeModel> getFormulas(Long asphaltId, String startTime, String endTime, Integer warningType, Integer dealStatus) {
        return this.asphaltWarningMessageMapper.getFormulas(asphaltId, startTime, endTime, warningType, dealStatus);
    }

    /**
     * 更新
     *
     * @param model1
     * @return
     */
    public int updateByModel(AsphaltWarningMessageModel model1) {
        return this.asphaltWarningMessageMapper.updateByModel(model1);
    }

    /**
     * 判断查询参数是否为空 或者格式错误
     *
     * @param options
     * @param id
     * @param start
     * @param end
     * @return
     */
    public boolean isNull(KendoOptions options, Long id, String start, String end) {
        if (options.getPage() == null || options.getPageSize() == null || id == null
                || !DatetimeUtil.isDefaultDateFormat(start) ||
                !DatetimeUtil.isDefaultDateFormat(end)) {
            return true;
        }
        return false;
    }
}