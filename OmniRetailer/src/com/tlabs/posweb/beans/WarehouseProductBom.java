package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;



public class WarehouseProductBom {
	private String bomRef;

	
	private String productId; 

	
	private String productUom;


	private Integer productExpiryPeriodDays;

	
	private Integer productExpiryPeriodHours;

	
	private String materialCategory;

	
	private String processInstructions;

	
	private BigDecimal costPrice = new BigDecimal("0"); 

	private BigDecimal salePrice = new BigDecimal("0"); 

	
	private String productCategory;

	
	private String description;

	
	private Date processTime;


	private String userName;

	
	private String roleName;

	private Date createdDate;

	private Date updatedDate;

	private BigDecimal totalBomCost = new BigDecimal("0"); 

	private List<WarehouseProductBomChild> boMaterialChilds;

	private RequestHeader requestHeader;

	private String processTimeStr;

	private String startIndex;

	private String maxRecords;

	private String searchCriteria;

	private String startDateStr;

	private String endDateStr;

	private String createdDateStr;

	private String updatedDateStr;

	private List<String> boMaterialRefIds;

	private String storeLocation;
	
	private String subCategory;
	
	private String zoneId;
	
	private String brand;
	
	
	public String getBomRef() {
		return bomRef;
	}

	public void setBomRef(String bomRef) {
		this.bomRef = bomRef;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductUom() {
		return productUom;
	}

	public void setProductUom(String productUom) {
		this.productUom = productUom;
	}

	public Integer getProductExpiryPeriodDays() {
		return productExpiryPeriodDays;
	}

	public void setProductExpiryPeriodDays(Integer productExpiryPeriodDays) {
		this.productExpiryPeriodDays = productExpiryPeriodDays;
	}

	public Integer getProductExpiryPeriodHours() {
		return productExpiryPeriodHours;
	}

	public void setProductExpiryPeriodHours(Integer productExpiryPeriodHours) {
		this.productExpiryPeriodHours = productExpiryPeriodHours;
	}

	public BigDecimal getTotalBomCost() {
		return totalBomCost;
	}

	public void setTotalBomCost(BigDecimal totalBomCost) {
		this.totalBomCost = totalBomCost;
	}

	public String getMaterialCategory() {
		return materialCategory;
	}

	public void setMaterialCategory(String materialCategory) {
		this.materialCategory = materialCategory;
	}

	public String getProcessInstructions() {
		return processInstructions;
	}

	public void setProcessInstructions(String processInstructions) {
		this.processInstructions = processInstructions;
	}

	public BigDecimal getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(BigDecimal costPrice) {
		this.costPrice = costPrice;
	}

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getDescription() {
		return description;
	}
	
	

	

	public List<WarehouseProductBomChild> getBoMaterialChilds() {
		return boMaterialChilds;
	}

	public void setBoMaterialChilds(List<WarehouseProductBomChild> boMaterialChilds) {
		this.boMaterialChilds = boMaterialChilds;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getProcessTime() {
		return processTime;
	}

	public void setProcessTime(Date processTime) {
		this.processTime = processTime;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getRoleName() {
		return roleName;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
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

	

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getProcessTimeStr() {
		return processTimeStr;
	}

	public void setProcessTimeStr(String processTimeStr) {
		this.processTimeStr = processTimeStr;
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

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getUpdatedDateStr() {
		return updatedDateStr;
	}

	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}

	public List<String> getBoMaterialRefIds() {
		return boMaterialRefIds;
	}

	public void setBoMaterialRefIds(List<String> boMaterialRefIds) {
		this.boMaterialRefIds = boMaterialRefIds;
	}

}
