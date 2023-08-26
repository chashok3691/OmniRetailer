//package com.tlabs.omniretailerservices.models;
package com.tlabs.posweb.beans;

import java.util.List;


/*import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.tlabs.omniretailerservices.beans.RequestHeader;
import com.tlabs.omniretailerservices.beans.ResponseHeader;*/

/**
* @author 		: Radhika Vinayak
* @Created_on   : 21-08-2017
* @verified_By  :
* @modified_By  : 
* @modified_On  :  
* @modified_Ref :  
* @description  : This class is used to interact with the organizational_departments table in database . 
* */
//@Entity
//@Table(name="organizational_departments")
public class OrganizationalDept{

	//@Id
	//@Column(name="dept_id")
	private String deptId;
	
	//@Column(name="dept_name")
	private String deptName;
	
//	@Column(name="dept_description")
	private String deptDescription;
	
	//@Column(name="parent_dept")
	private String parentDept;
	
	//@Column(name="dept_email")
	private String deptEmail;
	
	//@Column(name="dept_phone_no")
	private String deptPhnNo;
	
	//@Transient
	private List<OrganizationalDept> organizationalDeptObj;
	
	//@Transient
	private RequestHeader requestHeader;
	
	//@Transient
	private ResponseHeader responseHeader;
	/* 
	@Transient
	private String[] dept_Id;
	*/
	//@Transient
	private String startIndex;
	
	//@Transient
	private String maxRecords;
	
	//@Transient
	private int totalRecords;
	
	//@Transient
	private String searchCriteria;
	
	//@Transient
	private String deptLocation;


private int slNo;
	
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	

	public String getDeptLocation() {
		return deptLocation;
	}

	public void setDeptLocation(String deptLocation) {
		this.deptLocation = deptLocation;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptDescription() {
		return deptDescription;
	}

	public void setDeptDescription(String deptDescription) {
		this.deptDescription = deptDescription;
	}

	public String getParentDept() {
		return parentDept;
	}

	public void setParentDept(String parentDept) {
		this.parentDept = parentDept;
	}

	public String getDeptEmail() {
		return deptEmail;
	}

	public void setDeptEmail(String deptEmail) {
		this.deptEmail = deptEmail;
	}

	public String getDeptPhnNo() {
		return deptPhnNo;
	}

	public void setDeptPhnNo(String deptPhnNo) {
		this.deptPhnNo = deptPhnNo;
	}

	public List<OrganizationalDept> getOrganizationalDeptObj() {
		return organizationalDeptObj;
	}

	public void setOrganizationalDeptObj(List<OrganizationalDept> organizationalDeptObj) {
		this.organizationalDeptObj = organizationalDeptObj;
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
/*
	public String[] getDept_Id() {
		return dept_Id;
	}

	public void setDept_Id(String[] dept_Id) {
		this.dept_Id = dept_Id;
	}*/

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
	


}
