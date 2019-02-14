package com.linghang.mina;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.linghang.model.GpsDataModel;
import com.linghang.model.GpsJsonModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.linghang.mina.DecodeHelper.*;

/**
 * 领航数据处理类
 *
 * @author i_it
 */
@Component
public class DispatcherLhImpl implements Dispatcher {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    private String responseMsg;

    @Override
    public List<GpsDataModel> getDataList(String message) {
        List<GpsJsonModel> gpsJsonModelList;
        try {
            gpsJsonModelList = JSONObject.parseArray(message, GpsJsonModel.class);
        } catch (Exception e) {
            responseMsg = "dataResultWeb:0000000000000";
            return new ArrayList<>(0);
        }
        JSONArray array = new JSONArray();
        List<GpsDataModel> dataModels = new ArrayList<>(0);
        try {
            for (GpsJsonModel jsonModel : gpsJsonModelList) {
                GpsDataModel gpsDataModel = deal(jsonModel);
                dataModels.add(gpsDataModel);
                array.add(jsonModel.getTime());
            }
        } catch (Exception e) {
            logger.warn("GPS 数据处理异常:[{}]", e);
//            System.out.println("DataHandler.class --> method [ messageReceived ] , Exception message : GPS 数据处理异常!");
        }
        String resultString = array.toString().replaceAll("\"", "").replace("[", "").replace("]", "");
        responseMsg = "".equals(resultString) ? "0000000000000" : "dataResultWeb:" + resultString;
        return dataModels;
    }

    @Override
    public String response() {
        return responseMsg;
    }

    private GpsDataModel deal(GpsJsonModel gpsJsonModel) {
        GpsDataModel model = new GpsDataModel();
        //GPS
        model.setSid(gpsJsonModel.getSn());
        String gpsStr = gpsJsonModel.getGps();
        String[] gps = gpsStr.split(",");
        String head = gps[0].replace("$", "");
        switch (head) {
            case GPGGA:
                gpgga(gps, model);
                break;
            case GNGGA:
                gngga(gps, model);
                break;
            default:
                break;
        }
        //温度
        temp(gpsJsonModel.getTemp(), model);
        //震动
        acm(gpsJsonModel.getAcm(), model);

//        model.setSid(gpsJsonModel.getCar());
        model.setGpsTime(new Date(Long.valueOf(gpsJsonModel.getTime() + "000")));
        return model;
    }
}
