package com.tlabs.posweb.beans;

/*
 * Added by Surya.k on 24/04/2019
 * 
 * */

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


public class PurchasePaymentMaster {
	
	private String transactionId;
	
	private String transactionref;
	
	private String location;
	
	private String urlOfPdf;
	
	public String getUrlOfPdf() {
		return urlOfPdf;
	}

	public void setUrlOfPdf(String urlOfPdf) {
		this.urlOfPdf = urlOfPdf;
	}

	private Date transactionDate;
	
	private Date dueDate;
	
	private Date createdDate;
	
	private Date updatedDate;
	
	private String userName;
	
	private String roleName;
	
	private String transactionDescription;
	
	private String supplierName;
	
	private BigDecimal invoiceAmount;
	
	private String status;
	
	private String organizationId;
	
	private List<PurchasePaymentChild> purchasePaymentChilds;
	
	private List<PurchasePaymentMaster> purchasePaymentMasters;
	
	private String startDate;
	
	private String endDate;
	
	private String paymentStatus;
	
	private String transactionDateStr;
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	private String dueDateStr;
	
	private String createdDateStr;
	
	private String updatedDateStr;
	
	private int totalRecords;
	
	private String startIndex;
	
	private String maxRecords;
	
	private String searchCritaria;
	
	private boolean isSaveReport;
	
	private String filePath;
	
	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getPaymentComments() {
		return paymentComments;
	}

	public void setPaymentComments(String paymentComments) {
		this.paymentComments = paymentComments;
	}

	private List<String> transactionIds;
	
    private String zoneId;
    private String paymentMode;
    private String  paymentComments;
    private float TotalInvoiceAmount;
    private float TotalDiscount;
    private float TotalNetCost;
    
    
    public float getTotalDiscount() {
		return TotalDiscount;
	}

	public void setTotalDiscount(float totalDiscount) {
		TotalDiscount = totalDiscount;
	}

	public float getTotalNetCost() {
		return TotalNetCost;
	}

	public void setTotalNetCost(float totalNetCost) {
		TotalNetCost = totalNetCost;
	}

	private List<String> nextActivities;
    private String  paymentReference;
    private BigDecimal paidAmount;
    public List<String> getNextActivities() {
		return nextActivities;
	}

	public String getPaymentReference() {
		return paymentReference;
	}

	public void setPaymentReference(String paymentReference) {
		this.paymentReference = paymentReference;
	}

	public BigDecimal getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(BigDecimal paidAmount) {
		this.paidAmount = paidAmount;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

	public List<String> getPreviousStates() {
		return previousStates;
	}

	public void setPreviousStates(List<String> previousStates) {
		this.previousStates = previousStates;
	}

	private List<String> previousStates;
    
	
	public float getTotalInvoiceAmount() {
		return TotalInvoiceAmount;
	}

	public void setTotalInvoiceAmount(float totalInvoiceAmount) {
		TotalInvoiceAmount = totalInvoiceAmount;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
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

	public List<String> getTransactionIds() {
		return transactionIds;
	}

	public void setTransactionIds(List<String> transactionIds) {
		this.transactionIds = transactionIds;
	}

	public List<PurchasePaymentMaster> getPurchasePaymentMasters() {
		return purchasePaymentMasters;
	}

	public void setPurchasePaymentMasters(List<PurchasePaymentMaster> purchasePaymentMasters) {
		this.purchasePaymentMasters = purchasePaymentMasters;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public boolean isSaveReport() {
		return isSaveReport;
	}

	public void setSaveReport(boolean isSaveReport) {
		this.isSaveReport = isSaveReport;
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

	public List<PurchasePaymentChild> getPurchasePaymentChilds() {
		return purchasePaymentChilds;
	}

	public void setPurchasePaymentChilds(List<PurchasePaymentChild> purchasePaymentChilds) {
		this.purchasePaymentChilds = purchasePaymentChilds;
	}

	public String getTransactionref() {
		return transactionref;
	}

	public void setTransactionref(String transactionref) {
		this.transactionref = transactionref;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public String getTransactionDescription() {
		return transactionDescription;
	}

	public void setTransactionDescription(String transactionDescription) {
		this.transactionDescription = transactionDescription;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public BigDecimal getInvoiceAmount() {
		return invoiceAmount;
	}

	public void setInvoiceAmount(BigDecimal invoiceAmount) {
		this.invoiceAmount = invoiceAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(String organizationId) {
		this.organizationId = organizationId;
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

	public String getDueDateStr() {
		return dueDateStr;
	}

	public void setDueDateStr(String dueDateStr) {
		this.dueDateStr = dueDateStr;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	
	
}
