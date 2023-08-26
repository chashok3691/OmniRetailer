package com.tlabs.posweb.beans;


public class ShiftTimings {

	
	private int sNo;
	
	
	private String shiftId;
	
	
	private String weekDay;
	
	
	private boolean extendedTime;
	
	
	private String start_time;
	
	private String end_time;

	
	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getShiftId() {
		return shiftId;
	}

	public void setShiftId(String shiftId) {
		this.shiftId = shiftId;
	}

	

	public String getWeekDay() {
		return weekDay;
	}

	public void setWeekDay(String weekDay) {
		this.weekDay = weekDay;
	}

	public boolean isExtendedTime() {
		return extendedTime;
	}

	public void setExtendedTime(boolean extendedTime) {
		this.extendedTime = extendedTime;
	}
	
	
	
}
