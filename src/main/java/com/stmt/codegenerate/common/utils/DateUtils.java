package com.stmt.codegenerate.common.utils;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * java日期处理类
 */
public class DateUtils {
    /**
     * 获取某月的最后一天
     * @param date
     * @return
     */
    public static Date getLastDayOfMonth(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(2, 1);
        cal.set(5, 0);
        return cal.getTime();
    }

    public static String getThisWeekMonday(Date date, String pattern) {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        calendar.setTime(date);
        calendar.setFirstDayOfWeek(Calendar.MONDAY);
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        return format.format(calendar.getTime());
    }

    public static String getThisWeekSunday(Date date, String pattern) {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        calendar.setTime(date);
        calendar.setFirstDayOfWeek(Calendar.MONDAY);
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
        return format.format(calendar.getTime());
    }

    public static String getFirstDayOfMonth(Date date, String pattern) {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        calendar.setTime(date);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        return format.format(calendar.getTime());
    }

    public static String getFirstDayOfMonth(String date, String pattern) {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        Date parse = new Date();
        try {
            parse = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        calendar.setTime(parse);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        return format.format(calendar.getTime());
    }

    public static String getTheDayOfLastMonth(String date, String pattern) {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        Date parse = new Date();
        try {
            parse = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        calendar.setTime(parse);
        calendar.add(2, -1);
        return format.format(calendar.getTime());
    }

    public static String getFirstDayOfLastMonth(String date, String pattern) {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        Date parse = new Date();
        try {
            parse = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        calendar.setTime(parse);
        calendar.add(Calendar.MONTH,-1);
        calendar.set(Calendar.DAY_OF_MONTH, 1);
        return format.format(calendar.getTime());
    }

    public static String getLastDayOfMonth(Date date, String pattern) {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        calendar.setTime(date);
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        return format.format(calendar.getTime());
    }

    public static String getLastDayOfMonth(String date, String pattern) {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        Date parse = new Date();
        try {
            parse = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        calendar.setTime(parse);
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        return format.format(calendar.getTime());
    }

    public static String getLastDayOfLastMonth(String date, String pattern) {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        Date parse = new Date();
        try {
            parse = format.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        calendar.setTime(parse);
        calendar.add(Calendar.MONTH,-1);
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        return format.format(calendar.getTime());
    }

    public static boolean isLastDayOfMonth(String date, String pattern) {
        String lastDayOfMonth = getLastDayOfMonth(date, pattern);
        return date.equals(lastDayOfMonth);
    }

    public static String getFirstDayOfForMonth(Date date, String pattern){
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, -1);
        Date theDate = calendar.getTime();

        GregorianCalendar gcLast = (GregorianCalendar) Calendar.getInstance();
        gcLast.setTime(theDate);
        gcLast.set(Calendar.DAY_OF_MONTH, 1);
        return format.format(gcLast.getTime());
    }

    public static String getFirstDayOfForMonth(Date date, String pattern, int day){
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        date = new Date(date.getTime() - 1000 * 60 * 60 * 24 * day);
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, -1);
        Date theDate = calendar.getTime();

        GregorianCalendar gcLast = (GregorianCalendar) Calendar.getInstance();
        gcLast.setTime(theDate);
        gcLast.set(Calendar.DAY_OF_MONTH, 1);
        return format.format(gcLast.getTime());
    }

    public static String getLastDayOfForMonth(Date date, String pattern){
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, -1);
        Date theDate = calendar.getTime();

        //上个月最后一天
        calendar.add(Calendar.MONTH, 1);    //加一个月
        calendar.set(Calendar.DATE, 1);        //设置为该月第一天
        calendar.add(Calendar.DATE, -1);    //再减一天即为上个月最后一天
        return format.format(calendar.getTime());
    }

    public static String getLastDayOfForMonth(Date date, String pattern, int day){
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        date = new Date(date.getTime() - 1000 * 60 * 60 * 24 * day);
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, -1);
        Date theDate = calendar.getTime();

        //上个月最后一天
        calendar.add(Calendar.MONTH, 1);    //加一个月
        calendar.set(Calendar.DATE, 1);        //设置为该月第一天
        calendar.add(Calendar.DATE, -1);    //再减一天即为上个月最后一天
        return format.format(calendar.getTime());
    }

    public static int getWeekOfYear(Date date){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return calendar.get(Calendar.WEEK_OF_YEAR);
    }

    public static int getWeekOfYear(String day ,  String pattern) throws ParseException {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        Date date = format.parse(day);
        calendar.setTime(date);
        return calendar.get(Calendar.WEEK_OF_YEAR);
    }

    public static int getMonthOfYear(String day ,  String pattern) throws ParseException {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        Date date = format.parse(day);
        calendar.setTime(date);
        return calendar.get(Calendar.MONTH) + 1;
    }

    //毫秒转天、小时、分
    public static String formatDuring(long mss) {
        long days = mss / (1000 * 60 * 60 * 24);
        long hours = (mss % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60);
        long minutes = (mss % (1000 * 60 * 60)) / (1000 * 60);

        String format;
        if(days == 0 && hours == 0 && minutes ==0 )
            format = "";
        else if(days == 0 && hours == 0)
            format = minutes + "分";
        else if(days == 0 )
            format = hours + "小时 " + minutes + "分";
        else
            format = days + "天" + hours + "小时 " + minutes + "分";
        return format;
    }

    //获取两个日期中的每一天日期(包含首尾) add by yankeyu
    public static List<String> getBetweenDays(String startDate, String endDate,String pattern) {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
        Date start = null;
        Date end = null;
        try {
            start = dateFormat.parse(startDate);
            end = dateFormat.parse(endDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        calendar.setTime(start);
        if (start.getTime() > end.getTime()) {
            return new ArrayList<>();
        }
        int days = (int) ((end.getTime() - start.getTime()) / (1000 * 3600 * 24));
        List<String> dates = new ArrayList<>();
        for(int i = 0 ; i <= days ; i ++) {
            dates.add(dateFormat.format(calendar.getTime()));
            if (days == 0) {
                break;
            }
            calendar.add(Calendar.DATE,1);
        }
        return dates;
    }


    public static String getHour(Date date) {

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        int minute = calendar.get(Calendar.MINUTE);
        if (hour < 10) return "0" + hour + ":00";
        return hour + ":00";
    }

    public static String getHour(Date date,boolean minute) {

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        if (hour < 10) return "0" + hour;
        return hour + "";
    }

    public static String getMinuteTarget(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String dateString = sdf.format(date);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        String hourString;
        if (hour < 10) hourString = "0" + hour;
        else hourString = hour + "";
        int minute = calendar.get(Calendar.MINUTE);
        if (32 <= minute) return dateString + hourString + "30";
        else return dateString + hourString + "00";
    }

    public static boolean getZero(Date date) {

        Calendar zero = Calendar.getInstance();
        zero.set(zero.get(Calendar.YEAR), zero.get(Calendar.MONTH), zero.get(Calendar.DATE), 0, 0, 0);

        Calendar ten = Calendar.getInstance();
        ten.set(ten.get(Calendar.YEAR), ten.get(Calendar.MONTH), ten.get(Calendar.DATE) , 0, 1, 0);

        if( date.getTime() >= zero.getTimeInMillis() && date.getTime() <= ten.getTimeInMillis())
            return true;
        return  false;
    }


    public static boolean getTimeScope(Date date) {
        Calendar zero = Calendar.getInstance();
        zero.set(zero.get(Calendar.YEAR), zero.get(Calendar.MONTH), zero.get(Calendar.DATE), 13, 59, 52);


        Calendar ten = Calendar.getInstance();
        ten.set(ten.get(Calendar.YEAR), ten.get(Calendar.MONTH), ten.get(Calendar.DATE) , 13, 59, 59);

        if( date.getTime() >= zero.getTimeInMillis() && date.getTime() <= ten.getTimeInMillis())
            return true;
        return  false;
    }

    public static boolean getTimeHour(Date date){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int minute = calendar.get(Calendar.MINUTE);
        if( minute == 0 && minute == 30 ) return true;
        return false;
    }




    /**
     * 获取前 n 天日期
     *
     * @return
     */
    public static String getCurrentDate(int n) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return simpleDateFormat.format(new Date().getTime() - 24*60*60*1000*n);
    }

    /**
     * 获取前 n 天日期指定格式
     *
     * @return
     */
    public static String getCurrentDate(int n, String pattern) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        return simpleDateFormat.format(new Date().getTime() - 24*60*60*1000*n);
    }



    public static void main(String[] args) throws ParseException {


        //System.out.println(getLastDayOfForMonth(new Date(),"yyyy-MM-dd"));
        //System.out.println(getMonthOfYear("2018-05-01","yyyy-MM-dd")+"月");
        //System.out.println(getBetweenDays("2018-05-10","2018-05-11","yyyy-MM-dd"));

        //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //System.out.println(getZero(sdf.parse("2018-10-11 00:09:50")));
        //System.out.println(getCurrentDate(0));
        //System.out.println(getTimeHour(new Date()));
        System.out.println(getCurrentDate(0));
    }
}
