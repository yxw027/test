package com.linghang.service;

import com.linghang.enums.MachineType;
import com.linghang.model.CarModel;
import com.linghang.model.business.asphalt.AsphaltInfoModel;
import com.linghang.model.business.water.WaterInfoModel;
import com.linghang.service.business.asphalt.AsphaltInfoService;
import com.linghang.service.business.asphalt.AsphaltMetadataService;
import com.linghang.service.business.water.WaterInfoService;
import com.linghang.service.business.water.WaterMetaDataService;
import com.linghang.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author youp
 * @date 2019-01-03
 **/
@Service
public class MixingStationService {
    @Autowired
    private AsphaltInfoService asphaltInfoService;
    @Autowired
    private AsphaltMetadataService asphaltMetadataService;
    @Autowired
    private WaterInfoService waterInfoService;
    @Autowired
    private WaterMetaDataService waterMetaDataService;
    @Autowired
    private CarService carService;

    /**
     * 查询拌合站信息
     *
     * @param id 拌合站射频器唯一标识
     * @return
     */
    public Map<String, Object> getMixingStationInfo(Long id) {
        if (id == null) {
            return ResultUtil.getErrorResultMap("信息错误");
        }
        Map<String, Object> model = new HashMap<>(16);
        AsphaltInfoModel info = asphaltInfoService.selectById(id);
        if (info != null) {
            model.put("id", id);
            model.put("name", info.getName());
            model.put("type", MachineType.LQ.getInteger());
            return ResultUtil.getSuccessResultMap(model);
        }
        WaterInfoModel water = waterInfoService.selectById(id);
        if (water != null) {
            model.put("id", id);
            model.put("name", water.getName());
            model.put("type", MachineType.SW.getInteger());
            return ResultUtil.getSuccessResultMap(model);
        }
        return ResultUtil.getErrorResultMap("信息错误");
    }

    /**
     * 根据id查询拌合站数据
     *
     * @param ids
     * @param type
     * @return
     */
    public Map<String, Object> selectDataByIds(String ids, Integer type) {
        switch (type) {
            case 1:
                return waterMetaDataService.selectDataByIds(ids);
            case 3:
                return asphaltMetadataService.selectDataByIds(ids);
            default:
                return ResultUtil.getErrorResultMap("类型查询错误");
        }
    }

    /**
     * 根据时间范围查询数据
     *
     * @param startTime
     * @param endTime
     * @param type
     * @return
     */
    public Map<String, Object> selectDataByTime(String startTime, String endTime, Integer type, Long mixingId) {
        if (type == null) {
            return ResultUtil.getErrorResultMap("类型查询错误");
        }
        switch (type) {
            case 1:
                return waterMetaDataService.selectDataByTime(startTime, endTime, mixingId);
            case 3:
                return asphaltMetadataService.selectDataByTime(startTime, endTime, mixingId);
            default:
                return ResultUtil.getErrorResultMap("类型查询错误");
        }
    }

    /**
     * 根据射频卡号获取基站信息
     *
     * @param cardMark
     * @return
     */
    public Map<String, Object> selectByCardMark(String cardMark) {
        if (StringUtils.isEmpty(cardMark)) {
            return ResultUtil.getErrorResultMap("信息错误");
        }
        Map<String, Object> model = new HashMap<>(16);
        AsphaltInfoModel info = asphaltInfoService.selectByCardMark(cardMark);
        if (info != null) {
            model.put("id", info.getId());
            model.put("name", info.getName());
            model.put("type", MachineType.LQ.getInteger());
            return ResultUtil.getSuccessResultMap(model);
        }
        WaterInfoModel water = waterInfoService.selectByCardMark(cardMark);
        if (water != null) {
            model.put("id", water.getId());
            model.put("name", water.getName());
            model.put("type", MachineType.SW.getInteger());
            return ResultUtil.getSuccessResultMap(model);
        }
        return ResultUtil.getErrorResultMap("信息错误");
    }

    /**
     * 查询摊铺机信息
     *
     * @param cardMark
     * @return
     */
    public Map<String, Object> selectPavingCarByMark(String cardMark) {
        if (StringUtils.isEmpty(cardMark)) {
            return ResultUtil.getErrorResultMap("信息错误");
        }
        Map<String, Object> model = new HashMap<>(16);
        //摊铺机信息
        CarModel info = null;
        try {
            info = carService.selectById(Long.parseLong(cardMark));
        } catch (Exception e) {
            System.out.println("摊铺机id格式化错误");
        }
        if (info != null) {
            model.put("id", info.getId());
            model.put("name", info.getName());
            //标记摊铺机
            model.put("type", -1);
            return ResultUtil.getSuccessResultMap(model);
        }
        return ResultUtil.getErrorResultMap("信息错误");
    }

    /**
     * 查询接料总重
     *
     * @param start
     * @param end
     * @param mixingType
     * @param mixingId
     * @return
     */
    public Map<String, Object> selectWeight(String start, String end, Integer mixingType, Long mixingId) {
        switch (mixingType) {
            case 1:
                return waterMetaDataService.selectWeight(start, end, mixingId);
            case 3:
                return asphaltMetadataService.selectWeight(start, end, mixingId);
            default:
                return ResultUtil.getErrorResultMap("类型查询错误");
        }
    }
}
