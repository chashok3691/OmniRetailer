package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;


public class FeaturedRetailer {

	/*private int serialNum;*/

	private List<String>featuredRetailertIds;
	

	private String locationId;
	private String featureId;
	private String featuredRating;
	private String featureDescription;
	private String zoneId;

	private String packageName;

	private int priorityNo;

	/*private Date createdDate;


	private Date updatedDate;


	private Date startDate;

	private Date endDate;*/

	private String status;

	private String userName;


	private String roleName;


	private String imageLink;
	private String featuredRetailerId;
	private String strPicture;
	
	
	
	public List<String> getFeaturedRetailertIds() {
		return featuredRetailertIds;
	}

	public void setFeaturedRetailertIds(List<String> featuredRetailertIds) {
		this.featuredRetailertIds = featuredRetailertIds;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getStrPicture() {
		return strPicture;
	}

	public void setStrPicture(String strPicture) {
		this.strPicture = strPicture;
	}

	public String getFeaturedRetailerId() {
		return featuredRetailerId;
	}

	public void setFeaturedRetailerId(String featuredRetailerId) {
		this.featuredRetailerId = featuredRetailerId;
	}

	public String getZone() {
		return zoneId;
	}

	public void setZone(String zone) {
		this.zoneId = zone;
	}

	public String getFeaturedRating() {
		return featuredRating;
	}

	public void setFeaturedRating(String featuredRating) {
		this.featuredRating = featuredRating;
	}

	public String getFeatureId() {
		return featureId;
	}

	public void setFeatureId(String featureId) {
		this.featureId = featureId;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	/*public int getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(int serialNum) {
		this.serialNum = serialNum;
	}*/

	public int getPriorityNo() {
		return priorityNo;
	}

	public void setPriorityNo(int priorityNo) {
		this.priorityNo = priorityNo;
	}

	public String getLocationId() {
		return locationId;
	}

	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}

	public String getFeatureDescription() {
		return featureDescription;
	}

	public void setFeatureDescription(String featureDescription) {
		this.featureDescription = featureDescription;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	/*public Date getCreatedDate() {
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}*/

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getImageLink() {
		return imageLink;
	}

	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}

	private RequestHeader requestHeader;

	private ResponseHeader responseHeader;


	//private String startIndex1;

	private String createdDateStr;

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

	/*public String getStartIndex() {
		return startIndex1;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex1 = startIndex;
	}*/

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

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
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

	public List<FeaturedRetailer> getFeaturedReatiler() {
		return featuredReatiler;
	}

	public void setFeaturedReatiler(List<FeaturedRetailer> featuredReatiler) {
		this.featuredReatiler = featuredReatiler;
	}

	public List<String> getLocationIds() {
		return locationIds;
	}

	public void setLocationIds(List<String> locationIds) {
		this.locationIds = locationIds;
	}


	private String updatedDateStr;


	private String startIndex;


	private String maxRecords;


	private String searchCriteria;


	private int totalRecords;

	private String startDateStr;

	private String endDateStr;

	private List<FeaturedRetailer> featuredReatiler;

	private List<String> locationIds;

}
