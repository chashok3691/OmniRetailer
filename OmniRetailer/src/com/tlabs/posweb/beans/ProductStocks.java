/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 17-3-2015
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

import java.math.BigDecimal;
import java.util.List;
//import java.util.Set;


/**
 * @author Sahitya
 * Verified By :
 * 
 * This class is used to receive/send product stocks related details from webservices/GUI to GUI/webservices
 */
public class ProductStocks {
	private BigDecimal totalQuantity;
    private BigDecimal totalPrice;
    private String supplierName;
	private boolean saveStockFlag;
	private RequestHeader requestHeader;
	private boolean boneyardSummaryFlag;
	private String status;
	private boolean isSaveReport;
//	private Set<String> stockLocations; 
	private List<String> stockLocations;
	private List<String> locationsList;
	private String storageArea="";

	
	

	public String getStorageArea() {
		return storageArea;
	}

	public void setStorageArea(String storageArea) {
		this.storageArea = storageArea;
	}

	public List<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}

	public List<String> getStockLocations() {
		return stockLocations;
	}

	public void setStockLocations(List<String> stockLocations) {
		this.stockLocations = stockLocations;
	}

	public boolean isSaveReport() {
		return isSaveReport;
	}

	public void setSaveReport(boolean isSaveReport) {
		this.isSaveReport = isSaveReport;
	}

	private String categoryName;
	private String store_location;
	private String zoneId; 
//	private String searchCriteria;
	
	private List<SkuDetails> reportsList;
	
	
	private String pluCode;
	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public boolean isBoneyardSummaryFlag() {
		return boneyardSummaryFlag;
	}

	public void setBoneyardSummaryFlag(boolean boneyardSummaryFlag) {
		this.boneyardSummaryFlag = boneyardSummaryFlag;
	}

	private String searchCriteria;
	
	private int startIndex;
	
	private String storeLocation;
	
	private String quantityInHand;
	
	private ResponseHeader responseHeader;
	
	private List<SkuDetails> sku;
	private List<SkuDetails> boneyardStockSummaries;
	private String stockType;
	
	private String searchType;
	
	private String startDate;
	
	private String endDate;

	private int requiredRecords;
	
	private String totalRecords;
	private String brand;
	private String category;
	private String subCategory;
	private String department;
	private Float startPriceRange;
	private Float endPriceRange;
	private String zoneID;
	private String stocksFilePath;

	private String salesReportFilePath;
	
	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}

	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
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
	
	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getStockType() {
		return stockType;
	}

	public void setStockType(String stockType) {
		this.stockType = stockType;
	}

	public int getRequiredRecords() {
		return requiredRecords;
	}

	public void setRequiredRecords(int requiredRecords) {
		this.requiredRecords = requiredRecords;
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

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public String getQuantityInHand() {
		return quantityInHand;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Float getStartPriceRange() {
		return startPriceRange;
	}

	public void setStartPriceRange(Float startPriceRange) {
		this.startPriceRange = startPriceRange;
	}

	public Float getEndPriceRange() {
		return endPriceRange;
	}

	public void setEndPriceRange(Float endPriceRange) {
		this.endPriceRange = endPriceRange;
	}

	public String getZone() {
		return zoneID;
	}

	public void setZone(String zone) {
		this.zoneID = zone;
	}

	public void setQuantityInHand(String quantityInHand) {
		this.quantityInHand = quantityInHand;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public List<SkuDetails> getSku() {
		return sku;
	}

	public void setSku(List<SkuDetails> sku) {
		this.sku = sku;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public boolean isSaveStockFlag() {
		return saveStockFlag;
	}

	public void setSaveStockFlag(boolean saveStockFlag) {
		this.saveStockFlag = saveStockFlag;
	}

	public String getStocksFilePath() {
		return stocksFilePath;
	}

	public void setStocksFilePath(String stocksFilePath) {
		this.stocksFilePath = stocksFilePath;
	}

	public List<SkuDetails> getBoneyardStockSummaries() {
		return boneyardStockSummaries;
	}

	public void setBoneyardStockSummaries(List<SkuDetails> boneyardStockSummaries) {
		this.boneyardStockSummaries = boneyardStockSummaries;
	}

	public BigDecimal getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(BigDecimal totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getStore_location() {
		return store_location;
	}

	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public List<SkuDetails> getReportsList() {
		return reportsList;
	}

	public void setReportsList(List<SkuDetails> reportsList) {
		this.reportsList = reportsList;
	}
	
	
	
}
