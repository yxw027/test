package com.linghang.mina;

import com.linghang.model.GpsDataModel;
import com.linghang.util.IdWorker;
import com.linghang.util.ZipStrUtil;
import org.apache.mina.filter.codec.textline.LineDelimiter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.*;

import static com.linghang.mina.DecodeHelper.*;

/**
 * 华测GPS数据处理类
 *
 * @author i_it
 */
@Component
public class DispatcherHcImpl implements Dispatcher {

    private static final String LAST_TIME = "lastTime";
    private static final String RESPONSE_HEAD = "$";
    private static final String START_CHAR = "#";

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    private String responseMsg;

    public String decode(String msg) {
        if (StringUtils.isEmpty(msg)) {
            return null;
        }
        String[] msgSplit = msg.split("");
        String head = msgSplit[0];
        if (!msgSplit[0].startsWith(START_CHAR)) {
            return null;
        }
        int length = Integer.parseInt(head.substring(1));
        if (msgSplit[1].length() != length) {
            return null;
        }
        try {
            String data2 = new String(BASE_64_DECODER.decode(msgSplit[1]), StandardCharsets.ISO_8859_1);
            return ZipStrUtil.unCompress(data2);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public String response() {
        return responseMsg;
    }

    @Override
    public List<GpsDataModel> getDataList(String message) {
        message = decode(message);
//        System.out.println("华测量解析数据:" + message);
        if (StringUtils.isEmpty(message)) {
            return new ArrayList<>(0);
        }
        List<GpsDataModel> list = new ArrayList<>(7);
        try {
            Map<String, Object> map = deal(message, list);
            list = (List<GpsDataModel>) map.get("resultList");
            if (map.get(LAST_TIME) != null) {
                responseMsg = RESPONSE_HEAD + map.get(LAST_TIME) + LineDelimiter.WINDOWS.getValue();
            }
        } catch (Exception e) {
            logger.error("保存华测数据异常:[{}]", e);
        }
        return list;
    }

    private Map<String, Object> deal(String data, List<GpsDataModel> resultList) {
        Map<String, Object> resultMap = new HashMap<>(2);
        Long lastTime = null;
        if (data != null) {
            String[] datas = data.split("\r\n");
            for (int i = 0; i < datas.length; i++) {
                GpsDataModel model = formate(datas[i]);
                if (model != null) {
                    resultList.add(model);
                }
                if (i == datas.length - 1) {
                    lastTime = model.getGpsTime().getTime();
                }
            }
        }
        resultMap.put("lastTime", lastTime);
        resultMap.put("resultList", resultList);
        return resultMap;
    }

    private GpsDataModel formate(String data) {
        String[] items = data.split("\\$");
        if (items.length < 3) {
            return null;
        }
        //第一个参数
        GpsDataModel model = new GpsDataModel();
        model.setId(IdWorker.nextId());
        model.setGpsTime(new Date(Long.parseLong(items[1].replace("$", ""))));
//        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(model.getGpsTime());
//        System.out.println("lastTime:" + time);
        //第二个参数
        model.setSid(items[2]);
        for (int i = 3; i < items.length; i++) {
            String[] values = items[i].split(",");
            String head = values[0];
            switch (head) {
                case GPGGA:
                    gpgga(values, model);
                    break;
                case GNGGA:
                    gngga(values, model);
                    break;
                case TEMP:
                    temp(values[i], model);
                    break;
                case ACM:
                    acm(values[i], model);
                    break;
                case RFID:
                    rfid(values[2], model);
                    break;
                default:
                    break;
            }
        }
        return model;
    }


}
