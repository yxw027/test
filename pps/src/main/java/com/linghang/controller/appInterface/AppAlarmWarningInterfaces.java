package com.linghang.controller.appInterface;

import com.alibaba.fastjson.JSON;
import com.linghang.enums.AlarmType;
import com.linghang.enums.asphalt.AsphaltWarningType;
import com.linghang.model.base.AlarmDealModel;
import com.linghang.model.base.AnnexModel;
import com.linghang.model.base.KendoOptions;
import com.linghang.model.business.asphalt.AsphaltWarningMessageModel;
import com.linghang.model.business.water.WaterWarningMessageModel;
import com.linghang.service.base.AlarmDealService;
import com.linghang.service.base.AnnexService;
import com.linghang.service.business.asphalt.AsphaltMetadataService;
import com.linghang.service.business.asphalt.AsphaltWarningMessageService;
import com.linghang.service.business.water.WaterWarningMessageService;
import com.linghang.util.DatetimeUtil;
import com.linghang.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * app端告警监控信息列表查询及处理
 *
 * @author youp
 * @date 2019-01-12
 **/
@RequestMapping("appAlarmWarning")
@Controller
public class AppAlarmWarningInterfaces {
    @Autowired
    private AsphaltMetadataService metadataService;
    @Autowired
    private AsphaltWarningMessageService asphaltMessageService;
    @Autowired
    private WaterWarningMessageService waterMessageService;
    @Autowired
    private AlarmDealService alarmDealService;
    @Autowired
    private AnnexService annexService;

    /**
     * 沥青拌合站--告警监控列表
     *
     * @param options     分页参数
     * @param id          拌合站id
     * @param start       开始时间 格式 yyyy-MM-dd
     * @param end         结束时间 格式 yyyy-MM-dd
     * @param level       告警级别 {@link AsphaltWarningType}
     * @param stationType 拌合站类型 {@link AlarmType}
     * @return
     */
    @RequestMapping("warningList")
    @ResponseBody
    public Map<String, Object> asphaltWarningList(KendoOptions options, Long id, String start, String end, Integer level, Integer stationType) {
        if (!AsphaltWarningType.isIn(level)) {
            return ResultUtil.getErrorResultMap("告警级别错误");
        }
        if (asphaltMessageService.isNull(options, id, start, end)) {
            return ResultUtil.getErrorResultMap("查询参数错误");
        }
        if (AlarmType.ASPHALT.getInteger().equals(stationType)) {
            return ResultUtil.getSuccessResultMap(asphaltMessageService.getWarningData(options, id, start, end, level, null));
        } else if (AlarmType.WATER.getInteger().equals(stationType)) {
            return ResultUtil.getSuccessResultMap(waterMessageService.getWarningData(options, id, start, end, level, null));
        }
        return ResultUtil.getErrorResultMap("拌合站类型错误");
    }

    /**
     * 查询有告警的日期
     *
     * @param stationId 拌合站id
     * @param stationType 拌合站类型{@link AlarmType}
     * @return
     */
    @RequestMapping("getSearchTimeMark")
    @ResponseBody
    public Map<String, Object> getSearchTimeMark(Long stationId, Integer stationType) {
        if (AlarmType.ASPHALT.getInteger().equals(stationType)) {
            return ResultUtil.getSuccessResultMap(metadataService.getSearchTimeMark(stationId));
        } else if (AlarmType.WATER.getInteger().equals(stationType)) {
            return ResultUtil.getSuccessResultMap(waterMessageService.getSearchTimeMark(stationId));
        }
        return ResultUtil.getErrorResultMap("拌合站类型错误");
    }

    /**
     * 根据消息id和预警类型获取预警内容
     *
     * @param id   消息id
     * @param stationType 拌合站类型 {@link AlarmType}
     */
    @RequestMapping("getDataByType")
    @ResponseBody
    public Map<String, Object> getDataByType(Long id, Integer stationType) {
        Map<String, Object> result = new HashMap<>();
        //获取预警信息
        if (AlarmType.ASPHALT.getInteger().equals(stationType)) {
            AsphaltWarningMessageModel messageModel = asphaltMessageService.selectById(id);
            result.put("alarmTime", JSON.toJSONString(messageModel.getCreateTime()));
            result.put("alarmContent", JSON.toJSONString(getMessageByModel(messageModel)));
        } else if (AlarmType.WATER.getInteger().equals(stationType)) {
            WaterWarningMessageModel messageModel = waterMessageService.selectById(id);
            result.put("alarmTime", JSON.toJSONString(DatetimeUtil.formatDate(messageModel.getCreateTime(), DatetimeUtil.DEFAULT_FORMAT_STRING)));
            result.put("alarmContent", JSON.toJSONString(messageModel.getContent()));
        } else {
            return ResultUtil.getErrorResultMap("消息类型错误");
        }
        //获取历史处理信息
        AlarmDealModel dealModel = new AlarmDealModel(id, stationType);
        List<AlarmDealModel> history = alarmDealService.selectByModel(dealModel);
        if (!CollectionUtils.isEmpty(history)) {
            for (AlarmDealModel process : history) {
                if (!StringUtils.isEmpty(process.getAnnexIds())) {
                    String[] idsArray = process.getAnnexIds().split(",");
                    List<AnnexModel> lstAnnex = annexService.selectAnnexByIds(idsArray);
                    process.setLstAnnexs(lstAnnex);
                }
            }
        }
        result.put("history", history);
        return ResultUtil.getSuccessResultMap(result);
    }

    /**
     * 获取报警信息
     *
     * @param messageModel
     * @return
     */
    private String getMessageByModel(AsphaltWarningMessageModel messageModel) {
        StringBuilder builder = new StringBuilder();
        builder.append(StringUtils.isEmpty(messageModel.getOilStoneMsg()) ? "" : messageModel.getOilStoneMsg())
                .append(StringUtils.isEmpty(messageModel.getSieveMsg()) ? "" : messageModel.getSieveMsg())
                .append(StringUtils.isEmpty(messageModel.getAsphaltTempMsg()) ? "" : messageModel.getAsphaltTempMsg())
                .append(StringUtils.isEmpty(messageModel.getTempMsg()) ? "" : messageModel.getTempMsg())
                .append(StringUtils.isEmpty(messageModel.getAggTempMsg()) ? "" : messageModel.getAggTempMsg())
                .append(StringUtils.isEmpty(messageModel.getMixingTempMsg()) ? "" : messageModel.getMixingTempMsg());
        return builder.toString();
    }

    /**
     * 文件上传
     *
     * @param files
     * @return
     */
    @RequestMapping(value = "uploadFiles", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadFile(@RequestParam("file") List<MultipartFile> files) {
        Map<String, Object> map = alarmDealService.uploadFile(files);
        if ((boolean) map.get("success")) {
            return ResultUtil.getSuccessResultMap(map.get("models"));
        }
        return ResultUtil.getErrorResultMap("上传失败");
    }

    /**
     * 删除文件
     */
    @RequestMapping("removeFiles")
    @ResponseBody
    public Map<String, Object> removeFiles(Long id) {
        return alarmDealService.deleteFileById(id);
    }

    /**
     * 新增处理
     *
     * @param model
     * @return
     */
    @RequestMapping("addDealInfo")
    @ResponseBody
    public Map<String, Object> addDealInfo(@RequestBody AlarmDealModel model) {
        return alarmDealService.addDealInfo(model);
    }
}
