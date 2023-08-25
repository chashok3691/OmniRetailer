package com.tlabs.posweb.beans;

import java.util.List;


public class StoreStockVerificationBean {

	private RequestHeader requestHeader;
	private List<StoreStockVerificationItems> itemsList;
	private List<StoreStockVerificationPosting> postingList;
	private String verification_code;
	private String verified_by;
	private String verified_on;
	private String verifiedOnStr;
	private String location;
	private String remarks;
	private String searchCriteria;
	private String startDate;
	private String endDate;
	private String startIndex;
	private String maxRecords;
	private String masterVerificationCode;
	private String subCategory;
	private String model;
	private String size;
	private String color;
	private String category;
	private String brand;
	private String skuId;
	private String startTimeStr;
	private String endTimeStr;
	private String verifiedDateStr;
	private String status;
	private List<String> locList;
	private String zoneId;
	private String childVerificationCode;
	private String verification_reference;
	private String batchNumber;	
	private Float skuPhysicalStock;
	private boolean itemLevel;
	private boolean verification;
	private boolean referrenceLevel;
	//private List<Integer> Sno;
	private boolean postingLevel;
	
	private String verificationRef;
	private String updatedOnStr;
	private String flowUnder;
	private ResponseHeader responseHeader;
	private int totalItems;
	private String URL;
	
	
	
	
	
	public String getURL() {
		return URL;
	}

	public void setURL(String uRL) {
		URL = uRL;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}


	public String getVerifiedOnStr() {
		return verifiedOnStr;
	}

	public void setVerifiedOnStr(String verifiedOnStr) {
		this.verifiedOnStr = verifiedOnStr;
	}
	
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public String getVerificationRef() {
		return verificationRef;
	}

	public void setVerificationRef(String verificationRef) {
		this.verificationRef = verificationRef;
	}

	public String getUpdatedOnStr() {
		return updatedOnStr;
	}

	public void setUpdatedOnStr(String updatedOnStr) {
		this.updatedOnStr = updatedOnStr;
	}

	public String getFlowUnder() {
		return flowUnder;
	}

	public void setFlowUnder(String flowUnder) {
		this.flowUnder = flowUnder;
	}

	public boolean isPostingLevel() {
		return postingLevel;
	}

	public void setPostingLevel(boolean postingLevel) {
		this.postingLevel = postingLevel;
	}

	public boolean isVerification() {
		return verification;
	}

	public void setVerification(boolean verification) {
		this.verification = verification;
	}

	public boolean isReferrenceLevel() {
		return referrenceLevel;
	}

	public void setReferrenceLevel(boolean referrenceLevel) {
		this.referrenceLevel = referrenceLevel;
	}

	/*public List<Integer> getSno() {
		return Sno;
	}

	public void setSno(List<Integer> sno) {
		Sno = sno;
	}*/

	public List<StoreStockVerificationPosting> getPostingList() {
		return postingList;
	}

	public void setPostingList(List<StoreStockVerificationPosting> postingList) {
		this.postingList = postingList;
	}

	public String getChildVerificationCode() {
		return childVerificationCode;
	}

	public void setChildVerificationCode(String childVerificationCode) {
		this.childVerificationCode = childVerificationCode;
	}

	public String getVerification_reference() {
		return verification_reference;
	}

	public void setVerification_reference(String verification_reference) {
		this.verification_reference = verification_reference;
	}

	public String getBatchNumber() {
		return batchNumber;
	}

	public void setBatchNumber(String batchNumber) {
		this.batchNumber = batchNumber;
	}

	public Float getSkuPhysicalStock() {
		return skuPhysicalStock;
	}

	public void setSkuPhysicalStock(Float skuPhysicalStock) {
		this.skuPhysicalStock = skuPhysicalStock;
	}

	public boolean isItemLevel() {
		return itemLevel;
	}

	public void setItemLevel(boolean itemLevel) {
		this.itemLevel = itemLevel;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getVerification_code() {
		return verification_code;
	}

	public void setVerification_code(String verification_code) {
		this.verification_code = verification_code;
	}

	public String getVerified_by() {
		return verified_by;
	}

	public void setVerified_by(String verified_by) {
		this.verified_by = verified_by;
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

	public List<StoreStockVerificationItems> getItemsList() {
		return itemsList;
	}

	public void setItemsList(List<StoreStockVerificationItems> itemsList) {
		this.itemsList = itemsList;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getVerified_on() {
		return verified_on;
	}

	public void setVerified_on(String verified_on) {
		this.verified_on = verified_on;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
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

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getModel() {
		return model;
	}

	 

	public String getVerifiedDateStr() {
		return verifiedDateStr;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setVerifiedDateStr(String verifiedDateStr) {
		this.verifiedDateStr = verifiedDateStr;
	}

 

	public void setModel(String model) {
		this.model = model;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getStartTimeStr() {
		return startTimeStr;
	}

	public void setStartTimeStr(String startTimeStr) {
		this.startTimeStr = startTimeStr;
	}

	public String getEndTimeStr() {
		return endTimeStr;
	}

	public void setEndTimeStr(String endTimeStr) {
		this.endTimeStr = endTimeStr;
	}

	public String getMasterVerificationCode() {
		return masterVerificationCode;
	}

	public void setMasterVerificationCode(String masterVerificationCode) {
		this.masterVerificationCode = masterVerificationCode;
	}

	public List<String> getLocList() {
		return locList;
	}

	public void setLocList(List<String> locList) {
		this.locList = locList;
	}

	

	

}
