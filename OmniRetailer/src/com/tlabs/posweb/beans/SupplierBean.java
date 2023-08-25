package com.tlabs.posweb.beans;

import java.util.List;

public class SupplierBean {
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
    private String supplierCode;
	private String firmName;
	private String plotNo;
	private String streetName;
	private String city;
	private String zipCode;
	private String countryCode;
	private String currencyCode;
	private String emailId;
	private String websiteUrl;
	private String phone;
	private String mobile;
	private boolean issueWiseLocation;
	private String fax;
	private SupplierBean supplierMaster;
	private String paymentTerms;
	private String shipmentMode;
	private String shipmentTerms;
	private Integer minOrderCost;
	private Integer minQuantity;
	private Integer leadTime;
	private String uom;
	private String targetOrderValue;
	private String rFactor;
	private String maxFactor;
	private String rating;
	private int startIndex;
	private String maxRecords;
	private boolean isProductRestrictions;
	private String productRestrictionsStr;
	private String gstn_num;
	private boolean status;
	private String statusStr;
	private String skuId;
	private List<String>supplierList;
	
	private String storeLocation;
	private String locationType;
	private String state;
	
	
	
	private String returnTerms;
	private Float returnDays;
	private Float markdown;
	private String pan;
	private List<SupplierAddresses> supplierAddresses;
	
	
	 private List<String> previousWorkFlowLogList;
	 private List<String> previousStates;
	 private List<String> nextWorkFlowStates;
	 
	 
	 private String statusOrder;
	 
	 
	
	public String getStatusOrder() {
		return statusOrder;
	}
	public void setStatusOrder(String statusOrder) {
		this.statusOrder = statusOrder;
	}
	public List<String> getNextWorkFlowStates() {
		return nextWorkFlowStates;
	}
	public void setNextWorkFlowStates(List<String> nextWorkFlowStates) {
		this.nextWorkFlowStates = nextWorkFlowStates;
	}
	public List<String> getPreviousWorkFlowLogList() {
		return previousWorkFlowLogList;
	}
	public void setPreviousWorkFlowLogList(List<String> previousWorkFlowLogList) {
		this.previousWorkFlowLogList = previousWorkFlowLogList;
	}
	
	
	public List<String> getPreviousStates() {
		return previousStates;
	}
	public void setPreviousStates(List<String> previousStates) {
		this.previousStates = previousStates;
	}
	public List<SupplierAddresses> getSupplierAddresses() {
		return supplierAddresses;
	}
	public void setSupplierAddresses(List<SupplierAddresses> supplierAddresses) {
		this.supplierAddresses = supplierAddresses;
	}
	public String getPan() {
		return pan;
	}
	public void setPan(String pan) {
		this.pan = pan;
	}
	public String getReturnTerms() {
		return returnTerms;
	}
	public void setReturnTerms(String returnTerms) {
		this.returnTerms = returnTerms;
	}
	public Float getReturnDays() {
		return returnDays;
	}
	public void setReturnDays(Float returnDays) {
		this.returnDays = returnDays;
	}
	public Float getMarkdown() {
		return markdown;
	}
	public void setMarkdown(Float markdown) {
		this.markdown = markdown;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public boolean isIssueWiseLocation() {
		return issueWiseLocation;
	}
	public void setIssueWiseLocation(boolean issueWiseLocation) {
		this.issueWiseLocation = issueWiseLocation;
	}
	public String getStatusStr() {
		return statusStr;
	}
	public void setStatusStr(String statusStr) {
		this.statusStr = statusStr;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public String getLocationType() {
		return locationType;
	}
	public void setLocationType(String locationType) {
		this.locationType = locationType;
	}
	public List<String> getSupplierList() {
		return supplierList;
	}
	public void setSupplierList(List<String> supplierList) {
		this.supplierList = supplierList;
	}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public boolean isProductRestrictions() {
		return isProductRestrictions;
	}
	public void setProductRestrictions(boolean isProductRestrictions) {
		this.isProductRestrictions = isProductRestrictions;
	}
	public String getProductRestrictionsStr() {
		return productRestrictionsStr;
	}
	public void setProductRestrictionsStr(String productRestrictionsStr) {
		this.productRestrictionsStr = productRestrictionsStr;
	}
	public String getGstn_num() {
		return gstn_num;
	}
	public void setGstn_num(String gstn_num) {
		this.gstn_num = gstn_num;
	}
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	private List<SupplierProducts> supplierProducts;
	
	/*private String userId;*/
	/* for header information */
	/*private String userName;
	private String accessKey;
	private String applicationName;
	private String dateAndTime;
	private String correlationId;*/
	
	private Integer pageNo;
	private String searchCriteria;
	private List<String> supplierCodes;

	private String totalRecords;
	private int slNo;
	
	public String getrFactor() {
		return rFactor;
	}
	public void setrFactor(String rFactor) {
		this.rFactor = rFactor;
	}
	public String getMaxFactor() {
		return maxFactor;
	}
	public void setMaxFactor(String maxFactor) {
		this.maxFactor = maxFactor;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getSupplierCode() {
		return supplierCode;
	}
	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}
	public String getFirmName() {
		return firmName;
	}
	public void setFirmName(String firmName) {
		this.firmName = firmName;
	}
	public String getPlotNo() {
		return plotNo;
	}
	public void setPlotNo(String plotNo) {
		this.plotNo = plotNo;
	}
	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getCurrencyCode() {
		return currencyCode;
	}
	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getWebsiteUrl() {
		return websiteUrl;
	}
	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getPaymentTerms() {
		return paymentTerms;
	}
	public void setPaymentTerms(String paymentTerms) {
		this.paymentTerms = paymentTerms;
	}
	public String getShipmentMode() {
		return shipmentMode;
	}
	public void setShipmentMode(String shipmentMode) {
		this.shipmentMode = shipmentMode;
	}
	public String getShipmentTerms() {
		return shipmentTerms;
	}
	public void setShipmentTerms(String shipmentTerms) {
		this.shipmentTerms = shipmentTerms;
	}
	public Integer getMinOrderCost() {
		return minOrderCost;
	}
	public void setMinOrderCost(Integer minOrderCost) {
		this.minOrderCost = minOrderCost;
	}
	
	public Integer getMinQuantity() {
		return minQuantity;
	}
	public void setMinQuantity(Integer minQuantity) {
		this.minQuantity = minQuantity;
	}
	public Integer getLeadTime() {
		return leadTime;
	}
	public void setLeadTime(Integer leadTime) {
		this.leadTime = leadTime;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public String getTargetOrderValue() {
		return targetOrderValue;
	}
	public void setTargetOrderValue(String targetOrderValue) {
		this.targetOrderValue = targetOrderValue;
	}
	/*public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
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
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public List<String> getSupplierCodes() {
		return supplierCodes;
	}
	public void setSupplierCodes(List<String> supplierCodes) {
		this.supplierCodes = supplierCodes;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public List<SupplierProducts> getSupplierProducts() {
		return supplierProducts;
	}
	public void setSupplierProducts(List<SupplierProducts> supplierProducts) {
		this.supplierProducts = supplierProducts;
	}
	public SupplierBean getSupplierMaster() {
		return supplierMaster;
	}
	public void setSupplierMaster(SupplierBean supplierMaster) {
		this.supplierMaster = supplierMaster;
	}

	
	
	
}
