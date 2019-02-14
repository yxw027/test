package com.linghang.util;

import java.math.BigDecimal;
import java.util.Date;

public class GpsUtils {
    /**
     * 赤道半径
     */
    private static final double EARTH_RADIUS = 6378137;
    /**
     * 地球周长
     */
    private static final double EARTH_CIRCUMFERENCE = 6381372 * Math.PI * 2;
    private static double x_pi = 3.14159265358979324 * 3000.0 / 180.0;
    // π
    private static double pi = 3.1415926535897932384626;
    // 长半轴
    private static double a = 6378245.0;
    // 扁率
    private static double ee = 0.00669342162296594323;

    public static boolean outOfChina(double lon, double lat) {
        if (lon < 72.004 || lon > 137.8347) {
            return true;
        } else if (lat < 0.8293 || lat > 55.8271) {
            return true;
        }
        return false;
    }

    public static double transformlat(double lon, double lat) {
        double ret = -100.0 + 2.0 * lon + 3.0 * lat + 0.2 * lat * lat + 0.1 * lon * lat + 0.2 * Math.sqrt(Math.abs(lon));
        ret += (20.0 * Math.sin(6.0 * lon * pi) + 20.0 * Math.sin(2.0 * lon * pi)) * 2.0 / 3.0;
        ret += (20.0 * Math.sin(lat * pi) + 40.0 * Math.sin(lat / 3.0 * pi)) * 2.0 / 3.0;
        ret += (160.0 * Math.sin(lat / 12.0 * pi) + 320 * Math.sin(lat * pi / 30.0)) * 2.0 / 3.0;
        return ret;
    }

    public static double transformlng(double lon, double lat) {
        double ret = 300.0 + lon + 2.0 * lat + 0.1 * lon * lon + 0.1 * lon * lat + 0.1 * Math.sqrt(Math.abs(lon));
        ret += (20.0 * Math.sin(6.0 * lon * pi) + 20.0 * Math.sin(2.0 * lon * pi)) * 2.0 / 3.0;
        ret += (20.0 * Math.sin(lon * pi) + 40.0 * Math.sin(lon / 3.0 * pi)) * 2.0 / 3.0;
        ret += (150.0 * Math.sin(lon / 12.0 * pi) + 300.0 * Math.sin(lon / 30.0 * pi)) * 2.0 / 3.0;
        return ret;
    }

    /**
     * WGS84转GCJ02(火星坐标系)
     *
     * @param wgsLon WGS84坐标系的经度
     * @param wgsLat WGS84坐标系的纬度
     * @return 火星坐标数组
     */
    public static double[] wgs84togcj02(double wgsLon, double wgsLat) {
        if (outOfChina(wgsLon, wgsLat)) {
            return new double[]{wgsLon, wgsLat};
        }
        double dlat = transformlat(wgsLon - 105.0, wgsLat - 35.0);
        double dlng = transformlng(wgsLon - 105.0, wgsLat - 35.0);
        double radlat = wgsLat / 180.0 * pi;
        double magic = Math.sin(radlat);
        magic = 1 - ee * magic * magic;
        double sqrtmagic = Math.sqrt(magic);
        dlat = (dlat * 180.0) / ((a * (1 - ee)) / (magic * sqrtmagic) * pi);
        dlng = (dlng * 180.0) / (a / sqrtmagic * Math.cos(radlat) * pi);
        BigDecimal blat = new BigDecimal(wgsLat + dlat);
        BigDecimal blng = new BigDecimal(wgsLon + dlng);
        double mglat = blat.setScale(10, BigDecimal.ROUND_HALF_UP).doubleValue();
        double mglng = blng.setScale(10, BigDecimal.ROUND_HALF_UP).doubleValue();
        return new double[]{mglng, mglat};
    }

    /**
     * GCJ02(火星坐标系)转GPS84
     *
     * @param gcjLon 火星坐标系的经度
     * @param gcjLat 火星坐标系纬度
     * @return WGS84坐标数组
     */
    public static double[] gcj02towgs84(double gcjLon, double gcjLat) {
        if (outOfChina(gcjLon, gcjLat)) {
            return new double[]{gcjLon, gcjLat};
        }
        double dlat = transformlat(gcjLon - 105.0, gcjLat - 35.0);
        double dlng = transformlng(gcjLon - 105.0, gcjLat - 35.0);
        double radlat = gcjLat / 180.0 * pi;
        double magic = Math.sin(radlat);
        magic = 1 - ee * magic * magic;
        double sqrtmagic = Math.sqrt(magic);
        dlat = (dlat * 180.0) / ((a * (1 - ee)) / (magic * sqrtmagic) * pi);
        dlng = (dlng * 180.0) / (a / sqrtmagic * Math.cos(radlat) * pi);
        double mglat = gcjLat + dlat;
        double mglng = gcjLon + dlng;
        return new double[]{gcjLon * 2 - mglng, gcjLat * 2 - mglat};
    }

