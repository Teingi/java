package com.codecore.tools;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
/**
 * 日期转换工具类
 * @author Vincent
 *
 */
public class DataTool {
	static final DateFormat DF = new SimpleDateFormat("yyyy-MM-dd");
	static final DateFormat DFALL = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	//字符转成日期
	public static Date stringtoDate(String str) throws ParseException {
		Date date = null;
		date = DF.parse(str);
		return date;
	}
	
	//日期转成字符串
	public static String datetoString(Date date) {
		String str = DF.format(date);
		return str;
	}
	
	//
	public static Date allStringtoDate(String str) throws ParseException {
		Date date = null;
		date = DFALL.parse(str);
		return date;
	}
	
	public static String allDatetoString(Date date) {
		String str = DFALL.format(date);
		return str;
	}
	public String getDate(){
		Calendar calendar=Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
        int mon = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DATE);
        int hour = calendar.get(Calendar.HOUR);
        int min = calendar.get(Calendar.MINUTE);
        int sec = calendar.get(Calendar.SECOND);
        int mi = calendar.get(Calendar.MILLISECOND);
		return ""+year+mon+day+hour+min+sec+mi+"";
	}
}
