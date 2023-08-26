package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;



import com.tlabs.posweb.beans.RequestHeader;

//@Entity
//@Table(name = "stock_verification_master")
public class StoreStockVerificationMaster {

	//@Id
	//@Column(name = "stock_verification_code")
	private String verification_code;

	//@Column(name = "approved_by")
	private String approvedBy;

	//@Column(name = "approved_on")
	private Date approvedOn;

	//@Column(name = "location")
	private String location;

	//@Column(name = "description")
	private String description;

	//@Column(name = "verification_start_date")
	private Date startDate;

	//@Column(name = "verification_end_date")
	private Date endDate;

	//@Column(name = "user_name")
	private String userName;

	//@Column(name = "role_name")
	private String roleName;

	//@Column(name = "status")
	private String status;

	//@Column(name = "brand")
	private String brand;

	//@Column(name = "model")
	private String model;

	//@Column(name = "department")
	private String department;

	//@Column(name = "product_category")
	private String productcategory;

	//@Column(name = "sub_category")
	private String subcategory;

	//new fields  added on 19-06-2017

	private boolean allowMultiplesForDay;
	
	
	
	public boolean isAllowMultiplesForDay() {
		return allowMultiplesForDay;
	}

	public void setAllowMultiplesForDay(boolean allowMultiplesForDay) {
		this.allowMultiplesForDay = allowMultiplesForDay;
	}

	//@Column(name = "is_periodic")
	private Boolean isPeriodic;

	
	public Boolean getIsPeriodic() {
		return isPeriodic;
	}

	public void setIsPeriodic(Boolean isPeriodic) {
		this.isPeriodic = isPeriodic;
	}

	//@Column(name = "periodic_type")
	private String periodicType;

	//@Column(name = "periodic_days")
	private int periodicdays;

	//@Column(name = "periodic_date")
	private int specificDate;

	//@Column(name = "periodic_month")
	private int specifiCMonth;

	//@Transient
	private List<String> daysNameList;

	//@Column(name = "specific_day")
	private String specDays;
	private String flowUnder;
	//new fields  added on 19-06-2017

	private String startTimeStr;
	private String groupId;

	
	
public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
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

private String endTimeStr;
	public String getFlowUnder() {
	return flowUnder;
}

public void setFlowUnder(String flowUnder) {
	this.flowUnder = flowUnder;
}

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

	//@Transient
	private List<String> verificationCodesList;

	//@Transient
	private boolean datesChanged;

	//@Transient
	private boolean validMasterCode;

	//@Transient
	private boolean verificationsUnderMasterCode;

	//@Transient
	private List<StoreStockVerification> stockVerificationList;

	//@Transient
	private String loss_type;

	//@Transient
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

	//@Transient
	private String approvedOnStr;

	//@Transient
	private Integer startIndex;

	//@Transient
	private Integer maxRecords;

	//@Transient
	private String searchCriteria;

	//@Transient
	private RequestHeader requestHeader;

	//@Transient
	private String startDateStr;

	//@Transient
	private String endDateStr;

	//@Transient
	private String verificationStartDateStr;

	//@Transient
	private String verificationEndDateStr;

	//@Transient
	private List<StoreStockVerificationItems> itemsList;

	public String getVerification_code() {
		return verification_code;
	}

	public boolean isVerificationsUnderMasterCode() {
		return verificationsUnderMasterCode;
	}

	public void setVerificationsUnderMasterCode(boolean verificationsUnderMasterCode) {
		this.verificationsUnderMasterCode = verificationsUnderMasterCode;
	}

	public List<StoreStockVerification> getStockVerificationList() {
		return stockVerificationList;
	}

	public void setStockVerificationList(List<StoreStockVerification> stockVerificationList) {
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

	public List<StoreStockVerificationItems> getItemsList() {
		return itemsList;
	}

	public void setItemsList(List<StoreStockVerificationItems> itemsList) {
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

}
