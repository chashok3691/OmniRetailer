package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;
import java.util.Set;



public class BalanceSheetBean {
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private List<AssetAccounts> assetList;
	
	private List<TrialBalanceBean> trialBalanceBean;
	
	private List<LiabilityAccounts> liabilityList;
	
	private List<Object[]> assetsList;
	
	private List<BalanceSheetBean> liabilitiesList;
	
	private List<BalanceSheetBean> equityList;
	
	private List<IncomeAccounts> incomeList;
	
	private List<ExpensesAccounts> expensesList;
	
	private String flowName;
	private String startDate;
	private String subAccountName;
	private String endDate;
	private String bussinessCycle;
	
	private String Locations;

	private String accountId;
	
	private String accountName;
	
	private String accountCategory;
	
	private String accountType;
	
	private int totalAssetRecords;
	
	private int totalLiabilityRecords;
	
	private int startIndex;
	
	private int maxRecords;
	
	private String organizationId;
	
	private Set<String> locationsList;
	
	private BigDecimal totalAssetAmount;
	
	private BigDecimal totalLiabilityAmount;
	
	private BigDecimal totalIncomeAmount;
	
	private BigDecimal totalExpensesAmount;
	
	private int totalIncomeRecords;
	
	private int totalExpensesRecords;
	
	private int totalRecords;
	
	private String uploadedFilePath;
	
	private List<CurrentAssetBean> currentAssetTransactionList;
	
	private List<LongRunAssetBean> longRunAssetTransactionList;
	private float totalCreditAmount;
	private float totalDebitAmount;
	 private BigDecimal dayStartValue;
     
     private BigDecimal dayEndValue;
     
     
     
     
     public BigDecimal getDayStartValue() {
             return dayStartValue;
     }

     public void setDayStartValue(BigDecimal dayStartValue) {
             this.dayStartValue = dayStartValue;
     }

     public BigDecimal getDayEndValue() {
             return dayEndValue;
     }

     public void setDayEndValue(BigDecimal dayEndValue) {
             this.dayEndValue = dayEndValue;
     }

	
	public String getSubAccountName() {
		return subAccountName;
	}

	public void setSubAccountName(String subAccountName) {
		this.subAccountName = subAccountName;
	}

	public String getFlowName() {
		return flowName;
	}
	

	public String getBussinessCycle() {
		return bussinessCycle;
	}

	public void setBussinessCycle(String bussinessCycle) {
		this.bussinessCycle = bussinessCycle;
	}

	public void setFlowName(String flowName) {
		this.flowName = flowName;
	}

	public float getTotalCreditAmount() {
		return totalCreditAmount;
	}

	public void setTotalCreditAmount(float totalCreditAmount) {
		this.totalCreditAmount = totalCreditAmount;
	}

	public float getTotalDebitAmount() {
		return totalDebitAmount;
	}

	public void setTotalDebitAmount(float totalDebitAmount) {
		this.totalDebitAmount = totalDebitAmount;
	}

	public List<BalanceSheetBean> getEquityList() {
		return equityList;
	}

	public void setEquityList(List<BalanceSheetBean> equityList) {
		this.equityList = equityList;
	}

	
	

	public List<CurrentAssetBean> getCurrentAssetTransactionList() {
		return currentAssetTransactionList;
	}

	public void setCurrentAssetTransactionList(List<CurrentAssetBean> currentAssetTransactionList) {
		this.currentAssetTransactionList = currentAssetTransactionList;
	}

	public List<LongRunAssetBean> getLongRunAssetTransactionList() {
		return longRunAssetTransactionList;
	}

	public void setLongRunAssetTransactionList(List<LongRunAssetBean> longRunAssetTransactionList) {
		this.longRunAssetTransactionList = longRunAssetTransactionList;
	}

	public String getAccountCategory() {
		return accountCategory;
	}

