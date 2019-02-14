package com.linghang.controller.base;

import com.alibaba.fastjson.JSON;
import com.linghang.enums.AlarmType;
import com.linghang.model.base.AlarmDealModel;
import com.linghang.model.base.AnnexModel;
import com.linghang.model.business.asphalt.AsphaltWarningMessageModel;
import com.linghang.model.business.water.WaterWarningMessageModel;
import com.linghang.service.base.AlarmDealService;
import com.linghang.service.base.AnnexService;
import com.linghang.service.business.asphalt.AsphaltInfoService;
import com.linghang.service.business.asphalt.AsphaltWarningMessageService;
import com.linghang.service.business.water.WaterInfoService;
import com.linghang.service.business.water.WaterWarningMessageService;
import com.linghang.util.DatetimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @author dell
 * description:
 * date: 2019/1/8 17:10
 */
@RestController
@RequestMapping("alarmDeal")
public class AlarmDealController {
    @Autowired
    private AsphaltInfoService asphaltInfoService;

    @Autowired
    private WaterInfoService wasterInfoService;
    @Autowired
    private AlarmDealService alarmDealService;

    @Autowired
    private AsphaltWarningMessageService asphaltWarningMessageService;

    @Autowired
    private WaterWarningMessageService waterWarningMessageService;

    @Autowired
    private AnnexService annexService;

    @RequestMapping("page")
    public ModelAndView page(ModelAndView mv, Long msgId, String type, Boolean readOnly,
                             Integer waterLevel, Integer dealStatus) {
        getDataByType(msgId, type, mv);
        mv.addObject("waterLevel", JSON.toJSONString(waterLevel == null ? "" : waterLevel));
        mv.addObject("dealStatus", JSON.toJSONString(dealStatus));
        mv.addObject("readOnly", JSON.toJSONString(readOnly));
        mv.addObject("msgId", JSON.toJSONString(msgId));
        mv.addObject("msgType", JSON.toJSONString(AlarmType.valueOf(type.toUpperCase()).getInteger()));
        mv.setViewName("common/alarmDeal");
        return mv;
    }

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
     * 根据消息体和预警类型获取预警内容
     *
     * @param msgId
     * @param type
     */
    public void getDataByType(Long msgId, String type, ModelAndView mv) {
        //获取预警信息
        if (AlarmType.ASPHALT.getString().equals(type)) {
            AsphaltWarningMessageModel messageModel = asphaltWarningMessageService.selectById(msgId);
            mv.addObject("alarmTime", JSON.toJSONString(messageModel.getCreateTime()));
            mv.addObject("alarmContent", JSON.toJSONString(getMessageByModel(messageModel)));
        } else if (AlarmType.WATER.getString().equals(type)) {
            WaterWarningMessageModel messageModel = waterWarningMessageService.selectById(msgId);
            mv.addObject("alarmTime", JSON.toJSONString(DatetimeUtil.formatDate(messageModel.getCreateTime(), DatetimeUtil.DEFAULT_FORMAT_STRING)));
            mv.addObject("alarmContent", JSON.toJSONString(messageModel.getContent()));
        }
        //获取历史处理信息
        AlarmDealModel dealModel = new AlarmDealModel(msgId, AlarmType.valueOf(type.toUpperCase()).getInteger());
        List<AlarmDealModel> lstProcess = alarmDealService.selectByModel(dealModel);
        if (!CollectionUtils.isEmpty(lstProcess)) {
            for (AlarmDealModel process : lstProcess) {
                String ids = process.getAnnexIds();
                if (!StringUtils.isEmpty(ids)) {
                    String[] idsArray = ids.split(",");
                    List<AnnexModel> lstAnnex = annexService.selectAnnexByIds(idsArray);
                    process.setLstAnnexs(lstAnnex);
                }
            }
        }
        mv.addObject("lstProcess", JSON.toJSONString(lstProcess));
    }

    /**
     * 文件上传
     *
     * @param files
     * @return
     */
    @RequestMapping(value = "uploadFiles", method = RequestMethod.POST)
    public Map<String, Object> uploadFile(@RequestParam("file") List<MultipartFile> files) {
        return alarmDealService.uploadFile(files);
    }

    /**
     * 删除文件
     */
    @RequestMapping("removeFiles")
    public Map<String, Boolean> removeFiles(@RequestBody AnnexModel model) {
        return alarmDealService.deleteFile(model);
    }

    @RequestMapping("addProcess")
    public Map<String, Object> addProcess(@RequestBody AlarmDealModel model) {
        return alarmDealService.insert(model);
    }
}
