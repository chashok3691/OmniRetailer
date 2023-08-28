package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;

public class StoreTaxation {
	
	private int autoNumber;
	
	private String location;
	
	private String taxName;
	
	private String taxType;
	
	private Float taxRate;
	
	private Date effectiveFrom;
	
	private String allLocationsStr;
	
	
	public String getAllLocationsStr() {
		return allLocationsStr;
	}
	public void setAllLocationsStr(String allLocationsStr) {
		this.allLocationsStr = allLocationsStr;
	}
	private String status;
	private Float saleValueFrom;
	private Float saleValueTo;
	private List<StoreTaxation> saleRangesList;
	private String remarks;
	
	private Date updatedDate;
	
	private String taxCode;
	private String taxRateStr;
	private String taxDescription;
	private List<Integer> sNos;
	private List<String> taxCodes;
	
	private List<String> locationsList;
	
	
	
	
	
	public List<String> getTaxCodes() {
		return taxCodes;
	}
	public void setTaxCodes(List<String> taxCodes) {
		this.taxCodes = taxCodes;
	}
	public List<Integer> getsNos() {
		return sNos;
	}
	public void setsNos(List<Integer> sNos) {
		this.sNos = sNos;
	}
	public List<String> getLocationsList() {
		return locationsList;
	}
	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}
	private String totalRecords;
	private String startIndex;
	private List<StoreTaxation> storeTaxationList;
	private RequestHeader requestHeader;
	private String searchCriteria;
	private ResponseHeader responseHeader;
	private String effectiveFromStr;
	
	private String userName;
	private String roleName;
	private String updatedDateStr;
	private String taxCategoryName;
	private int slNo;
	private String maxRecords;
	
	private boolean quantityBased;
	private boolean mrpBased;
	
	private String categoryTypeStr;
	
	
	
	
	
	
	
	
	
	public String getCategoryTypeStr() {
		return categoryTypeStr;
	}
	public void setCategoryTypeStr(String categoryTypeStr) {
		this.categoryTypeStr = categoryTypeStr;
	}
	public boolean isQuantityBased() {
		return quantityBased;
	}
	public void setQuantityBased(boolean quantityBased) {
		this.quantityBased = quantityBased;
	}
	public boolean isMrpBased() {
		return mrpBased;
	}
	public void setMrpBased(boolean mrpBased) {
		this.mrpBased = mrpBased;
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
	public String getTaxCategoryName() {
		return taxCategoryName;
	}
	public void setTaxCategoryName(String taxCategoryName) {
		this.taxCategoryName = taxCategoryName;
	}
	public String getUpdatedDateStr() {
		return updatedDateStr;
	}
	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
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
	public String getEffectiveFromStr() {
		return effectiveFromStr;
	}
	public void setEffectiveFromStr(String effectiveFromStr) {
		this.effectiveFromStr = effectiveFromStr;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public List<StoreTaxation> getStoreTaxationList() {
		return storeTaxationList;
	}
	public void setStoreTaxationList(List<StoreTaxation> storeTaxationList) {
		this.storeTaxationList = storeTaxationList;
	}
	public String getTaxDescription() {
		return taxDescription;
	}
	public void setTaxDescription(String taxDescription) {
		this.taxDescription = taxDescription;
	}
	public Date getEffectiveFrom() {
		return effectiveFrom;
	}
	public void setEffectiveFrom(Date effectiveFrom) {
		this.effectiveFrom = effectiveFrom;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public Float getTaxRate() {
		return taxRate;
	}
	
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	public void setTaxRate(Float taxRate) {
		this.taxRate = taxRate;
	}
	public int getAutoNumber() {
		return autoNumber;
	}
	public void setAutoNumber(int autoNumber) {
		this.autoNumber = autoNumber;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTaxName() {
		return taxName;
	}
	public void setTaxName(String taxName) {
		this.taxName = taxName;
	}
	public String getTaxType() {
		return taxType;
	}
	public void setTaxType(String taxType) {
		this.taxType = taxType;
	}
	
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getTaxRateStr() {
		return taxRateStr;
	}
	public void setTaxRateStr(String taxRateStr) {
		this.taxRateStr = taxRateStr;
	}
	public Float getSaleValueFrom() {
		return saleValueFrom;
	}
	public void setSaleValueFrom(Float saleValueFrom) {
		this.saleValueFrom = saleValueFrom;
	}
	public Float getSaleValueTo() {
		return saleValueTo;
	}
	public void setSaleValueTo(Float saleValueTo) {
		this.saleValueTo = saleValueTo;
	}
	public List<StoreTaxation> getSaleRangesList() {
		return saleRangesList;
	}
	public void setSaleRangesList(List<StoreTaxation> saleRangesList) {
		this.saleRangesList = saleRangesList;
	}
	public String getTaxCode() {
		return taxCode;
	}
	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}
	
	
}
