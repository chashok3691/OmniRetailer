package com.tlabs.posweb.beans;

import java.util.List;



public class WareHouseStockVerificationBean {
	
	
	private RequestHeader requestHeader;
	private List<WareHouseStockVerificationItems> itemsList;
	private String verification_code;
	private String verified_by;
	private String verified_on;
	private String location;
	private String remarks;
	private String searchCriteria;
	private String startDate;
	private String endDate;
	private String startIndex;
	private String maxRecords;
	private String masterVerificationCode;
	private List<WHStockVerificationPosting> postingList;
	private String zoneId;
	private String skuId;
	private String subCategory;
	private String model;
	private String size;
	private String color;
	private String category;
	private String brand;
	private String verification_reference;
	private boolean itemLevel;
	private String verifiedDateStr;
	private boolean stockVerification;
	private String totalRecords;
	private boolean verification;
	private List<Integer> Sno;
	
	
	
	
	
	
	
	public List<Integer> getSno() {
		return Sno;
	}
	public void setSno(List<Integer> sno) {
		Sno = sno;
	}
	public boolean isVerification() {
		return verification;
	}
	public void setVerification(boolean verification) {
		this.verification = verification;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public boolean isStockVerification() {
		return stockVerification;
	}
	public void setStockVerification(boolean stockVerification) {
		this.stockVerification = stockVerification;
	}
	public String getVerifiedDateStr() {
		return verifiedDateStr;
	}
	public void setVerifiedDateStr(String verifiedDateStr) {
		this.verifiedDateStr = verifiedDateStr;
	}
	public boolean isItemLevel() {
		return itemLevel;
	}
	public void setItemLevel(boolean itemLevel) {
		this.itemLevel = itemLevel;
	}
	public String getVerification_reference() {
		return verification_reference;
	}
	public void setVerification_reference(String verification_reference) {
		this.verification_reference = verification_reference;
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
	public String getZoneId() {
		return zoneId;
	}
	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}
	public List<WHStockVerificationPosting> getPostingList() {
		return postingList;
	}
	public void setPostingList(List<WHStockVerificationPosting> postingList) {
		this.postingList = postingList;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public List<WareHouseStockVerificationItems> getItemsList() {
		return itemsList;
	}
	public void setItemsList(List<WareHouseStockVerificationItems> itemsList) {
		this.itemsList = itemsList;
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
	public String getVerified_on() {
		return verified_on;
	}
	public void setVerified_on(String verified_on) {
		this.verified_on = verified_on;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
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
	public String getMasterVerificationCode() {
		return masterVerificationCode;
	}
	public void setMasterVerificationCode(String masterVerificationCode) {
		this.masterVerificationCode = masterVerificationCode;
	}
	

}
