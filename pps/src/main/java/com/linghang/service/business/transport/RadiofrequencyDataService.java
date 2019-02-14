package com.linghang.service.business.transport;

import com.linghang.enums.TrimbleInfoType;
import com.linghang.enums.transport.TransportStatus;
import com.linghang.mapper.business.transport.RadiofrequencyDataMapper;
import com.linghang.model.CarVehicleManagementModel;
import com.linghang.model.business.transport.MixingInfoModel;
import com.linghang.model.business.transport.RadiofrequencyDataModel;
import com.linghang.model.business.transport.TransportInfoModel;
import com.linghang.service.CarVehicleManagementService;
import com.linghang.service.MixingStationService;
import com.linghang.util.IdWorker;
import com.linghang.util.ListUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 射频扫描上传信息处理
 *
 * @author youp on 2019/01/02.
 */
@Service
public class RadiofrequencyDataService {

    private Logger logger = LoggerFactory.getLogger(RadiofrequencyDataService.class);

    @Autowired
    private RadiofrequencyDataMapper radiofrequencyDataMapper;
    @Autowired
    private CarVehicleManagementService carVehicleManagementService;
    @Autowired
    private TransportInfoService infoService;
    @Autowired
    private MixingStationService mixingStationService;

    /**
     * 射频扫描数据上传
     *
     * @param model
     * @param uploadTimeLimit
     * @return
     */
    public void uploadData(RadiofrequencyDataModel model, int uploadTimeLimit) {
        if (!StringUtils.isEmpty(model.getPosition()) && model.getTime() != null && !StringUtils.isEmpty(model.getCardMark())) {
            MixingInfoModel mixing = getPositionInfo(model.getPosition(), model.getType());
            //校验当前数据所属进程位置
            TransportInfoModel infoModel = infoService.selectByCardMark(model.getCardMark());
            if (infoModel == null) {
                CarVehicleManagementModel car = carVehicleManagementService.selectByCardMark(model.getCardMark());
                if (car != null) {
                    if (mixing != null) {
                        if (TrimbleInfoType.STATION.getInteger().equals(model.getType())) {
                            //初始开始接料
                            receiveStart(model, car, mixing);
                        } else if (TrimbleInfoType.MOBILE.getInteger().equals(model.getType())) {
                            //无拌合站打卡数据
                            startPaving(model, car, mixing);
                        }
                    } else {
                        logger.error("射频扫描器信息错误");
                    }
                } else {
                    logger.error("车辆信息错误");
                }
            } else {
                if (infoModel != null && TrimbleInfoType.MOBILE.getInteger().equals(model.getType()) && TransportStatus.RECEIVING.getInteger().equals(infoModel.getStatus())) {
                    //接料未结束--摊铺机打卡--结束接料
                    if (mixing != null) {
                        infoModel.setReceiveEndTime(new Date(model.getTime()));
                        long receiveTime = (new Date(model.getTime()).getTime() - infoModel.getReceiveStartTime().getTime()) / 1000;
                        infoModel.setReceiveTime(receiveTime);
                        infoModel.setPavingCarId(mixing.getId());
                        infoModel.setPavingCarName(mixing.getName());
                        infoModel.setOutputStartTime(new Date(model.getTime()));
                        long transportTime = (new Date(model.getTime()).getTime() - infoModel.getReceiveEndTime().getTime()) / 1000;
                        infoModel.setTransportTime(transportTime);
                        infoModel.setStatus(TransportStatus.CUTTING.getInteger());
                        infoService.updateById(infoModel);
                        BigDecimal weight = infoService.getWeight(infoModel.getId());
                        infoModel.setWeight(weight);
                        infoService.updateById(infoModel);
                    } else {
                        logger.error("射频扫描器信息错误");
                    }
                } else if (infoModel != null && TrimbleInfoType.MOBILE.getInteger().equals(model.getType()) && TransportStatus.RUNNING.getInteger().equals(infoModel.getStatus())) {
                    //运输中更改为下料中，查询摊铺机信息
                    if (mixing != null) {
                        infoModel.setPavingCarId(mixing.getId());
                        infoModel.setPavingCarName(mixing.getName());
                        infoModel.setOutputStartTime(new Date(model.getTime()));
                        long transportTime = (new Date(model.getTime()).getTime() - infoModel.getReceiveEndTime().getTime()) / 1000;
                        infoModel.setTransportTime(transportTime);
                        infoModel.setStatus(TransportStatus.CUTTING.getInteger());
                        infoService.updateById(infoModel);
                    } else {
                        logger.error("射频扫描器信息错误");
                    }
                } else if (infoModel != null && TrimbleInfoType.STATION.getInteger().equals(model.getType()) && TransportStatus.RUNNING.getInteger().equals(infoModel.getStatus())) {
                    logger.error("当前运输数据未产生摊铺机打卡数据");
                    //运输中在拌合站打卡---1，拌合站打卡器中断打卡；2，摊铺机未打卡
                    //查询当前车辆当日运输平均时长，如未产生数据则生成按第二条数据，如有运输时长则校验运输时长是否符合
                    if (System.currentTimeMillis() - infoModel.getReceiveEndTime().getTime() > uploadTimeLimit) {
                        updateTransportInfo(model, uploadTimeLimit, infoModel);
                    }
                } else if (infoModel != null && TrimbleInfoType.STATION.getInteger().equals(model.getType()) && TransportStatus.CUTTING.getInteger().equals(infoModel.getStatus())) {
                    //下料未结束---拌合站打卡---运输信息结束
                    Integer searchType = TrimbleInfoType.MOBILE.getInteger();
                    long searchTime = 0L;
                    if (infoModel.getReceiveStartTime() != null) {
                        searchTime = infoModel.getReceiveStartTime().getTime();
                    } else if (infoModel.getOutputStartTime() != null) {
                        //无拌合站打卡数据
                        searchTime = infoModel.getOutputStartTime().getTime();
                    }
                    List<RadiofrequencyDataModel> nowData = radiofrequencyDataMapper.selectByCardMarkAndTime(infoModel.getCarMark(), searchTime, searchType);
                    if (!CollectionUtils.isEmpty(nowData)) {
                        infoModel.setOutputEndTime(new Date(nowData.get(0).getTime()));
                    } else {
                        infoModel.setOutputEndTime(new Date(model.getTime()));
                    }
                    infoModel.setStatus(TransportStatus.END.getInteger());
                    long outputTime = (infoModel.getOutputEndTime().getTime() - infoModel.getOutputStartTime().getTime()) / 1000;
                    infoModel.setOutputTime(outputTime);
                    infoService.updateById(infoModel);
                }
            }
        }
    }

