package com.linghang.service;

import com.linghang.model.CarModel;
import com.linghang.model.GpsDataModel;
import com.linghang.util.FlatUtil;
import com.linghang.util.GpsUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.*;

/**
 * @author by liuhao on 2018/1/26.
 * 摊铺分析数据
 */
@Service
public class GpsDataAnalysisService {

    /**
     * gps缩放比例
     */
    private static final int SCALE = 4000000;

    private static final Map<Integer, Integer> RED_MAP = new HashMap<>(9);

    private Logger logger = LoggerFactory.getLogger(this.getClass());


    @Autowired
    private GpsDataService gpsDataService;
    @Autowired
    private CarService carService;
    @Autowired
    private StakeService stakeService;

    public GpsDataAnalysisService() {
        RED_MAP.put(49, 26);
        RED_MAP.put(70, 49);
        RED_MAP.put(89, 70);
        RED_MAP.put(106, 89);
        RED_MAP.put(121, 106);
        RED_MAP.put(135, 121);
        RED_MAP.put(147, 135);
        RED_MAP.put(158, 147);
        RED_MAP.put(168, 158);
    }

    public byte[] analysis(Long workAreaId) {
        if (workAreaId == null) {
            return null;
        }

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        try {
            date = dateFormat.parse("2018-08-22");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        List<GpsDataModel> gpsDataModels = gpsDataService.selectOneDay(null, date, workAreaId);
        if (gpsDataModels.isEmpty()) {
            return null;
        }

        double left, top, right, end;
        left = right = gpsDataModels.get(0).getLon();
        top = end = gpsDataModels.get(0).getLat();
        for (GpsDataModel model : gpsDataModels) {
            if (left > model.getLon()) {
                left = model.getLon();
            }
            if (right < model.getLon()) {
                right = model.getLon();
            }
            if (top > model.getLat()) {
                top = model.getLat();
            }
            if (end < model.getLat()) {
                end = model.getLat();
            }
        }

        /**
         * 横向坐标最大距离
         */
        double distance = GpsUtils.getDistance(left, top, right, top);

        int leftInt = (int) Math.round(left * SCALE);
        int rightInt = (int) Math.round(right * SCALE);
        int topInt = (int) Math.round(top * SCALE);
        int endInt = (int) Math.round(end * SCALE);

        int width = rightInt - leftInt;
        int height = endInt - topInt;

        /**
         * 图片与实际距离比例
         */
        double scale = width / distance;
        //创建BufferedImage对象
        BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
//        List<CarModel> carModels = carService.selectByModel(carModel);
//        for (CarModel model : carModels) {
//            if (CarType.PAVERS.getInteger().equals(model.getCarType())) {
//                drawPavers(model, workAreaId, date, bi, scale, leftInt, topInt);
//            }
//        }
        //        carId = 19937988858L;

        CarModel carModel = carService.selectById(19937988858L);
        CarModel carMode2 = carService.selectById(19240484304L);
//        drawPavers(carModel, workAreaId, date, bi, scale, leftInt, topInt);
        drawRubber(carMode2, workAreaId, date, bi, scale, leftInt, topInt);
//        Graphics2D graphics = bi.createGraphics();
//        graphics.dispose();

        // 保存文件
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            ImageIO.write(bi, "png", byteArrayOutputStream);
        } catch (IOException e) {
            logger.error("生成地图PNG错误[{}]", e);
        }
        return byteArrayOutputStream.toByteArray();


    }

    /**
     * 绘画摊铺机
     *
     * @param carModel
     * @param date
     * @param bi
     * @param scale
     * @param leftInt
     * @param topInt
     */
    private void drawPavers(CarModel carModel, Long workAreaId, Date date, BufferedImage bi, double scale, int leftInt, int topInt) {
        List<GpsDataModel> gpsDataModels = gpsDataService.selectOneDay(carModel.getId(), date, workAreaId);
        if (gpsDataModels.isEmpty()) {
            return;
        }
        Graphics2D g2d = bi.createGraphics();
        g2d.setColor(Color.white);
        float lineWidth = (float) (carModel.getWidth() * scale / 100);
//        float lineWidth = 20;
        g2d.setStroke(new BasicStroke(lineWidth));
        int i = 0;
        int latInt, lonInt;
        int[] xpoints = new int[gpsDataModels.size()];
        int[] ypoints = new int[gpsDataModels.size()];
        for (GpsDataModel model : gpsDataModels) {
            latInt = (int) Math.round(model.getLon() * SCALE) - leftInt;
            lonInt = bi.getHeight() - (int) Math.round(model.getLat() * SCALE) + topInt;
            xpoints[i] = latInt;
            ypoints[i] = lonInt;
            ++i;

//            g2d.drawString(model.getId().toString(), latInt, lonInt);
        }
        g2d.drawPolyline(xpoints, ypoints, gpsDataModels.size());
        g2d.dispose();
    }

