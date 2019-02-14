package com.linghang.mina;

import com.linghang.model.GpsDataModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Base64;

/**
 * 解析上报字符串接口
 *
 * @author i_it
 */
public class DecodeHelper {

    final static Base64.Decoder BASE_64_DECODER = Base64.getDecoder();
    public static final String RFID = "RFID";
    public static final String GPGGA = "GPGGA";
    public static final String GNGGA = "GNGGA";
    public static final String TEMP = "TEMP";
    public static final String ACM = "ACM";
    private static Logger logger = LoggerFactory.getLogger(DecodeHelper.class);

    /**
     * ddd°mm.mmm’ 转ddd.ddddd °
     *
     * @param dd
     * @return
     */
    public static double ddToDMS(String dd) {
        if (dd == null || "".equals(dd)) {
            return 0d;
        }
        double d = 0d;
        try {
            d = Double.parseDouble(dd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int d1 = (int) (d / 100);
        double d2 = (d - d1 * 100) / 60;
        return round(10, d1 + d2);
    }

    private static String big2(double d) {
        BigDecimal d1 = new BigDecimal(Double.toString(d));
        BigDecimal d2 = new BigDecimal(Integer.toString(10)); // 四舍五入,保留2位小数
        return d1.divide(d2, 10, BigDecimal.ROUND_HALF_UP).toString();
    }

    private static double round(int len, double d) {
        BigDecimal b = new BigDecimal(d);
        return b.setScale(len, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * GPGGA
     * <1> UTC时间，hhmmss（时分秒）格式
     * <2> 纬度ddmm.mmmm（度分）格式（前面的0也将被传输）
     * <3> 纬度半球N（北半球）或S（南半球）
     * <4> 经度dddmm.mmmm（度分）格式（前面的0也将被传输）
     * <5> 经度半球E（东经）或W（西经）
     * <6> GPS状态：0=未定位，1=非差分定位，2=差分定位，6=正在估算
     * <7> 正在使用解算位置的卫星数量（00~12）（前面的0也将被传输）
     * <8> HDOP水平精度因子（0.5~99.9）
     * <9> 海拔高度（-9999.9~99999.9）
     * <10> 地球椭球面相对大地水准面的高度
     * <11> 差分时间（从最近一次接收到差分信号开始的秒数，如果不是差分定位将为空）
     * <12> 差分站ID号0000~1023（前面的0也将被传输，如果不是差分定位将为空）
     *
     * @param data
     * @param model
     */

    public static void gpgga(String[] data, GpsDataModel model) {
        if (data.length < 9) {
            logger.error("error_gpgga:" + Arrays.toString(data));
        }
        model.setLat(ddToDMS(data[2]));
        model.setLon(ddToDMS(data[4]));
        model.setHi(Double.parseDouble(data[9]));
    }

    /**
     * $GNGGA:GPGGA(时间、定位质量)
     * UTC时间,纬度,纬半球,经度,经半球,定位质量标,卫星数量,水平精确度,天、地水准高度，差分GPS数据等, *, 校验和, 回车、换行
     * "$GNGGA,033640.00,3413.70262722,N,10852.85226806,E,1,10,3.2,476.827,M,-35.303,M,,*5B",
     *
     * @param data
     * @param model
     */
    static void gngga(String[] data, GpsDataModel model) {
        model.setLat(ddToDMS(data[2]));
        model.setLon(ddToDMS(data[4]));
        model.setHi(Double.parseDouble(data[9]));
    }

    public static void temp(String data, GpsDataModel model) {

    }

    static void acm(String data, GpsDataModel model) {

    }

    static void rfid(String data, GpsDataModel model) {
        model.setRfid(data.substring(20));
    }
}
