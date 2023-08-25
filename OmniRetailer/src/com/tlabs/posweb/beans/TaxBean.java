package com.tlabs.posweb.beans;

import java.util.List;

public class TaxBean {
	
	private RequestHeader requestHeader;
	/* for header information */
	/*private String userName;
	private String accessKey;
	private String applicationName;
	private String dateAndTime;
	private String correlationId;*/ 
  
	
	/* for response */
	/*private String responseCode;
	private String responseMessage;*/
//	@Transient
	private List<TaxLocations> taxLocationsList;
	
	
	public List<TaxLocations> getTaxLocationsList() {
		return taxLocationsList;
	}

	public void setTaxLocationsList(List<TaxLocations> taxLocationsList) {
		this.taxLocationsList = taxLocationsList;
	}

	private String maxRecords;
	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	/*private String customerId;*/
	private List<?> taxList;
	private String startIndex;
	private String taxId;
	private String taxName;
	private String taxDescription;
	private String totalRecords;
	private String searchCriteria;
	private List<String> deletedItems;
	private List<String> nonDeletedItems;
	
	
	/*public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAccessKey() {
		return accessKey;
	}

	public void setAccessKey(String accessKey) {
		this.accessKey = accessKey;
	}

	public String getApplicationName() {
		return applicationName;
	}

	public void setApplicationName(String applicationName) {
		this.applicationName = applicationName;
	}

	public String getDateAndTime() {
		return dateAndTime;
	}

	public void setDateAndTime(String dateAndTime) {
		this.dateAndTime = dateAndTime;
	}

	public String getCorrelationId() {
		return correlationId;
	}

	public void setCorrelationId(String correlationId) {
		this.correlationId = correlationId;
	}*/
	
	
	
	public String getSearchCriteria() {
		return searchCriteria;
	}

	public List<String> getDeletedItems() {
		return deletedItems;
	}

	public void setDeletedItems(List<String> deletedItems) {
		this.deletedItems = deletedItems;
	}

	public List<String> getNonDeletedItems() {
		return nonDeletedItems;
	}

	public void setNonDeletedItems(List<String> nonDeletedItems) {
		this.nonDeletedItems = nonDeletedItems;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getTaxId() {
		return taxId;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public void setTaxId(String taxId) {
		this.taxId = taxId;
	}

	public String getTaxName() {
		return taxName;
	}

	public void setTaxName(String taxName) {
		this.taxName = taxName;
	}

	/*public String getResponseCode() {
		return responseCode;
	}

	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}

	public String getResponseMessage() {
		return responseMessage;
	}

	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}*/

	
	public List<?> getTaxList() {
		return taxList;
	}

	public void setTaxList(List<?> taxList) {
		this.taxList = taxList;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getTaxDescription() {
		return taxDescription;
	}

	public void setTaxDescription(String taxDescription) {
		this.taxDescription = taxDescription;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}


}
