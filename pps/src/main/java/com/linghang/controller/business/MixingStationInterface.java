package com.linghang.controller.business;

import com.linghang.enums.MachineType;
import com.linghang.service.MixingStationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * 沥青拌合站第三方调用接口
 *
 * @author youp
 * @date 2019-01-03
 **/
@Controller
@RequestMapping("mixingStation/api")
public class MixingStationInterface {

    @Autowired
    private MixingStationService mixingStationService;

    /**
     * 第三方接口
     * 根据时间范围获取数据信息 车辆运输查询运输成品料信息
     * 查询的时间以数据的拌合结束时间为判断范围
     *
     * @param startTime 开始时间 字符串  格式 yyyy-MM-dd HH:mm:ss 例如 2018-12-25 15:33:21
     * @param endTime   结束时间 字符串  格式 yyyy-MM-dd HH:mm:ss 例如 2018-12-25 15:33:21
     * @param type      数据类型 整数型  数值详见{@link MachineType}
     * @param mixingId  拌合站id
     * @return
     */
    @RequestMapping("selectDataByTime")
    public Map<String, Object> selectDataByTime(String startTime, String endTime, Integer type, Long mixingId) {
        return mixingStationService.selectDataByTime(startTime, endTime, type, mixingId);
    }

    /**
     * 第三方接口
     * 根据数据id集合查询数据详情
     *
     * @param ids  数据id集合 字符串  多个以英文逗号隔开 例：1,2,3
     * @param type 数据类型   整数型  详见{@link MachineType}
     * @return
     */
    @RequestMapping("selectDataByIds")
    public Map<String, Object> selectDataByIds(String ids, Integer type) {
        return mixingStationService.selectDataByIds(ids, type);
    }

    /**
     * 根据拌合站id查询拌合站信息
     *
     * @param id
     * @return
     */
    @RequestMapping("getMixingStationInfo")
    public Map<String, Object> getMixingStationInfo(Long id) {
        return mixingStationService.getMixingStationInfo(id);
    }

}
