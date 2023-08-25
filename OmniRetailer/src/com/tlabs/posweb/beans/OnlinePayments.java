package com.tlabs.posweb.beans;

import java.util.Date;

public class OnlinePayments {
	
	private Integer sno;
	
	private String  customerId;
	
	private String  organizationName;
	
	private boolean cardPaymentEnabled;
	
	private boolean masterCard;
	
	private boolean visaCard;
	
	private boolean amexCard;
	
	private boolean onlineBankingEnabled;
	
	private boolean storeCardInfo;
	
	private String onlineBankingAggregator;
	
	private String onlineMerchantId;
	
	private String onlineMerchantPwd;
	
	private boolean walletAggregationEnabled;
	
	private boolean allWalletSupport;
	
	private String walletAggregator;
	
	private String walletMerchantId;
	
	private String walletMerchantPwd;
	
	private Date createdDate;
	
	private Date updatedDate;
	
	private String userName;
	
	private String userRole;
	
	private String remarks;

	private RequestHeader requestHeader;

	private String searchCriteria;
	
	private String startDateStr;
	
	private String endDateStr;
	
	private String startIndex;
	
	private String maxRecords;
	
	private String createdDateStr;
	
	private String updatedDateStr;
	
	private String newMerchantId;
	
	private String newMerchantPwd; 
	
	private String newWalletMerchantId;

	private String newWalletMerchantPwd;
	
    public String getNewWalletMerchantId() {
		return newWalletMerchantId;
	}

	public void setNewWalletMerchantId(String newWalletMerchantId) {
		this.newWalletMerchantId = newWalletMerchantId;
	}

	public String getNewWalletMerchantPwd() {
		return newWalletMerchantPwd;
	}

	public void setNewWalletMerchantPwd(String newWalletMerchantPwd) {
		this.newWalletMerchantPwd = newWalletMerchantPwd;
	}




	public Integer getSno() {
		return sno;
	}

	public void setSno(Integer sno) {
		this.sno = sno;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public boolean isCardPaymentEnabled() {
		return cardPaymentEnabled;
	}

	public void setCardPaymentEnabled(boolean cardPaymentEnabled) {
		this.cardPaymentEnabled = cardPaymentEnabled;
	}

	public boolean isMasterCard() {
		return masterCard;
	}

	public void setMasterCard(boolean masterCard) {
		this.masterCard = masterCard;
	}

	public boolean isVisaCard() {
		return visaCard;
	}

	public void setVisaCard(boolean visaCard) {
		this.visaCard = visaCard;
	}

	public boolean isAmexCard() {
		return amexCard;
	}

	public void setAmexCard(boolean amexCard) {
		this.amexCard = amexCard;
	}

	public boolean isOnlineBankingEnabled() {
		return onlineBankingEnabled;
	}

	public void setOnlineBankingEnabled(boolean onlineBankingEnabled) {
		this.onlineBankingEnabled = onlineBankingEnabled;
	}

	public boolean isStoreCardInfo() {
		return storeCardInfo;
	}

	public void setStoreCardInfo(boolean storeCardInfo) {
		this.storeCardInfo = storeCardInfo;
	}

	public String getOnlineBankingAggregator() {
		return onlineBankingAggregator;
	}

	public void setOnlineBankingAggregator(String onlineBankingAggregator) {
		this.onlineBankingAggregator = onlineBankingAggregator;
	}

	public String getOnlineMerchantId() {
		return onlineMerchantId;
	}

	public void setOnlineMerchantId(String onlineMerchantId) {
		this.onlineMerchantId = onlineMerchantId;
	}

	public String getOnlineMerchantPwd() {
		return onlineMerchantPwd;
	}

	public void setOnlineMerchantPwd(String onlineMerchantPwd) {
		this.onlineMerchantPwd = onlineMerchantPwd;
	}

	public boolean isWalletAggregationEnabled() {
		return walletAggregationEnabled;
	}

	public void setWalletAggregationEnabled(boolean walletAggregationEnabled) {
		this.walletAggregationEnabled = walletAggregationEnabled;
	}

	public boolean isAllWalletSupport() {
		return allWalletSupport;
	}

	public void setAllWalletSupport(boolean allWalletSupport) {
		this.allWalletSupport = allWalletSupport;
	}

	public String getWalletAggregator() {
		return walletAggregator;
	}

	public void setWalletAggregator(String walletAggregator) {
		this.walletAggregator = walletAggregator;
	}

	public String getWalletMerchantId() {
		return walletMerchantId;
	}

	public void setWalletMerchantId(String walletMerchantId) {
		this.walletMerchantId = walletMerchantId;
	}

	public String getWalletMerchantPwd() {
		return walletMerchantPwd;
	}

	public void setWalletMerchantPwd(String walletMerchantPwd) {
		this.walletMerchantPwd = walletMerchantPwd;
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

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
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

	public String getNewMerchantId() {
		return newMerchantId;
	}

	public void setNewMerchantId(String newMerchantId) {
		this.newMerchantId = newMerchantId;
	}

	public String getNewMerchantPwd() {
		return newMerchantPwd;
	}

	public void setNewMerchantPwd(String newMerchantPwd) {
		this.newMerchantPwd = newMerchantPwd;
	}
	
	
	
}