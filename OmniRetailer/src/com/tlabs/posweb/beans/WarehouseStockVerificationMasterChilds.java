package com.tlabs.posweb.beans;
import java.util.Date;
import java.util.List;



/**
 * 
 * @author Karthik
 *
 */
public class WarehouseStockVerificationMasterChilds {
	private String verificationRef;

	private String masterVerificationCode;

	private Date verificationStartDate;

	private Date verificationEndDate;

	private String status;

	private Date createdDate;

	private Date updatedDate;

	private String verificationDescription;

	private RequestHeader requestHeader;

	private String location;

	private String brand;

	private String model;

	private String department;

	private String productcategory;

	private String subcategory;

	private String startDateStr;

	private String endDateStr;

	private String startIndex;

	private String maxRecords;

	private String verfStartDateStr;

	private String verfEndDateStr;

	private String createdDateStr;

	private String updatedDateStr;

	private boolean verificationsUnderMasterCode;

	private List<WareHouseStockVerification> stockVerificationList;

	private String zoneId;

	private String lossType;

	private String searchCriteria;

	private String startTimeStr;

	private String endTimeStr;

	public String getVerificationRef() {
		return verificationRef;
	}

	public void setVerificationRef(String verificationRef) {
		this.verificationRef = verificationRef;
	}

	public String getMasterVerificationCode() {
		return masterVerificationCode;
	}

	public void setMasterVerificationCode(String masterVerificationCode) {
		this.masterVerificationCode = masterVerificationCode;
	}

	public Date getVerificationStartDate() {
		return verificationStartDate;
	}

	public void setVerificationStartDate(Date verificationStartDate) {
		this.verificationStartDate = verificationStartDate;
	}

	public Date getVerificationEndDate() {
		return verificationEndDate;
	}

	public void setVerificationEndDate(Date verificationEndDate) {
		this.verificationEndDate = verificationEndDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getVerificationDescription() {
		return verificationDescription;
	}

	public void setVerificationDescription(String verificationDescription) {
		this.verificationDescription = verificationDescription;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getProductcategory() {
		return productcategory;
	}

	public void setProductcategory(String productcategory) {
		this.productcategory = productcategory;
	}

	public String getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
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

	public String getVerfStartDateStr() {
		return verfStartDateStr;
	}

	public void setVerfStartDateStr(String verfStartDateStr) {
		this.verfStartDateStr = verfStartDateStr;
	}

	public String getVerfEndDateStr() {
		return verfEndDateStr;
	}

	public void setVerfEndDateStr(String verfEndDateStr) {
		this.verfEndDateStr = verfEndDateStr;
	}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public String getUpdatedDateStr() {
		return updatedDateStr;
	}

	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}

	public boolean isVerificationsUnderMasterCode() {
		return verificationsUnderMasterCode;
	}

	public void setVerificationsUnderMasterCode(boolean verificationsUnderMasterCode) {
		this.verificationsUnderMasterCode = verificationsUnderMasterCode;
	}

	public String getZoneId() {
		return zoneId;
	}

	public List<WareHouseStockVerification> getStockVerificationList() {
		return stockVerificationList;
	}

	public void setStockVerificationList(List<WareHouseStockVerification> stockVerificationList) {
		this.stockVerificationList = stockVerificationList;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getLossType() {
		return lossType;
	}

	public void setLossType(String lossType) {
		this.lossType = lossType;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
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
}
