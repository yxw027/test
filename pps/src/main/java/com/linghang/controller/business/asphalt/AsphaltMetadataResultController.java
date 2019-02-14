package com.linghang.controller.business.asphalt;

import com.github.pagehelper.PageInfo;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltMetadataResultModel;
import com.linghang.model.business.asphalt.param.AsphaltKendoOptions;
import com.linghang.model.business.asphalt.param.AsphaltMetadataResultParamModel;
import com.linghang.service.business.asphalt.AsphaltMetadataResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @author wuchen on 2018/12/17.
 * 元数据计算结果表 Controller
 */
@RestController
@RequestMapping("asphaltMetadataResult")
public class AsphaltMetadataResultController {

    @Autowired
    private AsphaltMetadataResultService asphaltMetadataResultService;

    /**
     * 跳转页面
     */
    @RequestMapping("list")
    public ModelAndView list(ModelAndView mv) {
        mv.setViewName("asphaltmetadataresult");
        return mv;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<AsphaltMetadataResultModel> showAll() {
        AsphaltMetadataResultModel model = new AsphaltMetadataResultModel();
        return this.asphaltMetadataResultService.selectByModel(model);
    }

    /**
     * 按前台条件选择
     */
    @RequestMapping("show")
    public PageInfo<AsphaltMetadataResultParamModel> selectByOptions(AsphaltKendoOptions options) {
        return this.asphaltMetadataResultService.selectByOptions(options);
    }

    /**
     * 根据元数据id查询级配信息
     *
     * @param id
     * @return
     */
    @RequestMapping("getGradationInfo")
    public AsphaltMetadataResultParamModel getGradationInfo(Long id) {
        return asphaltMetadataResultService.getGradationInfo(id);
    }

    /**
     * 获取图标分析数据
     *
     * @param asphaltId
     * @param searchTime
     * @return
     */
    @RequestMapping("echartAnalysisData")
    public Map<String, Object> echartAnalysisData(Long asphaltId, String searchTime, Long formulaId) {
        return asphaltMetadataResultService.echartAnalysisData(asphaltId, searchTime, formulaId);
    }


    /**
     * 获取图标分析数据
     *
     * @param asphaltId
     * @return
     */
    @RequestMapping("getWarningData")
    public PageInfo<AsphaltMetadataResultModel> getWarningData(Long asphaltId, KendoOptions options, String startTime, String endTime, Integer warningType) {
        return asphaltMetadataResultService.getWarningData(options, asphaltId, startTime, endTime, warningType);
    }


    /**
     * 获取统计信息
     *
     * @param asphaltId
     * @param searchTime
     * @param formulaId  配方id只有图标分析时有
     * @return
     */
    @RequestMapping("getCountStatistic")
    public Map<String, Object> getCountStatistic(Long asphaltId, String searchTime, Long formulaId, Long type) {
        return asphaltMetadataResultService.getCountStatistic(asphaltId, searchTime, formulaId, type);
    }
}