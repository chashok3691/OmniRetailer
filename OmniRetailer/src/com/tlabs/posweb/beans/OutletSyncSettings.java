package com.tlabs.posweb.beans;

/*import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.tlabs.omniretailerservices.beans.RequestHeader*/

//import java.util.Date;
import java.util.List;

//@Entity
//@Table(name = "outlet_sync_settings")
public class OutletSyncSettings {

//	@Id
//	@Column(name = "s_no")
	//@GeneratedValue(strategy = GenerationType.AUTO)
	private String sNo;
	
	
	public String getCounterType() {
		return counterType;
	}

	public void setCounterType(String counterType) {
		this.counterType = counterType;
	}

	public boolean isActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(boolean activeStatus) {
		this.activeStatus = activeStatus;
	}

	private String counterType; 
	private boolean activeStatus;
//	@Transient
	private ResponseHeader responseHeader;
//	@Transient
	private String zoneId;
//	@Transient
	private List<String> LocationsList;
//	@Transient
	private String startIndex;
//	@Transient
	private String maxRecords;
	
//	@Transient
	private int totalRecords;
	
//	@Transient
	private String emailId;
//	@Transient
	private String phoneNumber;

	
	
//	@Transient
	private List<OutletSyncSettings>outletSyncList;
	
	private String lastDownloadedDateSkuStr;
	private String lastDownloadedDateOfferStr;
	private String lastDownloadedDateDealStr;
	
	
	
	public String getLastDownloadedDateSkuStr() {
		return lastDownloadedDateSkuStr;
	}

	public void setLastDownloadedDateSkuStr(String lastDownloadedDateSkuStr) {
		this.lastDownloadedDateSkuStr = lastDownloadedDateSkuStr;
	}

	public String getLastDownloadedDateOfferStr() {
		return lastDownloadedDateOfferStr;
	}

	public void setLastDownloadedDateOfferStr(String lastDownloadedDateOfferStr) {
		this.lastDownloadedDateOfferStr = lastDownloadedDateOfferStr;
	}

	public String getLastDownloadedDateDealStr() {
		return lastDownloadedDateDealStr;
	}