    /**
     * 开始摊铺信息
     *
     * @param model
     * @param car
     * @param mixing
     */
    private synchronized void startPaving(RadiofrequencyDataModel model, CarVehicleManagementModel car, MixingInfoModel mixing) {
        TransportInfoModel infoModel = new TransportInfoModel();
        infoModel.setId(IdWorker.nextId());
        infoModel.setPavingCarId(mixing.getId());
        infoModel.setPavingCarName(mixing.getName());
        infoModel.setOutputStartTime(new Date(model.getTime()));
        infoModel.setStatus(TransportStatus.CUTTING.getInteger());
        infoModel.setOrgId(car.getOrgId());
        infoModel.setCarMark(model.getCardMark());
        infoModel.setCarId(car.getId());
        if (CollectionUtils.isEmpty(infoService.selectByModel(infoModel))) {
            infoModel.setId(IdWorker.nextId());
            infoService.insert(infoModel);
            System.out.println("id-----" + infoModel.getId());
        }
    }

    /**
     * 更新运输信息
     *
     * @param model
     * @param uploadTimeLimit
     * @param infoModel
     */
    private void updateTransportInfo(RadiofrequencyDataModel model, int uploadTimeLimit, TransportInfoModel infoModel) {
        Date date = new Date();
        infoModel.setStatus(TransportStatus.ERROR.getInteger());
        infoModel.setOutputStartTime(date);
        infoModel.setOutputEndTime(date);
        infoModel.setOutputTime(0L);
        infoService.updateById(infoModel);
        uploadData(model, uploadTimeLimit);
    }

    /**
     * 开始接料--同步线程
     *
     * @param model
     * @param car
     * @param mixing
     */
    private synchronized void receiveStart(RadiofrequencyDataModel model, CarVehicleManagementModel car, MixingInfoModel mixing) {
        Date time = new Date(model.getTime());
        TransportInfoModel infoModel = new TransportInfoModel();
        infoModel.setCarId(car.getId());
        infoModel.setCarMark(model.getCardMark());
        infoModel.setOrgId(car.getOrgId());
        infoModel.setReceiveStartTime(time);
        infoModel.setMixingId(Long.parseLong(mixing.getId()));
        infoModel.setMixingName(mixing.getName());
        infoModel.setMixingType(mixing.getType());
        infoModel.setStatus(TransportStatus.RECEIVING.getInteger());
        if (CollectionUtils.isEmpty(infoService.selectByModel(infoModel))) {
            infoModel.setId(IdWorker.nextId());
            infoService.insert(infoModel);
        }
    }

    /**
     * 调用接口查询拌合站信息
     *
     * @param position 拌合站id（射频设备初始化唯一标识）
     * @param type
     * @return
     */
    private MixingInfoModel getPositionInfo(String position, Integer type) {
        Map<String, Object> res = null;
        if (TrimbleInfoType.STATION.getInteger().equals(type)) {
            //拌合站信息
            res = mixingStationService.selectByCardMark(position);
        } else if (TrimbleInfoType.MOBILE.getInteger().equals(type)) {
            //摊铺机信息
            res = mixingStationService.selectPavingCarByMark(position);
        }
        if (res != null && (boolean) res.get("success")) {
            Map<String, Object> data = (Map<String, Object>) res.get("data");
            MixingInfoModel infoModel = new MixingInfoModel();
            infoModel.setId(data.get("id") + "");
            infoModel.setName((String) data.get("name"));
            infoModel.setType((Integer) data.get("type"));
            return infoModel;
        }
        return null;
    }


    public List<RadiofrequencyDataModel> selectByCardMarkAndTime(String carMark, Long startTime, Integer type) {
        //时间戳转换有差值，去除毫秒级查询，不影响查询结果
        Long formatTime = startTime.longValue() / 1000 * 1000;
        return radiofrequencyDataMapper.selectByCardMarkAndTime(carMark, formatTime, type);
    }

    public void insert(RadiofrequencyDataModel dataModel) {
        radiofrequencyDataMapper.insert(dataModel);
    }

    /**
     * 插入多条数据
     */
    public boolean insertList(List<RadiofrequencyDataModel> models) {
        if (models == null) {
            return false;
        }
        if (models.isEmpty()) {
            return true;
        }
        if (models.size() > 100) {
            for (List<RadiofrequencyDataModel> list : ListUtil.getSubList(models, 100)) {
                this.radiofrequencyDataMapper.insertList(list);
            }
        } else {
            return this.radiofrequencyDataMapper.insertList(models) > 0;
        }
        return true;
    }

    public List<RadiofrequencyDataModel> selectTenSecondsInsideData(Long currSearchTime) {
        return radiofrequencyDataMapper.selectTenSecondsInsideData(currSearchTime);
    }

}