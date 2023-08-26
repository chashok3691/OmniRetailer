package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


public class StoreShipmentReturn {
	private String purchaseStockReturnRef;

	private String fromLocation;

	private String supplierId;

	private String supplierLocation;

	private String supplierDescription;

	private String supplierShipmentRef;

	private Float shipmentCharges;

	private Float taxValue;
	private String pickedBy;


	private String transportMode;

	private String returnReason;
	 private String supplier_state ;
	 private String  location_state;
	 
	 
	
		private boolean printRequired=false;
		
		private String printURL;
	
		
		
	

	public boolean isPrintRequired() {
			return printRequired;
		}

		public void setPrintRequired(boolean printRequired) {
			this.printRequired = printRequired;
		}

		public String getPrintURL() {
			return printURL;
		}

		public void setPrintURL(String printURL) {
			this.printURL = printURL;
		}

	public String getLocation_state() {
		return location_state;
	}

	public void setLocation_state(String location_state) {
		this.location_state = location_state;
	}

	public String getSupplier_state() {
		return supplier_state;
	}

	public void setSupplier_state(String supplier_state) {
		this.supplier_state = supplier_state;
	}

	public String getPickedBy() {
		return pickedBy;
	}

	public void setPickedBy(String pickedBy) {
		this.pickedBy = pickedBy;
	}

	private String returnComments;

	private Date returnDate;

	private String poRef;

	private String status;

	private Date createdDate;

	private Date updatedDate;

	private String userName;

	private String userRole;
	private String returnBy;

	private float goodsVal;

	private String actionRequired;
	private String suppContNumber;

	private String invoiceNo;

	private String category;

	private String subCategory;

	private String skuId;

	private List<StoreShipmentReturnItems> stockReturnItems;

	private String returnDateStr;
	private String createdDateStr;
	private String updatedDateStr;
	private RequestHeader requestHeader;
	private String startDate;
	private String endDate;
	private String startIndex;
	private String maxRecords;
	private String searchCriteria;

	private int totRecords;

	private List<StoreShipmentReturn> storeShipmentReturnList;
	private List<StoreShipmentReturn> WHShipmentReturnList;
	
	private List<WHShipmentReturnWorkflowLogs> WHShipmentReturnWorkFlowLogList;

	private ResponseHeader ResponseHeader;

	private String shippedBy;

	private String shipmentCarrier;

	private String supplierAddress;

	private Date shippedOn;

	private String remarks;

	private BigDecimal subTotal;

	private BigDecimal total;

	private String shippedOnStr;

	private String supplierName;
	
	private String flowUnder;
	
	
	private boolean itemsReq;
	private List<String> previousWorkFlowList;
	private List<String> nextWorkFlowStates;
	private List<String> workFlowActivities;
	private List<String> previousStates;
	private List<String> nextActivities;
    private int noofItems;
	private float cost;
	
	
	private List<WHShipmentReturnWorkflowLogs> previousWorkFlowLogList;
	
	public List<WHShipmentReturnWorkflowLogs> getWHShipmentReturnWorkFlowLogList() {
		return WHShipmentReturnWorkFlowLogList;
	}

	public void setWHShipmentReturnWorkFlowLogList(List<WHShipmentReturnWorkflowLogs> wHShipmentReturnWorkFlowLogList) {
		WHShipmentReturnWorkFlowLogList = wHShipmentReturnWorkFlowLogList;
	}

	public List<WHShipmentReturnWorkflowLogs> getPreviousWorkFlowLogList() {
		return previousWorkFlowLogList;
	}

	public void setPreviousWorkFlowLogList(List<WHShipmentReturnWorkflowLogs> previousWorkFlowLogList) {
		this.previousWorkFlowLogList = previousWorkFlowLogList;
	}

	public int getNoofItems() {
		return noofItems;
	}

	public void setNoofItems(int i) {
		this.noofItems = i;
	}

	public float getCost() {
		return cost;
	}

	public void setCost(float f) {
		this.cost = f;
	}

	public List<StoreShipmentReturn> getWHShipmentReturnList() {
		return WHShipmentReturnList;
	}

