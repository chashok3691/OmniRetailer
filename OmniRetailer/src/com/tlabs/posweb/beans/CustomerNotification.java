package com.tlabs.posweb.beans;

import java.util.List;

public class CustomerNotification {
	private String filterId;
	private String batchName;
	private RequestHeader requestHeader;
	private String notificationCategory;
	private List<CustomerNotification> notificationMessages;  
	
	public List<CustomerNotification> getNotificationMessages() {
		return notificationMessages;
	}
	public void setNotificationMessages(
			List<CustomerNotification> notificationMessages) {
		this.notificationMessages = notificationMessages;
	}
	public String getNotificationCategory() {
		return notificationCategory;
	}
	public void setNotificationCategory(String notificationCategory) {
		this.notificationCategory = notificationCategory;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getFilterId() {
		return filterId;
	}
	public void setFilterId(String filterId) {
		this.filterId = filterId;
	}
	public String getBatchName() {
		return batchName;
	}
	public void setBatchName(String batchName) {
		this.batchName = batchName;
	}
	

}
