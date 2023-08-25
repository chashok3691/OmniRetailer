package com.tlabs.posweb.beans;

import java.io.Serializable;
import java.util.List;

public class Department implements Serializable {
 /**
	 * 
	 */
	private static final long serialVersionUID = 3591084994585526635L;
private String primaryDepartment;
 private String departmentDescription;
 private String dateTimeStr;
 private String startIndex;
 private String secondaryDepartment;
 private int noOfSubDepartments;
 List<SecondaryDepartment> secondaryDepartments;
 List<SkuDepartment> skuDepartments;
 RequestHeader requestHeader;
 private List<String> deletedSkuList;
 private String totalRecords;
 private String searchCriteria;
 private List<Department> departments;
 private List<Department> departmentList;
 private String startIndexStr;
 
 private String maxRecords;

 public String getMaxRecords() {
	return maxRecords;
}
public void setMaxRecords(String maxRecords) {
	this.maxRecords = maxRecords;
}
private int slNo;
	
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
public List<Department> getDepartments() {
	return departments;
}
public void setDepartments(List<Department> departments) {
	this.departments = departments;
}
public List<Department> getDepartmentList() {
	return departmentList;
}
public void setDepartmentList(List<Department> departmentList) {
	this.departmentList = departmentList;
}
public String getSearchCriteria() {
	return searchCriteria;
}
public void setSearchCriteria(String searchCriteria) {
	this.searchCriteria = searchCriteria;
}
public List<String> getDeletedSkuList() {
	return deletedSkuList;
}
public void setDeletedSkuList(List<String> deletedSkuList) {
	this.deletedSkuList = deletedSkuList;
}
public int getNoOfSubDepartments() {
	return noOfSubDepartments;
}
public void setNoOfSubDepartments(int noOfSubDepartments) {
	this.noOfSubDepartments = noOfSubDepartments;
}
public String getTotalRecords() {
	return totalRecords;
}
public void setTotalRecords(String totalRecords) {
	this.totalRecords = totalRecords;
}
public String getStartIndex() {
	return startIndex;
}
public void setStartIndex(String startIndex) {
	this.startIndex = startIndex;
}
public String getSecondaryDepartment() {
	return secondaryDepartment;
}
public void setSecondaryDepartment(String secondaryDepartment) {
	this.secondaryDepartment = secondaryDepartment;
}
public List<SkuDepartment> getSkuDepartments() {
	return skuDepartments;
}
public void setSkuDepartments(List<SkuDepartment> skuDepartments) {
	this.skuDepartments = skuDepartments;
}
public String getPrimaryDepartment() {
	return primaryDepartment;
}
public void setPrimaryDepartment(String primaryDepartment) {
	this.primaryDepartment = primaryDepartment;
}
public String getDepartmentDescription() {
	return departmentDescription;
}
public void setDepartmentDescription(String departmentDescription) {
	this.departmentDescription = departmentDescription;
}
public String getDateTimeStr() {
	return dateTimeStr;
}
public void setDateTimeStr(String dateTimeStr) {
	this.dateTimeStr = dateTimeStr;
}
public List<SecondaryDepartment> getSecondaryDepartments() {
	return secondaryDepartments;
}
public void setSecondaryDepartments(List<SecondaryDepartment> secondaryDepartments) {
	this.secondaryDepartments = secondaryDepartments;
}
public RequestHeader getRequestHeader() {
	return requestHeader;
}
public void setRequestHeader(RequestHeader requestHeader) {
	this.requestHeader = requestHeader;
}
public String getStartIndexStr() {
	return startIndexStr;
}
public void setStartIndexStr(String startIndexStr) {
	this.startIndexStr = startIndexStr;
}
 
 
}