	public void setAccountCategory(String accountCategory) {
		this.accountCategory = accountCategory;
	}

	

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<TrialBalanceBean> getTrialBalanceBean() {
		return trialBalanceBean;
	}

	public void setTrialBalanceBean(List<TrialBalanceBean> trialBalanceBean) {
		this.trialBalanceBean = trialBalanceBean;
	}

	public BigDecimal getTotalIncomeAmount() {
		return totalIncomeAmount;
	}

	public void setTotalIncomeAmount(BigDecimal totalIncomeAmount) {
		this.totalIncomeAmount = totalIncomeAmount;
	}

	public BigDecimal getTotalExpensesAmount() {
		return totalExpensesAmount;
	}

	public void setTotalExpensesAmount(BigDecimal totalExpensesAmount) {
		this.totalExpensesAmount = totalExpensesAmount;
	}

	public int getTotalIncomeRecords() {
		return totalIncomeRecords;
	}

	public void setTotalIncomeRecords(int totalIncomeRecords) {
		this.totalIncomeRecords = totalIncomeRecords;
	}

	public int getTotalExpensesRecords() {
		return totalExpensesRecords;
	}

	public void setTotalExpensesRecords(int totalExpensesRecords) {
		this.totalExpensesRecords = totalExpensesRecords;
	}

	public List<IncomeAccounts> getIncomeList() {
		return incomeList;
	}

	public void setIncomeList(List<IncomeAccounts> incomeList) {
		this.incomeList = incomeList;
	}

	public List<ExpensesAccounts> getExpensesList() {
		return expensesList;
	}

	public void setExpensesList(List<ExpensesAccounts> expensesList) {
		this.expensesList = expensesList;
	}

	public List<Object[]> getAssetsList() {
		return assetsList;
	}

	public void setAssetsList(List<Object[]> assetsList) {
		this.assetsList = assetsList;
	}

	

	public List<BalanceSheetBean> getLiabilitiesList() {
		return liabilitiesList;
	}

	public void setLiabilitiesList(List<BalanceSheetBean> liabilitiesList) {
		this.liabilitiesList = liabilitiesList;
	}

	public BigDecimal getTotalAssetAmount() {
		return totalAssetAmount;
	}

	public void setTotalAssetAmount(BigDecimal totalAssetAmount) {
		this.totalAssetAmount = totalAssetAmount;
	}

	public BigDecimal getTotalLiabilityAmount() {
		return totalLiabilityAmount;
	}

	public void setTotalLiabilityAmount(BigDecimal totalLiabilityAmount) {
		this.totalLiabilityAmount = totalLiabilityAmount;
	}

	public int getTotalAssetRecords() {
		return totalAssetRecords;
	}

	public void setTotalAssetRecords(int totalAssetRecords) {
		this.totalAssetRecords = totalAssetRecords;
	}

	public int getTotalLiabilityRecords() {
		return totalLiabilityRecords;
	}

	public void setTotalLiabilityRecords(int totalLiabilityRecords) {
		this.totalLiabilityRecords = totalLiabilityRecords;
	}

	public Set<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(Set<String> locationsList) {
		this.locationsList = locationsList;
	}

	public String getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(String organizationId) {
		this.organizationId = organizationId;
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

	public List<AssetAccounts> getAssetList() {
		return assetList;
	}

	public void setAssetList(List<AssetAccounts> assetList) {
		this.assetList = assetList;
	}

	public List<LiabilityAccounts> getLiabilityList() {
		return liabilityList;
	}

	public void setLiabilityList(List<LiabilityAccounts> liabilityList) {
		this.liabilityList = liabilityList;
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

	public String getLocations() {
		return Locations;
	}

	public void setLocations(String locations) {
		Locations = locations;
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

	public String getUploadedFilePath() {
		return uploadedFilePath;
	}

	public void setUploadedFilePath(String uploadedFilePath) {
		this.uploadedFilePath = uploadedFilePath;
	}
	
	
	
}
