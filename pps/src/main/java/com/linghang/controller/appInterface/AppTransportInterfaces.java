package com.linghang.controller.appInterface;

import com.linghang.enums.transport.TransportTimeMarkSearchType;
import com.linghang.model.base.KendoOptions;
import com.linghang.service.business.asphalt.AsphaltWarningMessageService;
import com.linghang.service.business.transport.TransportInfoService;
import com.linghang.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * app成品料运输接口
 *
 * @author youp
 * @date 2019-01-15
 **/
@Controller
@RequestMapping("appTransport")
public class AppTransportInterfaces {

    @Autowired
    private TransportInfoService infoService;
    @Autowired
    private AsphaltWarningMessageService asphaltMessageService;

    /**
     * 获取有数据的日期标记
     *
     * @param id   查询主键
     * @param type 查询类型 {@link TransportTimeMarkSearchType}
     * @return
     */
    @RequestMapping("getSearchTimeMark")
    @ResponseBody
    public Map<String, Object> getSearchTimeMark(Long id, Integer type) {
        if (TransportTimeMarkSearchType.CAR.getValue().equals(type)) {
            return ResultUtil.getSuccessResultMap(infoService.getCarMessageDate(id));
        } else if (TransportTimeMarkSearchType.ORG.getValue().equals(type)) {
            return ResultUtil.getSuccessResultMap(infoService.getTransportMessageDate(id));
        }
        return ResultUtil.getErrorResultMap("查询分类错误");
    }

    /**
     * 成品料运输接口
     *
     * @param options   分页参数
     * @param orgId     组织id
     * @param startTime 开始时间 格式 yyyy-MM-dd 00:00:00
     * @param endTime   结束时间 格式 yyyy-MM-dd 23:59:59
     * @param carId     为0表示查询所有车辆
     * @return
     */
    @RequestMapping("transportList")
    @ResponseBody
    public Map<String, Object> transportList(KendoOptions options, Long orgId, String startTime, String endTime, Long carId) {
        if (asphaltMessageService.isNull(options, orgId, startTime, endTime) || carId == null) {
            return ResultUtil.getErrorResultMap("查询参数错误");
        }
        return ResultUtil.getSuccessResultMap(infoService.selectByOptions(options, orgId, startTime, endTime, carId));
    }

    /**
     * 获取运输信息--运料详情
     *
     * @return
     */
    @RequestMapping("getTransportDetails")
    @ResponseBody
    public Map<String, Object> getTransportDetails(Long id) {
        return infoService.getMaterialData(id);
    }
}
