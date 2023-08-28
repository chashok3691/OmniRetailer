package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


public class CreditNoteMaster {
	
	private String creditNoteRef;
	
	private String transactionDescription;
	
	private BigDecimal creditNoteValue;
	
	private Date salesOrderDate;
	
	private Date billDate;
	
	private Date returnDate;
	
	private String taxInvoiceNo;
	
	private String billNo;
	
	private String salesOrderNo;
	
	private String gstRegistrationNo;
	
	private String location;
	
	private String organizationId;
	
	private Date createdDate;
	
	private Date updatedDate;
	
	private String userName;
	
	private String roleName;
	
	private List<CreditNoteMaster> creditNoteMasters;
	
	private List<CreditNoteItems> creditNoteItems;
	
	private List<String> creditNoteReferences;
	
	private String startDate;
	
	private String endDate;
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private String billDateStr;
	
	private String salesOrderDateStr;
	
	private String returnDateStr;
	
	private String createdDateStr;
	
	private String updatedDateStr;
	
	private int totalRecords;
	
	private String startIndex;
	
	private String maxRecords;
	
	private String searchCritaria;
	
	private boolean isSaveReport;
	
	private String filePath;
	
	

	public String getSalesOrderDateStr() {
		return salesOrderDateStr;
	}

	public void setSalesOrderDateStr(String salesOrderDateStr) {
		this.salesOrderDateStr = salesOrderDateStr;
	}

	public String getCreditNoteRef() {
		return creditNoteRef;
	}

	public void setCreditNoteRef(String creditNoteRef) {
		this.creditNoteRef = creditNoteRef;
	}

	public String getTransactionDescription() {
		return transactionDescription;
	}

	public void setTransactionDescription(String transactionDescription) {
		this.transactionDescription = transactionDescription;
	}

	public BigDecimal getCreditNoteValue() {
		return creditNoteValue;
	}

	public void setCreditNoteValue(BigDecimal creditNoteValue) {
		this.creditNoteValue = creditNoteValue;
	}

	public Date getSalesOrderDate() {
		return salesOrderDate;
	}

	public void setSalesOrderDate(Date salesOrderDate) {
		this.salesOrderDate = salesOrderDate;
	}

	public Date getBillDate() {
		return billDate;
	}

	public void setBillDate(Date billDate) {
		this.billDate = billDate;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public String getTaxInvoiceNo() {
		return taxInvoiceNo;
	}

	public void setTaxInvoiceNo(String taxInvoiceNo) {
		this.taxInvoiceNo = taxInvoiceNo;
	}

	public String getBillNo() {
		return billNo;
	}

	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}

	public String getSalesOrderNo() {
		return salesOrderNo;
	}

	public void setSalesOrderNo(String salesOrderNo) {
		this.salesOrderNo = salesOrderNo;
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

	public List<CreditNoteMaster> getCreditNoteMasters() {
		return creditNoteMasters;
	}

	public void setCreditNoteMasters(List<CreditNoteMaster> creditNoteMasters) {
		this.creditNoteMasters = creditNoteMasters;
	}

	public List<CreditNoteItems> getCreditNoteItems() {
		return creditNoteItems;
	}

	public void setCreditNoteItems(List<CreditNoteItems> creditNoteItems) {
		this.creditNoteItems = creditNoteItems;
	}

	public List<String> getCreditNoteReferences() {
		return creditNoteReferences;
	}

	public void setCreditNoteReferences(List<String> creditNoteReferences) {
		this.creditNoteReferences = creditNoteReferences;
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

	public String getBillDateStr() {
		return billDateStr;
	}

	public void setBillDateStr(String billDateStr) {
		this.billDateStr = billDateStr;
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
}
