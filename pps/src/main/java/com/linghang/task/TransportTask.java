package com.linghang.task;

import com.linghang.enums.TrimbleInfoType;
import com.linghang.enums.transport.TransportStatus;
import com.linghang.model.business.transport.RadiofrequencyDataModel;
import com.linghang.model.business.transport.TransportInfoModel;
import com.linghang.service.business.transport.RadiofrequencyDataService;
import com.linghang.service.business.transport.TransportInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 成品料运输信息定时任务
 * 定时扫描成品料运输信息-超出上传时限更改运输信息状态
 *
 * @author youp
 * @date 2019-01-04
 **/
@Component
public class TransportTask {
    @Autowired
    private TransportInfoService infoService;
    @Autowired
    private RadiofrequencyDataService dataService;

    /**
     * 数据上传间隔时间 秒 *1000
     */
    private static int uploadTimeLimit = 2 * 60 * 1000;
    /**
     * 记录最新数据时间
     */
    private static Long currSearchTime = 0L;
    /**
     * 每隔10秒扫描一次
     * 只查询下料中及接料中两种状态
     * 判断是否接料结束及下料结束
     */
//    @Scheduled(cron = "*/10 * * * * ?")
    public void scanTransportInfo(){
        //查询十秒内的数据进行数据校验，判断运输信息
        List<RadiofrequencyDataModel> datas = dataService.selectTenSecondsInsideData(currSearchTime);
        if(!CollectionUtils.isEmpty(datas)){
            for (int i = 0; i < datas.size(); i++) {
                if (datas.get(i).getTime() > currSearchTime) {
                    currSearchTime = datas.get(i).getTime();
                    System.out.println(i);
                    synchronized (this) {
                        dataService.uploadData(datas.get(i), uploadTimeLimit);
                    }
                }
            }
        }
        //查询信息状态未完结的运输信息
        List<TransportInfoModel> list = infoService.selectUnfinishedData();
        if (!CollectionUtils.isEmpty(list)) {
            for (TransportInfoModel infoModel : list) {
                if (TransportStatus.RECEIVING.getInteger().equals(infoModel.getStatus())) {
                    //查询当前卡号大于接收时间的数据
                    List<RadiofrequencyDataModel> nowData = dataService.selectByCardMarkAndTime(infoModel.getCarMark(), infoModel.getReceiveStartTime().getTime(), TrimbleInfoType.STATION.getInteger());
                    if (!CollectionUtils.isEmpty(nowData)) {
                        if (System.currentTimeMillis() - nowData.get(0).getTime() > uploadTimeLimit) {
                            infoModel.setStatus(TransportStatus.RUNNING.getInteger());
                            infoModel.setReceiveEndTime(new Date(nowData.get(0).getTime()));
                            long receiveTime = (infoModel.getReceiveEndTime().getTime() - infoModel.getReceiveStartTime().getTime()) / 1000;
                            infoModel.setReceiveTime(receiveTime);
                            infoService.updateById(infoModel);
                            BigDecimal weight = infoService.getWeight(infoModel.getId());
                            infoModel.setWeight(weight);
                            infoService.updateById(infoModel);
                        }
                    }
                } else if (TransportStatus.CUTTING.getInteger().equals(infoModel.getStatus())) {
                    long searchTime = 0L;
                    Integer searchType = TrimbleInfoType.MOBILE.getInteger();
                    if (infoModel.getReceiveStartTime() != null) {
                        searchTime = infoModel.getReceiveStartTime().getTime();
                    } else if (infoModel.getOutputStartTime() != null) {
                        //无拌合站打卡数据
                        searchTime = infoModel.getOutputStartTime().getTime();
                    }
                    List<RadiofrequencyDataModel> nowData = dataService.selectByCardMarkAndTime(infoModel.getCarMark(), searchTime, searchType);
                    if (!CollectionUtils.isEmpty(nowData)) {
                        if (System.currentTimeMillis() - nowData.get(0).getTime() > uploadTimeLimit) {
                            if (infoModel.getReceiveStartTime() != null) {
                                infoModel.setStatus(TransportStatus.END.getInteger());
                            } else {
                                infoModel.setStatus(TransportStatus.ERROR.getInteger());
                            }
                            infoModel.setOutputEndTime(new Date(nowData.get(0).getTime()));
                            long outputTime = (infoModel.getOutputEndTime().getTime() - infoModel.getOutputStartTime().getTime()) / 1000;
                            infoModel.setOutputTime(outputTime);
                            infoService.updateById(infoModel);
                        }
                    }
                }
            }
        }

//        validErrorData();
    }

    /**
     * 校验异常数据，运输超时,设置超时校验
     */
    private void validErrorData() {
        //查询今日最小运输时长
        Long limitTime = (long) uploadTimeLimit;
        List<TransportInfoModel> list = infoService.selectErrorData(limitTime);
        if (!CollectionUtils.isEmpty(list)) {
            for (TransportInfoModel infoModel : list) {
                if (TransportStatus.RUNNING.getInteger().equals(infoModel.getStatus())) {
                    System.err.println("当前运输数据未产生摊铺机打卡数据");
                    //运输中在拌合站打卡---1，拌合站打卡器中断打卡；2，摊铺机未打卡
                    //查询当前车辆当日运输平均时长，如未产生数据则生成按第二条数据，如有运输时长则校验运输时长是否符合
                    infoModel.setStatus(TransportStatus.ERROR.getInteger());
                    infoService.updateById(infoModel);
                }
            }
        }
    }

}
