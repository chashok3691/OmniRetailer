package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;






public class Cart {


	private String cartId;
	

	private String userId;
	
	private String userType;
	//private Date dateTime;
 
	private String shipmentPinCode; 
	
	private String location;
	
	private String ipAddress;
	
	private float totalItems;
	
	private float totalDiscounts;
 
	private float totalTax;
	
	private float totalCost;
	
	private String status;
 
	//private Date updatedOn;
	
	private String saleChannel;
	
	private String customerName;
	
	private String email;
	
	private String customerMobile;
	
	private String remarks;
 
	private List<CartItems> itemsList;	
	 private String totalRecords;
	private List<Integer> itemsIds;
	
	private RequestHeader requestHeader;
	
	private Integer startIndex;
	private boolean itemsRequired;
	private boolean saveReport;
	private Integer maxRecords;
	
	private String emailId;
	
	private String searchCriteria;
	
	private String enquiryDateStr;
	
	private String startDate;
	
	private String endDate;

	private String dateTimeStr;
	
	private String updatedOnStr;
	
	private String filePath;
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public boolean isSaveReport() {
		return saveReport;
	}

	public void setSaveReport(boolean saveReport) {
		this.saveReport = saveReport;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	/*public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}*/

	public String getShipmentPinCode() {
		return shipmentPinCode;
	}

	public void setShipmentPinCode(String shipmentPinCode) {
		this.shipmentPinCode = shipmentPinCode;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public float getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(float totalItems) {
		this.totalItems = totalItems;
	}

	public float getTotalDiscounts() {
		return totalDiscounts;
	}

	public void setTotalDiscounts(float totalDiscounts) {
		this.totalDiscounts = totalDiscounts;
	}

	public float getTotalTax() {
		return totalTax;
	}

	public void setTotalTax(float totalTax) {
		this.totalTax = totalTax;
	}

	public float getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(float totalCost) {
		this.totalCost = totalCost;
	}

	public List<Integer> getItemsIds() {
		return itemsIds;
	}

	public void setItemsIds(List<Integer> itemsIds) {
		this.itemsIds = itemsIds;
	}

	public List<CartItems> getItemsList() {
		return itemsList;
	}

	public void setItemsList(List<CartItems> itemsList) {
		this.itemsList = itemsList;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

/*	public Date getUpdatedOn() {
		return updatedOn;
	}
*/
	public String getDateTimeStr() {
		return dateTimeStr;
	}

	public void setDateTimeStr(String dateTimeStr) {
		this.dateTimeStr = dateTimeStr;
	}

	public String getUpdatedOnStr() {
		return updatedOnStr;
	}

	public void setUpdatedOnStr(String updatedOnStr) {
		this.updatedOnStr = updatedOnStr;
	}

	/*public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}*/

	public String getSaleChannel() {
		return saleChannel;
	}

	public void setSaleChannel(String saleChannel) {
		this.saleChannel = saleChannel;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCustomerMobile() {
		return customerMobile;
	}

	public void setCustomerMobile(String customerMobile) {
		this.customerMobile = customerMobile;
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

	public String getEnquiryDateStr() {
		return enquiryDateStr;
	}

	public void setEnquiryDateStr(String enquiryDateStr) {
		this.enquiryDateStr = enquiryDateStr;
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

	public Integer getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}

	public Integer getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(Integer maxRecords) {
		this.maxRecords = maxRecords;
	}

	
	public boolean isItemsRequired() {
		return itemsRequired;
	}

	public void setItemsRequired(boolean itemsRequired) {
		this.itemsRequired = itemsRequired;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

}
