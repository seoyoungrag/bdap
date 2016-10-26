package com.kt.bdapportal.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public final class DateUtil {
	public static int NOW = 0;
	public static String FORMAT_WITH_HYPEN = "yyyy-MM-dd";
	public static String FORMAT_yyyyMMdd = "yyyyMMdd";
	public static String FORMAT_yyyyMMddhh24miss = "yyyymmddhhmmss";
	public static String FORMAT_yyyyMMddhh24miss_WITH_HYPEN = "yyyy-mm-dd hh:mm:ss";
	public static int TIMESTAMP_BY_HOUR = 0;
	public static String getDateWithFormat(String format, int distance){
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		calendar.add(Calendar.DATE, distance);
		return sdf.format(calendar.getTime());
	}
	public static Long getTimeStampTypeLong(int type, int distance){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		Calendar targetCal = Calendar.getInstance();
		targetCal.set(Calendar.YEAR, calendar.get(Calendar.YEAR));
		targetCal.set(Calendar.MONTH, calendar.get(Calendar.MONTH));
		targetCal.set(Calendar.DAY_OF_MONTH, calendar.get(Calendar.DAY_OF_MONTH));
		targetCal.set(Calendar.HOUR, calendar.get(Calendar.HOUR));
		targetCal.set(Calendar.MINUTE, calendar.get(Calendar.MINUTE));
		targetCal.set(Calendar.SECOND, calendar.get(Calendar.SECOND));
		
		if(type == TIMESTAMP_BY_HOUR){
			targetCal.add(Calendar.HOUR_OF_DAY, distance);
		}
		
		return targetCal.getTimeInMillis();
		
	}
	public static String getDateDay(String date, String dateType) throws Exception {
	    String day = "" ;
	    SimpleDateFormat dateFormat = new SimpleDateFormat(dateType) ;
	    Date nDate = dateFormat.parse(date) ;
	    Calendar cal = Calendar.getInstance() ;
	    cal.setTime(nDate);
	    int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;
	    switch(dayNum){
	        case 1:
	            day = "일요일";
	            break ;
	        case 2:
	            day = "월요일";
	            break ;
	        case 3:
	            day = "화요일";
	            break ;
	        case 4:
	            day = "수요일";
	            break ;
	        case 5:
	            day = "목요일";
	            break ;
	        case 6:
	            day = "금요일";
	            break ;
	        case 7:
	            day = "토요일";
	            break ;
	    }
	    return day ;
	}
	
}