    /**
     * 绘画胶轮
     *
     * @param carModel
     * @param workAreaId
     * @param date
     * @param bi
     * @param scale
     * @param leftInt
     * @param topInt
     */
    private void drawRubber(CarModel carModel, Long workAreaId, Date date, BufferedImage bi, double scale, int leftInt, int topInt) {
        List<GpsDataModel> gpsDataModels = gpsDataService.selectOneDay(carModel.getId(), date, workAreaId);
        if (gpsDataModels.isEmpty()) {
            return;
        }
        Graphics2D g2d = bi.createGraphics();
        g2d.setColor(Color.red);
        float lineWidth = (float) (carModel.getWidth() * scale / 100);
        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 0.1f));
        g2d.setColor(Color.red);
        g2d.setStroke(new BasicStroke(lineWidth, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
        int previousLat = bi.getWidth() - (int) Math.round(gpsDataModels.get(0).getLon() * SCALE) + leftInt;
        int previousLon = (int) Math.round(gpsDataModels.get(0).getLat() * SCALE) - topInt;
        int nowLat;
        int nowLon;
        gpsDataModels.remove(0);
        for (GpsDataModel model : gpsDataModels) {
            nowLat = (int) Math.round(model.getLon() * SCALE) - leftInt;
            nowLon = bi.getHeight() - (int) Math.round(model.getLat() * SCALE) + topInt;
            if (nowLat == previousLat && nowLon == previousLon) {
                continue;
            }
            g2d.drawLine(previousLat, previousLon, nowLat, nowLon);
            fixPoint(bi, previousLat, previousLon, lineWidth);
            previousLat = nowLat;
            previousLon = nowLon;
        }
        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER));
        g2d.dispose();
    }

    public byte[] getPng() {
        List<GpsDataModel> gpsDataModels = this.gpsDataService.selectBySid("5502C02830");
//        if (gpsDataModels.isEmpty()) {
//            return null;
//        }
//        GpsDataModel preGpsDataModel = null;
//        for (GpsDataModel gpsDataModel : gpsDataModels) {
//            if (preGpsDataModel == null) {
//                preGpsDataModel = gpsDataModel;
//                continue;
//            }
//            gpsDataModel.setDistance(GpsUtils.getDistance(preGpsDataModel.getLat(), preGpsDataModel.getLon(), gpsDataModel.getLat(), gpsDataModel.getLon()));
//        }
//        System.out.println(gpsDataModels);
//        double left, top, right, end;
//        left = right = gpsDataModels.get(0).getLon();
//        top = end = gpsDataModels.get(0).getLat();
//        for (GpsDataModel model : gpsDataModels) {
//            if (left > model.getLon()) {
//                left = model.getLon();
//            }
//            if (right < model.getLon()) {
//                right = model.getLon();
//            }
//            if (top > model.getLat()) {
//                top = model.getLat();
//            }
//            if (end < model.getLat()) {
//                end = model.getLat();
//            }
//        }
//        int leftInt = (int) Math.round(left * 10000000);
//        int rightInt = (int) Math.round(right * 10000000);
//        int topInt = (int) Math.round(top * 10000000);
//        int endInt = (int) Math.round(end * 10000000);
//
//        int width = rightInt - leftInt;
//        int height = endInt - topInt;
        //创建BufferedImage对象
        BufferedImage bi = new BufferedImage(16000, 16000, BufferedImage.TYPE_INT_RGB);
        // 获取Graphics2D
        Graphics2D g2d = bi.createGraphics();
//        g2d.setBackground(Color.red);
//        bi.g
//        g2d.scale(10,10);

        //消除画图锯齿
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        // 1.0f为透明度 ，值从0-1.0，依次变得不透明
        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 0.2f));

        // 画图BasicStroke是JDK中提供的一个基本的画笔类,我们对他设置画笔的粗细，就可以在drawPanel上任意画出自己想要的图形了。
        g2d.setColor(Color.red);
        g2d.setStroke(new BasicStroke(1f));
//        g2d.drawLine(50, 50, 50, 50);
//        g2d.drawLine(100, 100, 100, 100);
//        g2d.drawLine(100, 100, 100, 100);
//        g2d.drawLine(200, 200, 200, 200);
//        g2d.drawLine(200, 200, 200, 200);
//        g2d.drawLine(200, 200, 200, 200);
//        int pixel;
//        pixel = bi.getRGB(50, 50);
//        System.out.println(pixel);
//        pixel = bi.getRGB(100, 100);
//        System.out.println(pixel);
//        pixel = bi.getRGB(200, 200);
//        System.out.println(pixel);


