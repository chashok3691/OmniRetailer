package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;





public class WarehouseGoodsReceiptNote {

	
	 private String receiptNoteId;
	 
	 private List<String> zonesList;
	 private String poRef;

	
	 private String quotationRef;
	 private String approvedBy; 
	 
	 private String submittedBy; 
	 private String delivered_by; 
	 private String supplierId;
	 
	 private String deliveredBy;
	 private String inspectedBy;

	 private String invoiceRefNumber;
	 
	 private Float totalGRNValue;
	 private Date dueDate;

	
	 private Date deliveredOn;

	
	 private String supplierName;

	 private boolean outletAll=false;
	 
	 private String receivedBy;
	 
	 private Integer vendorRating;

	 private String location;

	 private String zoneId;
	 
	 private String status;

	 private Date createdDate;

	 private Date updatedDate;

	 private String userName;

	 private String roleName;

	 private String comments;

	 private String dueDateStr;
	 private String deliveredOnStr;
	 private String createdDateStr;
	 private String updatedDateStr;
	 private Integer startIndex;
	 private Integer maxRecords;
	 private ResponseHeader responseHeader;
	 private RequestHeader requestHeader;
	 private boolean warehouseAll;
	 private List<WarehouseGoodsReceiptNoteItems> itemsList; 
	
	 private String searchCriteria;
	 
	 private String skuId;
	 
	 private String startDate;
	 
	 private String endDate;
	 
	 private boolean itemsRequired;
	 
	 private Double orderedQty;
	 
	 private Double suppliedQty;
	 
	 private List<Integer> itemDeletionList;
	 
	 private List<String> receiptIds;
	 
	 private String category;
	 
	 private String model;
	 private Float startPrice;
	 private Float endPrice;
	 private String brand;
	 
	public String getReceiptNoteId() {
		return receiptNoteId;
	}
	public void setReceiptNoteId(String receiptNoteId) {
		this.receiptNoteId = receiptNoteId;
	}
	public String getPoRef() {
		return poRef;
	}
	public void setPoRef(String poRef) {
		this.poRef = poRef;
	}
	public String getQuotationRef() {
		return quotationRef;
	}
	public void setQuotationRef(String quotationRef) {
		this.quotationRef = quotationRef;
	}
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	public String getInspectedBy() {
		return inspectedBy;
	}
	public void setInspectedBy(String inspectedBy) {
		this.inspectedBy = inspectedBy;
	}
	public String getZoneId() {
		return zoneId;
	}
	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public Date getDeliveredOn() {
		return deliveredOn;
	}
	public void setDeliveredOn(Date deliveredOn) {
		this.deliveredOn = deliveredOn;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getReceivedBy() {
		return receivedBy;
	}
	public void setReceivedBy(String receivedBy) {
		this.receivedBy = receivedBy;
	}
	public Integer getVendorRating() {
		return vendorRating;
	}
	public void setVendorRating(Integer vendorRating) {
		this.vendorRating = vendorRating;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
 
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public Float getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(Float startPrice) {
		this.startPrice = startPrice;
	}
	public Float getEndPrice() {
		return endPrice;
	}
	public void setEndPrice(Float endPrice) {
		this.endPrice = endPrice;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public List<String> getReceiptIds() {
		return receiptIds;
	}
	public void setReceiptIds(List<String> receiptIds) {
		this.receiptIds = receiptIds;
	}
	public List<Integer> getItemDeletionList() {
		return itemDeletionList;
	}
	public void setItemDeletionList(List<Integer> itemDeletionList) {
		this.itemDeletionList = itemDeletionList;
	}
 
	public boolean isItemsRequired() {
		return itemsRequired;
	}
	public void setItemsRequired(boolean itemsRequired) {
		this.itemsRequired = itemsRequired;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRoleName() {
		return roleName;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
 
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getDueDateStr() {
		return dueDateStr;
	}
	public void setDueDateStr(String dueDateStr) {
		this.dueDateStr = dueDateStr;
	}
	public String getDeliveredOnStr() {
		return deliveredOnStr;
	}
	public void setDeliveredOnStr(String deliveredOnStr) {
		this.deliveredOnStr = deliveredOnStr;
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
	public Integer getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}
	public Integer getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(Integer maxRecords) {
		this.maxRecords = maxRecords;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public Double getOrderedQty() {
		return orderedQty;
	}
	public void setOrderedQty(Double orderedQty) {
		this.orderedQty = orderedQty;
	}
	public Double getSuppliedQty() {
		return suppliedQty;
	}
	public void setSuppliedQty(Double suppliedQty) {
		this.suppliedQty = suppliedQty;
	}
	public List<WarehouseGoodsReceiptNoteItems> getItemsList() {
		return itemsList;
	}
	public void setItemsList(List<WarehouseGoodsReceiptNoteItems> itemsList) {
		this.itemsList = itemsList;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public List<String> getZonesList() {
		return zonesList;
	}
	public void setZonesList(List<String> zonesList) {
		this.zonesList = zonesList;
	}
	public boolean isWarehouseAll() {
		return warehouseAll;
	}
	public void setWarehouseAll(boolean warehouseAll) {
		this.warehouseAll = warehouseAll;
	}
	public boolean isOutletAll() {
		return outletAll;
	}
	public void setOutletAll(boolean outletAll) {
		this.outletAll = outletAll;
	}
	public String getApprovedBy() {
		return approvedBy;
	}
	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}
	public String getSubmittedBy() {
		return submittedBy;
	}
	public void setSubmittedBy(String submittedBy) {
		this.submittedBy = submittedBy;
	}
	public String getDelivered_by() {
		return delivered_by;
	}
	public void setDelivered_by(String delivered_by) {
		this.delivered_by = delivered_by;
	}
	public String getDeliveredBy() {
		return deliveredBy;
	}
	public void setDeliveredBy(String deliveredBy) {
		this.deliveredBy = deliveredBy;
	}
	public String getInvoiceRefNumber() {
		return invoiceRefNumber;
	}
	public void setInvoiceRefNumber(String invoiceRefNumber) {
		this.invoiceRefNumber = invoiceRefNumber;
	}
	public Float getTotalGRNValue() {
		return totalGRNValue;
	}
	public void setTotalGRNValue(Float totalGRNValue) {
		this.totalGRNValue = totalGRNValue;
	}
	
}
