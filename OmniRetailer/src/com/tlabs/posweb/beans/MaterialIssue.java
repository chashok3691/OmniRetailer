package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;



public class MaterialIssue {

	private String issueRef;
	
	private String materialReqRef;
	
	private String requestedBy;
	
	private String businessLocation;
	
	private String issuedBy;
 
	private String issuedTo;
	
	private String status;
	
	private String jobId;
	
	private String issuePurpose;
	
	private String description;
 
	private Float materialCost;
	
	private Date issueDate;
	
	private String userName;
	
	private String roleName; 
	
	
	private List<MaterialIssueItems> itemsList;
	
	private Integer startIndex;
	
	private Integer maxRecords;
	
	private RequestHeader requestHeader;
	
	private String searchCriteria;

	private String startDate;
	
	private String endDate;
	
	private String issuedDateStr;
	
	private List<String> issueRefIds;
	
	public String getIssueRef() {
		return issueRef;
	}

	public void setIssueRef(String issueRef) {
		this.issueRef = issueRef;
	}

	public String getMaterialReqRef() {
		return materialReqRef;
	}

	public void setMaterialReqRef(String materialReqRef) {
		this.materialReqRef = materialReqRef;
	}

	public String getRequestedBy() {
		return requestedBy;
	}

	public void setRequestedBy(String requestedBy) {
		this.requestedBy = requestedBy;
	}

	public String getBusinessLocation() {
		return businessLocation;
	}

	public void setBusinessLocation(String businessLocation) {
		this.businessLocation = businessLocation;
	}

	public String getIssuedBy() {
		return issuedBy;
	}

	public void setIssuedBy(String issuedBy) {
		this.issuedBy = issuedBy;
	}

	public String getIssuedTo() {
		return issuedTo;
	}

	public void setIssuedTo(String issuedTo) {
		this.issuedTo = issuedTo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getIssuePurpose() {
		return issuePurpose;
	}

	public void setIssuePurpose(String issuePurpose) {
		this.issuePurpose = issuePurpose;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

 

	public Date getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}

 

	public List<MaterialIssueItems> getItemsList() {
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

	public void setItemsList(List<MaterialIssueItems> itemsList) {
		this.itemsList = itemsList;
	}
 

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public List<String> getIssueRefIds() {
		return issueRefIds;
	}

	public void setIssueRefIds(List<String> issueRefIds) {
		this.issueRefIds = issueRefIds;
	}

	public String getIssuedDateStr() {
		return issuedDateStr;
	}

	public void setIssuedDateStr(String issuedDateStr) {
		this.issuedDateStr = issuedDateStr;
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

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public Float getMaterialCost() {
		return materialCost;
	}

	public void setMaterialCost(Float materialCost) {
		this.materialCost = materialCost;
	}

	public Integer getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}

	public Integer getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(Integer maxRecords) {
		this.maxRecords = maxRecords;
	}
 
}
