package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


public class ReconciliationMaster {
	
	private String reconciliationId;
	
	private String bankId;
	
	private String accountId;
	
	private String accountName;
	
	private BigDecimal differnceAmount;
	
	private Date reconciliationDate;
	
	private Date createdDate;
	
	private Date updatedDate;
	
	private String userName;
	
	private String roleName;
	
	private String comments;
	
	private String reconciliationDateStr;

	private String createdDateStr;
	
	private String updatedDateStr;
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private int totalRecords;
	
	private String startIndex;
	
	private String maxRecords;
	
	private String searchCritaria;
	
	private String startDate;
	
	private String endDate;
	
	private List<ReconciliationMaster> reconciliationMasters ;
	
	private List<ReconciliationDetails> reconciliationDetails ;
	private List<ReconciliationDetails> bankBookReconciliation;
	private List<ReconciliationDetails> transactionReconciliation;
	private List<ReconciliationDetails> assetTransactionList;
	private List<ReconciliationDetails> bankTransactionList;
	
	private List<Reconciliation> assetReconciliationDetails;
	private List<Reconciliation> bankReconciliationDetails;
	
	
	private float totalAssetCreditAmount;
	private float totalAssetDebitAmount;
	private float totalBankCreditAmount;
	private float totalBankDebitAmount;
	private float totalAssetDifference;
	private float totalBankDifference;
	
	
	
	public float getTotalAssetCreditAmount() {
		return totalAssetCreditAmount;
	}

	public void setTotalAssetCreditAmount(float totalAssetCreditAmount) {
		this.totalAssetCreditAmount = totalAssetCreditAmount;
	}

	public float getTotalAssetDebitAmount() {
		return totalAssetDebitAmount;
	}

	public void setTotalAssetDebitAmount(float totalAssetDebitAmount) {
		this.totalAssetDebitAmount = totalAssetDebitAmount;
	}

	public float getTotalBankCreditAmount() {
		return totalBankCreditAmount;
	}

	public void setTotalBankCreditAmount(float totalBankCreditAmount) {
		this.totalBankCreditAmount = totalBankCreditAmount;
	}

	public float getTotalBankDebitAmount() {
		return totalBankDebitAmount;
	}

	public void setTotalBankDebitAmount(float totalBankDebitAmount) {
		this.totalBankDebitAmount = totalBankDebitAmount;
	}

	public float getTotalAssetDifference() {
		return totalAssetDifference;
	}

	public void setTotalAssetDifference(float totalAssetDifference) {
		this.totalAssetDifference = totalAssetDifference;
	}

	public float getTotalBankDifference() {
		return totalBankDifference;
	}

	public void setTotalBankDifference(float totalBankDifference) {
		this.totalBankDifference = totalBankDifference;
	}

	public List<Reconciliation> getAssetReconciliationDetails() {
		return assetReconciliationDetails;
	}

	public void setAssetReconciliationDetails(List<Reconciliation> assetReconciliationDetails) {
		this.assetReconciliationDetails = assetReconciliationDetails;
	}

	public List<Reconciliation> getBankReconciliationDetails() {
		return bankReconciliationDetails;
	}

	public void setBankReconciliationDetails(List<Reconciliation> bankReconciliationDetails) {
		this.bankReconciliationDetails = bankReconciliationDetails;
	}

	public List<ReconciliationDetails> getAssetTransactionList() {
		return assetTransactionList;
	}

	public void setAssetTransactionList(List<ReconciliationDetails> assetTransactionList) {
		this.assetTransactionList = assetTransactionList;
	}

	public List<ReconciliationDetails> getBankTransactionList() {
		return bankTransactionList;
	}

	public void setBankTransactionList(List<ReconciliationDetails> bankTransactionList) {
		this.bankTransactionList = bankTransactionList;
	}

	public List<ReconciliationDetails> getBankBookReconciliation() {
		return bankBookReconciliation;
	}

	public void setBankBookReconciliation(List<ReconciliationDetails> bankBookReconciliation) {
		this.bankBookReconciliation = bankBookReconciliation;
	}

	public List<ReconciliationDetails> getTransactionReconciliation() {
		return transactionReconciliation;
	}

	public void setTransactionReconciliation(List<ReconciliationDetails> transactionReconciliation) {
		this.transactionReconciliation = transactionReconciliation;
	}

	public String getReconciliationId() {
		return reconciliationId;
	}

	public void setReconciliationId(String reconciliationId) {
		this.reconciliationId = reconciliationId;
	}

	public String getBankId() {
		return bankId;
	}

	public void setBankId(String bankId) {
		this.bankId = bankId;
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

	public BigDecimal getDiffernceAmount() {
		return differnceAmount;
	}

	public void setDiffernceAmount(BigDecimal differnceAmount) {
		this.differnceAmount = differnceAmount;
	}

	public Date getReconciliationDate() {
		return reconciliationDate;
	}

	public void setReconciliationDate(Date reconciliationDate) {
		this.reconciliationDate = reconciliationDate;
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

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getReconciliationDateStr() {
		return reconciliationDateStr;
	}

	public void setReconciliationDateStr(String reconciliationDateStr) {
		this.reconciliationDateStr = reconciliationDateStr;
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

	public List<ReconciliationMaster> getReconciliationMasters() {
		return reconciliationMasters;
	}

	public void setReconciliationMasters(List<ReconciliationMaster> reconciliationMasters) {
		this.reconciliationMasters = reconciliationMasters;
	}

	public List<ReconciliationDetails> getReconciliationDetails() {
		return reconciliationDetails;
	}

	public void setReconciliationDetails(List<ReconciliationDetails> reconciliationDetails) {
		this.reconciliationDetails = reconciliationDetails;
	}
	
	
	
	
	
	

}
