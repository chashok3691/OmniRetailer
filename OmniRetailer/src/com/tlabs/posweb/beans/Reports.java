package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * 
 * @author karthik.k
 * created_On:07-04-2017
 */

public class Reports {

	
	private int sno;

	
	private String location;


	private String zone;


	private String businessCycleDate;

	
	private String counter;

	
	private String shiftStartTime;


	private String shiftEndTime;

	
	private String cashier;

	
	private Double totalAmount;

	
	private Float tax;

	
	private Double netSales;

	
	private String reportType;


	/*private Date createdDate;*/

	
	private int shiftId;

	
	private RequestHeader requestHeader;

	
	private ResponseHeader responseHeader;


	private String startDateStr;

	
	private String endDateStr;


	private String startIndex;


	private List<Reports> reportsList;


	private int totalRecords;

	
	private String maxRecords;
	
	private String status;

	
	private String businessCycleDateStr;

	
	private BigDecimal totalSales;

	
	private BigDecimal totalNetSales;

	
	private BigDecimal totalTax;

	private List<String> locationsList;
	
	private String locationList;
	
	private String flow;
	
	private Double zCash=0.0;
	private Double xCash=0.0;
	private Double differenceAmount= 0.0;
	
	
	private String store_location;
	private String reportDate;
	
	private String  cashierId;
	private String   counterId;
	private String   dateStr;
	private String   cashierName;
	private String createdDate;
	
	
	
	
	
	
	


	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCounterId() {
		return counterId;
	}

	public void setCounterId(String counterId) {
		this.counterId = counterId;
	}

	public String getCashierId() {
		return cashierId;
	}

	public void setCashierId(String cashierId) {
		this.cashierId = cashierId;
	}

	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}

	public String getCashierName() {
		return cashierName;
	}

	public void setCashierName(String cashierName) {
		this.cashierName = cashierName;
	}

	private List<Reports>  reportResponses;
	
	
	
	public List<Reports> getReportResponses() {
		return reportResponses;
	}

	public void setReportResponses(List<Reports> reportResponses) {
		this.reportResponses = reportResponses;
	}

	public String getStore_location() {
		return store_location;
	}

	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public Double getzCash() {
		return zCash;
	}

	public void setzCash(Double zCash) {
		this.zCash = zCash;
	}

	public Double getxCash() {
		return xCash;
	}

	public void setxCash(Double xCash) {
		this.xCash = xCash;
	}

	public Double getDifferenceAmount() {
		return differenceAmount;
	}

	public void setDifferenceAmount(Double differenceAmount) {
		this.differenceAmount = differenceAmount;
	}

	public String getFlow() {
		return flow;
	}

	public void setFlow(String flow) {
		this.flow = flow;
	}

	public String getLocationList() {
		return locationList;
	}

	public void setLocationList(String locationList) {
		this.locationList = locationList;
	}

	public List<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}

	private String createdDateStr;

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public int getShiftId() {
		return shiftId;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	/*public Date getBusinessCycleDate() {
		return businessCycleDate;
	}

	public void setBusinessCycleDate(Date businessCycleDate) {
		this.businessCycleDate = businessCycleDate;
	}*/

	public String getCounter() {
		return counter;
	}

	public void setCounter(String counter) {
		this.counter = counter;
	}

	

	public String getCashier() {
		return cashier;
	}

	public void setCashier(String cashier) {
		this.cashier = cashier;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Float getTax() {
		return tax;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public void setTax(Float tax) {
		this.tax = tax;
	}

	public Double getNetSales() {
		return netSales;
	}

	public String getBusinessCycleDateStr() {
		return businessCycleDateStr;
	}

	public void setBusinessCycleDateStr(String businessCycleDateStr) {
		this.businessCycleDateStr = businessCycleDateStr;
	}

	public void setNetSales(Double netSales) {
		this.netSales = netSales;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public List<Reports> getReportsList() {
		return reportsList;
	}

	public void setReportsList(List<Reports> reportsList) {
		this.reportsList = reportsList;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public BigDecimal getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(BigDecimal totalSales) {
		this.totalSales = totalSales;
	}

	public BigDecimal getTotalNetSales() {
		return totalNetSales;
	}

	public void setTotalNetSales(BigDecimal totalNetSales) {
		this.totalNetSales = totalNetSales;
	}

	public BigDecimal getTotalTax() {
		return totalTax;
	}

	public String getShiftStartTime() {
		return shiftStartTime;
	}

	public void setShiftStartTime(String shiftStartTime) {
		this.shiftStartTime = shiftStartTime;
	}

	public String getShiftEndTime() {
		return shiftEndTime;
	}

	public void setShiftEndTime(String shiftEndTime) {
		this.shiftEndTime = shiftEndTime;
	}

	public void setTotalTax(BigDecimal totalTax) {
		this.totalTax = totalTax;
	}

	public void setShiftId(int shiftId) {
		this.shiftId = shiftId;
	}

	public String getBusinessCycleDate() {
		return businessCycleDate;
	}

	public void setBusinessCycleDate(String businessCycleDate) {
		this.businessCycleDate = businessCycleDate;
	}

}
