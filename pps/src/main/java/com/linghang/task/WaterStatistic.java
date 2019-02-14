package com.linghang.task;

import com.linghang.enums.OrgType;
import com.linghang.model.base.OrganizationModel;
import com.linghang.model.business.water.MachinePhoneNoteRecordModel;
import com.linghang.model.business.water.WaterStaticReportModel;
import com.linghang.service.base.OrganizationService;
import com.linghang.service.business.water.MachinePhoneNoteRecordService;
import com.linghang.service.business.water.WaterInfoService;
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
public class WaterStatistic {

    @Autowired
    private WaterInfoService waterInfoService;
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private MachinePhoneNoteRecordService machinePhoneNoteRecordService;


    /**
     * 水稳日统计推送
     */
//    @Scheduled(cron = "00 24 19 * * ?")
    public void impleMent() {
        List<WaterStaticReportModel> models = waterInfoService.geStatisticsSend();
        models.forEach(model -> {
            if (!StringUtils.isEmpty(model.getPhone())) {
                List<OrganizationModel> project = organizationService.getProjectData(model.getOrgId(), OrgType.PROJECT.getInteger());
                String content = getSendMsg(model, project);
                JSONObject jsonObject = SmsUtils.sendSms(model.getPhone(), content);
                String success = "失败";
                if ("Success".equals(jsonObject.get("returnstatus"))) {
                    success = "成功";
                }
                machinePhoneNoteRecordService.insert(new MachinePhoneNoteRecordModel(1, "", model.getPhone(), model.getAsphaltName(), content, new Date(), project.get(0).getName(), success, "日统计"));
            }
        });
    }

    private String getSendMsg(WaterStaticReportModel model, List<OrganizationModel> project) {
        String aggregateName = model.getAggregateName();
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
        msg.append("水超标批次:").append(model.getWaterExceed() == null ? 0 : model.getWaterExceed()).append("次;");
        msg.append("水泥超标批次:").append(model.getCementExceed() == null ? 0 : model.getCementExceed()).append("次;");
        msg.append("级配超标批次:").append(model.getSieveExceed() == null ? 0 : model.getSieveExceed()).append("次;");
        if (!StringUtils.isEmpty(aggregateName)) {
            String[] names = aggregateName.split(",");
            if (isExceed(model.getG1Batch()) && names.length > 0) {
                msg.append(names[0] + "超标批次:").append(model.getG1Batch() == null ? 0 : model.getG1Batch()).append("次;");
            }
            if (isExceed(model.getG2Batch()) && names.length > 1) {
                msg.append(names[1] + "超标批次:").append(model.getG2Batch() == null ? 0 : model.getG2Batch()).append("次;");
            }
            if (isExceed(model.getG3Batch()) && names.length > 2) {
                msg.append(names[2] + "超标批次:").append(model.getG3Batch() == null ? 0 : model.getG3Batch()).append("次;");
            }
            if (isExceed(model.getG4Batch()) && names.length > 3) {
                msg.append(names[3] + "超标批次:").append(model.getG4Batch() == null ? 0 : model.getG4Batch()).append("次;");
            }
            if (isExceed(model.getG5Batch()) && names.length > 4) {
                msg.append(names[4] + "超标批次:").append(model.getG5Batch() == null ? 0 : model.getG5Batch()).append("次;");
            }
            if (isExceed(model.getG6Batch()) && names.length > 5) {
                msg.append(names[5] + "超标批次:").append(model.getG6Batch() == null ? 0 : model.getG6Batch()).append("次;");
            }
            if (isExceed(model.getG7Batch()) && names.length > 6) {
                msg.append(names[6] + "超标批次:").append(model.getG7Batch() == null ? 0 : model.getG7Batch()).append("次;");
            }
            if (isExceed(model.getG8Batch()) && names.length > 7) {
                msg.append(names[7] + "超标批次:").append(model.getG8Batch() == null ? 0 : model.getG8Batch()).append("次;");
            }
            if (isExceed(model.getG9Batch()) && names.length > 8) {
                msg.append(names[8] + "超标批次:").append(model.getG9Batch() == null ? 0 : model.getG9Batch()).append("次;");
            }
            if (isExceed(model.getG10Batch()) && names.length > 9) {
                msg.append(names[9] + "超标批次:").append(model.getG10Batch() == null ? 0 : model.getG10Batch()).append("次;");
            }
        }

        return msg.toString();
    }

    private boolean isExceed(Integer value) {
        if (value == null || value == 0) {
            return false;
        }
        return true;
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
