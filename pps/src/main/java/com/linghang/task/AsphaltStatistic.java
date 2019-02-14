package com.linghang.task;

import com.linghang.enums.OrgType;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.business.asphalt.AsphaltStatisticsReportModel;
import com.linghang.model.business.water.MachinePhoneNoteRecordModel;
import com.linghang.service.base.OrganizationService;
import com.linghang.service.business.asphalt.AsphaltInfoService;
import com.linghang.service.business.water.MachinePhoneNoteRecordService;
import com.linghang.util.DatetimeUtil;
import com.linghang.util.SmsUtils;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Component
public class AsphaltStatistic {

    @Autowired
    private AsphaltInfoService asphaltInfoService;
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private MachinePhoneNoteRecordService machinePhoneNoteRecordService;

    /**
     * 沥青推送
     */
//    @Scheduled(cron = "0 46 16 * * ?")
    public void impleMent() {
        List<AsphaltStatisticsReportModel> models = asphaltInfoService.geStatisticsSend();
        models.forEach(model -> {
            if (!StringUtils.isEmpty(model.getPhone())) {
                List<OrganizationModel> project = organizationService.getProjectData(model.getOrgId(), OrgType.PROJECT.getInteger());
                String content = getSendMsg(model, project);
                JSONObject jsonObject = SmsUtils.sendSms(model.getPhone(), content);
                String success = "失败";
                if ("Success".equals(jsonObject.get("returnstatus"))) {
                    success = "成功";
                }
                machinePhoneNoteRecordService.insert(new MachinePhoneNoteRecordModel(2, "", model.getPhone(), model.getAsphaltName(), content, new Date(), project.get(0).getName(), success, "日统计"));
            }
        });
    }

    private String getSendMsg(AsphaltStatisticsReportModel model, List<OrganizationModel> project) {
        StringBuffer msg = new StringBuffer();
        OrganizationModel org = organizationService.selectById(model.getOrgId());
        msg.append("【").append(project.get(0).getName()).append("】")
                .append(org.getName()).append(model.getAsphaltName())
                .append(DatetimeUtil.getDate(new Date())).append(":");
        msg.append("生产批次:").append(model.getProductionBatch() == null ? 0 : model.getProductionBatch()).append("次;");
        msg.append("不合格批次:").append(model.getUnqualifiedBatch() == null ? 0 : model.getUnqualifiedBatch()).append("次;");
        msg.append("不合格率:").append(compareRate(model.getUnqualifiedBatch(), model.getProductionBatch())).append("%;");
        msg.append("生产重量:").append(formatValue(model.getProductionWeight())).append("吨;");
        msg.append("不合格重量:").append(formatValue(model.getUnqualifiedWeight())).append("吨;");
        msg.append("不合格率:").append(compareWeight(model.getUnqualifiedWeight(), model.getProductionWeight())).append("%;");
        msg.append("沥青超标:").append(model.getTemperatureExceed()).append("次;");
        msg.append("油石比超标:").append(model.getOilStoneExceed()).append("次;");
        msg.append("级配超标:").append(model.getGradationExceed()).append("次;");
        return msg.toString();
    }

    /**
     * 1:整数， 2：小数
     */
    private BigDecimal formatValue(BigDecimal value) {
        if (value == null) {
            value = BigDecimal.ZERO;
        }
        return (value.multiply(new BigDecimal(0.001))).setScale(2, BigDecimal.ROUND_HALF_UP);
    }

    private BigDecimal compareRate(Integer value1, Integer value2) {
        if (value1 == null || value2 == null || value2 == 0) {
            return BigDecimal.ZERO;
        }
        return new BigDecimal(value1).divide(new BigDecimal(value2), 4, BigDecimal.ROUND_HALF_UP).multiply(new BigDecimal(100)).setScale(2, BigDecimal.ROUND_HALF_UP);
    }

    private BigDecimal compareWeight(BigDecimal value1, BigDecimal value2) {
        if (value1 == null || value2 == null || value2.compareTo(BigDecimal.ZERO) == 0) {
            return BigDecimal.ZERO;
        }
        return value1.divide(value2, 4, BigDecimal.ROUND_HALF_UP).multiply(new BigDecimal(100)).setScale(2, BigDecimal.ROUND_HALF_UP);
    }
}