//        int previousLat = width - (int) Math.round(gpsDataModels.get(0).getLon() * 10000000) + leftInt;
//        int previousLon = (int) Math.round(gpsDataModels.get(0).getLat() * 10000000) - topInt;
//        int nowLat;
//        int nowLon;
//        gpsDataModels.remove(0);
//        int index = 0;
//        int[][] lineFourPointsXy = new int[0][0];
//        int[][] lineFourPointsXy2;
//        for (GpsDataModel model : gpsDataModels) {
//            nowLat = (int) Math.round(model.getLon() * 10000000) - leftInt;
//            nowLon = height - (int) Math.round(model.getLat() * 10000000) + topInt;
//            if (nowLat == previousLat && nowLon == previousLon) {
//                continue;
//            }
//            lineFourPointsXy2 = FlatUtil.getLineFourPointsXy(previousLat, previousLon, nowLat, nowLon, 100f);
//            if (index == 0) {
//                lineFourPointsXy = lineFourPointsXy2;
//            } else {
//                lineFourPointsXy[0][0] = lineFourPointsXy[0][3];
//                lineFourPointsXy[0][1] = lineFourPointsXy[0][2];
//                lineFourPointsXy[0][2] = lineFourPointsXy2[0][2];
//                lineFourPointsXy[0][3] = lineFourPointsXy2[0][3];
//                lineFourPointsXy[1][0] = lineFourPointsXy[1][3];
//                lineFourPointsXy[1][1] = lineFourPointsXy[1][2];
//                lineFourPointsXy[1][2] = lineFourPointsXy2[1][2];
//                lineFourPointsXy[1][3] = lineFourPointsXy2[1][3];
//                double distance1 = FlatUtil.getDistance(lineFourPointsXy[0][0], lineFourPointsXy[1][0], lineFourPointsXy[0][2], lineFourPointsXy2[1][2]);
//                double distance2 = FlatUtil.getDistance(lineFourPointsXy[0][0], lineFourPointsXy[1][0], lineFourPointsXy[0][3], lineFourPointsXy2[1][3]);
////                if (distance2 > distance1) {
////                    lineFourPointsXy[0][2] = lineFourPointsXy2[0][3];
////                    lineFourPointsXy[0][3] = lineFourPointsXy2[0][2];
////                    lineFourPointsXy[1][2] = lineFourPointsXy2[1][3];
////                    lineFourPointsXy[1][3] = lineFourPointsXy2[1][2];
////                }
//            }
//            g2d.fillPolygon(lineFourPointsXy[0], lineFourPointsXy[1], 4);
//
//            previousLat = nowLat;
//            previousLon = nowLon;
//            ++index;
//            if (index == 2) {
////                g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 0.45f));
////                g2d.setColor(Color.black);
////                g2d.drawLine(nowLat, nowLon, nowLat, nowLon);
////                g2d.drawLine(nowLat, nowLon, nowLat, nowLon);
////                g2d.drawLine(nowLat, nowLon, nowLat, nowLon);
////                showColor(bi, nowLat, nowLon);
////                break;
//            }
//        }

        int[] xx = new int[gpsDataModels.size()];
        int[] yy = new int[gpsDataModels.size()];
//        int index = 0;
//        for (GpsDataModel model : gpsDataModels) {
//            xx[index] = (int) Math.round(model.getLon() * 10000000) - leftInt;
//            yy[index] = height - (int) Math.round(model.getLat() * 10000000) + topInt;
//            ++index;
//        }

//        int[] xx = {140, 180, 170, 180, 140, 100, 110, 100};
//        int[] yy = {5, 25, 35, 45, 65, 45, 35, 25};
//        Polygon polygon2 = new Polygon(xx, yy, 8);
//        g2d.drawPolyline(xx, yy, gpsDataModels.size());

//            g2d.fillRect(128, 128, width, height);

        // 释放对象 透明度设置结束
        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER));
//        g2d.setBackground(Color.red);

        int width1 = bi.getWidth();
        int height1 = bi.getHeight();
        int minx = bi.getMinX();
        int miny = bi.getMinY();
        System.out.println("dd");
        g2d.setStroke(new BasicStroke(1));
//        g2d.setColor(Color.yellow);
        Set<Integer> set = new HashSet<>();
        Set<String> set2 = new HashSet<>();
