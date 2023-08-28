package com.tlabs.posweb.beans;

public class AverageInventoryBean {

	private String counterId;
	private String storeLocation;
	private RequestHeader requestHeader;
	private String startIndex;
	private String startDate;
	private String endDate;
	private String searchCriteria;
	private String requiredRecords;
	private String locationId;
	private String timeCycle;
	private String filterBy;
	private String store_location;
	
	public String getStore_location() {
		return store_location;
	}
	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}
	//added by manasa
	private String maxRecords;
	
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public String getFilterBy() {
		return filterBy;
	}
	public void setFilterBy(String filterBy) {
		this.filterBy = filterBy;
	}
	public String getCounterId() {
		return counterId;
	}
	public void setCounterId(String counterId) {
		this.counterId = counterId;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
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
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String getRequiredRecords() {
		return requiredRecords;
	}
	public void setRequiredRecords(String requiredRecords) {
		this.requiredRecords = requiredRecords;
	}
	public String getLocationId() {
		return locationId;
	}
	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}
	public String getTimeCycle() {
		return timeCycle;
	}
	public void setTimeCycle(String timeCycle) {
		this.timeCycle = timeCycle;
	}
	
	
}
