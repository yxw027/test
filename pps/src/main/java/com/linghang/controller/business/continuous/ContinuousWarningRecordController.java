package com.linghang.controller.business.continuous;

import com.github.pagehelper.PageInfo;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.continuous.ContinuousWarningRecordModel;
import com.linghang.service.business.continuous.ContinuousWarningRecordService;
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
@RequestMapping("continuousWarningRecord")
public class ContinuousWarningRecordController {

    @Autowired
    private ContinuousWarningRecordService continuousWarningRecordService;

    /**
     * 跳转页面
     */
    @RequestMapping("list")
    public ModelAndView list(ModelAndView mv) {
        mv.setViewName("continuouswarningrecord");
        return mv;
    }

    /**
     * 插入数据
     */
    @RequestMapping("insert")
    public ContinuousWarningRecordModel insert(@RequestBody ContinuousWarningRecordModel model) {
        if (this.continuousWarningRecordService.insert(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按模型选择
     */
    @RequestMapping("showAll")
    public List<ContinuousWarningRecordModel> showAll(Long continuousId) {
        return this.continuousWarningRecordService.selectByModel(new ContinuousWarningRecordModel(continuousId));
    }

    /**
     * 按主键更新
     */
    @RequestMapping("update")
    public ContinuousWarningRecordModel update(@RequestBody ContinuousWarningRecordModel model) {
        if (this.continuousWarningRecordService.updateById(model)) {
            return model;
        }
        return null;
    }

    /**
     * 按主键删除
     */
    @RequestMapping("delete")
    public ContinuousWarningRecordModel delete(@RequestBody ContinuousWarningRecordModel model) {
        if (this.continuousWarningRecordService.deleteById(model)) {
            return model;
        }
        return null;
    }

    /**
    * 按前台条件选择
    */
    @RequestMapping("show")
    public PageInfo<ContinuousWarningRecordModel> selectByOptions(KendoOptions options) {
        return this.continuousWarningRecordService.selectByOptions(options);
    }
}