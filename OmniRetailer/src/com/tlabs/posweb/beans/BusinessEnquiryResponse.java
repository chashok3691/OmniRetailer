package com.tlabs.posweb.beans;

import java.util.List;


public class BusinessEnquiryResponse {
private ResponseHeader responseHeader;
private int totalRecords;

private List<BusinessEnquiry> enquiryList;
private BusinessEnquiry enquiryObj;
public ResponseHeader getResponseHeader() {
	return responseHeader;
}
public void setResponseHeader(ResponseHeader responseHeader) {
	this.responseHeader = responseHeader;
}
public int getTotalRecords() {
	return totalRecords;
}
public void setTotalRecords(int totalRecords) {
	this.totalRecords = totalRecords;
}
public List<BusinessEnquiry> getEnquiryList() {
	return enquiryList;
}
public void setEnquiryList(List<BusinessEnquiry> enquiryList) {
	this.enquiryList = enquiryList;
}
public BusinessEnquiry getEnquiryObj() {
	return enquiryObj;
}
public void setEnquiryObj(BusinessEnquiry enquiryObj) {
	this.enquiryObj = enquiryObj;
}
}
