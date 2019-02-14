package com.linghang.controller.business.transport;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.linghang.enums.MachineType;
import com.linghang.enums.transport.TransportStatus;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.transport.TransportInfoModel;
import com.linghang.service.business.transport.TransportInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @author youp on 2019/01/02.
 * 车辆接料-运输-对接出料的过程数 Controller
 */
@RestController
@RequestMapping("transportInfo")
public class TransportInfoController {

    @Autowired
    private TransportInfoService transportInfoService;

    /**
     * 跳转页面
     */
    @RequestMapping("page")
    public ModelAndView list(ModelAndView mv) {
        mv.addObject("machineType", JSON.toJSONString(MachineType.getJson()));
        mv.addObject("transportStatus", JSON.toJSONString(TransportStatus.getJson()));
        mv.setViewName("business/transport/transportInfo");
        return mv;
    }


    /**
     * 按前台条件选择
     */
    @RequestMapping("show")
    public PageInfo<TransportInfoModel> selectByOptions(KendoOptions options, Long orgId, String startTime, String endTime, Long carId) {
        return this.transportInfoService.selectByOptions(options, orgId, startTime, endTime, carId);
    }

    /**
     * 获取成品料信息
     *
     * @param id 当前运输信息
     * @return
     */
    @RequestMapping("getMaterialData")
    public Map<String, Object> getMaterialData(Long id) {
        return this.transportInfoService.getMaterialData(id);
    }

    /**
     * 获取当前标段下存在日期的集合
     *
     * @param orgId
     * @return
     */
    @RequestMapping("getTransportMessageDate")
    public List<String> getTransportMessageDate(Long orgId) {
        return this.transportInfoService.getTransportMessageDate(orgId);
    }

    /**
     * 查询当前车辆下的标注日期
     *
     * @param carId
     * @return
     */
    @RequestMapping("getCarMessageDate")
    public List<String> getCarMessageDate(Long carId) {
        return this.transportInfoService.getCarMessageDate(carId);
    }

}