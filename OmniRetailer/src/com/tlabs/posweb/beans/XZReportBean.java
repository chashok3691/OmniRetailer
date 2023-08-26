package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;

public class XZReportBean {
	
	private String zone;
    private String location;
	private Date date;
	private String counter;
	private String cashierId;
    private String cashierName;
    private String shiftId;
	private String xCash;
    private String zCash;
    private String differenceAmount;
	
    private Float returnTotal=0f;
    
    

	public Float getReturnTotal() {
		return returnTotal;
	}
	public void setReturnTotal(Float returnTotal) {
		this.returnTotal = returnTotal;
	}
	public String getDifferenceAmount() {
		return differenceAmount;
	}
	public void setDifferenceAmount(String differenceAmount) {
		this.differenceAmount = differenceAmount;
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
	
	
	public String getShiftId() {
		return shiftId;
	}
	public void setShiftId(String shiftId) {
		this.shiftId = shiftId;
	}
	public String getxCash() {
		return xCash;
	}
	public void setxCash(String xCash) {
		this.xCash = xCash;
	}

	public String getzCash() {
		return zCash;
	}
	public void setzCash(String zCash) {
		this.zCash = zCash;
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
	private String dateStr;
	private int totalRecords;
	
private List<XZReportBean> xzReportList;
	

	public int getTotalRecords() {
	return totalRecords;
}
public void setTotalRecords(int totalRecords) {
	this.totalRecords = totalRecords;
}
	public List<XZReportBean> getXzReportList() {
		return xzReportList;
	}

	public void setXzReportList(List<XZReportBean> xzReportList) {
		this.xzReportList = xzReportList;
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