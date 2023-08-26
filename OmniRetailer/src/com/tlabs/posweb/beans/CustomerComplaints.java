package com.tlabs.posweb.beans;

import java.util.List;

/**
* @author 		: kesav
* @Created_on   : 30-12-2015
* @verified_By  :
* @modified_By  : 
* @modified_On  :  
* @modified_Ref :  
* @description  : This class is used to interact with the  customer_complaints table in database . 
* */
public class CustomerComplaints {
	private String complaintID;
	private String complaintStatus;
	private String createdBy;
	private String customerName;
	private String mobileNum;
	private String customerEmail;
	private String complaintType;
	private String complaintDetails;
	private String estimatedClosureDate;
	private String remarks;
	private String priority;
	private String assignedTo;
	private String complaintMode;
	private Customer customerObj;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String dobStr;
	private String startIndex;
	private String maxRecords;
	private String searchCriteria;
	private String estimatedClosureDateStr;
	private String dateTimeStr;
	private List<String> nextActivities;
	private String startDate;
	private String endDate;
	private String storeLocation;
	
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

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public List<String> getNextActivities() {
		return nextActivities;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

	public String getDateTimeStr() {
		return dateTimeStr;
	}

	public void setDateTimeStr(String dateTimeStr) {
		this.dateTimeStr = dateTimeStr;
	}

	public String getComplaintID() {
		return complaintID;
	}

	public void setComplaintID(String complaintID) {
		this.complaintID = complaintID;
	}

	public String getComplaintStatus() {
		return complaintStatus;
	}

	public void setComplaintStatus(String complaintStatus) {
		this.complaintStatus = complaintStatus;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getMobileNum() {
		return mobileNum;
	}

	public void setMobileNum(String mobileNum) {
		this.mobileNum = mobileNum;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public Customer getCustomerObj() {
		return customerObj;
	}

	public void setCustomerObj(Customer customerObj) {
		this.customerObj = customerObj;
	}

	public String getComplaintType() {
		return complaintType;
	}

	public void setComplaintType(String complaintType) {
		this.complaintType = complaintType;
	}

	public String getComplaintDetails() {
		return complaintDetails;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public String getEstimatedClosureDateStr() {
		return estimatedClosureDateStr;
	}

	public void setEstimatedClosureDateStr(String estimatedClosureDateStr) {
		this.estimatedClosureDateStr = estimatedClosureDateStr;
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

	public void setComplaintDetails(String complaintDetails) {
		this.complaintDetails = complaintDetails;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getDobStr() {
		return dobStr;
	}

	public void setDobStr(String dobStr) {
		this.dobStr = dobStr;
	}

	public String getEstimatedClosureDate() {
		return estimatedClosureDate;
	}

	public void setEstimatedClosureDate(String estimatedClosureDate) {
		this.estimatedClosureDate = estimatedClosureDate;
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
	
	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getAssignedTo() {
		return assignedTo;
	}

	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}

	public String getComplaintMode() {
		return complaintMode;
	}

	public void setComplaintMode(String complaintMode) {
		this.complaintMode = complaintMode;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	
}
