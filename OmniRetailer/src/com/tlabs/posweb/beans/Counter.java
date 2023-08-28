package com.tlabs.posweb.beans;

import java.util.List;
//import java.util.Set;

public class Counter {

	private String counterId;
	private String counterName;
	private String deviceId ;
	private String counterType ;
	private String storeLocation ;
	private String remarks ;
	private String startIndex;
	private String createdOn;
	private String warehouseLocation;
	private RequestHeader requestHeader;
	private List<Counter> counters;
	private String totalRecords;
	private List<String> counterIds;
	private String deviceType;
	private String searchCriteria;
	private String maxRecords;
	private int slNo;
	private String counterUserId;
	private String printingType;
	private String menu;
	private boolean quickBill;
	private boolean b2bCounter=false;
	
	private String  taxCode;
	private String customerId;
	private String createdOnStr;
	
	
	private boolean b2bCounters=false;
	
	
	private String paymentDevicePort;
    private String paymentDeviceUsername;
    private String paymentDevicePin;

	
	
	
	public String getPaymentDevicePort(){
		return paymentDevicePort;
	}
	public void setPaymentDevicePort(String paymentDevicePort) {
		this.paymentDevicePort = paymentDevicePort;
	}
	public String getPaymentDeviceUsername() {
		return paymentDeviceUsername;
	}
	public void setPaymentDeviceUsername(String paymentDeviceUsername) {
		this.paymentDeviceUsername = paymentDeviceUsername;
	}
	public String getPaymentDevicePin() {
		return paymentDevicePin;
	}
	public void setPaymentDevicePin(String paymentDevicePin) {
		this.paymentDevicePin = paymentDevicePin;
	}
	public String getCreatedOnStr() {
		return createdOnStr;
	}
	public void setCreatedOnStr(String createdOnStr) {
		this.createdOnStr = createdOnStr;
	}
	public boolean isB2bCounters() {
		return b2bCounters;
	}
	public void setB2bCounters(boolean b2bCounters) {
		this.b2bCounters = b2bCounters;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getTaxCode() {
		return taxCode;
	}
	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}
	public boolean isB2bCounter() {
		return b2bCounter;
	}
	public void setB2bCounter(boolean b2bCounter) {
		this.b2bCounter = b2bCounter;
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
	public String getPrintingType() {
		return printingType;
	}
	public void setPrintingType(String printingType) {
		this.printingType = printingType;
	}
	public String getCounterUserId() {
		return counterUserId;
	}
	public void setCounterUserId(String counterUserId) {
		this.counterUserId = counterUserId;
	}
	//private Set<String> counterLocations; 
	private List<String> counterLocations; 
	
	public List<String> getCounterLocations() {
		return counterLocations;
	}
	public void setCounterLocations(List<String> counterLocations) {
		this.counterLocations = counterLocations;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String getDeviceType() {
		return deviceType;
	}
	public void setDeviceType(String deviceType) {
		this.deviceType = deviceType;
	}
	public List<String> getCounterIds() {
		return counterIds;
	}
	public void setCounterIds(List<String> counterIds) {
		this.counterIds = counterIds;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<Counter> getCounters() {
		return counters;
	}
	public void setCounters(List<Counter> counters) {
		this.counters = counters;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	
	public String getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}
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
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public String getWarehouseLocation() {
		return warehouseLocation;
	}
	public void setWarehouseLocation(String warehouseLocation) {
		this.warehouseLocation = warehouseLocation;
	}
	
	
}
