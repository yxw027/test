package com.linghang.controller.business.continuous;

import com.github.pagehelper.PageInfo;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.continuous.ContinuousWarningModel;
import com.linghang.service.business.continuous.ContinuousWarningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author wuchen on 2019/01/28.
 */
@RestController
@RequestMapping("continuousWarning")
public class ContinuousWarningController {

    @Autowired
    private ContinuousWarningService continuousWarningService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView list(ModelAndView mv) {
        mv.setViewName("business/continuous/continuousWarning");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public ContinuousWarningModel insert(@RequestBody ContinuousWarningModel model) {
        if (this.continuousWarningService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<ContinuousWarningModel> showAll(Long orgId) {
        return this.continuousWarningService.selectByModel(new ContinuousWarningModel(orgId));
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public ContinuousWarningModel update(@RequestBody ContinuousWarningModel model) {
        if (this.continuousWarningService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public ContinuousWarningModel delete(@RequestBody ContinuousWarningModel model) {
        if (this.continuousWarningService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
    * 按前台条件选择
    */
    @RequestMapping("show")
    public PageInfo<ContinuousWarningModel> selectByOptions(KendoOptions options) {
        return this.continuousWarningService.selectByOptions(options);
    }

    /**
    * 按主键查询
    */
    @RequestMapping("selectById")
    public ContinuousWarningModel selectById(Long id) {
        return this.continuousWarningService.selectById(id);
    }

    /**
     *查复判定
     */
    @RequestMapping("selectByProjectId")
    public List<ContinuousWarningModel> selectByProjectId(Long projectId , Integer mixerType,Long id) {
        return this.continuousWarningService.selectByProjectId(new ContinuousWarningModel(id,projectId,mixerType));
    }
}