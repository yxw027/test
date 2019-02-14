package com.linghang.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Util {

    public static final String SUCCESS = "success";
    public static final String MESSAGE = "message";
    public static final String DEFAULTPASSWORD = "c4ca4238a0b923820dcc509a6f75849b";
    public static final String DEFAULTSOFTTDOG = "MQ==";
    public static final Long ADMINID = 0L;
    public static final Long ADMINORGID = 0L;
    public static final String ADMINNAME = "系统管理员";
    private static final String SRCSTART = "data:image/";
    private static final String BASE64 = ";base64,";
    private static Pattern NUMBER_PATTERN = Pattern.compile("\\d+");

    private static Logger logger = LoggerFactory.getLogger(Util.class);

    /**
     * 获取返回Map
     *
     * @param result 返回结果
     */
    public static Map<String, Object> getResultMap(boolean result) {
        Map<String, Object> resultMap = new HashMap<>(2);
        resultMap.put(SUCCESS, result);
        return resultMap;
    }

    /**
     * 将一个List分割为多个list
     *
     * @param allList 要分割的List
     * @param size    分割的大小
     */
    public static <T> List<List<T>> getSubList(List<T> allList, int size) {
        List<List<T>> lists = new ArrayList<>();
        for (int i = 0; i < allList.size(); i += size) {
            if (i + size < allList.size()) {
                lists.add(allList.subList(i, i + size));
            } else {
                lists.add(allList.subList(i, allList.size()));
            }
        }
        return lists;
    }

    /**
     * 获取台账父级编号
     *
     * @param number 台账编号
     */
    public static String getParentNumber(String number) {
        if (StringUtils.isEmpty(number)) {
            return number;
        }
        String[] numbers = number.split("-");
        if (numbers.length == 1) {
            return null;
        } else if (numbers.length == 2) {
            try {
                int numberInt = Integer.parseInt(numbers[0]);
                return (numberInt / 100 * 100) + "";
            } catch (NumberFormatException e) {
                return null;
            }
        }
        return number.substring(0, number.lastIndexOf("-"));
    }

    /**
     * 获取台账排序号
     *
     * @param number 台账编号
     */
    public static String getInventoryOrder(String number) {
        if (StringUtils.isEmpty(number)) {
            return null;
        }
        number = number.trim();
        Matcher m = NUMBER_PATTERN.matcher(number);
        int end = 0;
        StringBuilder formatNumber = new StringBuilder();
        int i;
        for (i = 0; m.find(); i++) {
            if (i == 0) {
                formatNumber.append(number, 0, m.start());
            } else {
                formatNumber.append(number, end, m.start());
            }
            formatNumber.append(String.format("%04d", Integer.valueOf(m.group())));
            end = m.end();
        }
        if (i == 0) {
            return number;
        }
        return formatNumber.toString();
    }

    /**
     * 根据不同浏览器将文件名中的汉字转为UTF8编码的串,以便下载时能正确显示另存的文件名.
     *
     * @param s 原文件名
     * @return 重新编码后的文件名
     */
    public static String toUtf8String(String s) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c >= 0 && c <= 255) {
                sb.append(c);
            } else {
                byte[] b;
                try {
                    b = Character.toString(c).getBytes("utf-8");
                } catch (Exception ex) {
                    b = new byte[0];
                }
                for (byte aB : b) {
                    int k = aB;
                    if (k < 0) {
                        k += 256;
                    }
                    sb.append("%").append(Integer.toHexString(k).toUpperCase());
                }
            }
        }
        return sb.toString();
    }

}
