package com.tlabs.posweb.beans;

public class BusinessEvent {
	
	private String eventId;
	private String eventTitle;
	private String userName;
	private String userRole;
	private String status;
	private String approvedBy;
	private String description;
	private String eventImage1;
	private String eventImage2;
	private String eventImage3;
	private boolean eventImage1Flag;
	private String  eventImage1RefId;
	private boolean eventImage2Flag;
	private String eventImage2RefId;
	private boolean eventImage3Flag;
	private String eventImage3RefId;
	private RequestHeader requestHeader;
	private String startIndex;
	private String maxRecords;
	private String searchCriteria;
	private String eventStartDateStr;
	private String eventEndDateStr;
	private String[] eventIds;
	private String createdDateStr;
	private String updatedDateStr;
	private String totalRecords;
	private int slNo;
	private String targetUrl; 
	private String type;
	

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTargetUrl() {
		return targetUrl;
	}

	public void setTargetUrl(String targetUrl) {
		this.targetUrl = targetUrl;
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

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public boolean isEventImage1Flag() {
		return eventImage1Flag;
	}

	public void setEventImage1Flag(boolean eventImage1Flag) {
		this.eventImage1Flag = eventImage1Flag;
	}

	public String getEventImage1RefId() {
		return eventImage1RefId;
	}

	public void setEventImage1RefId(String eventImage1RefId) {
		this.eventImage1RefId = eventImage1RefId;
	}

	public boolean isEventImage2Flag() {
		return eventImage2Flag;
	}

	public void setEventImage2Flag(boolean eventImage2Flag) {
		this.eventImage2Flag = eventImage2Flag;
	}

	public String getEventImage2RefId() {
		return eventImage2RefId;
	}

	public void setEventImage2RefId(String eventImage2RefId) {
		this.eventImage2RefId = eventImage2RefId;
	}

	public boolean isEventImage3Flag() {
		return eventImage3Flag;
	}

	public void setEventImage3Flag(boolean eventImage3Flag) {
		this.eventImage3Flag = eventImage3Flag;
	}

	public String getEventImage3RefId() {
		return eventImage3RefId;
	}

	public void setEventImage3RefId(String eventImage3RefId) {
		this.eventImage3RefId = eventImage3RefId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEventImage1() {
		return eventImage1;
	}

	public void setEventImage1(String eventImage1) {
		this.eventImage1 = eventImage1;
	}

	public String getEventImage2() {
		return eventImage2;
	}

	public void setEventImage2(String eventImage2) {
		this.eventImage2 = eventImage2;
	}

	public String getEventImage3() {
		return eventImage3;
	}

	public void setEventImage3(String eventImage3) {
		this.eventImage3 = eventImage3;
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

	public String getEventStartDateStr() {
		return eventStartDateStr;
	}

	public void setEventStartDateStr(String eventStartDateStr) {
		this.eventStartDateStr = eventStartDateStr;
	}

	public String getEventEndDateStr() {
		return eventEndDateStr;
	}

	public void setEventEndDateStr(String eventEndDateStr) {
		this.eventEndDateStr = eventEndDateStr;
	}

	public String[] getEventIds() {
		return eventIds;
	}

	public void setEventIds(String[] eventIds) {
		this.eventIds = eventIds;
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
	
}
