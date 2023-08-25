package com.tlabs.posweb.beans;


import java.util.List;



public class AccountTypeMaster {

	
	private String accountId;

	
	private String accountName;
	
	
	private String accountType;
	
	
	private String accountCategory;
	
	
	private boolean status;
	
	
	private String createdDate;
	
	private List<SubAccountTypeMaster> subAccountTypeMasters;
	private String accountDescription;
	private String bankBookStatus;
	
	
	
	public List<SubAccountTypeMaster> getSubAccountTypeMasters() {
		return subAccountTypeMasters;
	}

	public void setSubAccountTypeMasters(List<SubAccountTypeMaster> subAccountTypeMasters) {
		this.subAccountTypeMasters = subAccountTypeMasters;
	}

	public String getBankBookStatus() {
		return bankBookStatus;
	}

	public void setBankBookStatus(String bankBookStatus) {
		this.bankBookStatus = bankBookStatus;
	}

	private RequestHeader requestHeader;
	
	
	private ResponseHeader responseHeader;
	
	
	private int totalRecords;
	
	
	private int startIndex;
	
	
	private int maxRecords;
	
	
	private String searchCritaria;
	
	
    private String startDate;
    
    
    private String endDate;
    
   
    private String createDateStr;
    
    private String accountTypeStatus;
    private String organizationId;
    private AccountTypeMaster accountTypeMaster;
    
    
    
    public String getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(String organizationId) {
		this.organizationId = organizationId;
	}

	public String getAccountTypeStatus() {
		return accountTypeStatus;
	}

	public void setAccountTypeStatus(String accountTypeStatus) {
		this.accountTypeStatus = accountTypeStatus;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	private String location;
    
    
    private List<AccountTypeMaster> accountTypeMasters;
    
    
    private List<String> accountIds;
    
    public List<String> getAccountIds() {
		return accountIds;
	}

	public void setAccountIds(List<String> accountIds) {
		this.accountIds = accountIds;
	}

	public List<AccountTypeMaster> getAccountTypeMasters() {
		return accountTypeMasters;
	}

	public void setAccountTypeMasters(List<AccountTypeMaster> accountTypeMasters) {
		this.accountTypeMasters = accountTypeMasters;
	}

	public AccountTypeMaster getAccountTypeMaster() {
		return accountTypeMaster;
	}

	public void setAccountTypeMaster(AccountTypeMaster accountTypeMaster) {
		this.accountTypeMaster = accountTypeMaster;
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

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
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
	
	
}
