package com.linghang.service.business.transport;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linghang.enums.transport.TransportStatus;
import com.linghang.mapper.business.transport.TransportInfoMapper;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.transport.TransportInfoModel;
import com.linghang.service.MixingStationService;
import com.linghang.util.DatetimeUtil;
import com.linghang.util.ResultUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author youp on 2019/01/02.
 * 车辆接料-运输-对接出料的过程数 Service
 */
@Service
public class TransportInfoService {

    private Logger logger = LoggerFactory.getLogger(TransportInfoService.class);


    @Autowired
    private TransportInfoMapper transportInfoMapper;
    @Autowired
    private MixingStationService mixingStationService;

    /**
     * 按主键删除
     */
    public boolean deleteById(Long id) {
        return id != null && this.transportInfoMapper.deleteById(id) >= 0;
    }

    /**
     * 插入数据
     */
    public boolean insert(TransportInfoModel model) {
        return model != null && this.transportInfoMapper.insert(model) == 1;
    }


    /**
     * 按主键选择
     */
    public TransportInfoModel selectById(Long id) {
        return id == null ? null : this.transportInfoMapper.selectById(id);
    }

    /**
     * 按模型选择
     */
    public List<TransportInfoModel> selectByModel(TransportInfoModel model) {
        return model == null ? new ArrayList<>(0) : this.transportInfoMapper.selectByModel(model);
    }

    /**
     * 按主键更新
     */
    public boolean updateById(TransportInfoModel model) {
        return !(model == null || model.getId() == null) && this.transportInfoMapper.updateById(model) == 1;
    }

    /**
     * 按主键删除
     */
    public boolean deleteById(TransportInfoModel model) {
        return model != null && this.deleteById(model.getId());
    }

    /**
     * 按前台条件选择
     */
    public PageInfo<TransportInfoModel> selectByOptions(KendoOptions options, Long orgId, String starTime, String endTime, Long carId) {
        if (options == null) {
            return new PageInfo<>();
        }
        PageHelper.startPage(options.getPage(), options.getPageSize());
        return new PageInfo<>(this.transportInfoMapper.selectByOptions(options, orgId, starTime, endTime, carId));
    }

    /**
     * 查询未完成的运输信息，状态不为4
     *
     * @return
     */
    public List<TransportInfoModel> selectUnfinishedData() {
        return transportInfoMapper.selectUnfinishedData();
    }

    /**
     * 获取运输成品料信息
     *
     * @param id
     * @return
     */
    public Map<String, Object> getMaterialData(Long id) {
        TransportInfoModel infoModel = transportInfoMapper.selectById(id);
        if (infoModel == null) {
            return ResultUtil.getErrorResultMap("信息错误");
        }
        if (TransportStatus.RECEIVING.getInteger().equals(infoModel.getStatus())) {
            return ResultUtil.getErrorResultMap("接料未完成，请稍后查询");
        }
        String start = DatetimeUtil.formatDate(infoModel.getReceiveStartTime(), "yyyy-MM-dd HH:mm:ss");
        String end = DatetimeUtil.formatDate(infoModel.getReceiveEndTime(), "yyyy-MM-dd HH:mm:ss");
        Map<String, Object> data = mixingStationService.selectDataByTime(start, end, infoModel.getMixingType(), infoModel.getMixingId());
        return data;
    }

    /**
     * 获取当前运输信息的重量
     *
     * @param id
     * @return
     */
    public BigDecimal getWeight(Long id) {
        TransportInfoModel infoModel = transportInfoMapper.selectById(id);
        if (infoModel == null) {
            return null;
        }
        if (infoModel.getReceiveStartTime() == null && infoModel.getReceiveEndTime() == null) {
            return null;
        }
        String start = DatetimeUtil.formatDate(infoModel.getReceiveStartTime(), "yyyy-MM-dd HH:mm:ss");
        String end = DatetimeUtil.formatDate(infoModel.getReceiveEndTime(), "yyyy-MM-dd HH:mm:ss");
        Map<String, Object> data = mixingStationService.selectWeight(start, end, infoModel.getMixingType(), infoModel.getMixingId());
        if (!CollectionUtils.isEmpty(data)) {
            return new BigDecimal(data.get("allWeight") + "");
        }
        return null;
    }

    /**
     * 查询当前车辆的运输信息
     *
     * @param cardMark
     * @return
     */
    public TransportInfoModel selectByCardMark(String cardMark) {
        return transportInfoMapper.selectByCardMark(cardMark);
    }

    public List<String> getTransportMessageDate(Long orgId) {
        return orgId == null ? new ArrayList<>() : transportInfoMapper.getTransportMessageDate(orgId);
    }

    public List<String> getCarMessageDate(Long carId) {
        return carId == null ? new ArrayList<>() : transportInfoMapper.getCarMessageDate(carId);
    }

    public TransportInfoModel selectTodayDataByCardMark(String carMark, Long orgId) {
        return transportInfoMapper.selectTodayDataByCardMark(carMark, orgId);
    }

    public List<TransportInfoModel> selectErrorData(Long time) {
        return transportInfoMapper.selectErrorData(time);
    }

    public TransportInfoModel selectTodayMinTransportTime() {
        return transportInfoMapper.selectTodayMinTransportTime();
    }
}