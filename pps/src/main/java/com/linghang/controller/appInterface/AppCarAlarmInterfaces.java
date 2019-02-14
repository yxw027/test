package com.linghang.controller.appInterface;

import com.linghang.enums.car.CarAlarmMessageType;
import com.linghang.model.base.KendoOptions;
import com.linghang.service.car.CarAlamMessageService;
import com.linghang.util.DatetimeUtil;
import com.linghang.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * 车辆报警监控
 *
 * @author youp
 * @date 2019-01-21
 **/
@Controller
@RequestMapping("appCarAlarm")
public class AppCarAlarmInterfaces {

    @Autowired
    private CarAlamMessageService messageService;

    /**
     * 报警监控列表数据
     *
     * @param orgId     标段id
     * @param startTime 开始时间 yyyy-MM-dd 00:00:00
     * @param endTime   结束时间 yyyy-MM-dd 23:59:59
     * @param alamType  报警类型 {@link CarAlarmMessageType}
     * @param options   分页数据
     * @return
     */
    @RequestMapping("alarmList")
    @ResponseBody
    public Map<String, Object> alarmList(Long orgId, String startTime, String endTime, Integer alamType, KendoOptions options) {
        if (orgId == null || alamType == null || options.getPageSize() == null || options.getPage() == null
                || !DatetimeUtil.isDefaultDateFormat(startTime) || !DatetimeUtil.isDefaultDateFormat(endTime)) {
            return ResultUtil.getErrorResultMap("参数错误");
        }
        return ResultUtil.getSuccessResultMap(messageService.selectMoldeByOptions(orgId, startTime, endTime, alamType, options));
    }


}
