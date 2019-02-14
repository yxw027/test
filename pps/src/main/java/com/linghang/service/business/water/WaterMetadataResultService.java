package com.linghang.service.business.water;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.business.water.WaterMetadataResultMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.water.WaterMetaDataModel;
import com.linghang.model.business.water.WaterMetadataResultModel;
import com.linghang.model.business.water.WaterWarningMessageModel;
import com.linghang.model.business.water.param.WaterMetadataResultParamMolde;
import com.linghang.util.Constant;
import com.linghang.util.ListUtil;
import com.linghang.util.ResultUtil;
import com.linghang.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by lvruixing on 2018/12/19.
 * 元数据计算结果表 Service
 *
 * @author 田朋
 */
@Service
public class WaterMetadataResultService {

    @Autowired
    private WaterMetadataResultMapper waterMetadataResultMapper;
    @Autowired
    private WaterWarningMessageService messageService;

    /**
     * 获取实时数据级配信息
     *
     * @param metaDataModel
     * @return
     */
    public PageInfo<WaterMetadataResultModel> selectByOptions(WaterMetaDataModel metaDataModel) {
        if (metaDataModel == null || metaDataModel.getStationId() == null) {
            return new PageInfo<>();
        }
        if (metaDataModel.getPageSize() == null) {
            metaDataModel.setPageSize(1);
            PageHelper.startPage(metaDataModel.getPage(), metaDataModel.getPageSize());
            PageInfo<WaterMetadataResultModel> info = new PageInfo<WaterMetadataResultModel>(this.waterMetadataResultMapper.selectByOptions(metaDataModel));
            metaDataModel.setPageSize((int) info.getTotal());
        }
        PageHelper.startPage(metaDataModel.getPage(), metaDataModel.getPageSize());
        return new PageInfo<WaterMetadataResultModel>(this.waterMetadataResultMapper.selectByOptions(metaDataModel));
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.waterMetadataResultMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.waterMetadataResultMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(WaterMetadataResultModel model) {
        return model != null && this.waterMetadataResultMapper.insert(model) == 1;
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<WaterMetadataResultModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > Constant.NUM_ONE_HUNDRED) {
            for (List<WaterMetadataResultModel> list : ListUtil.getSubList(models, Constant.NUM_ONE_HUNDRED)) {
                this.waterMetadataResultMapper.insertList(list);
            }
        } else {
            return this.waterMetadataResultMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(WaterMetadataResultModel model) {
        return model != null && this.waterMetadataResultMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public WaterMetadataResultModel selectById(Long id) {
        return id == null ? null : this.waterMetadataResultMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<WaterMetadataResultModel> selectByModel(WaterMetadataResultModel model) {
        return model == null ? new ArrayList<>(0) : this.waterMetadataResultMapper.selectByModel(model);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(WaterMetadataResultModel model) {
        return !(model == null || model.getId() == null) && this.waterMetadataResultMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(WaterMetadataResultModel model) {
        return !(model == null || model.getId() == null) && this.waterMetadataResultMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(WaterMetadataResultModel model) {
        return !(model == null || model.getId() == null) && this.waterMetadataResultMapper.deleteById(model.getId()) >= 0;
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(WaterMetadataResultModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.waterMetadataResultMapper.insert(model) == 1;
        }
        return this.waterMetadataResultMapper.updateById(model) == 1;
    }

    /**
     * 获取当日生产数据统计信息
     *
     * @param stationId
     * @param searchTime
     * @return
     */
    public Map<String, Object> getCountStatistic(Long stationId, String searchTime) {
        List<Map<String, Object>> list = waterMetadataResultMapper.getCountStatistic(stationId, searchTime);
        return ResultUtil.getSuccessResultMap(list);
    }

    public PageInfo<WaterMetadataResultModel> getWarningData(KendoOptions options, Long stationId, String startTime, String endTime, Integer warningType) {
        if (options == null || stationId == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.waterMetadataResultMapper.getWarningData(options, stationId, startTime, endTime, warningType));

    }

    public WaterMetadataResultParamMolde getGradationInfo(Long id) {
        return waterMetadataResultMapper.getGradationInfo(id);
    }

    /**
     * 提取controller方法到server
     *
     * @param id
     * @return
     */
    public WaterMetadataResultModel getGradationInfoNew(Long id) {
        WaterMetadataResultModel resultModel = new WaterMetadataResultModel();
        resultModel.setDataId(id);
        List<WaterMetadataResultModel> lst = this.waterMetadataResultMapper.selectByModel(resultModel);
        WaterMetadataResultModel wmModel = new WaterMetadataResultModel();
        //判断是否是级配超标
        if (CollectionUtils.isEmpty(lst) || Utils.integerIsEmpty(wmModel.getIsPass())) {
            if (!CollectionUtils.isEmpty(lst)) {
                wmModel = lst.get(0);
            }
            WaterWarningMessageModel wwModel = messageService.selectByDataId(id);
            if (wwModel != null) {
                wmModel.setExcessMsg(wwModel.getContent());
            }
        }
        return wmModel;

    }

    /**
     * app端获取数据的级配数据信息
     *
     * @param id
     * @return
     */
    public Map<String, Object> getWaterGradationInfo(Long id) {
        WaterMetadataResultModel resultModel = new WaterMetadataResultModel();
        resultModel.setDataId(id);
        List<WaterMetadataResultModel> lst = this.waterMetadataResultMapper.selectByModel(resultModel);
        if (CollectionUtils.isEmpty(lst)) {
            return ResultUtil.getErrorResultMap("无级配数据");
        }
        WaterMetadataResultModel wmModel = lst.get(0);
        WaterWarningMessageModel wwModel = messageService.selectByDataId(id);
        if (wwModel != null) {
            wmModel.setExcessMsg(wwModel.getContent());
        }
        return ResultUtil.getSuccessResultMap(wmModel);
    }
}