package com.tlabs.posweb.beans;


import java.util.List;
/*
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;*/

/*@Entity
@Table(name = "store_stock_verification")*/
public class StoreStockVerification {

	//@Id
	//@Column(name = "verification_code")
	private String verification_code;
	private String totalRecords;
	private StoreStockVerification stockVerificationObj;
	private List<StoreStockVerification> verificationList;
	
	 private List<String> nextActivities;
	 private List<String> workFlowActivities;
	 private List<String> previousStates;
	 private List<String> nextWorkFlowStates;
	 private String status;
	private String maxRecords;
	

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<String> getNextActivities() {
		return nextActivities;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

	public List<String> getWorkFlowActivities() {
		return workFlowActivities;
	}

	public void setWorkFlowActivities(List<String> workFlowActivities) {
		this.workFlowActivities = workFlowActivities;
	}

	public List<String> getPreviousStates() {
		return previousStates;
	}

	public void setPreviousStates(List<String> previousStates) {
		this.previousStates = previousStates;
	}

	public List<String> getNextWorkFlowStates() {
		return nextWorkFlowStates;
	}

	public void setNextWorkFlowStates(List<String> nextWorkFlowStates) {
		this.nextWorkFlowStates = nextWorkFlowStates;
	}

	public List<StoreStockVerification> getVerificationList() {
		return verificationList;
	}

	public void setVerificationList(List<StoreStockVerification> verificationList) {
		this.verificationList = verificationList;
	}

	public StoreStockVerification getStockVerificationObj() {
		return stockVerificationObj;
	}

	public void setStockVerificationObj(StoreStockVerification stockVerificationObj) {
		this.stockVerificationObj = stockVerificationObj;
	}

	private RequestHeader requestHeader;
	private String startIndex;
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

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	//@Column(name = "verified_by")
	private String verified_by;

	//@Column(name = "verified_on")
	//private Date verified_on;

	//@Column(name = "store_location")
	private String location;

	//@Column(name = "remarks")
	private String remarks;
	
	//@Column(name = "master_verification_code")
	private String masterVerificationCode;
	
	
	//@Column(name = "user_name")
	private String userName;

	//@Column(name = "role_name")
	private String roleName;

	//@Column(name = "updated_on")
	//private Date updatedOn;
	
	private String startTime;
	private String endTime;
private String verifiedDateStr;
	
	public String getStartTime() {
	return startTime;
}

public void setStartTime(String startTime) {
	this.startTime = startTime;
}

public String getEndTime() {
	return endTime;
}

public void setEndTime(String endTime) {
	this.endTime = endTime;
}

public String getVerifiedDateStr() {
	return verifiedDateStr;
}

public void setVerifiedDateStr(String verifiedDateStr) {
	this.verifiedDateStr = verifiedDateStr;
}

	//@Transient
	private String verifiedOnStr;
	
	//@Transient
	private List<StoreStockVerificationItems> itemsList;
	public String getVerification_code() {
		return verification_code;
	}

	public void setVerification_code(String verification_code) {
		this.verification_code = verification_code;
	}

	public String getVerified_by() {
		return verified_by;
	}

	public void setVerified_by(String verified_by) {
		this.verified_by = verified_by;
	}

	public String getRemarks() {
		return remarks;
	}

/*	public Date getVerified_on() {
		return verified_on;
	}

	public void setVerified_on(Date verified_on) {
		this.verified_on = verified_on;
	}*/

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	/*public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}*/

	public String getVerifiedOnStr() {
		return verifiedOnStr;
	}

	public void setVerifiedOnStr(String verifiedOnStr) {
		this.verifiedOnStr = verifiedOnStr;
	}

	public List<StoreStockVerificationItems> getItemsList() {
		return itemsList;
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

	public void setItemsList(List<StoreStockVerificationItems> itemsList) {
		this.itemsList = itemsList;
	}

	public String getMasterVerificationCode() {
		return masterVerificationCode;
	}

	public void setMasterVerificationCode(String masterVerificationCode) {
		this.masterVerificationCode = masterVerificationCode;
	}

	 

}
