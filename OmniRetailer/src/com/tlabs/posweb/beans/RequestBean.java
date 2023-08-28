/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 6-3-2015
 * 
 * Licensed under the Technolabs Software License, Version 1.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.technolabssoftware.com/pages/privacy-policy/
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/

package com.tlabs.posweb.beans;

import java.util.List;
//import java.util.Set;


/**
 * @author Sahitya
 * Verified By :
 * 
 * This class is used to receive/send common request & repsonse parameteres across all functionalitites
 */
public class RequestBean {
	private boolean isTotalCountRequired;
	private boolean enforceGeneratePO;
	private String wareHouseLocation;
	private String receiptNoteId;
	private String maxRecords;
	private String start;
	private String startIndexStr;
	private List<String> formStoreCodeList;
	private String supplierCode;
	private String mobileNumber;
	private boolean isProductRestrictions;
	private boolean saveStockMovementFlag;

	private String store_location;
	private boolean isSaveReport;
	private String requiredRecords;
	
	private String expiryDate;
	
	private int lifeTimeSpan;
	
	private boolean returnableItem;
	
	private List<String> skuIdList;
	private List<String> outletLocations;
	private boolean outletFlag;
	
	private String indentCategory;
	
	private boolean storageRefRequired;
	
	private WareHouseSku wareHouseSku;
	private WareHouseSku  warehouseskumaster;

	private boolean productSearch;
	
	
	private String customerId;
	private String userName;
	
	
	private String generateIndentType;

	private boolean isWHShipmentSearch;
	
	
	private boolean jsonFileRequired;
	
	private String nearestStoreLocation;
	private boolean isB2cRequest;
	private boolean skuSearchRequired;
	private boolean activeItems;
	private boolean totalRecordsFlag;
	private boolean isDetailsRequired;
	private boolean isImagesRequired;
	
	private boolean bomsearchSkusFlag;
	
	
	
	
	
	
	
	
	
