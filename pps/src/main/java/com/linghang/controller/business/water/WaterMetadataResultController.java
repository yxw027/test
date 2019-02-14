package com.linghang.controller.business.water;

import com.github.pagehelper.PageInfo;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.water.WaterMetadataResultModel;
import com.linghang.model.business.water.param.WaterMetadataResultParamMolde;
import com.linghang.service.business.water.WaterMetadataResultService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by lvruixing on 2018/12/19.
 * 元数据计算结果表 Controller
 */
@RestController
@RequestMapping("waterMetadataResult")
public class WaterMetadataResultController {
    private static final Logger LOGGER = LoggerFactory.getLogger(WaterMetadataResultController.class);


    @Autowired
    private WaterMetadataResultService waterMetadataResultService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv) {
        mv.setViewName("business/water/waterMetaDataResult");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public WaterMetadataResultModel insert(@RequestBody WaterMetadataResultModel model) {
        if (this.waterMetadataResultService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<WaterMetadataResultModel> showAll() {
        WaterMetadataResultModel model = new WaterMetadataResultModel();
        return this.waterMetadataResultService.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public WaterMetadataResultModel update(@RequestBody WaterMetadataResultModel model) {
        if (this.waterMetadataResultService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public WaterMetadataResultModel delete(@RequestBody WaterMetadataResultModel model) {
        if (this.waterMetadataResultService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 获取图标分析数据
     *
     * @param stationId
     * @return
     */
    @RequestMapping("getWarningData")
    public PageInfo<WaterMetadataResultModel> getWarningData(Long stationId, KendoOptions options, String startTime, String endTime, Integer warningType) {
        return waterMetadataResultService.getWarningData(options, stationId, startTime, endTime, warningType);
    }


    /**
     * 根据元数据id查询级配信息
     *
     * @param id
     * @return
     */
    @RequestMapping("getGradationInfo")
    public WaterMetadataResultParamMolde getGradationInfo(Long id) {
        return waterMetadataResultService.getGradationInfo(id);
    }

}