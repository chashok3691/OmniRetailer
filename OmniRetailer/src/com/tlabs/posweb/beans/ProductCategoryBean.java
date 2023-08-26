package com.tlabs.posweb.beans;

import java.io.Serializable;
import java.util.List;

public class ProductCategoryBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1047040212389768757L;
	private RequestHeader requestHeader;
	private String categoryName;
	private String categoryDescription;
	private String startIndex;
	private List<String> categoryList;
	private String totalRecords;
	private int slNo;
	private String maxRecords;
	private String image;
	private String imageId;
	private Integer sortOrder;
	private int priority; 
	private boolean b2cCategory;
	
	private String searchCriteria;
	private String banner;
	private String bannerId;
	private String businessActivity;
	
	public String getBusinessActivity() {
		return businessActivity;
	}
	public void setBusinessActivity(String businessActivity) {
		this.businessActivity = businessActivity;
	}
	
	public String getBanner() {
		return banner;
	}
	public void setBanner(String banner) {
		this.banner = banner;
	}
	public String getBannerId() {
		return bannerId;
	}
	public void setBannerId(String bannerId) {
		this.bannerId = bannerId;
	}
	public boolean isB2cCategory() {
		return b2cCategory;
	}
	public void setB2cCategory(boolean b2cCategory) {
		this.b2cCategory = b2cCategory;
	}
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
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryDescription() {
		return categoryDescription;
	}

	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public List<String> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<String> categoryList) {
		this.categoryList = categoryList;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getImageId() {
		return imageId;
	}
	public void setImageId(String imageId) {
		this.imageId = imageId;
	}
	public Integer getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(Integer sortOrder) {
		this.sortOrder = sortOrder;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}


	
	
}
