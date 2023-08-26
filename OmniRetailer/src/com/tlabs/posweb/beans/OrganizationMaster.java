package com.tlabs.posweb.beans;

import java.util.List;




public class OrganizationMaster {

	
	private String organizationId;
	

	private String incorporationName;
	

	private String incorporationType;
	
	
	private String description;
	
	
	private String gstn;
	

	private String website;
	private String organizationStatus;
	
	private String mobileNo;
	

	private String emailId;
	
	private String address;
	
	
	private String createdDate;
	
	
	private String businessLocations;
	
	
	private List<OrganizationLocations> organizationLocations;
	
	
	private RequestHeader requestHeader;
	
	
	private ResponseHeader responseHeader;
	
	
	private int totalRecords;
	
	
	private int startIndex;
	
	
	private int maxRecords;
	
	
	private String searchCritaria;
	
	private String location;
	
	private String status;
	
	private String panNo;
	private String defaultBankAccount;
	
	private String buildingNo;
    
	private String street;
	        
	private String area;
	        
	private String city;
	        
	private String pincode;
	        
	private String businessType;
	
	
	
	public String getBuildingNo() {
		return buildingNo;
	}
	public void setBuildingNo(String buildingNo) {
		this.buildingNo = buildingNo;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
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
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public String getPanNo() {
		return panNo;
	}
	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}
	public String getDefaultBankAccount() {
		return defaultBankAccount;
	}
	public void setDefaultBankAccount(String defaultBankAccount) {
		this.defaultBankAccount = defaultBankAccount;
	}
	public String getOrganizationStatus() {
		return organizationStatus;
	}
	public void setOrganizationStatus(String organizationStatus) {
		this.organizationStatus = organizationStatus;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	
	private List<OrganizationMaster> organizationMasters;
	
	
	
    private String startDate;
    
   
    private String endDate;
    
    
    private String createDateStr;
    
    public String getUpdatedDateStr() {
		return updatedDateStr;
	}
	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}


	private String updatedDateStr;
	
    public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public List<OrganizationMaster> getOrganizationMasters() {
		return organizationMasters;
	}
	public void setOrganizationMasters(List<OrganizationMaster> organizationMasters) {
		this.organizationMasters = organizationMasters;
	}
	
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(int maxRecords) {
		this.maxRecords = maxRecords;
	}
	public String getSearchCritaria() {
		return searchCritaria;
	}
	public void setSearchCritaria(String searchCritaria) {
		this.searchCritaria = searchCritaria;
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
	public String getCreateDateStr() {
		return createDateStr;
	}
	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
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
	public List<OrganizationLocations> getOrganizationLocations() {
		return organizationLocations;
	}
	public void setOrganizationLocations(List<OrganizationLocations> organizationLocations) {
		this.organizationLocations = organizationLocations;
	}
	public String getOrganizationId() {
		return organizationId;
	}
	public void setOrganizationId(String organizationId) {
		this.organizationId = organizationId;
	}
	public String getIncorporationName() {
		return incorporationName;
	}
	public void setIncorporationName(String incorporationName) {
		this.incorporationName = incorporationName;
	}
	public String getIncorporationType() {
		return incorporationType;
	}
	public void setIncorporationType(String incorporationType) {
		this.incorporationType = incorporationType;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getGstn() {
		return gstn;
	}
	public void setGstn(String gstn) {
		this.gstn = gstn;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBusinessLocations() {
		return businessLocations;
	}
	public void setBusinessLocations(String businessLocations) {
		this.businessLocations = businessLocations;
	}
	
	
}