    /**
     * 火星坐标系(GCJ-02)转百度坐标系(BD-09)
     * <p>
     * 谷歌、高德——>百度
     *
     * @param gcjLon 火星坐标经度
     * @param gcjLat 火星坐标纬度
     * @return 百度坐标数组
     */
    public static double[] gcj02tobd09(double gcjLon, double gcjLat) {
        double z = Math.sqrt(gcjLon * gcjLon + gcjLat * gcjLat) + 0.00002 * Math.sin(gcjLat * x_pi);
        double theta = Math.atan2(gcjLat, gcjLon) + 0.000003 * Math.cos(gcjLon * x_pi);
        double bdLng = z * Math.cos(theta) + 0.0065;
        double bdLat = z * Math.sin(theta) + 0.006;
        return new double[]{bdLng, bdLat};
    }

    /**
     * 百度坐标系(BD-09)转火星坐标系(GCJ-02)
     * <p>
     * 百度——>谷歌、高德
     *
     * @param bdLon 百度坐标纬度
     * @param bdLat 百度坐标经度
     * @return 火星坐标数组
     */
    public static double[] bd09togcj02(double bdLon, double bdLat) {
        double x = bdLon - 0.0065;
        double y = bdLat - 0.006;
        double z = Math.sqrt(x * x + y * y) - 0.00002 * Math.sin(y * x_pi);
        double theta = Math.atan2(y, x) - 0.000003 * Math.cos(x * x_pi);
        double ggLng = z * Math.cos(theta);
        double ggLat = z * Math.sin(theta);
        return new double[]{ggLng, ggLat};
    }

    /**
     * WGS坐标转百度坐标系(BD-09)
     *
     * @param wgsLng WGS84坐标系的经度
     * @param wgsLat WGS84坐标系的纬度
     * @return 百度坐标数组
     */
    public static double[] wgs84tobd09(double wgsLng, double wgsLat) {
        double[] gcj = wgs84togcj02(wgsLng, wgsLat);
        double[] bd09 = gcj02tobd09(gcj[0], gcj[1]);
        return bd09;
    }

    /**
     * 百度坐标系(BD-09)转WGS坐标
     *
     * @param bdLng 百度坐标纬度
     * @param bdLat 百度坐标经度
     * @return WGS84坐标数组
     */
    public static double[] bd09towgs84(double bdLng, double bdLat) {
        double[] gcj = bd09togcj02(bdLng, bdLat);
        double[] wgs84 = gcj02towgs84(gcj[0], gcj[1]);
        return wgs84;
    }

    /**
     * 转换为弧度
     */
    private static double rad(double d) {
        return d * Math.PI / 180.0;
    }

