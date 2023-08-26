package com.tlabs.posweb.beans;

import java.util.Date;



public class EventManPowerDetails {

	private String sNo;
	
	
	private String eventReference;
	
	
	private String eventName;
	

	private String storeLocation;
	
	
	private String employeeId;
	

	private String employeeName;
	
	
	private String employeeRole;
	
	/*@Column(name = "date_of_joining")
	private String dateOfJoining;*/

	private Date updatedDate;
	
	
	private String employerContactNumber;
	

	private String employerEmail;
	
	
	private String userName;
	
	
	private String roleName;

	
	private Date dateOfJoining;

	private String  dateOfJoiningStr;
	
	private Date createdDate;
	private String createdDateStr;
	
	  private int submissionCount=1;

	
	public int getSubmissionCount() {
		return submissionCount;
	}

	public void setSubmissionCount(int submissionCount) {
		this.submissionCount = submissionCount;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public Date getDateOfJoining() {
		return dateOfJoining;
	}

	public void setDateOfJoining(Date dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}

	public String getDateOfJoiningStr() {
		return dateOfJoiningStr;
	}

	public void setDateOfJoiningStr(String dateOfJoiningStr) {
		this.dateOfJoiningStr = dateOfJoiningStr;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getsNo() {
		return sNo;
	}

	public void setsNo(String sNo) {
		this.sNo = sNo;
	}

	public String getEventReference() {
		return eventReference;
	}

	public void setEventReference(String eventReference) {
		this.eventReference = eventReference;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
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

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getEmployeeRole() {
		return employeeRole;
	}

	public void setEmployeeRole(String employeeRole) {
		this.employeeRole = employeeRole;
	}

	public String getEmployerContactNumber() {
		return employerContactNumber;
	}

	public void setEmployerContactNumber(String employerContactNumber) {
		this.employerContactNumber = employerContactNumber;
	}

	public String getEmployerEmail() {
		return employerEmail;
	}

	public void setEmployerEmail(String employerEmail) {
		this.employerEmail = employerEmail;
	}

	public String getUserName() {
		return userName;
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
	
	
	
}		