	public boolean isBomsearchSkusFlag() {
		return bomsearchSkusFlag;
	}
	public void setBomsearchSkusFlag(boolean bomsearchSkusFlag) {
		this.bomsearchSkusFlag = bomsearchSkusFlag;
	}
	public boolean isSkuSearchRequired() {
		return skuSearchRequired;
	}
	public void setSkuSearchRequired(boolean skuSearchRequired) {
		this.skuSearchRequired = skuSearchRequired;
	}
	public boolean isActiveItems() {
		return activeItems;
	}
	public void setActiveItems(boolean activeItems) {
		this.activeItems = activeItems;
	}
	public boolean isTotalRecordsFlag() {
		return totalRecordsFlag;
	}
	public void setTotalRecordsFlag(boolean totalRecordsFlag) {
		this.totalRecordsFlag = totalRecordsFlag;
	}
	public boolean isDetailsRequired() {
		return isDetailsRequired;
	}
	public void setDetailsRequired(boolean isDetailsRequired) {
		this.isDetailsRequired = isDetailsRequired;
	}
	public boolean isImagesRequired() {
		return isImagesRequired;
	}
	public void setImagesRequired(boolean isImagesRequired) {
		this.isImagesRequired = isImagesRequired;
	}
	public boolean isB2cRequest() {
		return isB2cRequest;
	}
	public void setB2cRequest(boolean isB2cRequest) {
		this.isB2cRequest = isB2cRequest;
	}
	public String getNearestStoreLocation() {
		return nearestStoreLocation;
	}
	public void setNearestStoreLocation(String nearestStoreLocation) {
		this.nearestStoreLocation = nearestStoreLocation;
	}
	public boolean isJsonFileRequired() {
		return jsonFileRequired;
	}
	public void setJsonFileRequired(boolean jsonFileRequired) {
		this.jsonFileRequired = jsonFileRequired;
	}
	public boolean isWHShipmentSearch() {
		return isWHShipmentSearch;
	}
	public void setWHShipmentSearch(boolean isWHShipmentSearch) {
		this.isWHShipmentSearch = isWHShipmentSearch;
	}
	public WareHouseSku getWarehouseskumaster() {
		return warehouseskumaster;
	}
	public void setWarehouseskumaster(WareHouseSku warehouseskumaster) {
		this.warehouseskumaster = warehouseskumaster;
	}
	public String getGenerateIndentType() {
		return generateIndentType;
	}
	public void setGenerateIndentType(String generateIndentType) {
		this.generateIndentType = generateIndentType;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public WareHouseSku getWareHouseSku() {
		return wareHouseSku;
	}
	public void setWareHouseSku(WareHouseSku wareHouseSku) {
		this.wareHouseSku = wareHouseSku;
	}
	public boolean isProductSearch() {
		return productSearch;
	}
	public void setProductSearch(boolean productSearch) {
		this.productSearch = productSearch;
	}
	public boolean isStorageRefRequired() {
		return storageRefRequired;
	}
	public void setStorageRefRequired(boolean storageRefRequired) {
		this.storageRefRequired = storageRefRequired;
	}
	public String getIndentCategory() {
		return indentCategory;
	}
	public void setIndentCategory(String indentCategory) {
		this.indentCategory = indentCategory;
	}
	public boolean isOutletFlag() {
		return outletFlag;
	}
	public void setOutletFlag(boolean outletFlag) {
		this.outletFlag = outletFlag;
	}
	public List<String> getOutletLocations() {
		return outletLocations;
	}
	public void setOutletLocations(List<String> outletLocations) {
		this.outletLocations = outletLocations;
	}
	public List<String> getSkuIdList() {
		return skuIdList;
	}
	public void setSkuIdList(List<String> skuIdList) {
		this.skuIdList = skuIdList;
	}
	public int getLifeTimeSpan() {
		return lifeTimeSpan;
	}
	public void setLifeTimeSpan(int lifeTimeSpan) {
		this.lifeTimeSpan = lifeTimeSpan;
	}
	public boolean isReturnableItem() {
		return returnableItem;
	}
	public void setReturnableItem(boolean returnableItem) {
		this.returnableItem = returnableItem;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getRequiredRecords() {
		return requiredRecords;
	}
	public void setRequiredRecords(String requiredRecords) {
		this.requiredRecords = requiredRecords;
	}
	public boolean isSaveReport() {
		return isSaveReport;
	}
	public void setSaveReport(boolean isSaveReport) {
		this.isSaveReport = isSaveReport;
	}
	
	
	public String getStore_location() {
		return store_location;
	}
	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}
	public boolean isSaveStockMovementFlag() {
		return saveStockMovementFlag;
	}
	public void setSaveStockMovementFlag(boolean saveStockMovementFlag) {
		this.saveStockMovementFlag = saveStockMovementFlag;
	}
	public boolean isProductRestrictions() {
		return isProductRestrictions;
	}
	public void setProductRestrictions(boolean isProductRestrictions) {
		this.isProductRestrictions = isProductRestrictions;
	}
	public String getSupplierCode() {
		return supplierCode;
	}
	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}

	List<String> selectedLocationsList;
	
	public List<String> getSelectedLocationsList() {
		return selectedLocationsList;
	}
	public void setSelectedLocationsList(List<String> selectedLocationsList) {
		this.selectedLocationsList = selectedLocationsList;
	}

	private List<String> issueToList;
	public List<String> getIssueToList() {
		return issueToList;
	}
	public void setIssueToList(List<String> issueToList) {
		this.issueToList = issueToList;
	}

	private List<String> fromWareHouseList;
	
	public List<String> getFromWareHouseList() {
		return fromWareHouseList;
	}
	public void setFromWareHouseList(List<String> fromWareHouseList) {
		this.fromWareHouseList = fromWareHouseList;
	}
	public List<String> getFormStoreCodeList() {
		return formStoreCodeList;
	}
	public void setFormStoreCodeList(List<String> formStoreCodeList) {
		this.formStoreCodeList = formStoreCodeList;
	}
	public List<String> getLocationsList() {
		return locationsList;
	}
	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}

	private String supplierId;
	private String billId;
	private String createdOnStr;
	
	private List<String> locationsList;
	
