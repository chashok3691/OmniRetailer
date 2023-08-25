package com.tlabs.posweb.beans;

import java.util.List;


public class BusinessEnquiry {
	private String enquiryId;
	private String fromFirstName;
	private String fromLastName;
	private String enquiryDate;
	private String phoneNumber;
	private String emailId;
	private String houseNo;
	private String streetName;
	private String location;
	private String city;
	private String state;
	private String zipCode;
	private String enquiryDesc;
	private String enquiryType;
	private String enquiryChannel;
	private String contactDate;
	private String contactTime;
	private String enquirySubject;
	private String enquiryTime;
	private RequestHeader requestHeader;
	private String startIndex;
	private String maxRecords;
	private String searchCriteria;
	private String enquiryDateStr;
	private String startDate;
	private String endDate;
	private String contactDateStr;
	private String contactTimeStr;
	private String enquiryTimeStr;
	private List<String> enquiryIds;
	private String response;
	private String totalRecords;
	private int slNo;
	private String storeLocation;
	private String status;
	private List<String> nextActivities;
	
	
	
	public List<String> getNextActivities() {
		return nextActivities;
	}
	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public String getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(String enquiryId) {
		this.enquiryId = enquiryId;
	}

	public String getFromFirstName() {
		return fromFirstName;
	}

	public void setFromFirstName(String fromFirstName) {
		this.fromFirstName = fromFirstName;
	}

	public String getFromLastName() {
		return fromLastName;
	}

	public void setFromLastName(String fromLastName) {
		this.fromLastName = fromLastName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public String getStreetName() {
		return streetName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getEnquirySubject() {
		return enquirySubject;
	}

	public void setEnquirySubject(String enquirySubject) {
		this.enquirySubject = enquirySubject;
	}

	public List<String> getEnquiryIds() {
		return enquiryIds;
	}

	public void setEnquiryIds(List<String> enquiryIds) {
		this.enquiryIds = enquiryIds;
	}

	public String getContactTimeStr() {
		return contactTimeStr;
	}

	public void setContactTimeStr(String contactTimeStr) {
		this.contactTimeStr = contactTimeStr;
	}

	public String getEnquiryTimeStr() {
		return enquiryTimeStr;
	}

	public void setEnquiryTimeStr(String enquiryTimeStr) {
		this.enquiryTimeStr = enquiryTimeStr;
	}

	public String getContactDateStr() {
		return contactDateStr;
	}

	public void setContactDateStr(String contactDateStr) {
		this.contactDateStr = contactDateStr;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getEnquiryDesc() {
		return enquiryDesc;
	}

	public void setEnquiryDesc(String enquiryDesc) {
		this.enquiryDesc = enquiryDesc;
	}

	public String getEnquiryType() {
		return enquiryType;
	}

	public void setEnquiryType(String enquiryType) {
		this.enquiryType = enquiryType;
	}

	public String getEnquiryChannel() {
		return enquiryChannel;
	}

	public void setEnquiryChannel(String enquiryChannel) {
		this.enquiryChannel = enquiryChannel;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
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

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
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

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getEnquiryDateStr() {
		return enquiryDateStr;
	}

	public void setEnquiryDateStr(String enquiryDateStr) {
		this.enquiryDateStr = enquiryDateStr;
	}

	public String getEnquiryDate() {
		return enquiryDate;
	}

	public void setEnquiryDate(String enquiryDate) {
		this.enquiryDate = enquiryDate;
	}

	public String getContactDate() {
		return contactDate;
	}

	public void setContactDate(String contactDate) {
		this.contactDate = contactDate;
	}

	public String getContactTime() {
		return contactTime;
	}

	public void setContactTime(String contactTime) {
		this.contactTime = contactTime;
	}

	public String getEnquiryTime() {
		return enquiryTime;
	}

	public void setEnquiryTime(String enquiryTime) {
		this.enquiryTime = enquiryTime;
	}
 
}
