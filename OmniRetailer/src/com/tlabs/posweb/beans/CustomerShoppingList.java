package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;



public class CustomerShoppingList {

	
	
	
	private String channel;
	private String zoneID;
	private String listDescription;
    private String status;
	private String country;
	

	private String customerCategory;
	
	
	
	private String listId;

	private String customerPhNum;
	

	private String listName;
	

	private float timePeriod;
	
	
	private Date createdOn;
	

	private Date updatedOn;
 

	private boolean periodicDelivery;
	

	private String specialInstructions;
	

	private List<CustomerShoppingItemsList> itemsList;
	

	private int totalItemsInList;
	

	private String createdOnStr;
	

	private String updatedOnStr;
	

	private RequestHeader requestHeader;
	

	private ResponseHeader responseHeader;
	

	private String startIndex;
	

	private String maxRecords;
	

	private String searchCriteria;
	

	private String startDate;
	

	private String endDate;
	

	private boolean periodicListRequired;
	

	private List<String> listIds;
	

	private Float salePrice;
	
	
	
	
	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getZoneID() {
		return zoneID;
	}

	public void setZoneID(String zoneID) {
		this.zoneID = zoneID;
	}

	public String getListDescription() {
		return listDescription;
	}

	public void setListDescription(String listDescription) {
		this.listDescription = listDescription;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCustomerCategory() {
		return customerCategory;
	}

	public void setCustomerCategory(String customerCategory) {
		this.customerCategory = customerCategory;
	}
	
	
	
	
	
	
	
	
	
	public boolean isPeriodicDelivery() {
		return periodicDelivery;
	}

	public void setPeriodicDelivery(boolean periodicDelivery) {
		this.periodicDelivery = periodicDelivery;
	}
 
	public String getListId() {
		return listId;
	}

	public void setListId(String listId) {
		this.listId = listId;
	}

	 
	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}


	public String getSpecialInstructions() {
		return specialInstructions;
	}

	public void setSpecialInstructions(String specialInstructions) {
		this.specialInstructions = specialInstructions;
	}

	public float getTimePeriod() {
		return timePeriod;
	}

	public void setTimePeriod(float timePeriod) {
		this.timePeriod = timePeriod;
	}

	public String getCreatedOnStr() {
		return createdOnStr;
	}

	public void setCreatedOnStr(String createdOnStr) {
		this.createdOnStr = createdOnStr;
	}

	public String getUpdatedOnStr() {
		return updatedOnStr;
	}

	public void setUpdatedOnStr(String updatedOnStr) {
		this.updatedOnStr = updatedOnStr;
	}

	public List<CustomerShoppingItemsList> getItemsList() {
		return itemsList;
	}

	public void setItemsList(List<CustomerShoppingItemsList> itemsList) {
		this.itemsList = itemsList;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public String getListName() {
		return listName;
	}

	public void setListName(String listName) {
		this.listName = listName;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public int getTotalItemsInList() {
		return totalItemsInList;
	}

	public void setTotalItemsInList(int totalItemsInList) {
		this.totalItemsInList = totalItemsInList;
	}

	public String getCustomerPhNum() {
		return customerPhNum;
	}

	public void setCustomerPhNum(String customerPhNum) {
		this.customerPhNum = customerPhNum;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public Float getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Float salePrice) {
		this.salePrice = salePrice;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public List<String> getListIds() {
		return listIds;
	}

	public void setListIds(List<String> listIds) {
		this.listIds = listIds;
	}

	public boolean isPeriodicListRequired() {
		return periodicListRequired;
	}

	public void setPeriodicListRequired(boolean periodicListRequired) {
		this.periodicListRequired = periodicListRequired;
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

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	
	
	
}
