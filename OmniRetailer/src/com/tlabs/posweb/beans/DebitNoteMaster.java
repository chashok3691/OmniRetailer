package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


public class DebitNoteMaster {
	
	private String debitNoteRef;
	
	private String transactionDescription;
	
	private BigDecimal debitNoteValue;
	
	private String purchaseOrderDate;
	private String invoiceDate;
	
	private String returnDate;
	
	private String taxInvoiceNo;
	
	private String grnNo;
	
	private String purchaseOrderNo;
	
	private String gstRegistrationNo;
	
	private String location;
	
	private String organizationId;
	
	private Date createdDate;
	
	private Date updatedDate;
	
	private String userName;
	
	private String roleName;
	
	private List<DebitNoteMaster> debitNoteMasters;
	
	private List<DebitNoteItems> debitNoteItems;
	
	private List<String> debitNoteReferences;
	
	private String startDate;
	
	private String endDate;
	
	private String purchaseOrderDateStr;
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private String invoiceDateStr;
	
	private String returnDateStr;
	
	private String createdDateStr;
	
	private String updatedDateStr;
	
	private int totalRecords;
	
	private String startIndex;
	
	private String maxRecords;
	
	private String searchCritaria;
	
	private boolean isSaveReport;
	
	private String filePath;
	
	
	
	public List<String> getDebitNoteReferences() {
		return debitNoteReferences;
	}
	public void setDebitNoteReferences(List<String> debitNoteReferences) {
		this.debitNoteReferences = debitNoteReferences;
	}
	public List<DebitNoteMaster> getDebitNoteMasters() {
		return debitNoteMasters;
	}
	public void setDebitNoteMasters(List<DebitNoteMaster> debitNoteMasters) {
		this.debitNoteMasters = debitNoteMasters;
	}
	public List<DebitNoteItems> getDebitNoteItems() {
		return debitNoteItems;
	}
	public void setDebitNoteItems(List<DebitNoteItems> debitNoteItems) {
		this.debitNoteItems = debitNoteItems;
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
	public String getPurchaseOrderDateStr() {
		return purchaseOrderDateStr;
	}
	public void setPurchaseOrderDateStr(String purchaseOrderDateStr) {
		this.purchaseOrderDateStr = purchaseOrderDateStr;
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
	public String getInvoiceDateStr() {
		return invoiceDateStr;
	}
	public void setInvoiceDateStr(String invoiceDateStr) {
		this.invoiceDateStr = invoiceDateStr;
	}
	public String getReturnDateStr() {
		return returnDateStr;
	}
	public void setReturnDateStr(String returnDateStr) {
		this.returnDateStr = returnDateStr;
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
	public String getDebitNoteRef() {
		return debitNoteRef;
	}
	public void setDebitNoteRef(String debitNoteRef) {
		this.debitNoteRef = debitNoteRef;
	}
	public String getTransactionDescription() {
		return transactionDescription;
	}
	public void setTransactionDescription(String transactionDescription) {
		this.transactionDescription = transactionDescription;
	}
	public BigDecimal getDebitNoteValue() {
		return debitNoteValue;
	}
	public void setDebitNoteValue(BigDecimal debitNoteValue) {
		this.debitNoteValue = debitNoteValue;
	}
	public String getPurchaseOrderDate() {
		return purchaseOrderDate;
	}
	public void setPurchaseOrderDate(String purchaseOrderDate) {
		this.purchaseOrderDate = purchaseOrderDate;
	}
	public String getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public String getTaxInvoiceNo() {
		return taxInvoiceNo;
	}
	public void setTaxInvoiceNo(String taxInvoiceNo) {
		this.taxInvoiceNo = taxInvoiceNo;
	}
	public String getGrnNo() {
		return grnNo;
	}
	public void setGrnNo(String grnNo) {
		this.grnNo = grnNo;
	}
	public String getPurchaseOrderNo() {
		return purchaseOrderNo;
	}
	public void setPurchaseOrderNo(String purchaseOrderNo) {
		this.purchaseOrderNo = purchaseOrderNo;
	}
	public String getGstRegistrationNo() {
		return gstRegistrationNo;
	}
	public void setGstRegistrationNo(String gstRegistrationNo) {
		this.gstRegistrationNo = gstRegistrationNo;
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
	
	
	
		

}
