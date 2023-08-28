package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;




public class AssetAccounts {
	
	
	private String transactionRef;
	
	private String accountId;
	
	private String accountName;
	
	private String locationId;

	private String organizationId;
	
	private String userName;
	
	private String roleName;
	
	private BigDecimal creditAmount;
	
	private BigDecimal debitAmount;
	
	private Date createdDate;
	
	private Date UpdatedDate;
	
	private boolean status;
	private String accountTypeStatus;
	private String remarks;
	
	private String subAssetTransactionRef;
	private float transactionAmount;
	
	
	private String txnType;
	private String transactionDateStr;
	private String sno;
	private String transactionStatus;
	
	public String getTransactionStatus() {
		return transactionStatus;
	}

	public void setTransactionStatus(String transactionStatus) {
		this.transactionStatus = transactionStatus;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getTransactionDateStr() {
		return transactionDateStr;
	}

	public void setTransactionDateStr(String transactionDateStr) {
		this.transactionDateStr = transactionDateStr;
	}

	public String getTxnType() {
		return txnType;
	}

	public void setTxnType(String txnType) {
		this.txnType = txnType;
	}

	public float getTransactionAmount() {
		return transactionAmount;
	}

	public void setTransactionAmount(float transactionAmount) {
		this.transactionAmount = transactionAmount;
	}

	public String getAccountTypeStatus() {
		return accountTypeStatus;
	}

	public void setAccountTypeStatus(String accountTypeStatus) {
		this.accountTypeStatus = accountTypeStatus;
	}

	public String getSubAssetTransactionRef() {
		return subAssetTransactionRef;
	}

	public void setSubAssetTransactionRef(String subAssetTransactionRef) {
		this.subAssetTransactionRef = subAssetTransactionRef;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private int totalRecords;
	
	private int startIndex;
	
	private String maxRecords;
	
	private String searchCritaria;
	
	private String startDate;
	
	private String endDate;
	
	private String createdDateStr;
	
	private String updatedDateStr;
	
	List<AssetAccounts> assetAccounts;
	List<AssetAccounts> liabilityAccounts;
	List<AssetAccounts> incomeAccounts;
	List<AssetAccounts> expensesAccounts;

	
	public List<AssetAccounts> getLiabilityAccounts() {
		return liabilityAccounts;
	}

	public void setLiabilityAccounts(List<AssetAccounts> liabilityAccounts) {
		this.liabilityAccounts = liabilityAccounts;
	}

	public List<AssetAccounts> getIncomeAccounts() {
		return incomeAccounts;
	}

	public void setIncomeAccounts(List<AssetAccounts> incomeAccounts) {
		this.incomeAccounts = incomeAccounts;
	}

	public List<AssetAccounts> getExpensesAccounts() {
		return expensesAccounts;
	}

	public void setExpensesAccounts(List<AssetAccounts> expensesAccounts) {
		this.expensesAccounts = expensesAccounts;
	}

	List<String> transactionReferences;
	
	public List<String> getTransactionReferences() {
		return transactionReferences;
	}

	public void setTransactionReferences(List<String> transactionReferences) {
		this.transactionReferences = transactionReferences;
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

	public List<AssetAccounts> getAssetAccounts() {
		return assetAccounts;
	}

	public void setAssetAccounts(List<AssetAccounts> assetAccounts) {
		this.assetAccounts = assetAccounts;
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

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
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

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getTransactionRef() {
		return transactionRef;
	}

	public void setTransactionRef(String transactionRef) {
		this.transactionRef = transactionRef;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getLocationId() {
		return locationId;
	}

	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}

	public String getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(String organizationId) {
		this.organizationId = organizationId;
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

	public BigDecimal getCreditAmount() {
		return creditAmount;
	}

	public void setCreditAmount(BigDecimal creditAmount) {
		this.creditAmount = creditAmount;
	}

	public BigDecimal getDebitAmount() {
		return debitAmount;
	}

	public void setDebitAmount(BigDecimal debitAmount) {
		this.debitAmount = debitAmount;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return UpdatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		UpdatedDate = updatedDate;
	}
}
