package com.tlabs.posweb.beans;

import java.util.List;

public class LocationBean {

	private RequestHeader requestHeader;
	private String state; 
	private String address = "";
	private String locationId = "";
	private String area = "";
	private String city = "";
	private String pin = "";
	private String country = "";
	private String officePhone = "";
	private String officeMailId = "";
	private String businessActivity = "";
	private String startIndex = "";
	private List<?> locationList;
	private String totalRecords;
	private String startValue;
	private String searchCriteria;
	private String description;
	private int slNo;
	private List<String> deletedItems;
	private List<String> nonDeletedItems;
	private boolean allLocations;
	private boolean status;
	private boolean geoCordinatesRequest;
	
	private String organizationId;
	private String businessType;
	private ResponseHeader responseHeader;
	
    private String gstnNo;
    private Double distance;
    private boolean multipleUsersAccessDB=true;
    private String multipleUserDBStr;
    private String zoneId;
    private String gpsLatitude;
    private String gpsLongitude;
    private String franchiseCode;
    
    
    public String getFranchiseCode() {
		return franchiseCode;
	}
	public void setFranchiseCode(String franchiseCode) {
		this.franchiseCode = franchiseCode;
	}
	public boolean isGeoCordinatesRequest() {
		return geoCordinatesRequest;
	}
	public void setGeoCordinatesRequest(boolean geoCordinatesRequest) {
		this.geoCordinatesRequest = geoCordinatesRequest;
	}
    
	public String getMultipleUserDBStr() {
		return multipleUserDBStr;
	}
	public void setMultipleUserDBStr(String multipleUserDBStr) {
		this.multipleUserDBStr = multipleUserDBStr;
	}
	public String getGstnNo() {
		return gstnNo;
	}
	public void setGstnNo(String gstnNo) {
		this.gstnNo = gstnNo;
	}
	public Double getDistance() {
		return distance;
	}
	public void setDistance(Double distance) {
		this.distance = distance;
	}
	public boolean isMultipleUsersAccessDB() {
		return multipleUsersAccessDB;
	}
	public void setMultipleUsersAccessDB(boolean multipleUsersAccessDB) {
		this.multipleUsersAccessDB = multipleUsersAccessDB;
	}
	public String getZoneId() {
		return zoneId;
	}
	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}
	public String getGpsLatitude() {
		return gpsLatitude;
	}
	public void setGpsLatitude(String gpsLatitude) {
		this.gpsLatitude = gpsLatitude;
	}
	public String getGpsLongitude() {
		return gpsLongitude;
	}
	public void setGpsLongitude(String gpsLongitude) {
		this.gpsLongitude = gpsLongitude;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public String getOrganizationId() {
		return organizationId;
	}
	public void setOrganizationId(String organizationId) {
		this.organizationId = organizationId;
	}
	private String maxRecords;
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public boolean isAllLocations() {
		return allLocations;
	}
	public void setAllLocations(boolean allLocations) {
		this.allLocations = allLocations;
	}
	public int getSlNo() {
		return slNo;
	}
	public List<String> getDeletedItems() {
		return deletedItems;
	}
	public void setDeletedItems(List<String> deletedItems) {
		this.deletedItems = deletedItems;
	}
	public List<String> getNonDeletedItems() {
		return nonDeletedItems;
	}
	public void setNonDeletedItems(List<String> nonDeletedItems) {
		this.nonDeletedItems = nonDeletedItems;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getStartValue() {
		return startValue;
	}
	public void setStartValue(String startValue) {
		this.startValue = startValue;
	}
	public String getLocationId() {
		return locationId;
	}
	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}
	public List<?> getLocationList() {
		return locationList;
	}
	public void setLocationList(List<?> locationList) {
		this.locationList = locationList;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getOfficePhone() {
		return officePhone;
	}
	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}
	public String getOfficeMailId() {
		return officeMailId;
	}
	public void setOfficeMailId(String officeMailId) {
		this.officeMailId = officeMailId;
	}
	public String getBusinessActivity() {
		return businessActivity;
	}
	public void setBusinessActivity(String businessActivity) {
		this.businessActivity = businessActivity;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
