package com.linghang.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;


/**
 * @description: 百度Api调用工具
 * @author: xuqiang
 * @createDate: 2019-01-09 09:59
 **/
@Component
public class BaiduApiUtil {

    private static String baiduapiak;

    @Value("${baiduapiak}")
    public void setBaiduapiak(String baiduapiak) {
        BaiduApiUtil.baiduapiak = baiduapiak;
    }

    public final static String BAIDUAPIURL = "http://api.map.baidu.com/geocoder/v2/";

    /**
     * 根据经纬度调用 当前位置信息
     *
     * @param latitude
     * @param longitude
     * @return
     */
    public static String getLocationFromlatitudeAndLongitude(String latitude, String longitude) {
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("ak", baiduapiak);
        paramMap.put("output", "json");
        paramMap.put("coordtype", "wgs84ll");
        paramMap.put("pois", "0");
        paramMap.put("location", latitude + "," + longitude);
        String forObject = new RestTemplate().getForObject(BAIDUAPIURL + "?ak={ak}&output={output}&coordtype={coordtype}&pois={pois}&location={location}", String.class, paramMap);
        return forObject;
    }
}
