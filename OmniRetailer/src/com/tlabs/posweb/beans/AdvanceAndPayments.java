package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Set;


public class AdvanceAndPayments {

	private String transactionId;
	
	private String transactionDescription;
	
	private String location;
	
	private String organizationId;
	
	private String zoneId;
	
	private Date transactionDate;
	
	private Date createdDate;
	
	private Date updatedDate;
	
	private BigDecimal advanceAmount;
	
	private String status;
	
	private String advanceType;
	
	private String paymentMode;
	
	private String paidToRef;
	
	private String advanceGivenTo;
	
	private String bankAccount;
	
	private String userName;
	
	private String roleName;
	
	List<AdvanceAndPayments> advanceAndPayments ;
	
	List<String> userActivities;
	
	List<String> nextActivities;
	
	private List<String> nextWorkFlowStates;
	
	private List<String> workFlowActivities;
	
	private Set<String> previousStates;
	
	private String startDate;
	
	private String endDate;
	
	private String paymentStatus;
	
	private String transactionDateStr;
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private String createdDateStr;
	
	private String updatedDateStr;
	
	private int totalRecords;
	
	private String startIndex;
	
	private String maxRecords;
	
	private String searchCritaria;
	
	private boolean isSaveReport;
	
	private String filePath;

	public List<AdvanceAndPayments> getAdvanceAndPayments() {
		return advanceAndPayments;
	}

	public void setAdvanceAndPayments(List<AdvanceAndPayments> advanceAndPayments) {
		this.advanceAndPayments = advanceAndPayments;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getTransactionDescription() {
		return transactionDescription;
	}

	public void setTransactionDescription(String transactionDescription) {
		this.transactionDescription = transactionDescription;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(String organizationId) {
		this.organizationId = organizationId;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public Date getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public BigDecimal getAdvanceAmount() {
		return advanceAmount;
	}

	public void setAdvanceAmount(BigDecimal advanceAmount) {
		this.advanceAmount = advanceAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAdvanceType() {
		return advanceType;
	}

	public void setAdvanceType(String advanceType) {
		this.advanceType = advanceType;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getPaidToRef() {
		return paidToRef;
	}

	public void setPaidToRef(String paidToRef) {
		this.paidToRef = paidToRef;
	}

	public String getAdvanceGivenTo() {
		return advanceGivenTo;
	}

	public void setAdvanceGivenTo(String advanceGivenTo) {
		this.advanceGivenTo = advanceGivenTo;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
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

	public List<String> getUserActivities() {
		return userActivities;
	}

	public void setUserActivities(List<String> userActivities) {
		this.userActivities = userActivities;
	}

	public List<String> getNextActivities() {
		return nextActivities;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

	public List<String> getNextWorkFlowStates() {
		return nextWorkFlowStates;
	}

	public void setNextWorkFlowStates(List<String> nextWorkFlowStates) {
		this.nextWorkFlowStates = nextWorkFlowStates;
	}

	public List<String> getWorkFlowActivities() {
		return workFlowActivities;
	}

	public void setWorkFlowActivities(List<String> workFlowActivities) {
		this.workFlowActivities = workFlowActivities;
	}

	public Set<String> getPreviousStates() {
		return previousStates;
	}

	public void setPreviousStates(Set<String> previousStates) {
		this.previousStates = previousStates;
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

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public String getTransactionDateStr() {
		return transactionDateStr;
	}

	public void setTransactionDateStr(String transactionDateStr) {
		this.transactionDateStr = transactionDateStr;
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

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
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

	public String getSearchCritaria() {
		return searchCritaria;
	}

	public void setSearchCritaria(String searchCritaria) {
		this.searchCritaria = searchCritaria;
	}

	public boolean isSaveReport() {
		return isSaveReport;
	}

	public void setSaveReport(boolean isSaveReport) {
		this.isSaveReport = isSaveReport;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	
	
	
	
	
	
	
}