	public void setLastDownloadedDateDealStr(String lastDownloadedDateDealStr) {
		this.lastDownloadedDateDealStr = lastDownloadedDateDealStr;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public List<String> getLocationsList() {
		return LocationsList;
	}

	public void setLocationsList(List<String> locationsList) {
		LocationsList = locationsList;
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

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public List<OutletSyncSettings> getOutletSyncList() {
		return outletSyncList;
	}

	public void setOutletSyncList(List<OutletSyncSettings> outletSyncList) {
		this.outletSyncList = outletSyncList;
	}

	private List<OutletSyncSettings> outletSyncSettings;
	
public List<OutletSyncSettings> getOutletSyncSettings() {
		return outletSyncSettings;
	}

	public void setOutletSyncSettings(List<OutletSyncSettings> outletSyncSettings) {
		this.outletSyncSettings = outletSyncSettings;
	}

	//	@Column(name = "device_id")
	private String deviceId = null;
	
//	@Column(name = "deal_status")
	private boolean dealStatus;
	
//	@Column(name = "tax_status")
	private boolean taxStatus;
	
//	@Column(name = "sku_status")
	private boolean skuStatus;
	
//	@Column(name = "offer_status")
	private boolean offerStatus;
	
//	@Column(name = "tables_status")
	private boolean tableStatus;
	
//	@Column(name = "waiters_status")
	private boolean waitersStatus;
	
//	@Column(name = "employee_status")
	private boolean employeeStatus;
	
	private boolean customerStatus;

public boolean isCustomerStatus() {
		return customerStatus;
	}

	public void setCustomerStatus(boolean customerStatus) {
		this.customerStatus = customerStatus;
	}

	//	@Column(name = "department_status")
	private boolean departmentStatus;
	/*
	@Column(name = "subdepartment_status")
	private boolean subDepartmentStatus;*/

//	@Column(name = "product_master_status")
	private boolean productMasterStatus;
//	@Column(name = "product_sub_category_status")
	private boolean productSubCategoryStatus;
	
//	@Column(name = "product_category_status")
	private boolean productCategoryStatus;
	
//	@Column(name = "denomination_master_status")
	private boolean denominationMasterStatus;


	public String getCounterId() {
		return counterId;
	}

	public void setCounterId(String counterId) {
		this.counterId = counterId;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

//	@Column(name = "counter_id")
	private String counterId;


//	@Column(name = "store_location")
	private String storeLocation;


	/*@Column(name = "created_date")
	private Date createdDate;

	@Column(name = "counter_id")
	private String counterId;

	@Column(name = "updated_date")
	private Date updatedDate;

	public String getCounterId()
	{
		return counterId;
	}

	public void setCounterId(String counterId)
	{
		this.counterId = counterId;
	}

	public Date getCreatedDate()
	{
		return createdDate;
	}

	public void setCreatedDate(Date createdDate)
	{
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate()
	{
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate)
	{
		this.updatedDate = updatedDate;
	}*/
	
//	@Transient
	private RequestHeader requestHeader;
	
	
	public boolean isProductMasterStatus() {
		return productMasterStatus;
	}

	public void setProductMasterStatus(boolean productMasterStatus) {
		this.productMasterStatus = productMasterStatus;
	}

	public boolean isProductSubCategoryStatus() {
		return productSubCategoryStatus;
	}

	public void setProductSubCategoryStatus(boolean productSubCategoryStatus) {
		this.productSubCategoryStatus = productSubCategoryStatus;
	}

	public boolean isProductCategoryStatus() {
		return productCategoryStatus;
	}

	public void setProductCategoryStatus(boolean productCategoryStatus) {
		this.productCategoryStatus = productCategoryStatus;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public boolean isDealStatus() {
		return dealStatus;
	}

	public void setDealStatus(boolean dealStatus) {
		this.dealStatus = dealStatus;
	}

	public boolean isTaxStatus() {
		return taxStatus;
	}

	public void setTaxStatus(boolean taxStatus) {
		this.taxStatus = taxStatus;
	}

	public boolean isSkuStatus() {
		return skuStatus;
	}

	public void setSkuStatus(boolean skuStatus) {
		this.skuStatus = skuStatus;
	}

	public boolean isOfferStatus() {
		return offerStatus;
	}

	public void setOfferStatus(boolean offerStatus) {
		this.offerStatus = offerStatus;
	}

	public boolean isTableStatus() {
		return tableStatus;
	}

	public void setTableStatus(boolean tableStatus) {
		this.tableStatus = tableStatus;
	}

	public boolean isWaitersStatus() {
		return waitersStatus;
	}

	public void setWaitersStatus(boolean waitersStatus) {
		this.waitersStatus = waitersStatus;
	}

	public String getsNo() {
		return sNo;
	}

	public void setsNo(String sNo) {
		this.sNo = sNo;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public boolean isEmployeeStatus() {
		return employeeStatus;
	}

	public void setEmployeeStatus(boolean employeeStatus) {
		this.employeeStatus = employeeStatus;
	}

	public boolean isDepartmentStatus() {
		return departmentStatus;
	}

	public void setDepartmentStatus(boolean departmentStatus) {
		this.departmentStatus = departmentStatus;
	}

	public boolean isDenominationMasterStatus() {
		return denominationMasterStatus;
	}

	public void setDenominationMasterStatus(boolean denominationMasterStatus) {
		this.denominationMasterStatus = denominationMasterStatus;
	}

/*	public boolean isSubDepartmentStatus() {
		return subDepartmentStatus;
	}

	public void setSubDepartmentStatus(boolean subDepartmentStatus) {
		this.subDepartmentStatus = subDepartmentStatus;
	}*/
	
	
}
