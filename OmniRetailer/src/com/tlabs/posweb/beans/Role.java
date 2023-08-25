package com.tlabs.posweb.beans;

import java.util.List;


public class Role {
	private String roleName;
	private String roleDescription;
	private String createdOn;
	private String createdBy;
	private String roleStatus;
	private String valid_date;
	private String validDate;
	private List<String> roleNameList;
    private List<AccessControl> accessControl;
    private RequestHeader requestHeader;
    private String startIndex;
    private String totalRecords;
    private List<ActivityAccessControl> accessControlActivity;
    private String activitiesStr;
    private List<RoleLocations> roleLocations;
    private List<String> locations;
	private String maxRecords;
	private String searchCriteria;
    public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	private String createdDateStr;
    
	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public List<String> getLocations() {
		return locations;
	}

	public void setLocations(List<String> locations) {
		this.locations = locations;
	}

	public List<RoleLocations> getRoleLocations() {
		return roleLocations;
	}

	public void setRoleLocations(List<RoleLocations> roleLocations) {
		this.roleLocations = roleLocations;
	}

	public String getActivitiesStr() {
		return activitiesStr;
	}

	public void setActivitiesStr(String activitiesStr) {
		this.activitiesStr = activitiesStr;
	}

	public List<ActivityAccessControl> getAccessControlActivity() {
		return accessControlActivity;
	}

	public void setAccessControlActivity(
			List<ActivityAccessControl> accessControlActivity) {
		this.accessControlActivity = accessControlActivity;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public List<String> getRoleNameList() {
		return roleNameList;
	}

	public void setRoleNameList(List<String> roleNameList) {
		this.roleNameList = roleNameList;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDescription() {
		return roleDescription;
	}

	public void setRoleDescription(String roleDescription) {
		this.roleDescription = roleDescription;
	}

	public String getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getRoleStatus() {
		return roleStatus;
	}

	public void setRoleStatus(String roleStatus) {
		this.roleStatus = roleStatus;
	}

	public String getValid_date() {
		return valid_date;
	}

	public void setValid_date(String valid_date) {
		this.valid_date = valid_date;
	}

	public String getValidDate() {
		return validDate;
	}

	public void setValidDate(String validDate) {
		this.validDate = validDate;
	}

	public List<AccessControl> getAccessControl() {
		return accessControl;
	}

	public void setAccessControl(List<AccessControl> accessControl) {
		this.accessControl = accessControl;
	}
}
