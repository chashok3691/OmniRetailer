package com.tlabs.posweb.beans;

import java.util.Date;
import java.math.BigDecimal;
import java.util.List;

public class WHStockIssueReportBean {
	
	private String category;
	private String brand;
	private String startDate;
	private String endDate;
	private String location;
	private String supplier;
	private String fileUrl;
	private String zone;
	private String skuId;
	private String productName;
	private String uom;
	private String size;
	private String color;
	private String issueDate;
	private String issueLocation;
	private String subCategory;
	private String searchCriteria;
	
	
	
	
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	private BigDecimal quantity;
    private BigDecimal price;
	private BigDecimal cost;
	private int totalRecords;

	private String startIndex;

	private String updated_date;
	
	private String storeLocation;
	
	//private boolean notForDownload;
	
	private boolean fileRequired;
	
	private RequestHeader requestHeader;
	
	private String maxRecords;
	private ResponseHeader responseHeader;
	private List<WHStockIssueReportBean> stockIssueReportDetails;
	
	
	
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	public String getIssueLocation() {
		return issueLocation;
	}
	public void setIssueLocation(String issueLocation) {
		this.issueLocation = issueLocation;
	}
	public BigDecimal getQuantity() {
		return quantity;
	}
	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public BigDecimal getCost() {
		return cost;
	}
	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public String getUpdated_date() {
		return updated_date;
	}
	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	
	public boolean isFileRequired() {
		return fileRequired;
	}
	public void setFileRequired(boolean fileRequired) {
		this.fileRequired = fileRequired;
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
	public List<WHStockIssueReportBean> getStockIssueReportDetails() {
		return stockIssueReportDetails;
	}
	public void setStockIssueReportDetails(List<WHStockIssueReportBean> stockIssueReportDetails) {
		this.stockIssueReportDetails = stockIssueReportDetails;
	}
	

	

}