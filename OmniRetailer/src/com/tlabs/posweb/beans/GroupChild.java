package com.tlabs.posweb.beans;

import java.util.List;

public class GroupChild {
	private int sNo;
	private String groupId;
	private String skuId;
	private String pluCode;
	private String dateAndTime;
	private String comments;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private List<GroupChild> groupChildLists;
	private String startIndex;
	private String searchCriteria;
	private boolean itemStatus;
	private String image;
	private Group groupObj;
	private String totalRecords;
	
	
//	Added by vijay
	private String description;
	private String color;
	private String size;
	private String measurementRange;
	private String ean;
	private String measure_range;
	private String measureRange;
	private String maxRecords;
	
	
	
	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getMeasurementRange() {
		return measurementRange;
	}

	public void setMeasurementRange(String measurementRange) {
		this.measurementRange = measurementRange;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

	public String getMeasure_range() {
		return measure_range;
	}

	public void setMeasure_range(String measure_range) {
		this.measure_range = measure_range;
	}

	public String getMeasureRange() {
		return measureRange;
	}

	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public List<GroupChild> getGroupChildLists() {
		return groupChildLists;
	}

	public void setGroupChildLists(List<GroupChild> groupChildLists) {
		this.groupChildLists = groupChildLists;
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

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
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

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getDateAndTime() {
		return dateAndTime;
	}

	public void setDateAndTime(String dateAndTime) {
		this.dateAndTime = dateAndTime;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}



	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public boolean isItemStatus() {
		return itemStatus;
	}

	public void setItemStatus(boolean itemStatus) {
		this.itemStatus = itemStatus;
	}

	public Group getGroupObj() {
		return groupObj;
	}

	public void setGroupObj(Group groupObj) {
		this.groupObj = groupObj;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

}
