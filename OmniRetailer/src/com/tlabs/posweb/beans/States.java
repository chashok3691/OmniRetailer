package com.tlabs.posweb.beans;

import java.util.List;

public class States {
	
private RequestHeader requestHeader;
	
private ResponseHeader responseHeader;

private String stateCode;
private String stateName;
private String searchCriteria;

private List<States> stateMasters;


private int slNo;



public int getSlNo() {
	return slNo;
}
public void setSlNo(int slNo) {
	this.slNo = slNo;
}

public List<States> getStateMasters() {
	return stateMasters;
}
public void setStateMasters(List<States> stateMasters) {
	this.stateMasters = stateMasters;
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
public String getStateCode() {
	return stateCode;
}
public void setStateCode(String stateCode) {
	this.stateCode = stateCode;
}
public String getStateName() {
	return stateName;
}
public void setStateName(String stateName) {
	this.stateName = stateName;
}
public String getSearchCriteria() {
	return searchCriteria;
}
public void setSearchCriteria(String searchCriteria) {
	this.searchCriteria = searchCriteria;
}



private String startIndex;
private String maxRecords;
private int totalRecords;

private String countryCode;

private String gststatecode;

private String operation;
private List<String> stateCodes;

private String searchCritaria;



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
public int getTotalRecords() {
	return totalRecords;
}
public void setTotalRecords(int totalRecords) {
	this.totalRecords = totalRecords;
}
public String getCountryCode() {
	return countryCode;
}
public void setCountryCode(String countryCode) {
	this.countryCode = countryCode;
}
public String getGststatecode() {
	return gststatecode;
}
public void setGststatecode(String gststatecode) {
	this.gststatecode = gststatecode;
}
public String getOperation() {
	return operation;
}
public void setOperation(String operation) {
	this.operation = operation;
}
public List<String> getStateCodes() {
	return stateCodes;
}
public void setStateCodes(List<String> stateCodes) {
	this.stateCodes = stateCodes;
}
public String getSearchCritaria() {
	return searchCritaria;
}
public void setSearchCritaria(String searchCritaria) {
	this.searchCritaria = searchCritaria;
}



}
