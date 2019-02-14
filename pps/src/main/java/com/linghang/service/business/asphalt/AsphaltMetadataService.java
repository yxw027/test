package com.linghang.service.business.asphalt;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.business.asphalt.AsphaltMetadataMapper;
import com.linghang.model.business.asphalt.AsphaltFormulaModel;
import com.linghang.model.business.asphalt.AsphaltMetadataModel;
import com.linghang.model.business.asphalt.AsphaltSieveSettingModel;
import com.linghang.model.business.asphalt.AsphaltStatisticsReportModel;
import com.linghang.model.business.asphalt.param.AsphaltKendoOptions;
import com.linghang.model.business.asphalt.param.WeeModel;
import com.linghang.model.business.transport.MaterialInformationModel;
import com.linghang.util.DatetimeUtil;
import com.linghang.util.ResultUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.*;

/**
 * @author wuchen on 2018/12/17.
 * 沥青元数据 Service
 */
@Service
public class AsphaltMetadataService {

    private Logger logger = LoggerFactory.getLogger(AsphaltMetadataService.class);

    @Autowired
    private AsphaltMetadataMapper asphaltMapper;
    @Autowired
    private AsphaltDataService asphaltDataService;
    @Autowired
    private AsphaltSieveSettingService sieveSettingService;
    @Autowired
    private AsphaltFormulaService formulaService;

    /**
     * 插入数据
     */
    public boolean insert(AsphaltMetadataModel model) {
        return model != null && this.asphaltMapper.insert(model) == 1;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(AsphaltMetadataModel model) {
        return model != null && this.asphaltMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public AsphaltMetadataModel selectById(Long id) {
        return id == null ? null : this.asphaltMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<AsphaltMetadataModel> selectByModel(AsphaltMetadataModel model) {
        return model == null ? new ArrayList<>(0) : this.asphaltMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(AsphaltMetadataModel model) {
        return !(model == null || model.getId() == null) && this.asphaltMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(AsphaltMetadataModel model) {
        return !(model == null || model.getId() == null) && this.asphaltMapper.updateById(model) == 1;
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<AsphaltMetadataModel> selectByOptions(AsphaltKendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        if (options.getPageSize() == null) {
            options.setPageSize(1);
            PageHelper.startPage(options.getPage(), options.getPageSize());
            PageInfo<AsphaltMetadataModel> info = new PageInfo<>(this.asphaltMapper.selectByOptions(options));
            options.setPageSize((int) info.getTotal());
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.asphaltMapper.selectByOptions(options));
    }

    /**
     * 数据接收
     *
     * @param model
     * @return
     */
    public String receiveData(AsphaltMetadataModel model) {
        return asphaltDataService.receiveData(model, false);
    }

    /**
     * 统计报表查询
     */
    public List<AsphaltStatisticsReportModel> dailyStatistical(Long asphaltId, String time, Integer type, String year, String startTime, String endTime) {
        Map<String, Object> map = new HashMap<>();
        map.put("asphaltId", asphaltId);
        map.put("time", time);
        map.put("type", type);
        map.put("year", year);
        map.put("startTime", startTime);
        map.put("endTime", endTime);
        return this.asphaltMapper.dailyStatistical(map);
    }

    /**
     * 获取周
     */
    public List<WeeModel> getWeek(Long asphaltId, String year) {
        List<WeeModel> weeks = this.asphaltMapper.getWeek(asphaltId, year);
        if (!CollectionUtils.isEmpty(weeks)) {
            weeks.forEach(model -> {
                model.setName(model.getName() + " (" +
                        DatetimeUtil.getDatFormat(model.getValue(), year, 2, false) + "至" +
                        DatetimeUtil.getDatFormat(model.getValue(), year, 0, true) + ")"
                );
            });
        }
        return weeks;
    }

    /**
     * 查询数据重复
     *
     * @param model
     * @return
     */
    public List<AsphaltMetadataModel> selectRepeatData(AsphaltMetadataModel model) {
        return asphaltMapper.selectRepeatData(model);
    }

    public List<Map<String, Object>> getSearchTimeMark(Long asphaltId) {
        return asphaltMapper.getSearchTimeMark(asphaltId);
    }

    /**
     * 新增配方--处理未处理数据
     *
     * @param formulaId
     * @return
     */
    public Map<String, Object> processData(Long formulaId) {
        AsphaltFormulaModel formulaModel = formulaService.selectById(formulaId);
        if (formulaModel == null) {
            return ResultUtil.getErrorResultMap("配方信息错误");
        }
        List<AsphaltSieveSettingModel> list = sieveSettingService.selectByFormulaId(formulaId);
        if (CollectionUtils.isEmpty(list)) {
            return ResultUtil.getErrorResultMap("未配置级配参数");
        }
        List<AsphaltMetadataModel> metadataModels = asphaltMapper.selectByFormulaCodeAndAsphaltId(formulaModel.getAsphaltNo(), formulaModel.getAsphaltId());
        boolean isFail = false;
        if (!CollectionUtils.isEmpty(metadataModels)) {
            for (AsphaltMetadataModel model : metadataModels) {
                model.setMixingMachineId(model.getAsphaltId());
                String res = asphaltDataService.receiveData(model, true);
                if ("fail".equals(res)) {
                    isFail = true;
                }
            }
            if (isFail) {
                return ResultUtil.getErrorResultMap("有部分数据未处理成功");
            }
        }
        return ResultUtil.getSuccessResultMap("处理成功");
    }

    public List<String> getSearchTimeMonthMark(Long asphaltId, Integer type) {
        return asphaltMapper.getSearchTimeMonthMark(asphaltId, type);
    }

    /**
     * 根据时间范围查询数据，车辆运输查询运输成品料信息
     *
     * @param startTime
     * @param endTime
     * @param mixingId
     * @return
     */
    public Map<String, Object> selectDataByTime(String startTime, String endTime, Long mixingId) {
        if (!DatetimeUtil.isDefaultDateFormat(startTime) || !DatetimeUtil.isDefaultDateFormat(endTime)) {
            return ResultUtil.getErrorResultMap("参数格式错误，时间格式为yyyy-MM-dd HH:mm:ss");
        }
        List<MaterialInformationModel> list = asphaltMapper.selectDataByTime(startTime, endTime, mixingId);
        return ResultUtil.getSuccessResultMap(list);
    }

    /**
     * 根据IDS集合查询数据
     *
     * @param ids
     * @return
     */
    public Map<String, Object> selectDataByIds(String ids) {
        if (StringUtils.isEmpty(ids)) {
            return ResultUtil.getErrorResultMap("参数不能为空");
        }
        String[] id = ids.split(",");
        List<Map<String, Object>> list = asphaltMapper.selectDataByIds(Arrays.asList(id));
        return ResultUtil.getSuccessResultMap(list);
    }

    public Map<String, Object> selectWeight(String start, String end, Long mixingId) {
        return asphaltMapper.selectWeight(start, end, mixingId);
    }
}