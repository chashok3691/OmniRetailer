package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;




public class XZReading {
	
	
	private String zone;
	
	
	private String location;
	
	
	private Date date;
	
	
	private String counter;
	
	
	private String cashierId;
	
	
	private String cashierName;
	
	private String totalRecords;
	
	
	private int shift;
	
	
	private Double xCash;
	
	
	private Double zCash;
	
	
	private Double diff;
	
	private List<XZReading> reportsDetails;
	
	

	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<XZReading> getReportsDetails() {
		return reportsDetails;
	}
	public void setReportsDetails(List<XZReading> reportsDetails) {
		this.reportsDetails = reportsDetails;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getCounter() {
		return counter;
	}
	public void setCounter(String counter) {
		this.counter = counter;
	}
	public String getCashierId() {
		return cashierId;
	}
	public void setCashierId(String cashierId) {
		this.cashierId = cashierId;
	}
	public String getCashierName() {
		return cashierName;
	}
	public void setCashierName(String cashierName) {
		this.cashierName = cashierName;
	}
	public int getShift() {
		return shift;
	}
	public void setShift(int shift) {
		this.shift = shift;
	}
	public Double getxCash() {
		return xCash;
	}
	public void setxCash(Double xCash) {
		this.xCash = xCash;
	}

	public Double getzCash() {
		return zCash;
	}
	public void setzCash(Double zCash) {
		this.zCash = zCash;
	}
	public Double getDiff() {
		return diff;
	}
	public void setDiff(Double diff) {
		this.diff = diff;
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
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private String startIndex;
	private String  flow;
	private String maxRecords;
	private String dateStr;

	
	
	
	public String getFlow() {
		return flow;
	}
	public void setFlow(String flow) {
		this.flow = flow;
	}
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public String getDateStr() {
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
}