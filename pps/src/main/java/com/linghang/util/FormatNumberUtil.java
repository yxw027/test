package com.linghang.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.NumberFormat;

/**
 * Created by djl on 2015/12/7.
 */
public class FormatNumberUtil {
    /**
     * 将字double字符串转化为double,并保留两们小数输出
     *
     * @param value djl 2015年12月14日
     * @return
     */
    public static Double doubleFormat(String value) {

        if (StringUtil.isEmpty(value)) {
            return null;
        }

        Double d = Double.parseDouble(value);
        NumberFormat format = NumberFormat.getInstance();
        format.setRoundingMode(RoundingMode.HALF_UP);
        format.setMinimumFractionDigits(2);
        format.setMaximumFractionDigits(2);
        format.setGroupingUsed(false);

        String str = format.format(d);
        return Double.parseDouble(str);


    }

    /**
     * 将double保留两们小数输出 djl2015年12月14日
     *
     * @param value
     * @return
     */
    public static Double doubleFormat(Double value) {

        if (value == null) {
            return null;
        }
        Double d = value;
        NumberFormat format = NumberFormat.getInstance();
        format.setRoundingMode(RoundingMode.HALF_UP);
        format.setMinimumFractionDigits(2);
        format.setMaximumFractionDigits(2);
        format.setGroupingUsed(false);
        String str = format.format(d);
        return Double.parseDouble(str);
    }

    /**
     * 将字double字符串转化为double,并保留两们小数输出
     *
     * @param value djl 2015年12月14日
     * @return
     */
    public static BigDecimal doubleFormat2BigDecimal(String value) {

        if (StringUtil.isEmpty(value)) {
            return null;
        }

        Double d = Double.parseDouble(value);
        NumberFormat format = NumberFormat.getInstance();
        format.setRoundingMode(RoundingMode.HALF_UP);
        format.setMinimumFractionDigits(2);
        format.setMaximumFractionDigits(2);
        format.setGroupingUsed(false);

        String str = format.format(d);
        return new BigDecimal(str);


    }

    /**
     * 将double保留两们小数输出 djl2015年12月14日
     *
     * @param value
     * @return
     */
    public static BigDecimal doubleFormat2BigDecimal(Double value) {

        if (value == null) {
            return null;
        }
        BigDecimal bigDecimal = new BigDecimal(value);
        // Double d = value;
        NumberFormat format = NumberFormat.getInstance();
        format.setRoundingMode(RoundingMode.HALF_UP);
        format.setMinimumFractionDigits(2);
        format.setMaximumFractionDigits(2);
        format.setGroupingUsed(false);
        String str = format.format(bigDecimal);
        return new BigDecimal(str);
    }

    /**
     * 传入double字符串和要保留的位数,格式化输出,如小数不足,补0
     *
     * @param dstr
     * @param length
     * @return
     */
    public static String double2string(String dstr, int length) {
        if (StringUtil.isEmpty(dstr)) {
            return null;
        }
        double d = Double.parseDouble(dstr);
        DecimalFormat format = new DecimalFormat();
        String pattern = "##";
        if (length > 0) {
            pattern += ".";
            for (int i = 0; i < length; i++) {
                pattern += "0";
            }
        }
        format.applyPattern(pattern);

        return format.format(d);
    }


//    public static void main(String[] args) {
////        Double d = doubleFormat(145788552.23d);
//////        System.out.println(Double.toString(d));
//////        System.out.println(Double.toHexString(d));
//////        System.out.println(Double.doubleToRawLongBits(d));
////        DecimalFormat format = new DecimalFormat("##.000");
////        //System.out.printf(format.format(d));
////
////        BigDecimal bigDecimal = new BigDecimal(d);
////        System.out.println(bigDecimal.toString());
//
//        System.out.println(doubleFormat2BigDecimal("145788552.23d"));
//    }


}