    /**
     * 基于余弦定理求两经纬度距离
     *
     * @param lat1 点一纬度
     * @param lng1 点一经度
     * @param lat2 点二纬度
     * @param lng2 点二经度
     * @return 返回的距离, 单位:米
     */
    public static double getDistance(double lat1, double lng1, double lat2, double lng2) {
        double radLat1 = rad(lat1);
        double radLat2 = rad(lat2);
        double a = radLat1 - radLat2;
        double b = rad(lng1) - rad(lng2);
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) +
                Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
        s = s * EARTH_RADIUS;
//        double ss = Math.round(s);
//        double sss = Math.floor(s);
        return s;
    }




    /**
     * 获取桩号比例
     * <p>
     * 知道三条边的长度a,b,c
     * 则三角形面积s=√p(p-a)(p-b)(p-c),其中p=(a+b+c)/2
     * (海伦公式）
     * 则：
     * a边上的高h1=2s/a，
     * b边上的高h2=2s/b
     * c边上的高h3=2s/c
     *
     * @param pileStartLat 开始桩号纬度
     * @param pileStartLng 开始桩号经度
     * @param pileEndLat   结束桩号纬度
     * @param pileEndLng   结束桩号经度
     * @param carLat       车辆桩号纬度
     * @param catLng       车辆桩号经度
     * @return
     */
    public static double getStakeRatio(double pileStartLat, double pileStartLng, double pileEndLat, double pileEndLng, double carLat, double catLng) {
        double cLength = getDistance(pileStartLat, pileStartLng, pileEndLat, pileEndLng);
        double bLength = getDistance(pileStartLat, pileStartLng, carLat, catLng);
        double aLength = getDistance(pileEndLat, pileEndLng, carLat, catLng);
        double s = (cLength + bLength + aLength) / 2;
        double area = Math.sqrt(s * (s - aLength) * (s - bLength) * (s - cLength));
        double h = area * 2 / cLength;
//        double aa = Math.sqrt(aLength * aLength - h * h);
        double bb = Math.sqrt(bLength * bLength - h * h);
        double ratio = bb / cLength;
//        System.out.println(ratio);
        return ratio;
    }

    /**
     * 根据两GPS点计算方向角度
     *
     * @param startLat
     * @param startLng
     * @param endLat
     * @param endLng
     * @return
     */
    public static double getDirection(double startLat, double startLng, double endLat,
                                      double endLng) {
        double direction;
        startLat = startLat * Math.PI / 180;
        startLng = startLng * Math.PI / 180;
        endLat = endLat * Math.PI / 180;
        endLng = endLng * Math.PI / 180;
        direction = Math.sin(startLat) * Math.sin(endLat) + Math.cos(startLat) * Math.cos(endLat) * Math.cos(endLng - startLng);
        direction = Math.sqrt(1 - direction * direction);
        direction = Math.cos(endLat) * Math.sin(endLng - startLng) / direction;
        direction = Math.asin(direction) * 180 / Math.PI;
        if (0 > direction) {
            direction = 180 - direction;
        }
//        direction = (double) Math.round(direction * 100) / 100;
        return direction;
    }

    /**
     * 速度计算
     *
     * @param startLat 开始纬度
     * @param startLng 开始经度
     * @param endLat   结束纬度
     * @param endLng   结束经度
     * @return 千米/小时
     */
    public static double getSpeed(double startLat, double startLng, double endLat,
                                  double endLng) {
        double distance = getDistance(startLat, startLng, endLat, endLng);
        distance = (double) Math.round(distance * 360) / 100;
        return distance;
    }

    /**
     * 速度计算
     *
     * @param startTime 开始时间
     * @param endTime   结束时间
     * @param distance  距离 (单位 米)
     * @return 千米/小时
     */
    public static double getSpeed(Date startTime, Date endTime, double distance) {
        long timeLong = (endTime.getTime() - startTime.getTime()) / 1000;
        return distance * 1000 / (timeLong * 3600);
    }

    /**
     * @param startLat 开始纬度
     * @param startLng 开始经度
     * @param endLat   结束纬度
     * @param endLng   结束经度
     * @return 千米/小时
     */
    public static double getSpeed(double startLat, double startLng, double endLat,
                                  double endLng, double time) {
        double distance = getDistance(startLat, startLng, endLat, endLng);
        distance = (distance / time) * 3.6;
        return distance;
    }

    /**
     * 米勒坐标系 gps转平面
     *
     * @param lat 纬度
     * @param lon 经度
     * @return
     */
    public static double[] millierGpsToFlat(double lat, double lon) {
        // 平面展开后，x轴等于周长
        double w = EARTH_CIRCUMFERENCE;
        // y轴约等于周长一半
        double h = EARTH_CIRCUMFERENCE / 2;
        // 米勒投影中的一个常数，范围大约在正负2.3之间
        double mill = 2.3;
        // 将经度从度数转换为弧度
        double x = lon * Math.PI / 180;
        // 将纬度从度数转换为弧度
        double y = lat * Math.PI / 180;
        // 米勒投影的转换
        y = 1.25 * Math.log(Math.tan(0.25 * Math.PI + 0.4 * y));
        // 弧度转为实际距离
        x = (w / 2) + (w / (2 * Math.PI)) * x;
        y = (h / 2) - (h / (2 * mill)) * y;
        double[] result = new double[2];
        result[0] = x;
        result[1] = y;
        return result;
    }

    /**
     * 米勒坐标系 平面转gps
     *
     * @param x X
     * @param y Y
     * @return
     */
    public static double[] millierFlatToGps(double x, double y) {
        // 平面展开后，x轴等于周长
        double w = EARTH_CIRCUMFERENCE;
        // y轴约等于周长一半
        double h = EARTH_CIRCUMFERENCE / 2;
        // 米勒投影中的一个常数，范围大约在正负2.3之间
        double mill = 2.3;
        double lat;
        lat = ((h / 2 - y) * 2 * mill) / (1.25 * h);
        lat = ((Math.atan(Math.exp(lat)) - 0.25 * Math.PI) * 180) / (0.4 * Math.PI);
        double lon;
        lon = (x - w / 2) * 360 / w;
        double[] result = new double[2];
        result[0] = lon;
        result[1] = lat;
        return result;
    }

    public static void main(String[] args) {
        System.out.println(getDistance(34.2383890000, 108.8962860000, 34.2340540000, 108.8963220000));
        getStakeRatio(34.2383890000, 108.8962860000, 34.2340540000, 108.8963220000, 34.2374560000, 108.8989720000);

        double speed = getSpeed(23.1939802800, 109.6620399700, 23.1939488200, 109.6621151600);
        System.out.println(speed);

        double direction = getDirection(23.1939802800, 109.6620399700, 23.1939488200, 109.6621151600);
        System.out.println(direction);


    }

}
