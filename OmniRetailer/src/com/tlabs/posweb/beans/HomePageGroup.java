package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;




public class HomePageGroup {
	
	private int sNo;
	
	private String groupId;
	
	private String groupName;
	
	private String groupDescription;
	
	private String groupCategory;
	
	private boolean homePageOrder;
	
	private Date createdDate;
	
	private Date updatedDate;
	
	private boolean status;
	
	private String groupImage;
	
	private String userName;
	
	private String roleName;
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private String createdDateStr;
	
	private String updatedDateStr;
	
	private String startIndex;
	
	private String maxRecords;
	
	private String searchCriteria;
	
	private int totalRecords;
	
	private String startDate;
	
	private String endDate;
	
	private List<HomePageGroup> homePageGroups;
	
	private String groupStatus;
	
	private List<Integer> sNos;

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

	public List<Integer> getsNos() {
		return sNos;
	}

	public void setsNos(List<Integer> sNos) {
		this.sNos = sNos;
	}

	public String getGroupCategory() {
		return groupCategory;
	}

	public void setGroupCategory(String groupCategory) {
		this.groupCategory = groupCategory;
	}

	public String getGroupStatus() {
		return groupStatus;
	}

	public void setGroupStatus(String groupStatus) {
		this.groupStatus = groupStatus;
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

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<HomePageGroup> getHomePageGroups() {
		return homePageGroups;
	}

	public void setHomePageGroups(List<HomePageGroup> homePageGroups) {
		this.homePageGroups = homePageGroups;
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

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getGroupDescription() {
		return groupDescription;
	}

	public void setGroupDescription(String groupDescription) {
		this.groupDescription = groupDescription;
	}

	public boolean isHomePageOrder() {
		return homePageOrder;
	}

	public void setHomePageOrder(boolean homePageOrder) {
		this.homePageOrder = homePageOrder;
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

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getGroupImage() {
		return groupImage;
	}

	public void setGroupImage(String groupImage) {
		this.groupImage = groupImage;
	}

}
