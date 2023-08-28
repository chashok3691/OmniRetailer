package com.tlabs.posweb.beans;

import java.util.List;

public class LoyaltyCards {
	
	private String loyaltyCardNumber;
	private String loyaltyProgramNumber;
	private String cardStatus;
	private String assignedStatus;
	private ResponseHeader responseHeader;
	private String cardId;
	private String searchCriteria;
	private String status;

	private boolean saveLoyaltyCardFlag;
	
	private String startDateStr;
	private String endDateStr;
	public String getEndDateStr() {
		return endDateStr;
	}
	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}
	public String getStartDateStr() {
		return startDateStr;
	}
	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}
	private String customerMobile;
	public String getCustomerMobile() {
		return customerMobile;
	}
	public void setCustomerMobile(String customerMobile) {
		this.customerMobile = customerMobile;
	}
	private boolean otpRequired;
	
	
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public LoyaltyCards clone() {
		LoyaltyCards loyaltyCardsInfo = null;
		try {
			loyaltyCardsInfo = (LoyaltyCards) super.clone();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return loyaltyCardsInfo;
	}
	
	public boolean isOtpRequired() {
		return otpRequired;
	}
	public void setOtpRequired(boolean otpRequired) {
		this.otpRequired = otpRequired;
	}
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public String getLoyaltyCardNumber() {
		return loyaltyCardNumber;
	}
	public void setLoyaltyCardNumber(String loyaltyCardNumber) {
		this.loyaltyCardNumber = loyaltyCardNumber;
	}
	public String getLoyaltyProgramNumber() {
		return loyaltyProgramNumber;
	}
	public void setLoyaltyProgramNumber(String loyaltyProgramNumber) {
		this.loyaltyProgramNumber = loyaltyProgramNumber;
	}
	public String getCardStatus() {
		return cardStatus;
	}
	public void setCardStatus(String cardStatus) {
		this.cardStatus = cardStatus;
	}
	public String getAssignedStatus() {
		return assignedStatus;
	}
	public void setAssignedStatus(String assignedStatus) {
		this.assignedStatus = assignedStatus;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	
	public List<CustomerLoyaltyCards> customerLoyaltyCardsList;
	private int MaxRecords;
	private String assignedCustId;
    private String start_date;
	private String end_date;
	private String startIndex;
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public boolean isSaveLoyaltyCardFlag() {
		return saveLoyaltyCardFlag;
	}
	public void setSaveLoyaltyCardFlag(boolean saveLoyaltyCardFlag) {
		this.saveLoyaltyCardFlag = saveLoyaltyCardFlag;
	}
	public List<CustomerLoyaltyCards> getCustomerLoyaltyCardsList() {
		return customerLoyaltyCardsList;
	}
	public void setCustomerLoyaltyCardsList(List<CustomerLoyaltyCards> customerLoyaltyCardsList) {
		this.customerLoyaltyCardsList = customerLoyaltyCardsList;
	}
	public int getMaxRecords() {
		return MaxRecords;
	}
	public void setMaxRecords(int maxRecords) {
		MaxRecords = maxRecords;
	}
	public String getAssignedCustId() {
		return assignedCustId;
	}
	public void setAssignedCustId(String assignedCustId) {
		this.assignedCustId = assignedCustId;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	
	
	

}
