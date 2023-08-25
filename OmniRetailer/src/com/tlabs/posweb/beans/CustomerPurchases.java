package com.tlabs.posweb.beans;

import java.util.List;

public class CustomerPurchases {

	private String startIndexForBilling;
	private String maxRecordsForBilling;
	private boolean requiredBillingDetails;
	private String email;
	private String phoneNumber;
//	private String startDate;
//	private String endDate;
	private RequestHeader requestHeader;
	private List<CustomerPurchases> itemsList;
	private String totalRecords;
	private String billId;
	private String sku_id;
	private String item_name;
	private float quantity;
	private float item_total_price;
	private int slNo;
    private String searchCriteriaForBills;
    
    
    private String storeLocation;
    private String color;
    private String size;
    private String productRange;
    private String billedDate;
	private float itemUnitPrice;
    
    
	public String getBilledDate() {
		return billedDate;
	}
	public void setBilledDate(String billedDate) {
		this.billedDate = billedDate;
	}
	public float getItemUnitPrice() {
		return itemUnitPrice;
	}
	public void setItemUnitPrice(float itemUnitPrice) {
		this.itemUnitPrice = itemUnitPrice;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getProductRange() {
		return productRange;
	}
	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public String getSearchCriteriaForBills() {
		return searchCriteriaForBills;
	}
	public void setSearchCriteriaForBills(String searchCriteriaForBills) {
		this.searchCriteriaForBills = searchCriteriaForBills;
	}
	public String getStartIndexForBilling() {
		return startIndexForBilling;
	}
	public void setStartIndexForBilling(String startIndexForBilling) {
		this.startIndexForBilling = startIndexForBilling;
	}
	public String getMaxRecordsForBilling() {
		return maxRecordsForBilling;
	}
	public void setMaxRecordsForBilling(String maxRecordsForBilling) {
		this.maxRecordsForBilling = maxRecordsForBilling;
	}
	public boolean isRequiredBillingDetails() {
		return requiredBillingDetails;
	}
	public void setRequiredBillingDetails(boolean requiredBillingDetails) {
		this.requiredBillingDetails = requiredBillingDetails;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	
	public List<CustomerPurchases> getItemsList() {
		return itemsList;
	}
	public void setItemsList(List<CustomerPurchases> itemsList) {
		this.itemsList = itemsList;
	}
	public String getBillId() {
		return billId;
	}
	public void setBillId(String billId) {
		this.billId = billId;
	}
	public String getSku_id() {
		return sku_id;
	}
	public void setSku_id(String sku_id) {
		this.sku_id = sku_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public float getQuantity() {
		return quantity;
	}
	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}
	public float getItem_total_price() {
		return item_total_price;
	}
	public void setItem_total_price(float item_total_price) {
		this.item_total_price = item_total_price;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	
	
}
