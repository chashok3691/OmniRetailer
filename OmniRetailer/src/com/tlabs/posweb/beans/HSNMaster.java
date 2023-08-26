package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;


public class HSNMaster {
	
	private String hsnCode;
	
	private String sectionName;
	
	private String chapterName;
	
	private String headingsName;
	
	private String subHeadingsName;
	
	private String taxCode;
	
	private float taxRate;
	
	private Date createdDate;
	
	private Date updatedDate;
	
	private String userName;
	
	private String roleName;
	
	private String comments;
	private String operation;
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private String createdDateStr;
	
	private String updatedDateStr;
	
	private String startIndex;
	
	private String maxRecords;
	
	private String searchCriteria;
	
	private int totalRecords;
	
	private String startDate;
	
	private String endDate;
	
	private List<HSNMaster> hsnMasters;

	private List<String> hsnCodes;
	
	private String taxRateStr;
	
	
	
	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getTaxRateStr() {
		return taxRateStr;
	}

	public void setTaxRateStr(String taxRateStr) {
		this.taxRateStr = taxRateStr;
	}

	public List<String> getHsnCodes() {
		return hsnCodes;
	}

	public void setHsnCodes(List<String> hsnCodes) {
		this.hsnCodes = hsnCodes;
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

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public List<HSNMaster> getHsnMasters() {
		return hsnMasters;
	}

	public void setHsnMasters(List<HSNMaster> hsnMasters) {
		this.hsnMasters = hsnMasters;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

	public String getChapterName() {
		return chapterName;
	}

	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}

	public String getHeadingsName() {
		return headingsName;
	}

	public void setHeadingsName(String headingsName) {
		this.headingsName = headingsName;
	}

	public String getSubHeadingsName() {
		return subHeadingsName;
	}

	public void setSubHeadingsName(String subHeadingsName) {
		this.subHeadingsName = subHeadingsName;
	}

	public String getTaxCode() {
		return taxCode;
	}

	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}

	public float getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(float taxRate) {
		this.taxRate = taxRate;
	}

	public Date getCreatedDate() {
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
	

}
