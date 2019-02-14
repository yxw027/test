package com.linghang.util;

import com.linghang.enums.AlarmType;
import com.linghang.enums.WarningLevel;
import com.linghang.model.business.asphalt.AsphaltMetadataResultModel;
import com.linghang.model.business.continuous.ContinuousWarningModel;
import com.linghang.model.business.water.WaterMetaDataModel;
import com.linghang.service.business.asphalt.AsphaltMetadataResultService;
import com.linghang.service.business.water.WaterMetaDataService;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * @author wuchen
 */
public class MixingUtil {

    /**
     * 连续盘数预警信息追加
     */
    public static void setExcelMsg(StringBuffer sb, Integer level, ContinuousWarningModel mixConfig, int excelLevel, List<Integer> numbers) {
        switch (mixConfig.getWarningType()){
            case 1:
                sb.append("连续"+WarningLevel.getKey(excelLevel) +"超标"+numbers.get(excelLevel-1)+"盘;");
                break;
            case 2:
                sb.append("连续超标"+numbers.get(excelLevel-1)+"盘;");
                break;
            default:
        }
    }

    public static void setWarningNumber(ContinuousWarningModel mixConfig, List<Integer> numbers) {
        numbers.add(mixConfig.getFirstWarning());
        numbers.add(mixConfig.getSecondWarning());
        numbers.add(mixConfig.getThreeWarning());
    }

    /**
     * 获取超标级别
     */
    public static List<Integer> getExcelLevel(Long asphaltId, Integer level, ContinuousWarningModel mixConfig, List<Integer> excelLevel, List<Integer> numbers , Integer mixType , Object dataService,Long dataId) throws Exception {
        setWarningNumber(mixConfig, numbers);
        for (int i = 0; i < numbers.size(); i++) {
            int number = numbers.get(i);
            boolean flag = true;
            switch (mixConfig.getWarningType()){
                case 1:
                    //区分超标级别
                    if (AlarmType.ASPHALT.getInteger().equals(mixType)){
                        flag = distinguishLevelAsp(asphaltId, level, i, number,flag,(AsphaltMetadataResultService)dataService);
                    } else if(AlarmType.WATER.getInteger().equals(mixType)){
                        flag = distinguishLevelWat(asphaltId, level, i, number,flag,(WaterMetaDataService)dataService,dataId);
                    }

                    break;
                case 2:
                    if (AlarmType.ASPHALT.getInteger().equals(mixType)){
                        flag = notDistinguishLevelAsp(asphaltId, number, flag , (AsphaltMetadataResultService)dataService);
                    } else if(AlarmType.WATER.getInteger().equals(mixType)){
                        flag = notDistinguishLevelWat(asphaltId, number, flag , (WaterMetaDataService)dataService,dataId);
                    }
                    break;
                default:
            }
            if (flag){
                excelLevel.add(i+1);
            }
        }
        return excelLevel;
    }

    /**
     * 区分超标级别判定（沥青）
     */
    private static boolean distinguishLevelAsp(Long asphaltId, Integer level, int i, int number, boolean flag , AsphaltMetadataResultService resultService) {
        List<AsphaltMetadataResultModel> datas = resultService.getContinuousLevelData(asphaltId, number);
        for (AsphaltMetadataResultModel data : datas) {
            if ((i+1) != data.getAllLevel() || datas.size()<number){
                flag = false;
                break;
            }
        }
        return flag;
    }

    /**
     * 区分超标级别判定（水稳）
     */
    private static boolean distinguishLevelWat(Long waterId, Integer level, int i, int number, boolean flag , WaterMetaDataService dataService,Long dataId) {
        List<WaterMetaDataModel> datas = dataService.getContinuousData(waterId, number-1,dataId);
        for (WaterMetaDataModel data : datas) {
            //获取超标数据
            Integer warningLevel = dataService.getWarningLevel(data.getId());
            if (StringUtils.isEmpty(warningLevel) || (i+1) != warningLevel || datas.size()<number-1){
                flag = false;
                break;
            }
        }
        if ((i+1) != level){
            flag = false;
        }
        return flag;
    }

    /**
     * 不区分超标级别判定（沥青）
     */
    private static boolean notDistinguishLevelAsp(Long asphaltId, int number, boolean flag , AsphaltMetadataResultService resultService) {
        List<AsphaltMetadataResultModel> continuousData = resultService.getContinuousData(asphaltId, number);
        for (AsphaltMetadataResultModel continuousDatum : continuousData) {
            if (continuousDatum.getIsPass() != 1 || continuousData.size()<number){
                flag = false;
                break;
            }
        }
        return flag;
    }

    /**
     * 不区分超标级别判定（水稳）
     */
    private static boolean notDistinguishLevelWat(Long waterId, int number, boolean flag , WaterMetaDataService dataService,Long dataId) {
        List<WaterMetaDataModel> continuousData = dataService.getContinuousData(waterId, number - 1,dataId);
        for (WaterMetaDataModel continuousDatum : continuousData) {
            if (continuousDatum.getIsPass() != 1 || continuousData.size()<number-1){
                flag = false;
                break;
            }
        }
        return flag;
    }
}
