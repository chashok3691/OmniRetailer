package com.tlabs.posweb.beans;


import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * @modified_By  : Ramu K
 * @modified_On  : 25-10-2021
*/
///@Table(name="event_inventory_transfer_temp")
public class EventInventoryTransferReport {

	
	private int s_no;
	
	private String eventId;
	
	private String eventName;
	
	private String storeLocation;
	
	private Date date;
	
	private String skuId;
	
	private String uom;
	
	private Double issuedQuantity;
	
	private Double consumedQuantity;
	
	private Double wastageQuantity;
	
	private Double returnQuantity;
	
	private RequestHeader requestHeader;
	
	private String maxRecords;
	
	private String startIndex;
	
	private List<String> locationsList;
	
	private String totalRecords;
	
	private String searchCriteria;
	private String workflowStatus;
	private float price;
	private String strDate;
	
	
	
	public String getStrDate() {
		return strDate;
	}

	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}

	public String getWorkflowStatus() {
		return workflowStatus;
	}

	public void setWorkflowStatus(String workflowStatus) {
		this.workflowStatus = workflowStatus;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}


	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getURL() {
		return URL;
	}

	public void setURL(String uRL) {
		URL = uRL;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	private String URL;
	private String zoneId;
	
	private ResponseHeader responseHeader;
	
	private String startDate;
	private String endDate;
	
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

	private String location;
	
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	private List<EventInventoryTransferReport> InventoryTransferList;
	
	public List<EventInventoryTransferReport> getInventoryTransferList() {
		return InventoryTransferList;
	}

	public void setInventoryTransferList(List<EventInventoryTransferReport> inventoryTransferList) {
		InventoryTransferList = inventoryTransferList;
	}

	private boolean saveReport=false;
	
	public boolean isSaveReport() {
		return saveReport;
	}

	public void setSaveReport(boolean saveReport) {
		this.saveReport = saveReport;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public Double getIssuedQuantity() {
		return issuedQuantity;
	}

	public void setIssuedQuantity(Double issuedQuantity) {
		this.issuedQuantity = issuedQuantity;
	}

	public Double getConsumedQuantity() {
		return consumedQuantity;
	}

	public void setConsumedQuantity(Double consumedQuantity) {
		this.consumedQuantity = consumedQuantity;
	}

	public Double getWastageQuantity() {
		return wastageQuantity;
	}

	public void setWastageQuantity(Double wastageQuantity) {
		this.wastageQuantity = wastageQuantity;
	}

	public Double getReturnQuantity() {
		return returnQuantity;
	}

	public void setReturnQuantity(Double returnQuantity) {
		this.returnQuantity = returnQuantity;
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
