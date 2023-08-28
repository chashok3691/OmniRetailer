package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;



public class WarehouseTaxation {
	
	
	private String taxCode;
	
	private String location;
	
	private String taxCategoryName;
	
	private String taxName;
	
	private String taxType;
	
	private Float taxRate;
	
	private Date effectiveFrom;
	
	private String status;
	
	private String remarks;
	
	private Date updatedDate;
	
	private String taxDescription;
	
	private String userName;
	
	private String roleName;
	
	private boolean mrpBased;
	
	private boolean quantityBased;
	
	private List<WHTaxSaleRanges> saleRangesList;
	
	private List<TaxLocations> taxLocationsList;
	private List<String> locationsList;
 
	private String taxRateStr;
	private String effectiveFromStr;
	private String updatedDateStr;
	private String startIndex;
	private String maxRecords;
	
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	
	private String searchCriteria;
	private String categoryTypeStr;
	
	private String totalRecords;
	
	private int slNo;
	
	private String allLocationsStr;
	
	private List<WarehouseTaxation> warehouseTaxations;
	
	
	private List<Integer> sNos;
//	
	private List<String> taxCodes;
	
	
	
	
	
	
	public List<String> getTaxCodes() {
		return taxCodes;
	}
	public void setTaxCodes(List<String> taxCodes) {
		this.taxCodes = taxCodes;
	}
	public List<WarehouseTaxation> getWarehouseTaxations() {
		return warehouseTaxations;
	}
	public List<Integer> getsNos() {
		return sNos;
	}
	public void setsNos(List<Integer> sNos) {
		this.sNos = sNos;
	}
	public void setWarehouseTaxations(List<WarehouseTaxation> warehouseTaxations) {
		this.warehouseTaxations = warehouseTaxations;
	}
	public String getAllLocationsStr() {
		return allLocationsStr;
	}
	public void setAllLocationsStr(String allLocationsStr) {
		this.allLocationsStr = allLocationsStr;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public List<String> getLocationsList() {
		return locationsList;
	}
	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}
	public String getCategoryTypeStr() {
		return categoryTypeStr;
	}
	public void setCategoryTypeStr(String categoryTypeStr) {
		this.categoryTypeStr = categoryTypeStr;
	}
	public boolean isMrpBased() {
		return mrpBased;
	}
	public void setMrpBased(boolean mrpBased) {
		this.mrpBased = mrpBased;
	}
	public boolean isQuantityBased() {
		return quantityBased;
	}
	public void setQuantityBased(boolean quantityBased) {
		this.quantityBased = quantityBased;
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
	 
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
 
	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
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
	public String getTaxDescription() {
		return taxDescription;
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
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public void setTaxDescription(String taxDescription) {
		this.taxDescription = taxDescription;
	}
	public String getTaxRateStr() {
		return taxRateStr;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public void setTaxRateStr(String taxRateStr) {
		this.taxRateStr = taxRateStr;
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
	public String getTaxCode() {
		return taxCode;
	}
	public String getEffectiveFromStr() {
		return effectiveFromStr;
	}
	public List<WHTaxSaleRanges> getSaleRangesList() {
		return saleRangesList;
	}
	public void setSaleRangesList(List<WHTaxSaleRanges> saleRangesList) {
		this.saleRangesList = saleRangesList;
	}
	public void setEffectiveFromStr(String effectiveFromStr) {
		this.effectiveFromStr = effectiveFromStr;
	}
	/**
	 * @return the taxLocationsList
	 */
	public List<TaxLocations> getTaxLocationsList() {
		return taxLocationsList;
	}
	/**
	 * @param taxLocationsList the taxLocationsList to set
	 */
	public void setTaxLocationsList(List<TaxLocations> taxLocationsList) {
		this.taxLocationsList = taxLocationsList;
	}
	
	
}
