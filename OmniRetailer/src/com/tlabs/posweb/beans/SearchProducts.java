package com.tlabs.posweb.beans;

import java.util.List;

public class SearchProducts {

	private String startIndex;
	private String searchCriteria;
	private String storeLocation;
	private String productCategory = null;
	private String maxRecords;
	private String productSubCategory;
	private boolean isImagesRequired;
	private String storage_unit;
	private String storage_location;
	private String salePriceOrderBy;
	private String skuId;
	private boolean isDetailsRequired;
	private boolean isProductRestrictions;
	private String supplierName;
	
	private String startDateStr;
	private String endDateStr;
	
	private boolean isTotalCountRequired;
	private boolean isB2cRequest;
	private String supplierCode;
	
	private boolean totalRecordsFlag;
	
	
	/*newly added */
	private RequestHeader requestHeader;
	private String businessCategory;
	private String businessSubCategory;
	private List<String> locationsList;
	
	
	
	private boolean isAdvanced;
	private String uom;
	private String aliasName;
	private String product_usage;
	private String measureRange;

	private boolean runningItemsRequired;
	private boolean isZoneSpecificSearch;
	private String supplierId;
	private boolean itemTypeFlag;
	private List<String> skuIdList;
	private boolean outletFlag;
	
	private String brandCode;
	private String startPrice;
	private String endPrice;
	private String groupId;
	private String startRate;
	private String endRate;
	
	private String sortingKey;
	private List<String> brandList;
	private boolean activeItems;
	private boolean storageRefRequired;
	private String department;
	private String section;
	private boolean saveReport  ;
	
	
	
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public boolean isSaveReport() {
		return saveReport;
	}
	public void setSaveReport(boolean saveReport) {
		this.saveReport = saveReport;
	}
	public boolean isStorageRefRequired() {
		return storageRefRequired;
	}
	public void setStorageRefRequired(boolean storageRefRequired) {
		this.storageRefRequired = storageRefRequired;
	}
	public boolean isActiveItems() {
		return activeItems;
	}
	public void setActiveItems(boolean activeItems) {
		this.activeItems = activeItems;
	}
	public List<String> getBrandList() {
		return brandList;
	}
	public void setBrandList(List<String> brandList) {
		this.brandList = brandList;
	}
	public String getSortingKey() {
		return sortingKey;
	}
	public void setSortingKey(String sortingKey) {
		this.sortingKey = sortingKey;
	}
	public String getStartRate() {
		return startRate;
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
	public void setStartRate(String startRate) {
		this.startRate = startRate;
	}
	public String getEndRate() {
		return endRate;
	}
	public void setEndRate(String endRate) {
		this.endRate = endRate;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getBrandCode() {
		return brandCode;
	}
	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}
	public String getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(String startPrice) {
		this.startPrice = startPrice;
	}
	public String getEndPrice() {
		return endPrice;
	}
	public void setEndPrice(String endPrice) {
		this.endPrice = endPrice;
	}
	public boolean isOutletFlag() {
		return outletFlag;
	}
	public void setOutletFlag(boolean outletFlag) {
		this.outletFlag = outletFlag;
	}
	public List<String> getSkuIdList() {
		return skuIdList;
	}
	public void setSkuIdList(List<String> skuIdList) {
		this.skuIdList = skuIdList;
	}
	public boolean isItemTypeFlag() {
		return itemTypeFlag;
	}
	public void setItemTypeFlag(boolean itemTypeFlag) {
		this.itemTypeFlag = itemTypeFlag;
	}
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public boolean isProductRestrictions() {
		return isProductRestrictions;
	}
	public void setProductRestrictions(boolean isProductRestrictions) {
		this.isProductRestrictions = isProductRestrictions;
	}
	public boolean isTotalRecordsFlag() {
		return totalRecordsFlag;
	}
	public void setTotalRecordsFlag(boolean totalRecordsFlag) {
		this.totalRecordsFlag = totalRecordsFlag;
	}
	public boolean isZoneSpecificSearch() {
		return isZoneSpecificSearch;
	}
	public void setZoneSpecificSearch(boolean isZoneSpecificSearch) {
		this.isZoneSpecificSearch = isZoneSpecificSearch;
	}
	public boolean isRunningItemsRequired() {
	return runningItemsRequired;
}
public void setRunningItemsRequired(boolean runningItemsRequired) {
	this.runningItemsRequired = runningItemsRequired;
}
	private boolean skuSearchRequired;
	public boolean isSkuSearchRequired() {
		return skuSearchRequired;
	}
	public void setSkuSearchRequired(boolean skuSearchRequired) {
		this.skuSearchRequired = skuSearchRequired;
	}
	public boolean isAdvanced() {
		return isAdvanced;
	}
	public void setAdvanced(boolean isAdvanced) {
		this.isAdvanced = isAdvanced;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public String getAliasName() {
		return aliasName;
	}
	public void setAliasName(String aliasName) {
		this.aliasName = aliasName;
	}
	public String getProduct_usage() {
		return product_usage;
	}
	public void setProduct_usage(String product_usage) {
		this.product_usage = product_usage;
	}
	public String getMeasureRange() {
		return measureRange;
	}
	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}
	public String getSupplierCode() {
		return supplierCode;
	}
	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}
	public boolean isEffectiveDateConsidered() {
		return isEffectiveDateConsidered;
	}
	public void setEffectiveDateConsidered(boolean isEffectiveDateConsidered) {
		this.isEffectiveDateConsidered = isEffectiveDateConsidered;
	}
	private boolean isEffectiveDateConsidered;
	
	public boolean isTotalCountRequired() {
		return isTotalCountRequired;
	}
	public void setTotalCountRequired(boolean isTotalCountRequired) {
		this.isTotalCountRequired = isTotalCountRequired;
	}
	public boolean isDetailsRequired() {
		return isDetailsRequired;
	}
	public void setDetailsRequired(boolean isDetailsRequired) {
		this.isDetailsRequired = isDetailsRequired;
	}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public String getSalePriceOrderBy() {
		return salePriceOrderBy;
	}
	public void setSalePriceOrderBy(String salePriceOrderBy) {
		this.salePriceOrderBy = salePriceOrderBy;
	}
	public String getStorage_unit() {
		return storage_unit;
	}
	public void setStorage_unit(String storage_unit) {
		this.storage_unit = storage_unit;
	}
	public String getStorage_location() {
		return storage_location;
	}
	public void setStorage_location(String storage_location) {
		this.storage_location = storage_location;
	}
	
	public String getProductSubCategory() {
		return productSubCategory;
	}
	public void setProductSubCategory(String productSubCategory) {
		this.productSubCategory = productSubCategory;
	}
	public boolean isImagesRequired() {
		return isImagesRequired;
	}
	public void setImagesRequired(boolean isImagesRequired) {
		this.isImagesRequired = isImagesRequired;
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
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public boolean isB2cRequest() {
		return isB2cRequest;
	}
	public void setB2cRequest(boolean isB2cRequest) {
		this.isB2cRequest = isB2cRequest;
	}
	public String getBusinessCategory() {
		return businessCategory;
	}
	public void setBusinessCategory(String businessCategory) {
		this.businessCategory = businessCategory;
	}
	public String getBusinessSubCategory() {
		return businessSubCategory;
	}
	public void setBusinessSubCategory(String businessSubCategory) {
		this.businessSubCategory = businessSubCategory;
	}
	public List<String> getLocationsList() {
		return locationsList;
	}
	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}
	
	
}
