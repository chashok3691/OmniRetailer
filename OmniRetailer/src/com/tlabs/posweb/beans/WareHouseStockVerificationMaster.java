package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;



public class WareHouseStockVerificationMaster {

	private String verification_code;

	private String approvedBy;

	private Date approvedOn;

	private String location;

	private String description;

	private Date startDate;

	private Date endDate;

	private String userName;

	private String roleName;

	private String status;

	private String brand;

	private String model;

	private String department;

	private String productcategory;

	private String subcategory;

	//new fields  added on 19-06-2017

	private boolean isPeriodic;

	private String periodicType;

	private int periodicdays;

	private int specificDate;

	private int specifiCMonth;

	private Date startTime;

	private Date endTime;

	private String startTimeStr;

	private String endTimeStr;

	private List<String> daysNameList;

	private String specDays;

	private List<WarehouseStockVerificationMasterChilds> stockverfMasterChildList;

	private List<String> verificationCodesList;

	private boolean datesChanged;

	private boolean validMasterCode;

	private boolean verificationsUnderMasterCode;

	private List<WareHouseStockVerification> stockVerificationList;

	private String loss_type;

	private String zoneId;

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	private String approvedOnStr;

	private Integer startIndex;

	private Integer maxRecords;

	private String searchCriteria;

	private RequestHeader requestHeader;

	private String startDateStr;

	private String endDateStr;

	private String verificationStartDateStr;

	private String verificationEndDateStr;

	private List<WareHouseStockVerificationItems> itemsList;

	public String getVerification_code() {
		return verification_code;
	}

	public boolean isVerificationsUnderMasterCode() {
		return verificationsUnderMasterCode;
	}

	public void setVerificationsUnderMasterCode(boolean verificationsUnderMasterCode) {
		this.verificationsUnderMasterCode = verificationsUnderMasterCode;
	}

	public List<WarehouseStockVerificationMasterChilds> getStockverfMasterChildList() {
		return stockverfMasterChildList;
	}

	public void setStockverfMasterChildList(List<WarehouseStockVerificationMasterChilds> stockverfMasterChildList) {
		this.stockverfMasterChildList = stockverfMasterChildList;
	}

	public List<WareHouseStockVerification> getStockVerificationList() {
		return stockVerificationList;
	}

	public void setStockVerificationList(List<WareHouseStockVerification> stockVerificationList) {
		this.stockVerificationList = stockVerificationList;
	}

	public int getSpecifiCMonth() {
		return specifiCMonth;
	}

	public void setSpecifiCMonth(int specifiCMonth) {
		this.specifiCMonth = specifiCMonth;
	}

	public void setVerification_code(String verification_code) {
		this.verification_code = verification_code;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public List<String> getDaysNameList() {
		return daysNameList;
	}

	public void setDaysNameList(List<String> daysNameList) {
		this.daysNameList = daysNameList;
	}

	public boolean isPeriodic() {
		return isPeriodic;
	}

	public void setPeriodic(boolean isPeriodic) {
		this.isPeriodic = isPeriodic;
	}

	public String getPeriodicType() {
		return periodicType;
	}

	public void setPeriodicType(String periodicType) {
		this.periodicType = periodicType;
	}

	public int getPeriodicdays() {
		return periodicdays;
	}

	public void setPeriodicdays(int periodicdays) {
		this.periodicdays = periodicdays;
	}

	public String getApprovedBy() {
		return approvedBy;
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

	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}

	public Date getApprovedOn() {
		return approvedOn;
	}

	public void setApprovedOn(Date approvedOn) {
		this.approvedOn = approvedOn;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public String getLoss_type() {
		return loss_type;
	}

	public void setLoss_type(String loss_type) {
		this.loss_type = loss_type;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public boolean isDatesChanged() {
		return datesChanged;
	}

	public void setDatesChanged(boolean datesChanged) {
		this.datesChanged = datesChanged;
	}

	public boolean isValidMasterCode() {
		return validMasterCode;
	}

	public void setValidMasterCode(boolean validMasterCode) {
		this.validMasterCode = validMasterCode;
	}

	public String getRoleName() {
		return roleName;
	}

	public List<String> getVerificationCodesList() {
		return verificationCodesList;
	}

	public void setVerificationCodesList(List<String> verificationCodesList) {
		this.verificationCodesList = verificationCodesList;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public List<WareHouseStockVerificationItems> getItemsList() {
		return itemsList;
	}

	public void setItemsList(List<WareHouseStockVerificationItems> itemsList) {
		this.itemsList = itemsList;
	}

	public Integer getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}

	public Integer getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(Integer maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
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

	public String getApprovedOnStr() {
		return approvedOnStr;
	}

	public void setApprovedOnStr(String approvedOnStr) {
		this.approvedOnStr = approvedOnStr;
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

	//new fields  added on 19-06-2017
	public int getSpecificDate() {
		return specificDate;
	}

	public void setSpecificDate(int specificDate) {
		this.specificDate = specificDate;
	}

	public String getSpecDays() {
		return specDays;
	}

	public void setSpecDays(String specDays) {
		this.specDays = specDays;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
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
