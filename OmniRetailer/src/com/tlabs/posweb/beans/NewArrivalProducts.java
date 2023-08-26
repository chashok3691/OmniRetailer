package com.tlabs.posweb.beans;
import java.util.Date;
import java.util.List;

public class NewArrivalProducts {
	private String newRefId;
	
	private String newCategoryName;
	
	private String categoryId;
	 
	
	private String brandId;
	
	private String groupId;
	
	private Float priceRange;
	private String newCategoryType;
	
	private Date createdOn;
	
	private Date startDate;
	
	private Date endDate;
	
	private Date effectiveFrom;
	
	private Date lastDate;
	
	private String remarks;
	
	private String userName;
	
	private String roleName;
	
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
	private List<NewArrivalProductsList>  newArrivalProductsList;
	
/*	public List<NewArrivalProductsList> getRefId() {
		return refId;
	}

	public void setRefId(List<NewArrivalProductsList> refId) {
		this.refId = refId;
	}
*/
	private RequestHeader requestHeader;
	
/*	@Transient
	private List<NewArrivalProductsList> newArrivalProductsList;
*/   
	private String startIndex;
	
	private String maxRecords;
	
	private String searchCriteria;
	
	private String startDateStr;
	
	private String endDateStr;
	
	private String createdOnStr;
	
	private String effectiveFromStr;
	
	private String lastDateStr;
	
	private List<String> newRefIds;

	public String getNewRefId() {
		return newRefId;
	}

	public void setNewRefId(String newRefId) {
		this.newRefId = newRefId;
	}

	
	public List<String> getNewRefIds() {
		return newRefIds;
	}

	public void setNewRefIds(List<String> newRefIds) {
		this.newRefIds = newRefIds;
	}

	public String getNewCategoryName() {
		return newCategoryName;
	}

	public void setNewCategoryName(String newCategoryName) {
		this.newCategoryName = newCategoryName;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getBrandId() {
		return brandId;
	}

	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public Float getPriceRange() {
		return priceRange;
	}

	public void setPriceRange(Float priceRange) {
		this.priceRange = priceRange;
	}

	public String getNewCategoryType() {
		return newCategoryType;
	}

	public void setNewCategoryType(String newCategoryType) {
		this.newCategoryType = newCategoryType;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
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
	}

	public Date getEffectiveFrom() {
		return effectiveFrom;
	}

	public void setEffectiveFrom(Date effectiveFrom) {
		this.effectiveFrom = effectiveFrom;
	}

	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
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

	public String getCreatedOnStr() {
		return createdOnStr;
	}

	public void setCreatedOnStr(String createdOnStr) {
		this.createdOnStr = createdOnStr;
	}

	public String getEffectiveFromStr() {
		return effectiveFromStr;
	}

	public void setEffectiveFromStr(String effectiveFromStr) {
		this.effectiveFromStr = effectiveFromStr;
	}

	public String getLastDateStr() {
		return lastDateStr;
	}

	public void setLastDateStr(String lastDateStr) {
		this.lastDateStr = lastDateStr;
	}

	public List<NewArrivalProductsList> getNewArrivalProductsList() {
		return newArrivalProductsList;
	}

	public void setNewArrivalProductsList(List<NewArrivalProductsList> newArrivalProductsList) {
		this.newArrivalProductsList = newArrivalProductsList;
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

	
}
