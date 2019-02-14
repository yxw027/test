package com.linghang.service.business.water;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.mapper.business.water.WaterMetaDataMapper;
import com.linghang.model.business.asphalt.AsphaltMetadataResultModel;
import com.linghang.model.business.transport.MaterialInformationModel;
import com.linghang.model.business.water.WaterFormulaModel;
import com.linghang.model.business.water.WaterMetaDataModel;
import com.linghang.model.business.water.WaterSieveSettingModel;
import com.linghang.model.business.water.WaterStaticModel;
import com.linghang.util.Constant;
import com.linghang.util.DatetimeUtil;
import com.linghang.util.ListUtil;
import com.linghang.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Created by dell on 2018/12/19.
 * 沥青元数据 Service
 *
 * @author 田朋
 */
@Service
public class WaterMetaDataService {

    @Autowired
    private WaterMetaDataMapper waterMetaDataMapper;
    @Autowired
    private WaterDataService waterDataService;
    @Autowired
    private WaterFormulaService formulaService;
    @Autowired
    private WaterSieveSettingService sieveSettingService;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.waterMetaDataMapper.deleteById(id) >= 0;
    }

    /**
     * 按主键删除
     */
    public boolean deleteByIds(List<Long> ids) {
        return ids != null && (ids.isEmpty() || this.waterMetaDataMapper.deleteByIds(ids) > 0);
    }

    /**
     * 插入数据
     */
    public boolean insert(WaterMetaDataModel model) {
        return model != null && this.waterMetaDataMapper.insert(model) == 1;
    }

