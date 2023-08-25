package com.tlabs.posweb.beans;

//import java.util.Date;
import java.util.List;

public class DenominationMaster {
	
	private Float denominationValue;

	private String denominationName;
	
	private String denominationType;

	private String denominationImage;

	private String description;

	private String roleName;

	private String userName;

	private Boolean denominationStatus;
	private DenominationMaster denominations;
	
	private RequestHeader requestHeader;

	private String startIndex;

	private String maxRecords;

	private String searchCriteria;

	private String startDateStr;

	private String endDateStr;

	private String denomImageId;
	
	
	private String currencyCode;

	//private String currencyCode;
	
	private List<String> denomNamesList;

	public String getDenominationName() {
		return denominationName;
	}

	public void setDenominationName(String denominationName) {
		this.denominationName = denominationName;
	}

	public String getDenominationImage() {
		return denominationImage;
	}

	public void setDenominationImage(String denominationImage) {
		this.denominationImage = denominationImage;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public List<String> getDenomNamesList() {
		return denomNamesList;
	}

	public void setDenomNamesList(List<String> denomNamesList) {
		this.denomNamesList = denomNamesList;
	}

	public void setDenominationValue(Float denominationValue) {
		this.denominationValue = denominationValue;
	}

	public void setDenominationType(String denominationType) {
		this.denominationType = denominationType;
	}

	public Float getDenominationValue() {
		return denominationValue;
	}

	public String getDenominationType() {
		return denominationType;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Boolean getDenominationStatus() {
		return denominationStatus;
	}

	public void setDenominationStatus(Boolean denominationStatus) {
		this.denominationStatus = denominationStatus;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
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

	 
	public String getDenomImageId() {
		return denomImageId;
	}

	public void setDenomImageId(String denomImageId) {
		this.denomImageId = denomImageId;
	}


	public DenominationMaster getDenominations() {
		return denominations;
	}

	public void setDenominations(DenominationMaster denominations) {
		this.denominations = denominations;
	}

	public String getCurrencyCode() {
		return currencyCode;
	}

	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}

}
