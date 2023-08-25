package com.tlabs.posweb.beans;

import java.util.List;

public class BusinessEventResponse {
	
private ResponseHeader responseHeader;
private List<BusinessEvent> eventList;
private BusinessEvent eventObj;
private int totalRecords;

public ResponseHeader getResponseHeader() {
	return responseHeader;
}
public void setResponseHeader(ResponseHeader responseHeader) {
	this.responseHeader = responseHeader;
}
public List<BusinessEvent> getEventList() {
	return eventList;
}
public void setEventList(List<BusinessEvent> eventList) {
	this.eventList = eventList;
}
public BusinessEvent getEventObj() {
	return eventObj;
}
public void setEventObj(BusinessEvent eventObj) {
	this.eventObj = eventObj;
}
public int getTotalRecords() {
	return totalRecords;
}
public void setTotalRecords(int totalRecords) {
	this.totalRecords = totalRecords;
}
}
