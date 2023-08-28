package com.tlabs.posweb.beans;

import java.util.List;

public class ShiftMaster {
	
	private int shiftId;
	
	private String shiftName;
	
	private String storeLocation;
	
	private String remarks;
	
    private List<ShiftTimings> shiftTimings;
	
    private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private String start_date;
	
	private String end_date;
	
	private boolean isShiftTime;
	
	private String startIndex;
	
	private List<String> shiftIds;
	
	private List<String> weekDays;
	
	private int slNo;
	
	
	private String flowUnder;
	
	
	public String getFlowUnder() {
		return flowUnder;
	}

	public void setFlowUnder(String flowUnder) {
		this.flowUnder = flowUnder;
	}

	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public List<String> getWeekDays() {
		return weekDays;
	}

	public void setWeekDays(List<String> weekDays) {
		this.weekDays = weekDays;
	}

	public List<String> getShiftIds() {
		return shiftIds;
	}

	public void setShiftIds(List<String> shiftIds) {
		this.shiftIds = shiftIds;
	}

	
	public int getShiftId() {
		return shiftId;
	}

	public void setShiftId(int shiftId) {
		this.shiftId = shiftId;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	
	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public boolean isShiftTime() {
		return isShiftTime;
	}

	public void setShiftTime(boolean isShiftTime) {
		this.isShiftTime = isShiftTime;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}


	public List<ShiftTimings> getShiftTimings() {
		return shiftTimings;
	}

	public void setShiftTimings(List<ShiftTimings> shiftTimings) {
		this.shiftTimings = shiftTimings;
	}

	public String getShiftName() {
		return shiftName;
	}

	public void setShiftName(String shiftName) {
		this.shiftName = shiftName;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
}
