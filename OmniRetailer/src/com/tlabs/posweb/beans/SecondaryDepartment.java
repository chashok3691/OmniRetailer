package com.tlabs.posweb.beans;

import java.io.Serializable;

public class SecondaryDepartment implements Serializable{
 /**
	 * 
	 */
	private static final long serialVersionUID = 8486063201289088797L;
private String secondaryDepartment;
 private String primaryDepartment;
 private String departmentDescription;
 private String dateTimeStr;
public String getSecondaryDepartment() {
	return secondaryDepartment;
}
public void setSecondaryDepartment(String secondaryDepartment) {
	this.secondaryDepartment = secondaryDepartment;
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
	
	

}