//	added by vijay
	private String primaryDepartment;
	private String secondaryDepartment;
	private String section;
	private String productClass;
	private String subClass;
	private String urlOfSaveOrders;
	private boolean  isSaveFlag;
	
	public boolean isSaveFlag() {
		return isSaveFlag;
	}
	public void setSaveFlag(boolean isSaveFlag) {
		this.isSaveFlag = isSaveFlag;
	}
	public String getUrlOfSaveOrders() {
		return urlOfSaveOrders;
	}
	public void setUrlOfSaveOrders(String urlOfSaveOrders) {
		this.urlOfSaveOrders = urlOfSaveOrders;
	}
	public String getPrimaryDepartment() {
		return primaryDepartment;
	}
	public void setPrimaryDepartment(String primaryDepartment) {
		this.primaryDepartment = primaryDepartment;
	}
	public String getSecondaryDepartment() {
		return secondaryDepartment;
	}
	public void setSecondaryDepartment(String secondaryDepartment) {
		this.secondaryDepartment = secondaryDepartment;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getProductClass() {
		return productClass;
	}
	public void setProductClass(String productClass) {
		this.productClass = productClass;
	}
	public String getSubClass() {
		return subClass;
	}
	public void setSubClass(String subClass) {
		this.subClass = subClass;
	}

	private boolean printResponseRequired;
	
	public boolean isPrintResponseRequired() {
		return printResponseRequired;
	}
	public void setPrintResponseRequired(boolean printResponseRequired) {
		this.printResponseRequired = printResponseRequired;
	}

	private String printingType;
	
	public String getPrintingType() {
		return printingType;
	}
	public void setPrintingType(String printingType) {
		this.printingType = printingType;
	}
	public String getCreatedOnStr() {
		return createdOnStr;
	}
	public void setCreatedOnStr(String createdOnStr) {
		this.createdOnStr = createdOnStr;
	}

	private List<String> poRefList; 
	  private List<String> requestIds;
	private RequestHeader requestHeader;
	 private String fromStoreCode;
	private String warehouseLocation;
	 private String toStoreCode;
	 private boolean issueAndClose;
	 private boolean zeroStockCheckAtOutletLevel;
	 private boolean notForDownload;
private List<String> zonesList;
	private ResponseHeader responseHeader;
	private List<StockIssueDetails> reciptDetails;
	private String shipped_from;
	private String endDateStr;
	private List<Outlet> storeDetails;
	private Boolean toConfirm ;
	private List<LocationBean> locationDetails;
	private String outletLocation;
	private List<Tax> taxDetails;
	private String subDepartment;
	private String supplierName;
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getSubDepartment() {
		return subDepartment;
	}
	public void setSubDepartment(String subDepartment) {
		this.subDepartment = subDepartment;
	}

	private String location;
	
	private String startIndex;
	
	private List<Id> skuIds;
	
	private String searchCriteria;
	
    private List<StockReciept> receipts;
    
    private String receipt_location;
    
    private String emailId;
    
    private String password;
    
    private String skuId;
	
	private StockReciept receipt;
	
	private StockReciept warehouse_receipt;
	
	private List<StockRecieptDetails> itemDetails;
	
	private String goods_receipt_ref_num;
	
	private String goods_issue_ref_num;
	
	private List<StockIssues> issueIds;
	
	private String wh_location;
	
	private String storeLocation;
	
	private Integer shiftId;

	private List<ShiftMaster> shifts;
	
	private String totalRecords;
	
	private String totalReceipts;
	
	private String totalOrders;
	
	private List<SkuPriceList> skuLists;
	
	private String category;
	
	private List<StockDashboardBean> stocksInfoByCategory;
	
	private List<StockDashboardBean> turnOvers;
	
	private String startDateStr;
	
	private String endDate;
	private String startDate;

	private String status;
	
	private String productCategory;
	private String productSubCategory;
	private String stockRequestId;
	
	private String url;
	
	private boolean outletAll;
	private boolean warehouseAll;
	private String fromWareHouseId;
	private String toWareHouseId;
	  private String indentedBy;
	    private Float requestedQty;
	    private Float issuedQty;
	private String  categoryId;
	private String  startPriceRange;
	private String  endPricRange;
	private String brandCode;
	private String  initialRecord;
	  private String brand;
	  
	    private String zoneID;
	    private String zoneId;
	    private String department;
	  //  private String category;
	    private Float endPriceRange;
	    private String model;
	    private String subCategory;
	    private boolean saveStockReport;
	    private String saveStockFilePath;
	    private String pickListURL;
	    private List<WHStorageSystemDetails> storageRefList;
	    
	    
	public List<WHStorageSystemDetails> getStorageRefList() {
			return storageRefList;
		}
		public void setStorageRefList(List<WHStorageSystemDetails> storageRefList) {
			this.storageRefList = storageRefList;
		}
		
	public String getProductSubCategory() {
			return productSubCategory;
		}
		public void setProductSubCategory(String productSubCategory) {
			this.productSubCategory = productSubCategory;
		}
	public String getPickListURL() {
			return pickListURL;
		}
		public void setPickListURL(String pickListURL) {
			this.pickListURL = pickListURL;
		}
	public boolean isTotalCountRequired() {
		return isTotalCountRequired;
	}
	public void setTotalCountRequired(boolean isTotalCountRequired) {
		this.isTotalCountRequired = isTotalCountRequired;
	}
	public String getToWareHouseId() {
		return toWareHouseId;
	}
	public void setToWareHouseId(String toWareHouseId) {
		this.toWareHouseId = toWareHouseId;
	}
	public String getFromWareHouseId() {
		return fromWareHouseId;
	}
	public void setFromWareHouseId(String fromWareHouseId) {
		this.fromWareHouseId = fromWareHouseId;
	}
	public boolean isOutletAll() {
		return outletAll;
	}
	public void setOutletAll(boolean outletAll) {
		this.outletAll = outletAll;
	}
	public boolean isWarehouseAll() {
		return warehouseAll;
	}
	public void setWarehouseAll(boolean warehouseAll) {
		this.warehouseAll = warehouseAll;
	}
	
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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

	public String getStockRequestId() {
		return stockRequestId;
	}

	public void setStockRequestId(String stockRequestId) {
		this.stockRequestId = stockRequestId;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public void setShiftId(Integer shiftId) {
		this.shiftId = shiftId;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getTotalOrders() {
		return totalOrders;
	}

	public void setTotalOrders(String totalOrders) {
		this.totalOrders = totalOrders;
	}

	public String getTotalReceipts() {
		return totalReceipts;
	}

	public void setTotalReceipts(String totalReceipts) {
		this.totalReceipts = totalReceipts;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<StockDashboardBean> getTurnOvers() {
		return turnOvers;
	}

	public void setTurnOvers(List<StockDashboardBean> turnOvers) {
		this.turnOvers = turnOvers;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public List<StockDashboardBean> getStocksInfoByCategory() {
		return stocksInfoByCategory;
	}

	public void setStocksInfoByCategory(
			List<StockDashboardBean> stocksInfoByCategory) {
		this.stocksInfoByCategory = stocksInfoByCategory;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public List<SkuPriceList> getSkuLists() {
		return skuLists;
	}

	public void setSkuLists(List<SkuPriceList> skuLists) {
		this.skuLists = skuLists;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public int getShiftId() {
		return shiftId;
	}

	public void setShiftId(int shiftId) {
		this.shiftId = shiftId;
	}

	public List<ShiftMaster> getShifts() {
		return shifts;
	}

	public void setShifts(List<ShiftMaster> shifts) {
		this.shifts = shifts;
	}

	public List<StockIssues> getIssueIds() {
		return issueIds;
	}

	public void setIssueIds(List<StockIssues> issueIds) {
		this.issueIds = issueIds;
	}

	private String issue_to;
	
	private List<LanguageBean> languages;
	
	private List<StoreStockVerification> verificationList;
	
	private List<StoreStockVerificationDetails> verificationItemsList;
	
	private String verification_code;
	
	private List<OrderDetails> ordersList;

	private OrderDetails orderDetails;
	
	private List<ItemDetails> orderItemDetails;

	
	
	public String getShipped_from() {
		return shipped_from;
	}

	public void setShipped_from(String shipped_from) {
		this.shipped_from = shipped_from;
	}

	public List<OrderDetails> getOrdersList() {
		return ordersList;
	}

	public void setOrdersList(List<OrderDetails> ordersList) {
		this.ordersList = ordersList;
	}

	public OrderDetails getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(OrderDetails orderDetails) {
		this.orderDetails = orderDetails;
	}

	public List<ItemDetails> getOrderItemDetails() {
		return orderItemDetails;
	}

	public void setOrderItemDetails(List<ItemDetails> orderItemDetails) {
		this.orderItemDetails = orderItemDetails;
	}

	public List<StoreStockVerificationDetails> getVerificationItemsList() {
		return verificationItemsList;
	}

	public void setVerificationItemsList(
			List<StoreStockVerificationDetails> verificationItemsList) {
		this.verificationItemsList = verificationItemsList;
	}

	public String getVerification_code() {
		return verification_code;
	}

	public void setVerification_code(String verification_code) {
		this.verification_code = verification_code;
	}

	public List<StoreStockVerification> getVerificationList() {
		return verificationList;
	}

	public void setVerificationList(List<StoreStockVerification> verificationList) {
		this.verificationList = verificationList;
	}

	public List<LanguageBean> getLanguages() {
		return languages;
	}

	public void setLanguages(List<LanguageBean> languages) {
		this.languages = languages;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIssue_to() {
		return issue_to;
	}

	public void setIssue_to(String issue_to) {
		this.issue_to = issue_to;
	}



	public String getGoods_issue_ref_num() {
		return goods_issue_ref_num;
	}

	public void setGoods_issue_ref_num(String goods_issue_ref_num) {
		this.goods_issue_ref_num = goods_issue_ref_num;
	}

	public String getGoods_receipt_ref_num() {
		return goods_receipt_ref_num;
	}

	public void setGoods_receipt_ref_num(String goods_receipt_ref_num) {
		this.goods_receipt_ref_num = goods_receipt_ref_num;
	}

	public StockReciept getReceipt() {
		return receipt;
	}

	public void setReceipt(StockReciept receipt) {
		this.receipt = receipt;
	}

	public List<StockRecieptDetails> getItemDetails() {
		return itemDetails;
	}

	public void setItemDetails(List<StockRecieptDetails> itemDetails) {
		this.itemDetails = itemDetails;
	}

	public List<StockReciept> getReceipts() {
		return receipts;
	}

	public void setReceipts(List<StockReciept> receipts) {
		this.receipts = receipts;
	}

	public String getReceipt_location() {
		return receipt_location;
	}

	public void setReceipt_location(String receipt_location) {
		this.receipt_location = receipt_location;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public List<Id> getSkuIds() {
		return skuIds;
	}

	public void setSkuIds(List<Id> skuIds) {
		this.skuIds = skuIds;
	}

	public List<Tax> getTaxDetails() {
		return taxDetails;
	}

	public void setTaxDetails(List<Tax> taxDetails) {
		this.taxDetails = taxDetails;
	}

	public List<LocationBean> getLocationDetails() {
		return locationDetails;
	}

	public void setLocationDetails(List<LocationBean> locationDetails) {
		this.locationDetails = locationDetails;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public List<Outlet> getStoreDetails() {
		return storeDetails;
	}

	public void setStoreDetails(List<Outlet> storeDetails) {
		this.storeDetails = storeDetails;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	
	
	public String getWh_location() {
		return wh_location;
	}

	public void setWh_location(String wh_location) {
		this.wh_location = wh_location;
	}

	
	public StockReciept getWarehouse_receipt() {
		return warehouse_receipt;
	}

	public void setWarehouse_receipt(StockReciept warehouse_receipt) {
		this.warehouse_receipt = warehouse_receipt;
	}

	@Override
	public String toString() {
		return "ClassPojo [responseHeader = " + responseHeader
				+ ", storeDetails = " + storeDetails + "]";
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getStartPriceRange() {
		return startPriceRange;
	}
	public void setStartPriceRange(String startPriceRange) {
		this.startPriceRange = startPriceRange;
	}
	public String getEndPricRange() {
		return endPricRange;
	}
	public void setEndPricRange(String endPricRange) {
		this.endPricRange = endPricRange;
	}
	public String getBrandCode() {
		return brandCode;
	}
	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}
	public String getInitialRecord() {
		return initialRecord;
	}
	public void setInitialRecord(String initialRecord) {
		this.initialRecord = initialRecord;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getZoneID() {
		return zoneID;
	}
	public void setZoneID(String zoneID) {
		this.zoneID = zoneID;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public Float getEndPriceRange() {
		return endPriceRange;
	}
	public void setEndPriceRange(Float endPriceRange) {
		this.endPriceRange = endPriceRange;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public String getIndentedBy() {
		return indentedBy;
	}
	public void setIndentedBy(String indentedBy) {
		this.indentedBy = indentedBy;
	}
	public Float getRequestedQty() {
		return requestedQty;
	}
	public void setRequestedQty(Float requestedQty) {
		this.requestedQty = requestedQty;
	}
	public Float getIssuedQty() {
		return issuedQty;
	}
	public void setIssuedQty(Float issuedQty) {
		this.issuedQty = issuedQty;
	}
	public String getZoneId() {
		return zoneId;
	}
	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}
	public String getWareHouseLocation() {
		return wareHouseLocation;
	}
	public void setWareHouseLocation(String wareHouseLocation) {
		this.wareHouseLocation = wareHouseLocation;
	}
	public List<String> getPoRefList() {
		return poRefList;
	}
	public void setPoRefList(List<String> poRefList) {
		this.poRefList = poRefList;
	}
	public String getFromStoreCode() {
		return fromStoreCode;
	}
	public void setFromStoreCode(String fromStoreCode) {
		this.fromStoreCode = fromStoreCode;
	}
	public String getToStoreCode() {
		return toStoreCode;
	}
	public void setToStoreCode(String toStoreCode) {
		this.toStoreCode = toStoreCode;
	}
	public List<String> getZonesList() {
		return zonesList;
	}
	public void setZonesList(List<String> zonesList) {
		this.zonesList = zonesList;
	}
	public String getOutletLocation() {
		return outletLocation;
	}
	public void setOutletLocation(String outletLocation) {
		this.outletLocation = outletLocation;
	}
	public String getWarehouseLocation() {
		return warehouseLocation;
	}
	public void setWarehouseLocation(String warehouseLocation) {
		this.warehouseLocation = warehouseLocation;
	}
	public boolean isIssueAndClose() {
		return issueAndClose;
	}
	public void setIssueAndClose(boolean issueAndClose) {
		this.issueAndClose = issueAndClose;
	}
	public boolean isNotForDownload() {
		return notForDownload;
	}
	public void setNotForDownload(boolean notForDownload) {
		this.notForDownload = notForDownload;
	}
	public boolean isEnforceGeneratePO() {
		return enforceGeneratePO;
	}
	public void setEnforceGeneratePO(boolean enforceGeneratePO) {
		this.enforceGeneratePO = enforceGeneratePO;
	}
	public List<StockIssueDetails> getReciptDetails() {
		return reciptDetails;
	}
	public void setReciptDetails(List<StockIssueDetails> reciptDetails) {
		this.reciptDetails = reciptDetails;
	}
	public String getEndDateStr() {
		return endDateStr;
	}
	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}
	public Boolean getToConfirm() {
		return toConfirm;
	}
	public void setToConfirm(Boolean toConfirm) {
		this.toConfirm = toConfirm;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public List<String> getRequestIds() {
		return requestIds;
	}
	public void setRequestIds(List<String> requestIds) {
		this.requestIds = requestIds;
	}
	public String getSaveStockFilePath() {
		return saveStockFilePath;
	}
	public void setSaveStockFilePath(String saveStockFilePath) {
		this.saveStockFilePath = saveStockFilePath;
	}
	public boolean isSaveStockReport() {
		return saveStockReport;
	}
	public void setSaveStockReport(boolean saveStockReport) {
		this.saveStockReport = saveStockReport;
	}
	public String getReceiptNoteId() {
		return receiptNoteId;
	}
	public void setReceiptNoteId(String receiptNoteId) {
		this.receiptNoteId = receiptNoteId;
	}
	public boolean isZeroStockCheckAtOutletLevel() {
		return zeroStockCheckAtOutletLevel;
	}
	public void setZeroStockCheckAtOutletLevel(boolean zeroStockCheckAtOutletLevel) {
		this.zeroStockCheckAtOutletLevel = zeroStockCheckAtOutletLevel;
	}
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	public String getStartIndexStr() {
		return startIndexStr;
	}
	public void setStartIndexStr(String startIndexStr) {
		this.startIndexStr = startIndexStr;
	}
	public String getBillId() {
		return billId;
	}
	public void setBillId(String billId) {
		this.billId = billId;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
}