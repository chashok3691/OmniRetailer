package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;




public class SubAccountTypeMaster {

	private String subAccountTypeId;
	
	private String accountId;

	private String accountName;
	
	private String accountType;
	
	private String accountCategory;
	
	private boolean status;
	
	private Date createdDate;
	
	private Date updatedDate;
	
	private String accountDescription;
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private int totalRecords;
	
	private int startIndex;
	
	private int maxRecords;
	
	private String searchCritaria;
	
    private String startDate;
    
    private String endDate;
    
    private String createDateStr;
    
    private String updatedDateStr;
    
    private SubAccountTypeMaster accountTypeMaster;
    
    private List<SubAccountTypeMaster> accountTypeMasters;
    
    private List<String> subAccountIds;
    
	private String subAccountTypeStatus;
    
    
    
    public String getSubAccountTypeStatus() {
		return subAccountTypeStatus;
	}

	public void setSubAccountTypeStatus(String subAccountTypeStatus) {
		this.subAccountTypeStatus = subAccountTypeStatus;
	}

	public List<String> getSubAccountIds() {
		return subAccountIds;
	}

	public void setSubAccountIds(List<String> subAccountIds) {
		this.subAccountIds = subAccountIds;
	}

	public SubAccountTypeMaster getAccountTypeMaster() {
		return accountTypeMaster;
	}

	public void setAccountTypeMaster(SubAccountTypeMaster accountTypeMaster) {
		this.accountTypeMaster = accountTypeMaster;
	}

	public List<SubAccountTypeMaster> getAccountTypeMasters() {
		return accountTypeMasters;
	}

	public void setAccountTypeMasters(List<SubAccountTypeMaster> accountTypeMasters) {
		this.accountTypeMasters = accountTypeMasters;
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

	public int getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(int maxRecords) {
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

	public String getCreateDateStr() {
		return createDateStr;
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
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

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getAccountCategory() {
		return accountCategory;
	}

	public void setAccountCategory(String accountCategory) {
		this.accountCategory = accountCategory;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getAccountDescription() {
		return accountDescription;
	}

	public void setAccountDescription(String accountDescription) {
		this.accountDescription = accountDescription;
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
	
	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getSubAccountTypeId() {
		return subAccountTypeId;
	}

	public void setSubAccountTypeId(String subAccountTypeId) {
		this.subAccountTypeId = subAccountTypeId;
	}

	public String getUpdatedDateStr() {
		return updatedDateStr;
	}

	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}
	
	
	
}
