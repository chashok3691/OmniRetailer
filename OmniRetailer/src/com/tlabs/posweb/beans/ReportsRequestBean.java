/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 21-8-2015
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

/**
 * @author Sahitya
 * Verified By :
 * 
 * This class is used to receive/send reports request & repsonse parameteres 
 */
public class ReportsRequestBean {
	private String searchCriteriaStr;
	private String reportEndDate;
	private String categoryName;
	 private String reportDate;
	 private String zoneId;
	 private String subCategory;
	 private String brand;
	 private String department;
    private String counterId;
    private String location;
    private String reportType;
    private String maxRecords;
    private String store_location;
	private String brandName;
	private String section;
    private RequestHeader requestHeader;
    private String supplierName;
    private String shiftId;
    
    private String startIndex;
    
    private String startDate;
    
    private String endDate;
    
    private String searchCriteria;
    
    private String requiredRecords;
    
    private String date;
    private String time;
    private String salesChannel;
    
    private List<CashHandOverDenominations> cashHandOverDenominations;
    
    private String reportId;
    
    private String originalBillId;
	private String tenderName;
	
	private boolean fileRequired;
	private String fileUrl;
	
	private String serailBillIdYearly;
	
	
	
	
    
    public String getSerailBillIdYearly() {
		return serailBillIdYearly;
	}

	public void setSerailBillIdYearly(String serailBillIdYearly) {
		this.serailBillIdYearly = serailBillIdYearly;
	}
	
	
    
    public boolean isFileRequired() {
		return fileRequired;
	}

	public void setFileRequired(boolean fileRequired) {
		this.fileRequired = fileRequired;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	public String getOriginalBillId() {
		return originalBillId;
	}

	public void setOriginalBillId(String originalBillId) {
		this.originalBillId = originalBillId;
	}

	public String getTenderName() {
		return tenderName;
	}

	public void setTenderName(String tenderName) {
		this.tenderName = tenderName;
	}

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	public List<CashHandOverDenominations> getCashHandOverDenominations() {
		return cashHandOverDenominations;
	}

	public void setCashHandOverDenominations(List<CashHandOverDenominations> cashHandOverDenominations) {
		this.cashHandOverDenominations = cashHandOverDenominations;
	}

	public String getSalesChannel() {
		return salesChannel;
	}

	public void setSalesChannel(String salesChannel) {
		this.salesChannel = salesChannel;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	private String order;
    
	private String orderBy;
	
	private String searchName;
	
	private String customer;
	private boolean isSaveReport;
	
	private boolean saveReportFlag;
	
	private String salesReportFilePath;
	
	private String cashierId;
	private boolean hourWiseReport=false;

	
	
	private String skuID;
	private String plucode;
	
	private boolean counterWiseFlag;
	
	
	
	

	public boolean isHourWiseReport() {
		return hourWiseReport;
	}

	public void setHourWiseReport(boolean hourWiseReport) {
		this.hourWiseReport = hourWiseReport;
	}

	public boolean isCounterWiseFlag() {
		return counterWiseFlag;
	}

	public void setCounterWiseFlag(boolean counterWiseFlag) {
		this.counterWiseFlag = counterWiseFlag;
	}

	public String getSkuID() {
		return skuID;
	}

	public void setSkuID(String skuID) {
		this.skuID = skuID;
	}

	public String getPlucode() {
		return plucode;
	}

	public void setPlucode(String plucode) {
		this.plucode = plucode;
	}

	private List<String> locationsList;
	public List<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}

	private String pluCode;
	private String storeLocation;
	
	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	private String skuId;
    
	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getCashierId() {
		return cashierId;
	}

	public void setCashierId(String cashierId) {
		this.cashierId = cashierId;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getReportEndDate() {
		return reportEndDate;
	}

	public void setReportEndDate(String reportEndDate) {
		this.reportEndDate = reportEndDate;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getRequiredRecords() {
		return requiredRecords;
	}

	public void setRequiredRecords(String requiredRecords) {
		this.requiredRecords = requiredRecords;
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

	public String getShiftId() {
		return shiftId;
	}

	public void setShiftId(String shiftId) {
		this.shiftId = shiftId;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getCounterId() {
		return counterId;
	}

	public void setCounterId(String counterId) {
		this.counterId = counterId;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public String getStore_location() {
		return store_location;
	}

	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
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

	public boolean isSaveReportFlag() {
		return saveReportFlag;
	}

	public void setSaveReportFlag(boolean saveReportFlag) {
		this.saveReportFlag = saveReportFlag;
	}

	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}

	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSearchCriteriaStr() {
		return searchCriteriaStr;
	}

	public void setSearchCriteriaStr(String searchCriteriaStr) {
		this.searchCriteriaStr = searchCriteriaStr;
	}
	
	
}
