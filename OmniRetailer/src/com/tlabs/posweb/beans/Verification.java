package com.tlabs.posweb.beans;

import java.util.List;

/**
 * @author Mythri
 *
 */
public class Verification {
	private float totalItemsSalePriceVarienceValue;
	private float totalItemCostPriceVarienceValue;
	private float totalItemsMrpPriceVarienceValue;
	private float totalItemsVarienceQty;
	private float totalItemsSalePriceValue;
	private float totalItemCostPriceValue;
	private float totalItemsMrpPriceValue;
	private RequestHeader requestHeader;
	private String startIndex;
	private String maxRecords;
	private List<String> locationsList;
	private boolean itemLevel;
	
	
	public boolean isItemLevel() {
		return itemLevel;
	}
	public void setItemLevel(boolean itemLevel) {
		this.itemLevel = itemLevel;
	}
	public List<String> getLocationsList() {
		return locationsList;
	}
	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}
	private ResponseHeader responseHeader;
	private String startDate;
	private String endDate;
	private String searchCriteria;
	private String createdDateStr;
	public String getCreatedDateStr() {
		return createdDateStr;
	}
	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}
	private StoreStockVerificationMaster verificationMasterObj;
	//private ListStoreStockVerificationMaster verificationMasterList;
	private List<WareHouseStockVerification> whVerificationList;
	private WareHouseStockVerification warehouseStockVerification;
	private List<WareHouseStockVerification> verificationList;
	private List<WareHouseStockVerification> verificationMasterList;
	
	//private List<WareHouseStockVerification> stockVerificationObj;
	
	private String masterVerificationCode;
	private String startTime;
	private String productCategory;
	private String subCategory;
	private String verificationStartDateStr;
	private List<WareHouseStockVerificationItems> verfItemsList;
	private String requiredRecords;
	private String salesReportFilePath;
	private String zone;
	private String department;
	private String subDepartment;
	private String section;
	private String brand;
	private String ean;
	private String store_location;
	private String categoryName;
	private boolean isSaveReport;
	
	private boolean allowMultiplesForDay;
	private Float closedStockCost;
	
	public Float getClosedStockCost() {
		return closedStockCost;
	}
	public void setClosedStockCost(Float closedStockCost) {
		this.closedStockCost = closedStockCost;
	}
	public boolean isAllowMultiplesForDay() {
		return allowMultiplesForDay;
	}
	public void setAllowMultiplesForDay(boolean allowMultiplesForDay) {
		this.allowMultiplesForDay = allowMultiplesForDay;
	}
	public String getVerificationStartDateStr() {
	return verificationStartDateStr;
}
public void setVerificationStartDateStr(String verificationStartDateStr) {
	this.verificationStartDateStr = verificationStartDateStr;
}
public String getVerificationEndDateStr() {
	return verificationEndDateStr;
}
public void setVerificationEndDateStr(String verificationEndDateStr) {
	this.verificationEndDateStr = verificationEndDateStr;
}
	private String verificationEndDateStr;
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getMasterVerificationCode() {
		return masterVerificationCode;
	}
	public void setMasterVerificationCode(String masterVerificationCode) {
		this.masterVerificationCode = masterVerificationCode;
	}
	public List<WareHouseStockVerification> getVerificationMasterList() {
		return verificationMasterList;
	}
	public void setVerificationMasterList(List<WareHouseStockVerification> verificationMasterList) {
		this.verificationMasterList = verificationMasterList;
	}
	private String verification_code;
	private String wh_location;
	private String totalRecords;
	private String location;
	private WareHouseStockVerification stockVerificationObj;
	
	private List<WareHouseStockVerificationItems> itemsList;
	
	public List<WareHouseStockVerificationItems> getItemsList() {
		return itemsList;
	}
	public void setItemsList(List<WareHouseStockVerificationItems> itemsList) {
		this.itemsList = itemsList;
	}
	private StoreStockVerificationMaster masterObj;

	public StoreStockVerificationMaster getMasterObj() {
		return masterObj;
	}
	public void setMasterObj(StoreStockVerificationMaster masterObj) {
		this.masterObj = masterObj;
	}
	public WareHouseStockVerification getStockVerificationObj() {
		return stockVerificationObj;
	}
	public void setStockVerificationObj(WareHouseStockVerification stockVerificationObj) {
		this.stockVerificationObj = stockVerificationObj;
	}
	public List<WareHouseStockVerification> getVerificationList() {
		return verificationList;
	}
	public void setVerificationList(List<WareHouseStockVerification> verificationList) {
		this.verificationList = verificationList;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getWh_location() {
		return wh_location;
	}
	public void setWh_location(String wh_location) {
		this.wh_location = wh_location;
	}
	public String getVerification_code() {
		return verification_code;
	}
	public void setVerification_code(String verification_code) {
		this.verification_code = verification_code;
	}
	public List<WareHouseStockVerification> getWhVerificationList() {
		return whVerificationList;
	}
	public void setWhVerificationList(List<WareHouseStockVerification> whVerificationList) {
		this.whVerificationList = whVerificationList;
	}
	public WareHouseStockVerification getWarehouseStockVerification() {
		return warehouseStockVerification;
	}
	public void setWarehouseStockVerification(WareHouseStockVerification warehouseStockVerification) {
		this.warehouseStockVerification = warehouseStockVerification;
	}
	public float getTotalItemsSalePriceVarienceValue() {
		return totalItemsSalePriceVarienceValue;
	}
	public void setTotalItemsSalePriceVarienceValue(float totalItemsSalePriceVarienceValue) {
		this.totalItemsSalePriceVarienceValue = totalItemsSalePriceVarienceValue;
	}
	public float getTotalItemCostPriceVarienceValue() {
		return totalItemCostPriceVarienceValue;
	}
	public void setTotalItemCostPriceVarienceValue(float totalItemCostPriceVarienceValue) {
		this.totalItemCostPriceVarienceValue = totalItemCostPriceVarienceValue;
	}
	public float getTotalItemsMrpPriceVarienceValue() {
		return totalItemsMrpPriceVarienceValue;
	}
	public void setTotalItemsMrpPriceVarienceValue(float totalItemsMrpPriceVarienceValue) {
		this.totalItemsMrpPriceVarienceValue = totalItemsMrpPriceVarienceValue;
	}
	public float getTotalItemsVarienceQty() {
		return totalItemsVarienceQty;
	}
	public void setTotalItemsVarienceQty(float totalItemsVarienceQty) {
		this.totalItemsVarienceQty = totalItemsVarienceQty;
	}
	public float getTotalItemsSalePriceValue() {
		return totalItemsSalePriceValue;
	}
	public void setTotalItemsSalePriceValue(float totalItemsSalePriceValue) {
		this.totalItemsSalePriceValue = totalItemsSalePriceValue;
	}
	public float getTotalItemCostPriceValue() {
		return totalItemCostPriceValue;
	}
	public void setTotalItemCostPriceValue(float totalItemCostPriceValue) {
		this.totalItemCostPriceValue = totalItemCostPriceValue;
	}
	public float getTotalItemsMrpPriceValue() {
		return totalItemsMrpPriceValue;
	}
	public void setTotalItemsMrpPriceValue(float totalItemsMrpPriceValue) {
		this.totalItemsMrpPriceValue = totalItemsMrpPriceValue;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
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
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
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
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public StoreStockVerificationMaster getVerificationMasterObj() {
		return verificationMasterObj;
	}
	public void setVerificationMasterObj(StoreStockVerificationMaster verificationMasterObj) {
		this.verificationMasterObj = verificationMasterObj;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public List<WareHouseStockVerificationItems> getVerfItemsList() {
		return verfItemsList;
	}
	public void setVerfItemsList(List<WareHouseStockVerificationItems> verfItemsList) {
		this.verfItemsList = verfItemsList;
	}
	public String getRequiredRecords() {
		return requiredRecords;
	}
	public void setRequiredRecords(String requiredRecords) {
		this.requiredRecords = requiredRecords;
	}

	
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getSubDepartment() {
		return subDepartment;
	}
	public void setSubDepartment(String subDepartment) {
		this.subDepartment = subDepartment;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getEan() {
		return ean;
	}
	public void setEan(String ean) {
		this.ean = ean;
	}
	public String getStore_location() {
		return store_location;
	}
	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public boolean isSaveReport() {
		return isSaveReport;
	}
	public void setSaveReport(boolean isSaveReport) {
		this.isSaveReport = isSaveReport;
	}
	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}
	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}
	
	
}