//        for (int i = 0; i < width; i++) {
//            for (int j = 0; j < height; j++) {
//                pixel = bi.getRGB(i, j);
////                if (pixel == -8388608) {
////                    g2d.drawLine(i, j, i, j);
////                }
//                int i1 = (pixel & 0xff0000) >> 16;
//                int i2 = (pixel & 0xff00) >> 8;
//                int i3 = (pixel & 0xff);
//                String e = i1 + "," + i2 + "," + i3;
//                set.add(pixel);
//                set2.add(e);
////                System.out.println(e);
//            }
//        }
        System.out.println(set);
        System.out.println(set2);

        g2d.dispose();


        // 保存文件
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            ImageIO.write(bi, "png", byteArrayOutputStream);
        } catch (IOException e) {
            logger.error("生成地图PNG错误[{}]", e);
        }
        return byteArrayOutputStream.toByteArray();

    }

    public byte[] getPng2() {
        List<GpsDataModel> gpsDataModels = this.gpsDataService.selectBySid("5502C02830");
        if (gpsDataModels.isEmpty()) {
            return null;
        }

        double left, top, right, end;
        left = right = gpsDataModels.get(0).getLon();
        top = end = gpsDataModels.get(0).getLat();
        for (GpsDataModel model : gpsDataModels) {
            if (left > model.getLon()) {
                left = model.getLon();
            }
            if (right < model.getLon()) {
                right = model.getLon();
            }
            if (top > model.getLat()) {
                top = model.getLat();
            }
            if (end < model.getLat()) {
                end = model.getLat();
            }
        }
        int leftInt = (int) Math.round(left * 10000000);
        int rightInt = (int) Math.round(right * 10000000);
        int topInt = (int) Math.round(top * 10000000);
        int endInt = (int) Math.round(end * 10000000);

        int width = rightInt - leftInt;
        int height = endInt - topInt;
        //创建BufferedImage对象
        BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        // 获取Graphics2D
        Graphics2D g2d = bi.createGraphics();

        //消除画图锯齿
//        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        // 1.0f为透明度 ，值从0-1.0，依次变得不透明
        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 0.1f));

        // 画图BasicStroke是JDK中提供的一个基本的画笔类,我们对他设置画笔的粗细，就可以在drawPanel上任意画出自己想要的图形了。
        g2d.setColor(Color.red);
        g2d.setStroke(new BasicStroke(100f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));


        int previousLat = width - (int) Math.round(gpsDataModels.get(0).getLon() * 10000000) + leftInt;
        int previousLon = (int) Math.round(gpsDataModels.get(0).getLat() * 10000000) - topInt;
        int preRedValue;
        int nowLat;
        int nowLon;
        int nowRedValue;
        gpsDataModels.remove(0);
        int index = 0;

        for (GpsDataModel model : gpsDataModels) {
            nowLat = (int) Math.round(model.getLon() * 10000000) - leftInt;
            nowLon = height - (int) Math.round(model.getLat() * 10000000) + topInt;
            if (nowLat == previousLat && nowLon == previousLon) {
                continue;
            }
//            preRedValue = getRedValue(bi, nowLat, nowLon);
            g2d.drawLine(previousLat, previousLon, nowLat, nowLon);
//            nowRedValue = getRedValue(bi, nowLat, nowLon);
//            float alpha = getAlpha(preRedValue, nowRedValue);
//            if (alpha < 1) {
//                g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));
//                g2d.setColor(Color.black);
//                g2d.drawLine(previousLat, previousLon, previousLat, previousLon);
//            }
            fixPoint(bi, previousLat, previousLon, 100);
            previousLat = nowLat;
            previousLon = nowLon;
//            showColor(bi, nowLat, nowLon);
            ++index;
//            if (index == 2) {
//                g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 0.45f));
//                g2d.setColor(Color.black);
//                g2d.drawLine(nowLat, nowLon, nowLat, nowLon);
//                g2d.drawLine(nowLat, nowLon, nowLat, nowLon);
//                g2d.drawLine(nowLat, nowLon, nowLat, nowLon);
//                showColor(bi, nowLat, nowLon);
//                break;
//            }
        }

        g2d.drawLine(100, 100, 500, 100);
        int beforeRedValue = getRedValue(bi, 500, 100);
        showColor(bi, 500, 100);
        g2d.drawLine(500, 100, 500, 500);
        int afterRedValue = getRedValue(bi, 500, 100);
        showColor(bi, 500, 100);
        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER));

        fixPoint(bi, 500, 100, 99);

        // 释放对象 透明度设置结束
        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER));

        g2d.dispose();

        // 保存文件
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            ImageIO.write(bi, "png", byteArrayOutputStream);
        } catch (IOException e) {
            logger.error("生成地图PNG错误[{}]", e);
        }
        return byteArrayOutputStream.toByteArray();

    }

    public byte[] getPng3() {
        BufferedImage bi = new BufferedImage(1000, 1000, BufferedImage.TYPE_INT_RGB);
        // 获取Graphics2D
        Graphics2D g2d = bi.createGraphics();

        //消除画图锯齿
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        // 1.0f为透明度 ，值从0-1.0，依次变得不透明
        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 0.1f));

        g2d.setColor(Color.red);


        for (int i = 1000; i >= 100; i -= 100) {
            g2d.fillPolygon(new int[]{0, 0, i, i}, new int[]{0, i, i, 0}, 4);
        }
        g2d.fillPolygon(new int[]{0, 50, 50, 0}, new int[]{0, 0, 1000, 1000}, 4);


        int redValue1 = getRedValue(bi, 40, 950);
        int redValue2 = getRedValue(bi, 60, 950);
        float alpha = getAlpha(redValue2, redValue1);

