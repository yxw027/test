package com.linghang.util;

import com.linghang.model.car.CarElectronicFencePointModel;

import java.awt.geom.Point2D;
import java.util.List;

/**
 * @description: 电子围栏报警
 * @author: xuqiang
 * @createDate: 2019-01-14 10:18
 **/
public class IsInPolygonUitl {
    public static boolean isInPolygon(Double longitude, Double latitude, List<CarElectronicFencePointModel> carElectronicFencePointModelList) {


        Integer counter = 0;
        Double xinters;
        CarElectronicFencePointModel p1 = carElectronicFencePointModelList.get(0);
        CarElectronicFencePointModel p2;
        Integer pointCount = carElectronicFencePointModelList.size();
        for (int i = 1; i <= pointCount; i++) {
            p2 = carElectronicFencePointModelList.get(i % pointCount);
            if (longitude > Math.min(Double.parseDouble(p1.getXlabe()), Double.parseDouble(p2.getXlabe())) &&
                    longitude <= Math.max(Double.parseDouble(p1.getXlabe()), Double.parseDouble(p2.getXlabe()))) {
                if (latitude <= Math.max(Double.parseDouble(p1.getYlabe()), Double.parseDouble(p2.getYlabe()))) {
                    if (Double.parseDouble(p1.getXlabe()) != Double.parseDouble(p2.getXlabe())) {
                        xinters =
                                (longitude - Double.parseDouble(p1.getXlabe())) *
                                        (Double.parseDouble(p2.getYlabe()) - Double.parseDouble(p1.getYlabe()) /
                                                Double.parseDouble(p2.getXlabe()) - Double.parseDouble(p1.getXlabe())) +
                                        Double.parseDouble(p1.getYlabe());
                        if (p1.getYlabe().equals(p2.getYlabe()) || latitude <= xinters) {
                            counter++;
                        }

                    }
                }
            }
            p1 = p2;
        }
        if (counter % 2 == 0) {
            return false;
        } else {
            return true;
        }
    }


    /**
     * 判断点是否在多边形内
     *
     * @param point 测试点
     * @param pts   多边形的点
     * @return boolean
     * @throws
     * @Title: IsPointInPoly
     * @Description: TODO()
     */
    public static boolean isInPolygon(Point2D.Double point, List<Point2D.Double> pts) {

        int N = pts.size();
        boolean boundOrVertex = true;
        int intersectCount = 0;//交叉点数量
        double precision = 2e-10; //浮点类型计算时候与0比较时候的容差
        Point2D.Double p1, p2;//临近顶点
        Point2D.Double p = point; //当前点

        p1 = pts.get(0);
        for (int i = 1; i <= N; ++i) {
            if (p.equals(p1)) {
                return boundOrVertex;
            }

            p2 = pts.get(i % N);
            if (p.x < Math.min(p1.x, p2.x) || p.x > Math.max(p1.x, p2.x)) {
                p1 = p2;
                continue;
            }

            //射线穿过算法
            if (p.x > Math.min(p1.x, p2.x) && p.x < Math.max(p1.x, p2.x)) {
                if (p.y <= Math.max(p1.y, p2.y)) {
                    if (p1.x == p2.x && p.y >= Math.min(p1.y, p2.y)) {
                        return boundOrVertex;
                    }

                    if (p1.y == p2.y) {
                        if (p1.y == p.y) {
                            return boundOrVertex;
                        } else {
                            ++intersectCount;
                        }
                    } else {
                        double xinters = (p.x - p1.x) * (p2.y - p1.y) / (p2.x - p1.x) + p1.y;
                        if (Math.abs(p.y - xinters) < precision) {
                            return boundOrVertex;
                        }

                        if (p.y < xinters) {
                            ++intersectCount;
                        }
                    }
                }
            } else {
                if (p.x == p2.x && p.y <= p2.y) {
                    Point2D.Double p3 = pts.get((i + 1) % N);
                    if (p.x >= Math.min(p1.x, p3.x) && p.x <= Math.max(p1.x, p3.x)) {
                        ++intersectCount;
                    } else {
                        intersectCount += 2;
                    }
                }
            }
            p1 = p2;
        }
        if (intersectCount % 2 == 0) {//偶数在多边形外
            return false;
        } else { //奇数在多边形内
            return true;
        }
    }

}
