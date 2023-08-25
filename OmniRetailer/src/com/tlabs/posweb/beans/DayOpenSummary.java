package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Set;


public class DayOpenSummary {

	private String dayOpenId;
	
	//@Column(name = "business_date")
	private Date businessDate;
	
	//@Column(name="created_date")
	private Date createdDate;
	
	//@Column(name="shift_Id")
	private int shiftId;
	
	//@Column(name="comments")
	private String comments;
	
	//@Column(name="counter_id")
	private String counterId;
	
	//@Column(name="store_location")
	private String storeLocation;
	
	private String counterName;
	public String getCounterName() {
		return counterName;
	}

	public void setCounterName(String counterName) {
		this.counterName = counterName;
	}
	//@Column(name="employee_Id")
	private String employeeId;
	
	//@Column(name="user_name")
	private String user_name;
	
	//@Column(name="role")
	private String role;
	
	//@Column(name="carry_forward_amount")
	private BigDecimal carryForwardAmt;
	
	//@Column(name="actual_float_amount")
	private BigDecimal actualAmt;
	
	//@Column(name="carry_forward_note_count")
	private int carryForwardNoteCount;
	
	//@Column(name="actual_note_count")
	private int actualNoteCount;
	
	private String versionId;
	
	private String filePathUrl;
	
	
	
	public String getFilePathUrl() {
		return filePathUrl;
	}

	public void setFilePathUrl(String filePathUrl) {
		this.filePathUrl = filePathUrl;
	}

	public String getVersionId() {
		return versionId;
	}

	public void setVersionId(String versionId) {
		this.versionId = versionId;
	}
	private String counterActivatedOn;

	public String getCounterActivatedOn() {
		return counterActivatedOn;
	}

	public void setCounterActivatedOn(String counterActivatedOn) {
		this.counterActivatedOn = counterActivatedOn;
	}
	private Set<DayOpenSummaryDenominations> denominationsList;
	
	
	//	@Transient
	private RequestHeader requestHeader;
	
	//	@Transient
	private ResponseHeader responseHeader;

	//	@Transient
	private String startIndex;
	
	//	@Transient
	private String maxRecords;
	
	//	@Transient
	private int totalRecords;
	
	private boolean saveReport;
	
	//	@Transient
	private String searchCriteria;
	private String counterStatus;
	
	
	

	public boolean isSaveReport() {
		return saveReport;
	}

	public void setSaveReport(boolean saveReport) {
		this.saveReport = saveReport;
	}

	public String getCounterStatus() {
		return counterStatus;
	}

	public void setCounterStatus(String counterStatus) {
		this.counterStatus = counterStatus;
	}


	public String getDayOpenId() {
		return dayOpenId;
	}

	public void setDayOpenId(String dayOpenId) {
		this.dayOpenId = dayOpenId;
	}

	public Date getBusinessDate() {
		return businessDate;
	}

	public void setBusinessDate(Date businessDate) {
		this.businessDate = businessDate;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public int getShiftId() {
		return shiftId;
	}

	public void setShiftId(int shiftId) {
		this.shiftId = shiftId;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

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

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public BigDecimal getCarryForwardAmt() {
		return carryForwardAmt;
	}

	public void setCarryForwardAmt(BigDecimal carryForwardAmt) {
		this.carryForwardAmt = carryForwardAmt;
	}

	public BigDecimal getActualAmt() {
		return actualAmt;
	}

	public void setActualAmt(BigDecimal actualAmt) {
		this.actualAmt = actualAmt;
	}

	public int getCarryForwardNoteCount() {
		return carryForwardNoteCount;
	}

	public void setCarryForwardNoteCount(int carryForwardNoteCount) {
		this.carryForwardNoteCount = carryForwardNoteCount;
	}

	public int getActualNoteCount() {
		return actualNoteCount;
	}

	public void setActualNoteCount(int actualNoteCount) {
		this.actualNoteCount = actualNoteCount;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
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

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getBusiness_date() {
		return business_date;
	}

	public void setBusiness_date(String business_date) {
		this.business_date = business_date;
	}

	//	@Transient
	private String business_date;

	public Set<DayOpenSummaryDenominations> getDenominationsList() {
		return denominationsList;
	}

	public void setDenominationsList(Set<DayOpenSummaryDenominations> denominationsList) {
		this.denominationsList = denominationsList;
	}
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Set<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(Set<String> locationsList) {
		this.locationsList = locationsList;
	}
	public List<DayOpenSummary> getDayOpen() {
		return dayOpen;
	}

	public void setDayOpen(List<DayOpenSummary> dayOpen) {
		this.dayOpen = dayOpen;
	}

	//	@Transient
	private String startDate;

	//	@Transient
	private String zoneId;

	//	@Transient
	private String endDate;
	
	//	@Transient
	private Set<String> locationsList;

	//	@Transient
	private List<DayOpenSummary> dayOpen;

}
