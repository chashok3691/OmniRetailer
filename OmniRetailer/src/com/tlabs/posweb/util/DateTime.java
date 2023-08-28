package com.tlabs.posweb.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public final class DateTime {
	

	//returns datetime string in yy/MM/dd HH:mm:ss format
    public static String getDateTime(){
    	String datetime=null;
    	try{
    	 SimpleDateFormat sdfDate = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
         Date now = new Date();
         datetime = sdfDate.format(now);
    	}
    	catch(Exception e) {e.printStackTrace();
    	}
    	return datetime;
    }
    
    public static long getDifferenceInMinutes(String dateStart,String dateStop){
    	long difference=0;
    	try{
    		// Custom date format
    		SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd HH:mm:ss");  

    		Date d1 = null;
    		Date d2 = null;
    		try {
    		    d1 = format.parse(dateStart);
    		    d2 = format.parse(dateStop);
    		} 
    		catch (ParseException e) {
    		    e.printStackTrace();
    		}    

    		// Get msec from each, and subtract.
    		long diff = d2.getTime() - d1.getTime();
    		//long diffSeconds = diff / 1000 % 60;  
    		long diffMinutes = diff / (60 * 1000) % 60;
    		long diffHours = diff / (60 * 60 * 1000);                      
    		difference=diffMinutes+diffHours*60;
    		
    	}
    	catch(Exception e){e.printStackTrace();
    	}
    	return difference;
    }
    
    //returns the scheduled date time by adding the no.of hours and no.of minutes given to the present date time
    public static String getScheduledDateTime(long hours,long minutes){
     String scheduledDateTimeStr=null;
     try {
      SimpleDateFormat dateFormatter = new SimpleDateFormat("yy/MM/dd HH:mm:ss");
      Date dateTime=null;

      Calendar calendar = Calendar.getInstance();

      calendar.add(Calendar.HOUR,(int)hours);
      calendar.add(Calendar.MINUTE,(int)minutes);
      
      dateTime=calendar.getTime();
      scheduledDateTimeStr=dateFormatter.format(dateTime);

     }
     catch(Exception e){e.printStackTrace();
     }
     return scheduledDateTimeStr;
    }
}
