package com.tlabs.posweb.beans;

import java.util.List;

public class CashierShortageReportBean {

	
	private String searchCriteria;
	
	private String startIndex;
	private String startDate;
	private String endDate;
	private String counterId;
	private String cashierId;
	private String requiredRecords;
	private boolean isSaveReport;
	private boolean saveReportFlag;
	private String store_location;
	private int totalRecords;
	private List<CashierShortageReportBean> reportList;
	private ResponseHeader responseHeader;
	private RequestHeader requestHeader;
	
	
	
	private float shortageAmount;
	private float systemAmount;
	private float declareAmount;
	private String shiftId;
	private String storeLocation;
	private String zone;
	private String salesReportFilePath;
	private String date;
	
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public float getShortageAmount() {
		return shortageAmount;
	}
	public void setShortageAmount(float shortageAmount) {
		this.shortageAmount = shortageAmount;
	}
	public float getSystemAmount() {
		return systemAmount;
	}
	public void setSystemAmount(float systemAmount) {
		this.systemAmount = systemAmount;
	}
	public float getDeclareAmount() {
		return declareAmount;
	}
	public void setDeclareAmount(float declareAmount) {
		this.declareAmount = declareAmount;
	}
	public String getShiftId() {
		return shiftId;
	}
	public void setShiftId(String shiftId) {
		this.shiftId = shiftId;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
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
	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}
	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}
	
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	
	
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getRequiredRecords() {
		return requiredRecords;
	}
	public void setRequiredRecords(String requiredRecords) {
		this.requiredRecords = requiredRecords;
	}
	public boolean isSaveReport() {
		return isSaveReport;
	}
	public void setSaveReport(boolean isSaveReport) {
		this.isSaveReport = isSaveReport;
	}
	public boolean isSaveReportFlag() {
		return saveReportFlag;
	}
	public void setSaveReportFlag(boolean saveReportFlag) {
		this.saveReportFlag = saveReportFlag;
	}
	public String getStore_location() {
		return store_location;
	}
	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	
	public List<CashierShortageReportBean> getReportList() {
		return reportList;
	}
	public void setReportList(List<CashierShortageReportBean> reportList) {
		this.reportList = reportList;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	}
