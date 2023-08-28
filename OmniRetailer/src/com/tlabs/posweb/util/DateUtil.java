package com.tlabs.posweb.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

	public static String getDateDDMMYYYY(String strDate){
		String strFormatedDate = null;
		try{
		Date date = null;
		Calendar c = Calendar.getInstance();
		SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		date = formatter.parse(strDate);
		c.setTime(date);
		int mon = c.get(Calendar.MONTH) +1;
		strFormatedDate = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return strFormatedDate;
	}
	
	 /**
		 *@Author : vijay
		 *@Desc : method retruns the date in specified format passed as argument
		 *@date	: 16 july,18
		 */
		 public static String getCurrentDateInFormat(String format){
		    	String datetime=null;
		    	try{
		    	 SimpleDateFormat sdfDate = new SimpleDateFormat(format);
		         Date now = new Date();
		         datetime = sdfDate.format(now);
		    	}
		    	catch(Exception e) {e.printStackTrace();
		    	}
		    	return datetime;
		    }
	
	 public static String getDateFromYYYYMMDDHHMMSS(Date inputdate){
			String str_date = null;
//			Date date = null;
			try{
			//Calendar c = Calendar.getInstance();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			str_date = formatter.format(new Date());
		
			}catch(Exception exception){
				exception.printStackTrace();
				str_date = "Invalid Date";
			}
			return str_date;
			}
	 
	public static String getDateYYYYMMDD(String strDate){
		String strFormatedDate = null;
		try{
		Date date = null;
		Calendar c = Calendar.getInstance();
		SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		date = formatter.parse(strDate);
		c.setTime(date);
		int mon = c.get(Calendar.MONTH) +1;
		strFormatedDate = c.get(Calendar.YEAR) +"/"+ mon +"/"+ c.get(Calendar.DATE);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return strFormatedDate;
	}
	
	
	public static String getDateYYYYMMDDFormat(String strDate){
		String strFormatedDate = null;
		try{
		Date date = null;
		Calendar c = Calendar.getInstance();
		SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd");
		date = formatter.parse(strDate);
		c.setTime(date);
		int mon = c.get(Calendar.MONTH) +1;
		strFormatedDate = c.get(Calendar.YEAR) +"/"+ mon +"/"+ c.get(Calendar.DATE);
		}catch(Exception exception){
			exception.printStackTrace();
		}
		return strFormatedDate;
	}
	
	public static String getDateFromYYYYMMDD(String inputdate){
		String str_date = null;
		Date date = null;
		try{
		Calendar c = Calendar.getInstance();
		SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd");
		date = formatter.parse(inputdate);
		c.setTime(date);
		int mon = c.get(Calendar.MONTH) +1;
		str_date = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
		}catch(Exception exception){
			exception.printStackTrace();
			str_date = "Invalid Date";
		}
		return str_date;
		}
	
	
	// added by vijay 
		// recieves the times string in 24 hours format and produces output in 12 hours format
		public static String getTimeIn12HoursFormat(String time){
			String timeStr="";
			try {
				String _24HourTime = time;
				SimpleDateFormat _24HourSDF = new SimpleDateFormat("HH:mm:ss");
				SimpleDateFormat _12HourSDF = new SimpleDateFormat("hh:mm a");
				Date _24HourDt = _24HourSDF.parse(_24HourTime);

				timeStr = _12HourSDF.format(_24HourDt);
			} 
			
			catch (ParseException e) {
				e.printStackTrace();
			}
			return timeStr;

		}
		
	public static String getDateFromMMMDDYYYY(String inputdate){
		String str_date = null;
		Date date = null;
		try{
		Calendar c = Calendar.getInstance();
		SimpleDateFormat formatter = new SimpleDateFormat("MMM dd, yyyy");
		//SimpleDateFormat  formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		date = formatter.parse(inputdate);
		c.setTime(date);
		int mon = c.get(Calendar.MONTH) +1;
		str_date = c.get(Calendar.DATE) +"/"+ mon +"/"+ c.get(Calendar.YEAR);
		}catch(Exception exception){
			exception.printStackTrace();
			str_date = "Invalid Date";
		}
		return str_date;
		}
	
	 public static String getLastMonthLastDate() {
	        Calendar calendar = Calendar.getInstance();
	        calendar.add(Calendar.MONTH, -1);

	        int max = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	        calendar.set(Calendar.DAY_OF_MONTH, max);
	        
	        DateFormat dateFormatObj = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	        Date dateObj = calendar.getTime();
	        String selectedDate = dateFormatObj.format(dateObj);
	        selectedDate = selectedDate.substring(0,10);

	        return selectedDate;
	    }
	 public static void main(String[] args) {
		String date = getLastMonthLastDate();
		//System.out.println(date);
	}
	
}
