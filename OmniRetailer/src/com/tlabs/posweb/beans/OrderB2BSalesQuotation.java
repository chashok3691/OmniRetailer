package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


public class OrderB2BSalesQuotation {
	
	private String quotationRef;
	
	private String customerId;
	
	private String customerName;
	
	private String tenderRef;
	
	private BigDecimal depositAmount;
	
	private BigDecimal discount;
	
	private BigDecimal shipmentCost;
	
	private Date tenderOpenDate;
	
	private Date tenderCloseDate;
	
	private Date projectStartDate;
	
	private Date projectEndDate;
	
	private Date createdDate;
	
	private Date updatedDate;
	
	private String shipmentTerms;
	
	private String salesTerms;
	
	private String fromLocation;
	
	private String fromAddress;
	
	private String fromStreetName;
	
	private String fromLocality;
	
	private String fromCity;
	
	private String fromState;
	
	private String toAddress;
	
	private String toStreetName;
	
	private String toLocality;
	
	private String toCity;
	
	private String toState;
	
	private String status;
	
	private String userName;
	
	private String roleName;
	
	private List<OrderB2BSalesQuotationItems> salesQuotationItems;
	
	private List<OrderB2BSalesQuotation> salesQuotations;
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private int totalRecords;
	
	private String startIndex;
	
	private String maxRecords;
	
	private String searchCritaria;
	
	private String startDate;
	
	private String endDate;
	
	private String createdDateStr;
	
	private String updatedDateStr;
	
	private String zoneId;
	
	private String tenderOpenDateStr;
	
	private String tenderCloseDateStr;
	
	private String projectStartDateStr;
	
	private String projectEndDateStr;
	

	private float quotationValue;
	private String fromPhoneNo;
	private String toPhone;
	private BigDecimal quotationStartValue;
	private BigDecimal quotationEndValue;
	 private List<String> nextActivities;
	 private List<String> workFlowActivities;
	 private List<String> previousStates;
	 private List<String> nextWorkFlowStates;
	
	 
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

	public float getQuotationValue() {
		return quotationValue;
	}

	public void setQuotationValue(float quotationValue) {
		this.quotationValue = quotationValue;
	}

	public String getFromPhoneNo() {
		return fromPhoneNo;
	}

	public void setFromPhoneNo(String fromPhoneNo) {
		this.fromPhoneNo = fromPhoneNo;
	}

	public String getToPhone() {
		return toPhone;
	}

	public void setToPhone(String toPhone) {
		this.toPhone = toPhone;
	}

	public BigDecimal getQuotationStartValue() {
		return quotationStartValue;
	}

	public void setQuotationStartValue(BigDecimal quotationStartValue) {
		this.quotationStartValue = quotationStartValue;
	}

	public BigDecimal getQuotationEndValue() {
		return quotationEndValue;
	}

	public void setQuotationEndValue(BigDecimal quotationEndValue) {
		this.quotationEndValue = quotationEndValue;
	}

	public List<OrderB2BSalesQuotationItems> getSalesQuotationItems() {
		return salesQuotationItems;
	}

	public void setSalesQuotationItems(List<OrderB2BSalesQuotationItems> salesQuotationItems) {
		this.salesQuotationItems = salesQuotationItems;
	}

	public List<OrderB2BSalesQuotation> getSalesQuotations() {
		return salesQuotations;
	}

	public void setSalesQuotations(List<OrderB2BSalesQuotation> salesQuotations) {
		this.salesQuotations = salesQuotations;
	}

	public String getTenderOpenDateStr() {
		return tenderOpenDateStr;
	}

	public void setTenderOpenDateStr(String tenderOpenDateStr) {
		this.tenderOpenDateStr = tenderOpenDateStr;
	}

	public String getTenderCloseDateStr() {
		return tenderCloseDateStr;
	}

	public void setTenderCloseDateStr(String tenderCloseDateStr) {
		this.tenderCloseDateStr = tenderCloseDateStr;
	}

	public String getProjectStartDateStr() {
		return projectStartDateStr;
	}

	public void setProjectStartDateStr(String projectStartDateStr) {
		this.projectStartDateStr = projectStartDateStr;
	}

	public String getProjectEndDateStr() {
		return projectEndDateStr;
	}

	public void setProjectEndDateStr(String projectEndDateStr) {
		this.projectEndDateStr = projectEndDateStr;
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

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getQuotationRef() {
		return quotationRef;
	}

	public void setQuotationRef(String quotationRef) {
		this.quotationRef = quotationRef;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getTenderRef() {
		return tenderRef;
	}

	public void setTenderRef(String tenderRef) {
		this.tenderRef = tenderRef;
	}

	public BigDecimal getDepositAmount() {
		return depositAmount;
	}

	public void setDepositAmount(BigDecimal depositAmount) {
		this.depositAmount = depositAmount;
	}

	public BigDecimal getDiscount() {
		return discount;
	}

	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}

	public BigDecimal getShipmentCost() {
		return shipmentCost;
	}

	public void setShipmentCost(BigDecimal shipmentCost) {
		this.shipmentCost = shipmentCost;
	}

	public Date getTenderOpenDate() {
		return tenderOpenDate;
	}

	public void setTenderOpenDate(Date tenderOpenDate) {
		this.tenderOpenDate = tenderOpenDate;
	}

	public Date getTenderCloseDate() {
		return tenderCloseDate;
	}

	public void setTenderCloseDate(Date tenderCloseDate) {
		this.tenderCloseDate = tenderCloseDate;
	}

	public Date getProjectStartDate() {
		return projectStartDate;
	}

	public void setProjectStartDate(Date projectStartDate) {
		this.projectStartDate = projectStartDate;
	}

	public Date getProjectEndDate() {
		return projectEndDate;
	}

	public void setProjectEndDate(Date projectEndDate) {
		this.projectEndDate = projectEndDate;
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

	public String getShipmentTerms() {
		return shipmentTerms;
	}

	public void setShipmentTerms(String shipmentTerms) {
		this.shipmentTerms = shipmentTerms;
	}

	public String getSalesTerms() {
		return salesTerms;
	}

	public void setSalesTerms(String salesTerms) {
		this.salesTerms = salesTerms;
	}

	public String getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}

	public String getFromStreetName() {
		return fromStreetName;
	}

	public void setFromStreetName(String fromStreetName) {
		this.fromStreetName = fromStreetName;
	}

	public String getFromLocation() {
		return fromLocation;
	}

	public void setFromLocation(String fromLocation) {
		this.fromLocation = fromLocation;
	}

	public String getFromCity() {
		return fromCity;
	}

	public void setFromCity(String fromCity) {
		this.fromCity = fromCity;
	}

	public String getFromState() {
		return fromState;
	}

	public void setFromState(String fromState) {
		this.fromState = fromState;
	}

	public String getToAddress() {
		return toAddress;
	}

	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}

	public String getToStreetName() {
		return toStreetName;
	}

	public void setToStreetName(String toStreetName) {
		this.toStreetName = toStreetName;
	}

	public String getFromLocality() {
		return fromLocality;
	}

	public void setFromLocality(String fromLocality) {
		this.fromLocality = fromLocality;
	}

	public String getToLocality() {
		return toLocality;
	}

	public void setToLocality(String toLocality) {
		this.toLocality = toLocality;
	}

	public String getToCity() {
		return toCity;
	}

	public void setToCity(String toCity) {
		this.toCity = toCity;
	}

	public String getToState() {
		return toState;
	}

	public void setToState(String toState) {
		this.toState = toState;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
	
	
	
	
	
	
	
	
	
}
