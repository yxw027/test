package com.linghang.util;


import org.springframework.util.StringUtils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DatetimeUtil {
    public static final String DEFAULT_FORMAT_STRING = "yyyy-MM-dd HH:mm:ss";
    public static final String DEFAULT_DATE = "yyyy-MM-dd";

    public static String getDate(Date date) {
        if (date == null) {
            return null;
        }
        SimpleDateFormat format = new SimpleDateFormat(DEFAULT_DATE);
        return format.format(date);
    }
    public static Date getDateTime2Date(Date date) {
        if (date == null) {
            return null;
        }
        SimpleDateFormat format = new SimpleDateFormat(DEFAULT_DATE);
		try {
			return  format.parse(format.format(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
        return null;
    }
    public static Date getNextDay(Date date) {
		return plusDay(date, 1);
    }
    public static Date plusDay(Date date, int n) {
        if (date == null) {
            return null;
        }
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DATE, n);//增加一天
		return calendar.getTime();
    }

    public static String toDefaultDateString(Date date) {
        if (date == null) {
            return null;
        }
        SimpleDateFormat format = new SimpleDateFormat(DEFAULT_FORMAT_STRING);
        return format.format(date);
    }

    public static String defaultDateString(Date date) {
        if (date == null) {
            return null;
        }
        SimpleDateFormat format = new SimpleDateFormat(DEFAULT_DATE);
        return format.format(date);
    }

	public static String getCurDateString(){
		return toDefaultDateString(new Date());
	}

	public static String dateFormate(String dateTime) {
		String regEx = "^\\d{2}/\\d{2}/\\d{4}  \\d:\\d{2}$";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(dateTime);
		if (m.find()) {
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy hh:mm");
			try {
				Date date = format.parse(dateTime);
				format = new SimpleDateFormat(DEFAULT_FORMAT_STRING);
				return format.format(date);
			} catch (ParseException e) {
				return dateTime;
			}

		}
		return dateTime;
	}

	public static Date string2Date(String datetime) {
		SimpleDateFormat format = new SimpleDateFormat(DEFAULT_FORMAT_STRING);
		try {
			return format.parse(datetime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static Date parseDate(String datetime) {
		SimpleDateFormat format = new SimpleDateFormat(DEFAULT_DATE);
		try {
			return format.parse(datetime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String formatDate(Date date,String regEx) {
		if (date == null) {
			return "";
		}
		DateFormat format = new SimpleDateFormat(regEx);
		return format.format(date);
	}

	public static Date getRealDate(Date date, String regEx) {
		DateFormat format = new SimpleDateFormat(regEx);
		String dateStr = format.format(date);
		try {
			return format.parse(dateStr);
		} catch (ParseException e) {
			return null;
		}
	}

	public static Date parseString2Date(String datetime, String regEx) {
		SimpleDateFormat format = new SimpleDateFormat(regEx);
		try {
			return format.parse(datetime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 两个时间之间相差距离多少天
	 * @param str1 时间参数 1：
	 * @param str2 时间参数 2：
	 * @return 相差天数
	 */
	public static long getDistanceDays(String str1, String str2){
		DateFormat df = new SimpleDateFormat(DEFAULT_FORMAT_STRING);
		Date one;
		Date two;
		long days=0;
		try {
			one = df.parse(str1);
			two = df.parse(str2);
			long time1 = one.getTime();
			long time2 = two.getTime();
			long diff ;
			if(time1<time2) {
				diff = time2 - time1;
			} else {
				diff = time1 - time2;
			}
			days = diff / (1000 * 60 * 60 * 24);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return days;
	}

	/**
	 * 隧道人员定位-停留时间计算
	 */
	public static String stayTime(String startTime) {
		return stayTime(startTime, getCurDateString());
	}

	public static String stayTime(String startTime, String endTime) {
		long l = string2Date(endTime).getTime() - string2Date(startTime).getTime();
		if (l > 0) {
			long hour = l / (1000 * 60 * 60);
			long min = (l % (1000 * 60 * 60)) / 1000 / 60;
			return hour + "小时" + min + "分钟";
		} else {
			return "0小时0分钟";
		}

	}


	/**
	 * 两个时间之间相加减时间
	 * @param time 时间参数 ：
	 * @param timeMillis 加减时间 ：
	 * @return 相加时间结果
	 */
	public static String plusTimeMillis(String time, Long timeMillis){
		String result = null;
		try {
			result = toDefaultDateString(new Date(string2Date(time).getTime() + timeMillis));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	//将时间转换date类型
	public static Date convert(String source) {
		if(StringUtils.isEmpty(source)) {
			return null;
		}

		Date date = null;
		SimpleDateFormat format= new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
		try {
			date = format.parse(source.trim());
		} catch (Exception e) {
			try {
				 format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				date = format.parse(source.trim());
			} catch (Exception e1) {
				try {
					format = new SimpleDateFormat("yyyy-MM-dd");
					date = format.parse(source.trim());
				} catch (Exception e2) {
				}
			}
		}

		return date;
	}

	public static String getDatFormat(Integer value,String year,Integer week , boolean sunday){
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, Integer.parseInt(year));
		cal.set(Calendar.WEEK_OF_YEAR, value);
		cal.set(Calendar.DAY_OF_WEEK, week);
		if (sunday){
            cal.add(Calendar.DAY_OF_MONTH, 1);
        }
		Date date = cal.getTime();
		return getDate(date);
	}


	/**
	 * 是否默认时间格式 yyyy-MM-dd HH:mm:ss
	 * @param date
	 * @return
	 */
	public static boolean isDefaultDateFormat(String date){
		if(StringUtils.isEmpty(date)){
			return false;
		}
		String reg = "^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$";
		if(Pattern.matches(reg,date)){
			return true;
		}
		return false;
	}
}
