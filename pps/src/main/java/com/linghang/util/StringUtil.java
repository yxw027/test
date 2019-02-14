package com.linghang.util;

import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 项目名称：sImp
 * 类名称：StringUtil
 * 类描述：
 * 创建人：djl
 * 创建时间：2015-10-31 上午10:55:27
 * 修改人：djl
 * 修改时间：2015-10-31 上午10:55:27
 * 修改备注：
 */
public class StringUtil extends StringUtils {

    public static String null2String(Object object) {
        String str = "";
        if (object != null) {
            str = object.toString();
        }
        return str;
    }

    /**
     * 获取传入字符串中的数字
     */
    public static String only2Num(String str) {
        if (isEmpty(str)) {
            return "";
        } else {
            //return str.trim().replaceAll("[\\u2E80-\\u9FFF]*","");
            return str.trim().replaceAll("\\D*", "");
        }
    }


    public static String transferList2Str(List<Integer> list) {
        String str = "";
        if (list == null || list.isEmpty()) {
            return str;
        }
        for (Integer id : list) {
            str += "," + id;
        }
        return str;
    }

    public static List<Integer> transferStr2List(String orderUnits) {
		List<Integer> list = new ArrayList<>();
		if (StringUtils.isEmpty(orderUnits)) {
			return list;
		}
		if (orderUnits.contains(",")) {
			String[] split = orderUnits.split(",");
			for (String str : split) {
				Integer unitId = getInteger(str);
				if (unitId != -1) {
					list.add(unitId);
				}
			}
		} else {
			if (getInteger(orderUnits) != -1) {
				list.add(getInteger(orderUnits));
			}
		}
		return list;
	}

	public static Integer getInteger(String str) {
		int parseInt = -1;
		if (StringUtils.isEmpty(str)) {
			return parseInt;
		}
		try {
			parseInt = Integer.parseInt(str);
		} catch (NumberFormatException e) {
			return parseInt;
		}
		return parseInt;
	}


	public static int compareTimeStrTo(String targetTime, String compareTime) {
		Long targetTimeLong = Long.parseLong(targetTime.replaceAll("-", ""));
		Long startTimeLong = Long.parseLong(compareTime.replaceAll("-", ""));
		return targetTimeLong.compareTo(startTimeLong);
	}

	public static String translateStrToStandardFormatStr(String currentDay) {
		if(currentDay.indexOf("-") >=0){
			return currentDay;
		}
		String[] strs = currentDay.split("\\D");
		StringBuffer sb = new StringBuffer();
		if(strs.length >= 3){
			for (int i = 0; i < 2; i++) {
				sb.append(strs[i].length() == 1? "0" + strs[i]: strs[i]).append("-");
			}
			sb.append(strs[2].length() == 1? "0" + strs[2]: strs[2]);
		}
		return sb.toString();
	}

    /**
     * 去掉内容里的html标签
     *
     * @param content
     * @return
     */
    public static String deleteAllHTMLTag(String content) {
        if (content == null) {
            return "";
        }
        String s = content;
        /** 删除普通标签  */
        s = s.replaceAll("<(S*?)[^>]*>.*?|<.*? />", "");
        /** 删除转义字符 */
        s = s.replaceAll("&.{2,6}?;", "");
        return s;
    }

    public static String replaceChar(String str) {
        String regEx = "[&\\|\\\\\\*^%$#@\\-]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        return m.replaceAll("").trim();
    }
}
