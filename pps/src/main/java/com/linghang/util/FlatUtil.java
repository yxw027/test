package com.linghang.util;

import java.awt.*;

/**
 * @author liuhao
 * 平面坐标工具类
 */
public class FlatUtil {

    /**
     * 平面两点距离
     *
     * @param x1 点一X
     * @param y1 点一Y
     * @param x2 点二X
     * @param y2 点二Y
     */
    public static double getDistance(int x1, int y1, int x2, int y2) {
        Point point = new Point(x1, y1);
        Point point2 = new Point(x2, y2);
        return point.distance(point2);
    }

    /**
     * 根据两平面点计算方向角度
     *
     * @param x1 点一X
     * @param y1 点一Y
     * @param x2 点二X
     * @param y2 点二Y
     */
    public static double getDirection(int x1, int y1, int x2, int y2) {
//        int x = Math.abs(x1 - x2);
        int x = x1 - x2;
//        int y = Math.abs(y1 - y2);
        int y = y1 - y2;
        double z = Math.sqrt(x * x + y * y);
        return Math.asin(y / z) / Math.PI * 180;
    }

    /**
     * 根据一条直线以及宽度计算矩形的四个点
     *
     * @param x1    点一X
     * @param y1    点一Y
     * @param x2    点二X
     * @param y2    点二Y
     * @param width 线宽
     */
    public static Point[] getLineFourPoints(int x1, int y1, int x2, int y2, double width) {
        double a;
        boolean b = x1 == x2;
        if (b) {
            a = (double) (x2 - x1) / (y2 - y1);
        } else {
            a = (double) (y2 - y1) / (x2 - x1);
        }
        double x = (width / 2) * Math.sin(Math.atan(a));
        double y = (width / 2) * Math.cos(Math.atan(a));
        if (b) {
            a = x;
            x = y;
            y = a;
        }
        Point[] points = new Point[4];
        points[0] = new Point((int) Math.round(x1 - x), (int) Math.round(y1 - y));
        points[1] = new Point((int) Math.round(x1 + x), (int) Math.round(y1 + y));
        points[2] = new Point((int) Math.round(x2 + x), (int) Math.round(y2 + y));
        points[3] = new Point((int) Math.round(x2 - x), (int) Math.round(y2 - y));
        return points;
    }

    /**
     * 根据一条直线以及宽度计算矩形的四个点
     *
     * @param x1    点一X
     * @param y1    点一Y
     * @param x2    点二X
     * @param y2    点二Y
     * @param width 线宽
     */
    public static int[][] getLineFourPointsXy(int x1, int y1, int x2, int y2, double width) {
        Point[] points = getLineFourPoints(x1, y1, x2, y2, width);
        int[] xPoints = new int[4];
        int[] yPoints = new int[4];
        for (int i = 0; i < points.length; i++) {
            xPoints[i] = points[i].x;
            yPoints[i] = points[i].y;
        }
        int[][] a = new int[2][];
        a[0] = xPoints;
        a[1] = yPoints;
        return a;
    }

    public static void main(String[] args) {

        Point[] lineFourPoints = getLineFourPoints(100, 100, 100, 200, 10D);
        System.out.println(lineFourPoints);
        Point[] lineFourPoints2 = getLineFourPoints(100, 100, 200, 100, 10D);
        System.out.println(lineFourPoints2);
        Point[] lineFourPoints3 = getLineFourPoints(100, 100, 200, 200, 10D);
        System.out.println(lineFourPoints3);

    }


}
