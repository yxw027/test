package com.linghang.service.business.asphalt;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.business.asphalt.AsphaltMetadataResultMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltInfoModel;
import com.linghang.model.business.asphalt.AsphaltMetadataModel;
import com.linghang.model.business.asphalt.AsphaltMetadataResultModel;
import com.linghang.model.business.asphalt.param.AsphaltFormulaParamModel;
import com.linghang.model.business.asphalt.param.AsphaltKendoOptions;
import com.linghang.model.business.asphalt.param.AsphaltMetadataResultParamModel;
import com.linghang.util.ListUtil;
import com.linghang.util.ResultUtil;
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
 * @author wuchen on 2018/12/17.
 * 元数据计算结果表 Service
 */
@Service
public class AsphaltMetadataResultService {

    private Logger logger = LoggerFactory.getLogger(AsphaltMetadataResultService.class);


    @Autowired
    private AsphaltMetadataResultMapper asphaltMetadataResultMapper;
    @Autowired
    private AsphaltFormulaService formulaService;
    @Autowired
    private AsphaltInfoService infoService;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.asphaltMetadataResultMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.asphaltMetadataResultMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(AsphaltMetadataResultModel model) {
        return model != null && this.asphaltMetadataResultMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<AsphaltMetadataResultModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<AsphaltMetadataResultModel> list : ListUtil.getSubList(models, 100)) {
                this.asphaltMetadataResultMapper.insertList(list);
            }
        } else {
            return this.asphaltMetadataResultMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(AsphaltMetadataResultModel model) {
        return model != null && this.asphaltMetadataResultMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public AsphaltMetadataResultModel selectById(Long id) {
        return id == null ? null : this.asphaltMetadataResultMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<AsphaltMetadataResultModel> selectByModel(AsphaltMetadataResultModel model) {
        return model == null ? new ArrayList<>(0) : this.asphaltMetadataResultMapper.selectByModel(model);
    }


    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(AsphaltMetadataResultModel model) {
        return !(model == null || model.getId() == null) && this.asphaltMetadataResultMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(AsphaltMetadataResultModel model) {
        return !(model == null || model.getId() == null) && this.asphaltMetadataResultMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(AsphaltMetadataResultModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<AsphaltMetadataResultParamModel> selectByOptions(AsphaltKendoOptions options) {
        if (options == null) {
            return new PageInfo<>();
        }
        if (options.getPageSize() == null) {
            options.setPageSize(1);
            PageHelper.startPage(options.getPage(), options.getPageSize());
            PageInfo<AsphaltMetadataResultParamModel> info = new PageInfo<>(this.asphaltMetadataResultMapper.selectByOptions(options));
            options.setPageSize((int) info.getTotal());
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.asphaltMetadataResultMapper.selectByOptions(options));
    }

    /**
     * 查询
     *
     * @param id
     * @return
     */
    public AsphaltMetadataResultParamModel getGradationInfo(Long id) {
        return asphaltMetadataResultMapper.getGradationInfo(id);
    }

    public List<AsphaltMetadataResultModel> getContinuousData(Long asphaltId , int size) {
        return asphaltMetadataResultMapper.getContinuousData(asphaltId , size);
    }

    public List<AsphaltMetadataResultModel> getContinuousLevelData(Long asphaltId , int size) {
        return asphaltMetadataResultMapper.getContinuousLevelData(asphaltId , size);
    }

    /**
     * 获取图标分析数据
     *
     * @param asphaltId
     * @param searchTime
     * @param formulaId
     * @return
     */
    public Map<String, Object> echartAnalysisData(Long asphaltId, String searchTime, Long formulaId) {
        if (asphaltId == null || StringUtils.isEmpty(searchTime)) {
            return ResultUtil.getErrorResultMap("信息错误");
        }
        Map<String, Object> map = new HashMap<>(16);
        List<AsphaltMetadataModel> list = asphaltMetadataResultMapper.selectAnalysisData(asphaltId, searchTime, formulaId);
        AsphaltFormulaParamModel model = formulaService.getDetailById(formulaId);
        AsphaltInfoModel infoModel = infoService.selectById(asphaltId);
        map.put("list", list);
        map.put("model", model);
        map.put("info", infoModel);
        return ResultUtil.getSuccessResultMap(map);
    }

    /**
     * 获取统计信息
     *
     * @param asphaltId
     * @param searchTime
     * @param formulaId
     * @param type
     * @return
     */
    public Map<String, Object> getCountStatistic(Long asphaltId, String searchTime, Long formulaId, Long type) {
        List<Map<String, Object>> list = asphaltMetadataResultMapper.getCountStatistic(asphaltId, searchTime, formulaId, type);
        return ResultUtil.getSuccessResultMap(list);
    }

    public PageInfo<AsphaltMetadataResultModel> getWarningData(KendoOptions options, Long asphaltId, String startTime, String endTime, Integer warningType) {
        if (options == null || asphaltId == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.asphaltMetadataResultMapper.getWarningData(options, asphaltId, startTime, endTime, warningType));

    }
}