//        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));
//        g2d.setColor(Color.black);
//        g2d.fillPolygon(new int[]{0, 50, 50, 0}, new int[]{0, 0, 1000, 1000}, 4);

//        g2d.fillPolygon(new int[]{0, 50, 50, 0}, new int[]{0, 0, 1000, 1000}, 4);

        for (int i = 50; i < 960; i += 100) {
            System.out.println(getRedValue(bi, 40, i) + " " + getRedValue(bi, 60, i));
        }

        // 释放对象 透明度设置结束
        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER));

        g2d.dispose();
        System.out.println("---------------");
        // 保存文件
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            ImageIO.write(bi, "png", byteArrayOutputStream);
        } catch (IOException e) {
            logger.error("生成地图PNG错误[{}]", e);
        }
        return byteArrayOutputStream.toByteArray();

    }

    private void showColor(BufferedImage bi, int x, int y) {
        int pixel = bi.getRGB(x, y);
        int i1 = (pixel & 0xff0000) >> 16;
        int i2 = (pixel & 0xff00) >> 8;
        int i3 = (pixel & 0xff);
        System.out.println("value:" + pixel + " RBG:" + i1 + "," + i2 + "," + i3);
    }

    private float getAlpha(int before, int after) {
        return 1f - ((float) before / after);
    }

    private int getRedValue(BufferedImage bi, int x, int y) {
        int pixel = bi.getRGB(x, y);
        return (pixel & 0xff0000) >> 16;
    }

    private void fixPoint(BufferedImage bi, int x, int y, float width) {
        Graphics2D g2d = (Graphics2D) bi.getGraphics();
        Map<Integer, Integer> redMap = new HashMap<>(9);
//        redMap.put(0, 0);
//        redMap.put(26, 0);
        redMap.put(49, 26);
        redMap.put(70, 49);
        redMap.put(89, 70);
        redMap.put(106, 89);
        redMap.put(121, 106);
        redMap.put(135, 121);
        redMap.put(147, 135);
        redMap.put(158, 147);
        redMap.put(168, 158);
        int startX = Math.round(x - width / 2);
        if (startX < 0) {
            startX = 0;
        }
        if (startX > bi.getWidth()) {
            startX = bi.getWidth();
        }
        int startY = Math.round(y - width / 2);
        if (startY < 0) {
            startY = 0;
        }
        if (startY > bi.getHeight()) {
            startY = bi.getHeight();
        }
        int endX = Math.round(x + width / 2);
        int endY = Math.round(y + width / 2);
//        g2d.setPaintMode();
        g2d.setStroke(new BasicStroke());
        for (; startX < endX; startX++) {
            for (; startY < endY; startY++) {
                double distance = FlatUtil.getDistance(x, y, startX, startY);
                if (distance <= width / 2) {
                    int redValue = 0;
                    try {
                        redValue = getRedValue(bi, startX, startY);
                    } catch (Exception e) {
//                        System.out.println("ddd");
                    }
                    Integer integer = redMap.get(redValue);
                    if (integer != null) {
                        g2d.setColor(new Color(integer, 0, 0));
                        g2d.drawLine(startX, startY, startX, startY);
                    }
                }
            }
            startY = Math.round(y - width / 2);
            if (startY < 0) {
                startY = 0;
            }
            if (startY > bi.getHeight()) {
                startY = bi.getHeight() - 1;
            }
        }
    }

    private void getGpsPoint(int x, int y, int width, int height, int scale) {
        double lat = x / scale - width;
//        double lon = y/ scale
    }

}