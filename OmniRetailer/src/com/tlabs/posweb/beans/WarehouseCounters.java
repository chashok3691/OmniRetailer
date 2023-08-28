package com.tlabs.posweb.beans;

//import java.util.Date;
import java.util.List;


public class WarehouseCounters {


	private String counterId;

	
	private String counterName = null;


	private String deviceId = null;

	
	private String counterType = null;

	
	private String warehouseLocation;


	private String remarks = null;

	//private String maxRecords;
//	private Date createdOn;
//
//
//	private Date updatedDate;


	private String userName;


	private String roleName;


	private String deviceType;

	private String startIndex;


	private List<String> counterIds;

	private List<String> locationsList;
	

	
	private boolean quickBill;
	
	private String menu;
	
	private String taxCode;
	
	private boolean b2bCounters=false;
	
	private String counterUserId;
	
	private String printingType;
	
	
	
	
	
	
	
	
	public String getPrintingType() {
		return printingType;
	}

	public void setPrintingType(String printingType) {
		this.printingType = printingType;
	}

	public boolean isB2bCounters() {
		return b2bCounters;
	}

	public void setB2bCounters(boolean b2bCounters) {
		this.b2bCounters = b2bCounters;
	}

	public String getCounterUserId() {
		return counterUserId;
	}

	public void setCounterUserId(String counterUserId) {
		this.counterUserId = counterUserId;
	}

	public boolean isQuickBill() {
		return quickBill;
	}

	public void setQuickBill(boolean quickBill) {
		this.quickBill = quickBill;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public String getTaxCode() {
		return taxCode;
	}

	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}

	public List<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}

	private String searchCriteria;


	private String maxRecords;


	private String startDateStr;


	private String endDateStr;


	private String createdDateStr;


	private String updatedDateStr;


	private RequestHeader requestHeader;

	public String getCounterId() {
		return counterId;
	}

	public void setCounterId(String counterId) {
		this.counterId = counterId;
	}

	public String getCounterName() {
		return counterName;
	}

	public void setCounterName(String counterName) {
		this.counterName = counterName;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public String getCounterType() {
		return counterType;
	}

	public void setCounterType(String counterType) {
		this.counterType = counterType;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getDeviceType() {
		return deviceType;
	}

	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}

	public String getWarehouseLocation() {
		return warehouseLocation;
	}

	public void setWarehouseLocation(String warehouseLocation) {
		this.warehouseLocation = warehouseLocation;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public List<String> getCounterIds() {
		return counterIds;
	}

	public void setCounterIds(List<String> counterIds) {
		this.counterIds = counterIds;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
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

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public String getUpdatedDateStr() {
		return updatedDateStr;
	}

	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

}
