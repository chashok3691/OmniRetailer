package com.tlabs.posweb.beans;

import java.util.Date;
import java.math.BigDecimal;
import java.util.List;

public class PurchaseReportsBean {
	
	private String skuId;
	private String skuName;
	private String poItemId;
	private String poOrderId;
	private String orderDate;
	private String orderedBy;
	private String supplierName;
	private String delDate;
	private BigDecimal poQty;
	private BigDecimal supplyQty;
	private BigDecimal supplyPrice;
	private BigDecimal cost;
	private boolean fileRequired;
	private String fileUrl;
	
	
	
	public boolean isFileRequired() {
		return fileRequired;
	}
	public void setFileRequired(boolean fileRequired) {
		this.fileRequired = fileRequired;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public String getPoOrderId() {
		return poOrderId;
	}
	public void setPoOrderId(String poOrderId) {
		this.poOrderId = poOrderId;
	}

	private String zone;
	private String itemWise;
	private String startIndex;
    private String searchCriteria;
	private String supplierId;
	private String category;
	private String maxrecords;
	
	private List<PurchaseReportsBean> reportDetails;
	private int totalRecords;
	private RequestHeader requestHeader;

	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMaxrecords() {
		return maxrecords;
	}
	public void setMaxrecords(String maxrecords) {
		this.maxrecords = maxrecords;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public List<PurchaseReportsBean> getReportDetails() {
		return reportDetails;
	}
	public void setReportDetails(List<PurchaseReportsBean> reportDetails) {
		this.reportDetails = reportDetails;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	
	private ResponseHeader responseHeader;
	
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
	
	private String startDateStr;
	
	
	private String endDateStr;
	
	private String storeLocation;
	
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
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
	
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public String getSkuName() {
		return skuName;
	}
	public void setSkuName(String skuName) {
		this.skuName = skuName;
	}
	public String getPoItemId() {
		return poItemId;
	}
	public void setPoItemId(String poItemId) {
		this.poItemId = poItemId;
	}
	

	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderedBy() {
		return orderedBy;
	}
	public void setOrderedBy(String orderedBy) {
		this.orderedBy = orderedBy;
	}
	
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getDelDate() {
		return delDate;
	}
	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}

	public BigDecimal getSupplyQty() {
		return supplyQty;
	}
	public void setSupplyQty(BigDecimal supplyQty) {
		this.supplyQty = supplyQty;
	}
	public BigDecimal getSupplyPrice() {
		return supplyPrice;
	}
	public void setSupplyPrice(BigDecimal supplyPrice) {
		this.supplyPrice = supplyPrice;
	}
	public BigDecimal getCost() {
		return cost;
	}
	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}
	public BigDecimal getPoQty() {
		return poQty;
	}
	public void setPoQty(BigDecimal poQty) {
		this.poQty = poQty;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getItemWise() {
		return itemWise;
	}
	public void setItemWise(String itemWise) {
		this.itemWise = itemWise;
	}
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	
	
}