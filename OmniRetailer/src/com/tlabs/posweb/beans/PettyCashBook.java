package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


public class PettyCashBook {

	private String transactionId;
	
	private String voucherNo;
	
	private String transactionDescription;
	
	private String bankAccount;
	
	private String receivedFrom;
	
	private String givenBy;
	
	private String receivedBy;
	 
	private String purpose;
	
	private String location;
	
	private String organizationId;
	
	private String transactionType;
	
	private String transactionAmount;
	
	private Date transactionDate;
	
	private Date createdDate;
	
	private Date updatedDate;
	
	private String userName;
	
	private String roleName;
	
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
	
	private String transactionDateStr;
	private String paymentId;
	private String receiptId;
	private String filePath;
	private List<PettyCashBook> cashBookList;
	private List<PettyCashBook> cashReceipts;
	private List<PettyCashBook> cashPayments;
	private float receiptAmount;
	private float paidAmount;
	private float totalPaidAmount;
	private float totalReceiptAmount;
	private float totalCashPaymentRecords;
	private float totalCashReceiptRecords;
	private boolean saveReport;

	
	
	public String getReceiptId() {
		return receiptId;
	}

	public void setReceiptId(String receiptId) {
		this.receiptId = receiptId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public float getTotalPaidAmount() {
		return totalPaidAmount;
	}

	public void setTotalPaidAmount(float totalPaidAmount) {
		this.totalPaidAmount = totalPaidAmount;
	}

	public float getTotalReceiptAmount() {
		return totalReceiptAmount;
	}

	public void setTotalReceiptAmount(float totalReceiptAmount) {
		this.totalReceiptAmount = totalReceiptAmount;
	}

	public float getTotalCashPaymentRecords() {
		return totalCashPaymentRecords;
	}

	public void setTotalCashPaymentRecords(float totalCashPaymentRecords) {
		this.totalCashPaymentRecords = totalCashPaymentRecords;
	}

	public float getTotalCashReceiptRecords() {
		return totalCashReceiptRecords;
	}

	public void setTotalCashReceiptRecords(float totalCashReceiptRecords) {
		this.totalCashReceiptRecords = totalCashReceiptRecords;
	}

	public boolean isSaveReport() {
		return saveReport;
	}

	public void setSaveReport(boolean saveReport) {
		this.saveReport = saveReport;
	}

	public float getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(float paidAmount) {
		this.paidAmount = paidAmount;
	}

	public float getReceiptAmount() {
		return receiptAmount;
	}

	public void setReceiptAmount(float receiptAmount) {
		this.receiptAmount = receiptAmount;
	}

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public List<PettyCashBook> getCashReceipts() {
		return cashReceipts;
	}

	public void setCashReceipts(List<PettyCashBook> cashReceipts) {
		this.cashReceipts = cashReceipts;
	}

	public List<PettyCashBook> getCashPayments() {
		return cashPayments;
	}

	public void setCashPayments(List<PettyCashBook> cashPayments) {
		this.cashPayments = cashPayments;
	}

	public List<PettyCashBook> getCashBookList() {
		return cashBookList;
	}

	public void setCashBookList(List<PettyCashBook> cashBookList) {
		this.cashBookList = cashBookList;
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

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getVoucherNo() {
		return voucherNo;
	}

	public void setVoucherNo(String voucherNo) {
		this.voucherNo = voucherNo;
	}

	public String getTransactionDescription() {
		return transactionDescription;
	}

	public void setTransactionDescription(String transactionDescription) {
		this.transactionDescription = transactionDescription;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public String getReceivedFrom() {
		return receivedFrom;
	}

	public void setReceivedFrom(String receivedFrom) {
		this.receivedFrom = receivedFrom;
	}

	public String getGivenBy() {
		return givenBy;
	}

	public void setGivenBy(String givenBy) {
		this.givenBy = givenBy;
	}

	public String getReceivedBy() {
		return receivedBy;
	}

	public void setReceivedBy(String receivedBy) {
		this.receivedBy = receivedBy;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
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

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public String getTransactionAmount() {
		return transactionAmount;
	}

	public void setTransactionAmount(String transactionAmount) {
		this.transactionAmount = transactionAmount;
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