//    /**
//     * 获取站点生产统计信息
//     *
//     * @param staticModel
//     * @return
//     */
//    public PageInfo<WaterStaticModel> getStationStaticData(WaterStaticModel staticModel) {
//        if (staticModel.getStationId() == null) {
//            return new PageInfo<>();
//        }
//
//        //获取生产统计信息
//        List<WaterStaticModel> lstTotalProduct = this.waterMetaDataMapper.getStationStaticData(staticModel);
//        //获取不合格统计信息
//        staticModel.setQualifiedFlag(Constant.NUM_ONE);
//        List<WaterStaticModel> lstUnqualifiedTotalProduct = this.waterMetaDataMapper.getStationStaticData(staticModel);
//
//        staticModel.setQualifiedFlag(Constant.NUM_TWO);
//        List<WaterStaticModel> lstUnqualifiedCementTotalProduct = this.waterMetaDataMapper.getStationStaticData(staticModel);
//        //拼装数据
//        //计算合计栏
//        BigDecimal totalWeight = BigDecimal.ZERO;
//        BigDecimal totalBatch = BigDecimal.ZERO;
//        BigDecimal totalUnQualifiedWeight = BigDecimal.ZERO;
//        BigDecimal totalUnQualifiedBatch = BigDecimal.ZERO;
//        BigDecimal totalUnQualifiedComent = BigDecimal.ZERO;
//        if (!CollectionUtils.isEmpty(lstTotalProduct)) {
//            for (WaterStaticModel waterStaticModel : lstTotalProduct) {
//                if (!CollectionUtils.isEmpty(lstUnqualifiedTotalProduct)) {
//                    if (waterStaticModel.getProductWeight() != null) {
//                        waterStaticModel.setProductWeight(waterStaticModel.getProductWeight().divide(new BigDecimal(Constant.NUM_ONE_THOUSAND), Constant.NUM_FOUR, RoundingMode.HALF_UP));
//                    }
//                    for (WaterStaticModel model : lstUnqualifiedTotalProduct) {
//                        if (!StringUtils.isEmpty(model.getFormula()) && model.getFormula().equals(waterStaticModel.getFormula())) {
//                            waterStaticModel.setUnqualifiedWeight(model.getProductWeight().divide(new BigDecimal(Constant.NUM_ONE_THOUSAND), Constant.NUM_FOUR, RoundingMode.HALF_UP));
//                            String resStr = caleBatchPercenet(model.getProductBatches(), waterStaticModel.getProductBatches());
//                            //累计不合格总重和总批次
//                            totalUnQualifiedBatch = totalUnQualifiedBatch.add(new BigDecimal(model.getProductBatches()));
//                            totalUnQualifiedWeight = totalUnQualifiedWeight.add(waterStaticModel.getUnqualifiedWeight());
//                            waterStaticModel.setUnqualifiedBatches(model.getProductBatches() + "批 （" + resStr + "）");
//                        }
//                    }
//                }
//                if (!CollectionUtils.isEmpty(lstUnqualifiedCementTotalProduct)) {
//                    for (WaterStaticModel comentModel : lstUnqualifiedCementTotalProduct) {
//                        if (!StringUtils.isEmpty(comentModel.getFormula()) && comentModel.getFormula().equals(waterStaticModel.getFormula())) {
//                            String resStr = caleBatchPercenet(comentModel.getProductBatches(), waterStaticModel.getProductBatches());
//                            //累计水泥超标总批次
//                            totalUnQualifiedComent = totalUnQualifiedComent.add(new BigDecimal(comentModel.getProductBatches()));
//                            waterStaticModel.setUnqualifiedComentBatches(comentModel.getProductBatches() + "批 （" + resStr + "）");
//                        }
//                    }
//                }
//                //计算合格率
//                BigDecimal rate = waterStaticModel.getProductWeight().subtract(waterStaticModel.getUnqualifiedWeight()).divide(waterStaticModel.getProductWeight(), Constant.NUM_FOUR, RoundingMode.HALF_UP).multiply(BigDecimal.valueOf(100));
//                waterStaticModel.setPassRate(rate.doubleValue() + "%");
//                //累计总重量和总批次
//                totalWeight = totalWeight.add(waterStaticModel.getProductWeight());
//                totalBatch = totalBatch.add(new BigDecimal(waterStaticModel.getProductBatches()));
//            }
//
//            WaterStaticModel staticModel1 = new WaterStaticModel();
//            staticModel1.setFormula("合计");
//            staticModel1.setProductWeight(totalWeight);
//            staticModel1.setProductBatches(totalBatch + "");
//            staticModel1.setUnqualifiedWeight(totalUnQualifiedWeight);
//            staticModel1.setUnqualifiedBatches(totalUnQualifiedBatch + "批");
//            staticModel1.setPassRate("--");
//            staticModel1.setUnqualifiedComentBatches(totalUnQualifiedComent + "批");
//            lstTotalProduct.add(staticModel1);
//
//        }
//        return new PageInfo<WaterStaticModel>(lstTotalProduct);
//    }


    public List<WaterStaticModel> getStationStaticData(WaterStaticModel staticModel) {
        return staticModel.getStationId() == null || staticModel.getStartTime() == null || staticModel.getEndTime() == null ? new ArrayList<>() : this.getWaterStatisticalData(staticModel);
    }

    public String caleBatchPercenet(String num1, String num2) {
        if (StringUtils.isEmpty(num2) || StringUtils.isEmpty(num2)) {
            return "";
        }
        BigDecimal res = new BigDecimal(num1).divide(new BigDecimal(num2), 2, RoundingMode.HALF_UP);
        NumberFormat percent = NumberFormat.getPercentInstance();
        percent.setMaximumFractionDigits(2);
        return percent.format(res.doubleValue());
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<WaterMetaDataModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > Constant.NUM_ONE_HUNDRED) {
            for (List<WaterMetaDataModel> list : ListUtil.getSubList(models, Constant.NUM_ONE_HUNDRED)) {
                this.waterMetaDataMapper.insertList(list);
            }
        } else {
            return this.waterMetaDataMapper.insertList(models) > 0;
        }
        return true;
    }

    /**
     * 插入数据,字段为空时不插入
     */
    public boolean insertSelective(WaterMetaDataModel model) {
        return model != null && this.waterMetaDataMapper.insertSelective(model) == 1;
    }

    /**
     * 按主键选择
     */
    public WaterMetaDataModel selectById(Long id) {
        return id == null ? null : this.waterMetaDataMapper.selectById(id);
    }


    public PageInfo<WaterMetaDataModel> selectByOptions(WaterMetaDataModel waterMetaDataModel) {
        if (waterMetaDataModel == null) {
            return new PageInfo<>();
        }
        if (waterMetaDataModel.getPageSize() == null) {
            waterMetaDataModel.setPageSize(1);
            PageHelper.startPage(waterMetaDataModel.getPage(), waterMetaDataModel.getPageSize());
            PageInfo<WaterMetaDataModel> info = new PageInfo<>(this.waterMetaDataMapper.selectByOptions(waterMetaDataModel));
            waterMetaDataModel.setPageSize((int) info.getTotal());
        }
        PageHelper.startPage(waterMetaDataModel.getPage(), waterMetaDataModel.getPageSize());
        return new PageInfo<>(this.waterMetaDataMapper.selectByOptions(waterMetaDataModel));
    }

    /**
     * 按模型选择
     */
    public List<WaterMetaDataModel> selectByModel(WaterMetaDataModel waterMetaDataModel) {
        return waterMetaDataModel == null ? new ArrayList<>(0) : this.waterMetaDataMapper.selectByModel(waterMetaDataModel);
    }

    /**
     * 按主键更新,字段为空时不更新
     */
    public boolean updateByIdSelective(WaterMetaDataModel model) {
        return !(model == null || model.getId() == null) && this.waterMetaDataMapper.updateByIdSelective(model) == 1;
    }

    /**
     * 按主键更新
     */
    public boolean updateById(WaterMetaDataModel model) {
        return !(model == null || model.getId() == null) && this.waterMetaDataMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(WaterMetaDataModel model) {
        return !(model == null || model.getId() == null) && this.waterMetaDataMapper.deleteById(model.getId()) >= 0;
    }

    public List<Map<String, Object>> getSearchTimeMark(Long stationId) {
        return waterMetaDataMapper.getSearchTimeMark(stationId);
    }

    /**
     * 插入或更新
     */
    public boolean insertOrUpdate(WaterMetaDataModel model) {
        if (model == null) {
            return false;
        }
        if (model.getId() == null) {
            return this.waterMetaDataMapper.insert(model) == 1;
        }
        return this.waterMetaDataMapper.updateById(model) == 1;
    }


    /**
     * 查询数据重复
     *
     * @param model
     * @return
     */
    public List<WaterMetaDataModel> selectRepeatData(WaterMetaDataModel model) {
        return waterMetaDataMapper.selectRepeatData(model);
    }

    /**
     * 数据接收
     *
     * @param model
     * @return
     */
    public String receiveData(WaterMetaDataModel model) {
        return waterDataService.receiveData(model, false);
    }

    /**
     * 新增配方--处理未处理数据
     *
     * @param formulaId
     * @return
     */
    public Map<String, Object> processData(Long formulaId) {
        WaterFormulaModel formulaModel = formulaService.selectById(formulaId);
        if (formulaModel == null) {
            return ResultUtil.getErrorResultMap("配方信息错误");
        }
        List<WaterSieveSettingModel> list = sieveSettingService.selectByFormulaId(formulaId);
        if (CollectionUtils.isEmpty(list)) {
            return ResultUtil.getErrorResultMap("未配置级配参数");
        }
        List<WaterMetaDataModel> metadataModels = waterMetaDataMapper.selectByFormulaCodeAndStationId(formulaModel.getNumber(), formulaModel.getStationId(), formulaModel.getType());
        boolean isFail = false;
        if (!CollectionUtils.isEmpty(metadataModels)) {
            for (WaterMetaDataModel model : metadataModels) {
                model.setMixingMachineId(model.getStationId());
                model.setFormulaCode(formulaModel.getNumber());
                model.setFormulaId(formulaModel.getId());
                String res = waterDataService.receiveData(model, true);
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

    /**
     * 查询时间段内的数据
     *
     * @param startTime
     * @param endTime
     * @return
     */
    public Map<String, Object> selectDataByTime(String startTime, String endTime, Long mixingId) {
        if (!DatetimeUtil.isDefaultDateFormat(startTime) || !DatetimeUtil.isDefaultDateFormat(endTime)) {
            return ResultUtil.getErrorResultMap("参数格式错误，时间格式为yyyy-MM-dd HH:mm:ss");
        }
        List<MaterialInformationModel> list = waterMetaDataMapper.selectDataByTime(startTime, endTime, mixingId);
        return ResultUtil.getSuccessResultMap(list);
    }

    public Map<String, Object> selectDataByIds(String ids) {
        if (StringUtils.isEmpty(ids)) {
            return ResultUtil.getErrorResultMap("参数不能为空");
        }
        String[] id = ids.split(",");
        List<Map<String, Object>> list = waterMetaDataMapper.selectDataByIds(Arrays.asList(id));
        return ResultUtil.getSuccessResultMap(list);
    }

    public List<WaterStaticModel> getWaterStatisticalData(WaterStaticModel model) {
        return this.waterMetaDataMapper.getWaterStatisticalData(model);
    }

    public Map<String, Object> selectWeight(String start, String end, Long mixingId) {
        return waterMetaDataMapper.selectWeight(start, end, mixingId);
    }

    public List<WaterMetaDataModel> getContinuousData(Long stationId , int size,Long dataId) {
        return waterMetaDataMapper.getContinuousData(stationId , size , dataId);
    }

    public Integer getWarningLevel(Long dataId) {
        return waterMetaDataMapper.getWarningLevel(dataId);
    }
}