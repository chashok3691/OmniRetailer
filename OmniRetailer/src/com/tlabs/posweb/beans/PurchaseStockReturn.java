package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;


public class PurchaseStockReturn {
	
	private String purchaseStockReturnRef;
	private String fromLocation;
	private String supplierId;
	private String supplierLocation;
	private String transportMode;
	private String returnReason;
	private String returnComments;
	private Date returnDate;
	private String poRef;
	private String grnRef;
	private String status;
	private Date createdDate;
	private Date updatedDate;
	private String userName;
	private String userRole;
	private String returnBy;
	private String pickedBy;
	private float goodsVal;
	private String actionRequired;
    private List<PurchaseStockReturnitems> stockReturnItems;
	private String returnDateStr;
	private String createdDateStr;
	private String updatedDateStr;
	private RequestHeader requestHeader;
	private String startDate;
	private String endDate;
	private String startIndex;
	private String maxRecords;
	private String searchCriteria;
	private String taxValue;
	private String shipmentCharges;
	private String supplierShipmentRef;
	private String supplierDescription;
	private List<PurchaseStockReturn> purchaseStockReturns;
	private String totalRecords;
	private int slNo;
	private PurchaseStockReturn purchaseStockReturn;
	private String flowUnder;
	
	private List<String> locationsList;
	private String ean;
	private String hsnCode;
	
	private String supplier_state ;
	
	private List<String> nextActivities;
	private List<String> nextWorkFlowStates;
	private List<String> previousStates;
	private String type;
	
	
	
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List<String> getNextWorkFlowStates() {
		return nextWorkFlowStates;
	}

	public void setNextWorkFlowStates(List<String> nextWorkFlowStates) {
		this.nextWorkFlowStates = nextWorkFlowStates;
	}

	public List<String> getPreviousStates() {
		return previousStates;
	}

	public void setPreviousStates(List<String> previousStates) {
		this.previousStates = previousStates;
	}

	public List<String> getNextActivities() {
		return nextActivities;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

	public String getSupplier_state() {
		return supplier_state;
	}

	public void setSupplier_state(String supplier_state) {
		this.supplier_state = supplier_state;
	}

	public String getGrnRef() {
		return grnRef;
	}

	public void setGrnRef(String grnRef) {
		this.grnRef = grnRef;
	}

	public String getPickedBy() {
		return pickedBy;
	}

	public void setPickedBy(String pickedBy) {
		this.pickedBy = pickedBy;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

	public String getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}

	

	public List<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}

	public String getFlowUnder() {
		return flowUnder;
	}

	public void setFlowUnder(String flowUnder) {
		this.flowUnder = flowUnder;
	}

	public PurchaseStockReturn getPurchaseStockReturn() {
		return purchaseStockReturn;
	}

	public void setPurchaseStockReturn(PurchaseStockReturn purchaseStockReturn) {
		this.purchaseStockReturn = purchaseStockReturn;
	}

	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<PurchaseStockReturn> getPurchaseStockReturns() {
		return purchaseStockReturns;
	}

	public void setPurchaseStockReturns(List<PurchaseStockReturn> purchaseStockReturns) {
		this.purchaseStockReturns = purchaseStockReturns;
	}

	public String getTaxValue() {
		return taxValue;
	}

	public void setTaxValue(String taxValue) {
		this.taxValue = taxValue;
	}

	public String getShipmentCharges() {
		return shipmentCharges;
	}

	public void setShipmentCharges(String shipmentCharges) {
		this.shipmentCharges = shipmentCharges;
	}

	public String getSupplierShipmentRef() {
		return supplierShipmentRef;
	}

	public void setSupplierShipmentRef(String supplierShipmentRef) {
		this.supplierShipmentRef = supplierShipmentRef;
	}

	public String getSupplierDescription() {
		return supplierDescription;
	}

	public void setSupplierDescription(String supplierDescription) {
		this.supplierDescription = supplierDescription;
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

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getReturnDateStr() {
		return returnDateStr;
	}

	public void setReturnDateStr(String returnDateStr) {
		this.returnDateStr = returnDateStr;
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

	public List<PurchaseStockReturnitems> getStockReturnItems() {
		return stockReturnItems;
	}

	public void setStockReturnItems(List<PurchaseStockReturnitems> stockReturnItems) {
		this.stockReturnItems = stockReturnItems;
	}

	public String getPurchaseStockReturnRef() {
		return purchaseStockReturnRef;
	}

	public void setPurchaseStockReturnRef(String purchaseStockReturnRef) {
		this.purchaseStockReturnRef = purchaseStockReturnRef;
	}

	public String getFromLocation() {
		return fromLocation;
	}

	public void setFromLocation(String fromLocation) {
		this.fromLocation = fromLocation;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getSupplierLocation() {
		return supplierLocation;
	}

	public void setSupplierLocation(String supplierLocation) {
		this.supplierLocation = supplierLocation;
	}

	public String getTransportMode() {
		return transportMode;
	}

	public void setTransportMode(String transportMode) {
		this.transportMode = transportMode;
	}

	public String getReturnReason() {
		return returnReason;
	}

	public void setReturnReason(String returnReason) {
		this.returnReason = returnReason;
	}

	public String getReturnComments() {
		return returnComments;
	}

	public void setReturnComments(String returnComments) {
		this.returnComments = returnComments;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public String getPoRef() {
		return poRef;
	}

	public void setPoRef(String poRef) {
		this.poRef = poRef;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getReturnBy() {
		return returnBy;
	}

	public void setReturnBy(String returnBy) {
		this.returnBy = returnBy;
	}

	public float getGoodsVal() {
		return goodsVal;
	}

	public void setGoodsVal(float goodsVal) {
		this.goodsVal = goodsVal;
	}

	public String getActionRequired() {
		return actionRequired;
	}

	public void setActionRequired(String actionRequired) {
		this.actionRequired = actionRequired;
	}
	
}
