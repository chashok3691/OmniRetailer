package com.tlabs.posweb.beans;
//import java.util.Date;
import java.util.List;

public class EmployeeBean {


	private String employeeCode;
	private String firstName;
	private String lastName;
	private String middleName;
	private String dateOfJoin;
	private String designation;
	private String location = null;
	private String dob;
	private String department;
	private String reportingManager;
	private String serviceType;
	private String highestQualification;
	//private Float yearsOfExperience;
	private String remarks;
	private int shiftId;
	private String email;
	private String createdDate;
	private String updatedDate;
	private String userName;
	private String roleName;
	private String subDepartment;
	
	private List<String> locationsList;
	
	public List<String> getLocationsList() {
		return locationsList;
	}
	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}
	private float yearsOfExperience;
	
	public float getYearsOfExperience() {
		return yearsOfExperience;
	}
	public void setYearsOfExperience(float yearsOfExperience) {
		this.yearsOfExperience = yearsOfExperience;
	}
	// Added by kesav
	private String jobLocation;
	private String doorNum;
	private String streetName;
	private String city;
	private String zipCode;
	private String consultantType;
	private String primarySpecialization;
	private String secondarySpecialization;
	private String phonuNum;
	private boolean status;
	private float ratig;
	private float overSeasExperience;
	private String searchCriteria;
	private String createdDateStr;
	private String updatedDateStr;
	private String dobStr;
	private String dateOfJoingingStr;
	
	/*@Transient
	private List<ConsultantCalendar> consultantCalenderList;*/
	
	private int slNo;
	private String dateOfJoining;
	
	private String dateOfBirth;
	
	private String orderDate;
	
	private String startIndex;
	
	private String startDate = null;
	
	private String endDate = null;
	
	private String maxRecords;
	
	//private List<ConsultantCalendar> consultantCalenderList;
	
	private List<String> employeeList;
		
	private RequestHeader requestHeader;
	
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getShiftId() {
		return shiftId;
	}
	public void setShiftId(int shiftId) {
		this.shiftId = shiftId;
	}
	public String getEmployeeCode() {
		return employeeCode;
	}
	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
 
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
 
	public String getJobLocation() {
		return jobLocation;
	}
	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}
	public String getDateOfJoin() {
		return dateOfJoin;
	}
	public void setDateOfJoin(String dateOfJoin) {
		this.dateOfJoin = dateOfJoin;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getDateOfJoining() {
		return dateOfJoining;
	}
	public void setDateOfJoining(String dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
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
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	/*public List<ConsultantCalendar> getConsultantCalenderList() {
		return consultantCalenderList;
	}
	public void setConsultantCalenderList(List<ConsultantCalendar> consultantCalenderList) {
		this.consultantCalenderList = consultantCalenderList;
	}*/
	public List<String> getEmployeeList() {
		return employeeList;
	}
	public void setEmployeeList(List<String> employeeList) {
		this.employeeList = employeeList;
	}
	public String getDoorNum() {
		return doorNum;
	}
	public void setDoorNum(String doorNum) {
		this.doorNum = doorNum;
	}
	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getConsultantType() {
		return consultantType;
	}
	public void setConsultantType(String consultantType) {
		this.consultantType = consultantType;
	}
	public String getPrimarySpecialization() {
		return primarySpecialization;
	}
	public void setPrimarySpecialization(String primarySpecialization) {
		this.primarySpecialization = primarySpecialization;
	}
	public String getSecondarySpecialization() {
		return secondarySpecialization;
	}
	public void setSecondarySpecialization(String secondarySpecialization) {
		this.secondarySpecialization = secondarySpecialization;
	}
	public String getPhonuNum() {
		return phonuNum;
	}
	public void setPhonuNum(String phonuNum) {
		this.phonuNum = phonuNum;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public float getRatig() {
		return ratig;
	}
	public void setRatig(float ratig) {
		this.ratig = ratig;
	}
	public float getOverSeasExperience() {
		return overSeasExperience;
	}
	public void setOverSeasExperience(float overSeasExperience) {
		this.overSeasExperience = overSeasExperience;
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
	public String getReportingManager() {
		return reportingManager;
	}
	public void setReportingManager(String reportingManager) {
		this.reportingManager = reportingManager;
	}
	public String getServiceType() {
		return serviceType;
	}
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	public String getUserName() {
		return userName;
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
	public String getDobStr() {
		return dobStr;
	}
	public void setDobStr(String dobStr) {
		this.dobStr = dobStr;
	}
	public String getDateOfJoingingStr() {
		return dateOfJoingingStr;
	}
	public void setDateOfJoingingStr(String dateOfJoingingStr) {
		this.dateOfJoingingStr = dateOfJoingingStr;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}
	public String getHighestQualification() {
		return highestQualification;
	}
	public void setHighestQualification(String highestQualification) {
		this.highestQualification = highestQualification;
	}
	
/*	
	public Float getYearsOfExperience() {
		return yearsOfExperience;
	}
	public void setYearsOfExperience(Float yearsOfExperience) {
		this.yearsOfExperience = yearsOfExperience;
	}*/
	/*public List<ShiftAllocation> getShiftAllocation() {
		return shiftAllocation;
	}
	public void setShiftAllocation(List<ShiftAllocation> shiftAllocation) {
		this.shiftAllocation = shiftAllocation;
	}*/
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	
	
	
	
	
	
}
