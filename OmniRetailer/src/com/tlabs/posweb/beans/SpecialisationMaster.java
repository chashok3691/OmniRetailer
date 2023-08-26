package com.tlabs.posweb.beans;

import java.util.List;

public class SpecialisationMaster {
	

	private String specialisationId;
	

	private String specialisationName;

	private String specialisationDesc;

	private RequestHeader requestHeader;
	private String startValue;
	private String searchCriteria;
	private String startIndex;
	private int slNo;
	private String maxRecords;
	private ResponseHeader responseHeader;

	private List<?> SpecialisationDetailsList;
	private int totalRecords;

	public String getSpecialisationId() {
		return specialisationId;
	}


	public void setSpecialisationId(String specialisationId) {
		this.specialisationId = specialisationId;
	}


	public String getSpecialisationName() {
		return specialisationName;
	}


	public void setSpecialisationName(String specialisationName) {
		this.specialisationName = specialisationName;
	}


	public String getSpecialisationDesc() {
		return specialisationDesc;
	}


	public void setSpecialisationDesc(String specialisationDesc) {
		this.specialisationDesc = specialisationDesc;
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


	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}


	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}


	public List<?> getSpecialisationDetailsList() {
		return SpecialisationDetailsList;
	}


	public void setSpecialisationDetailsList(List<?> specialisationDetailsList) {
		SpecialisationDetailsList = specialisationDetailsList;
	}


	public int getTotalRecords() {
		return totalRecords;
	}


	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}


	public String getStartValue() {
		return startValue;
	}


	public void setStartValue(String startValue) {
		this.startValue = startValue;
	}


	public String getSearchCriteria() {
		return searchCriteria;
	}


	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}


	public int getSlNo() {
		return slNo;
	}


	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	
	
	
}