	public void setWHShipmentReturnList(List<StoreShipmentReturn> wHShipmentReturnList) {
		WHShipmentReturnList = wHShipmentReturnList;
	}

	public String getFlowUnder() {
		return flowUnder;
	}

	public void setFlowUnder(String flowUnder) {
		this.flowUnder = flowUnder;
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

	public String getSupplierDescription() {
		return supplierDescription;
	}

	public void setSupplierDescription(String supplierDescription) {
		this.supplierDescription = supplierDescription;
	}

	public String getSupplierShipmentRef() {
		return supplierShipmentRef;
	}

	public void setSupplierShipmentRef(String supplierShipmentRef) {
		this.supplierShipmentRef = supplierShipmentRef;
	}

	public Float getShipmentCharges() {
		return shipmentCharges;
	}

	public void setShipmentCharges(Float shipmentCharges) {
		this.shipmentCharges = shipmentCharges;
	}

	public Float getTaxValue() {
		return taxValue;
	}

	public void setTaxValue(Float taxValue) {
		this.taxValue = taxValue;
	}

	public String getShippedBy() {
		return shippedBy;
	}

	public void setShippedBy(String shippedBy) {
		this.shippedBy = shippedBy;
	}

	public String getShipmentCarrier() {
		return shipmentCarrier;
	}

	public void setShipmentCarrier(String shipmentCarrier) {
		this.shipmentCarrier = shipmentCarrier;
	}

	public String getSupplierAddress() {
		return supplierAddress;
	}

	public void setSupplierAddress(String supplierAddress) {
		this.supplierAddress = supplierAddress;
	}

	public Date getShippedOn() {
		return shippedOn;
	}

	public void setShippedOn(Date shippedOn) {
		this.shippedOn = shippedOn;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public BigDecimal getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(BigDecimal subTotal) {
		this.subTotal = subTotal;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getShippedOnStr() {
		return shippedOnStr;
	}

	public void setShippedOnStr(String shippedOnStr) {
		this.shippedOnStr = shippedOnStr;
	}

	public List<String> getNextActivities() {
		return nextActivities;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public boolean isItemsReq() {
		return itemsReq;
	}

	public void setItemsReq(boolean itemsReq) {
		this.itemsReq = itemsReq;
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

	public String getPurchaseStockReturnRef() {
		return purchaseStockReturnRef;
	}

	public List<StoreShipmentReturnItems> getStockReturnItems() {
		return stockReturnItems;
	}

	public void setStockReturnItems(List<StoreShipmentReturnItems> stockReturnItems) {
		this.stockReturnItems = stockReturnItems;
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

	public ResponseHeader getResponseHeader() {
		return ResponseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		ResponseHeader = responseHeader;
	}

	public int getTotRecords() {
		return totRecords;
	}

	public void setTotRecords(int totRecords) {
		this.totRecords = totRecords;
	}

	public List<StoreShipmentReturn> getStoreShipmentReturnList() {
		return storeShipmentReturnList;
	}

	public void setStoreShipmentReturnList(List<StoreShipmentReturn> storeShipmentReturnList) {
		this.storeShipmentReturnList = storeShipmentReturnList;
	}

	public String getSuppContNumber() {
		return suppContNumber;
	}

	public void setSuppContNumber(String suppContNumber) {
		this.suppContNumber = suppContNumber;
	}

	public String getInvoiceNo() {
		return invoiceNo;
	}

	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public List<String> getPreviousWorkFlowList() {
		return previousWorkFlowList;
	}

	public void setPreviousWorkFlowList(List<String> previousWorkFlowList) {
		this.previousWorkFlowList = previousWorkFlowList;
	}

	public List<String> getNextWorkFlowStates() {
		return nextWorkFlowStates;
	}

	public void setNextWorkFlowStates(List<String> nextWorkFlowStates) {
		this.nextWorkFlowStates = nextWorkFlowStates;
	}

	public List<String> getWorkFlowActivities() {
		return workFlowActivities;
	}

	public void setWorkFlowActivities(List<String> workFlowActivities) {
		this.workFlowActivities = workFlowActivities;
	}

	public List<String> getPreviousStates() {
		return previousStates;
	}

	public void setPreviousStates(List<String> previousStates) {
		this.previousStates = previousStates;
	}
}
