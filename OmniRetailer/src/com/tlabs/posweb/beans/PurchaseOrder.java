package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;

public class PurchaseOrder {
	private int slNo;
	private String urlOfPdf;
	private String PO_Ref;
	private String pO_Ref;
	private String supplier_Id;
	private String supplier_name;
	private String supplier_contact_name;
	private String order_date;
	private String order_submitted_by;
	private String order_approved_by;
	private String shipping_address_street;
	private String shipping_address_doorNo;
	private String shipping_address_location;
	private String warehouse_location;
	private String zoneId;
	private String shipping_address_city;
	private String shipping_mode;
	private Double shipping_cost;
	private String shipping_terms;
	private String delivery_due_date;
	private String credit_terms;
	private String payment_terms;
	private Double  products_cost;
	private Double total_tax;
	private Double total_po_value;
	private String remarks;
	private String skuId;
    private BigDecimal discount;
    private String updatedDate;
 private List<String> locationList;
 private String categoryName;
 
 private String category;
 
 private String flowUnder;
 private String supplier_state ;
 
 private String location_state ;
 private String url;
 
 private List<SkuTax> taxList;
 
 private boolean storageRefRequired;
 private boolean isWHShipmentSearch;
 
 private String workflowStatus;
 private String requestChannel;
 
 
 
 
 	
 
	public String getRequestChannel() {
	return requestChannel;
}
public void setRequestChannel(String requestChannel) {
	this.requestChannel = requestChannel;
}
	public String getWorkflowStatus() {
	return workflowStatus;
}
public void setWorkflowStatus(String workflowStatus) {
	this.workflowStatus = workflowStatus;
}
	public boolean isStorageRefRequired() {
	return storageRefRequired;
}
public void setStorageRefRequired(boolean storageRefRequired) {
	this.storageRefRequired = storageRefRequired;
}
public boolean isWHShipmentSearch() {
	return isWHShipmentSearch;
}
public void setWHShipmentSearch(boolean isWHShipmentSearch) {
	this.isWHShipmentSearch = isWHShipmentSearch;
}
	public List<SkuTax> getTaxList() {
	return taxList;
}
public void setTaxList(List<SkuTax> taxList) {
	this.taxList = taxList;
}
	public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
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
	public String getFlowUnder() {
	return flowUnder;
}
public void setFlowUnder(String flowUnder) {
	this.flowUnder = flowUnder;
}
	public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
	public String getCategoryName() {
	return categoryName;
}
public void setCategoryName(String categoryName) {
	this.categoryName = categoryName;
}
	public String getZoneId() {
	return zoneId;
}
public void setZoneId(String zoneId) {
	this.zoneId = zoneId;
}
	public List<String> getLocationList() {
	return locationList;
}
public void setLocationList(List<String> locationList) {
	this.locationList = locationList;
}
	private BigDecimal totalPOValue;
	private BigDecimal totalIndentQty;
	private BigDecimal totalPoQty;
	private RequestHeader requestHeader;
	private List<String> whPurchaseOrderRefList;
	//private String orderPlacedDate;
//	private List<PurchaseOrderItems> purchaseItems;
	private List<WHPurchaseOrderItems> whPurchaseItems;
	private String startIndex;
	private String status;
	private String itemDetails;
	private String logo;
	private List<PurchaseOrder> ordersList;
	private String totalRecords;
	private String storeLocation;
	private List<String> quantity;
	private List<String> itemPrice;
	private List<String> id;
	private List<PurchaseOrderItems> purchaseItems;
	private List<WHPurchaseOrderItems> itemsList;
	private String deliveryLocations;
	private List<PurchaseOrderShipmentLocation> pOShipmentLocations;
	private List<LocationBean> selectedLocationList;
	private List<PurchaseOrderShipmentLocation> shipmentLocations;
	private List<WarehousePurchaseOrderShipmentLocations> whPOShipmentLocations;
	private List<WarehousePurchaseOrderShipmentLocations> locationsList;
	private String deliveryDate;
	private String ordereDate;
	private String maxRecords;
	private String startDateStr;
	private String endDateStr;
	private String searchCriteria;
	private String orderStartDate = null;
	private String orderEndDate = null;
	private String deliveryLocation;
	private Double sub_total;
	private List<String> nextActivities;
	private String quoteRef;
	private String poRef;
	private String orderPlacedDateStr;
	private String totalOrders;
	private List<String> nextWorkFlowStates;
	private List<String> previousStates;
	private String item_name;
	private Boolean itemsFlag;
	private String updatedDateStr;
	private String sunTotalwords;
	private String responseMessage;
	
	private List<WarehousePurchaseOrderWorkFlowLog> previousWorkFlowLogList;
	
	
	
	public List<WarehousePurchaseOrderWorkFlowLog> getPreviousWorkFlowLogList() {
		return previousWorkFlowLogList;
	}
	public void setPreviousWorkFlowLogList(List<WarehousePurchaseOrderWorkFlowLog> previousWorkFlowLogList) {
		this.previousWorkFlowLogList = previousWorkFlowLogList;
	}
	public String getResponseMessage() {
		return responseMessage;
	}
	public String getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}
	private Boolean trackingRequired = false;
	public Boolean getTrackingRequired() {
		return trackingRequired;
	}
	public void setTrackingRequired(Boolean trackingRequired) {
		this.trackingRequired = trackingRequired;
	}
	//@Column(name="cgst_amt")
	private BigDecimal cgstAmt;
	
	//@Column(name="sgst_amt")
	private BigDecimal sgstAmt;
	
	//@Column(name="other_tax_amt")
	private BigDecimal otherTaxAmt;
	
	
	
	public BigDecimal getCgstAmt() {
		return cgstAmt;
	}
	public void setCgstAmt(BigDecimal cgstAmt) {
		this.cgstAmt = cgstAmt;
	}
	public BigDecimal getSgstAmt() {
		return sgstAmt;
	}
	public void setSgstAmt(BigDecimal sgstAmt) {
		this.sgstAmt = sgstAmt;
	}
	public BigDecimal getOtherTaxAmt() {
		return otherTaxAmt;
	}
	public void setOtherTaxAmt(BigDecimal otherTaxAmt) {
		this.otherTaxAmt = otherTaxAmt;
	}
	public String getSunTotalwords() {
		return sunTotalwords;
	}
	public void setSunTotalwords(String sunTotalwords) {
		this.sunTotalwords = sunTotalwords;
	}
	//@Column(name = "cgst_rate")
	private BigDecimal cgstRate;
	
	//@Column(name = "cgst_value")
	private BigDecimal cgstValue;
	
	
	//@Column(name = "sgst_rate")
	private BigDecimal sgstRate;
	
	//@Column(name = "sgst_value")
	private BigDecimal sgstValue;
	//@Column(name = "igst_rate")
	private BigDecimal igstRate;
	
	//@Column(name = "igst_value")
	private BigDecimal igstValue;
	
	
	public BigDecimal getCgstRate() {
		return cgstRate;
	}
	public void setCgstRate(BigDecimal cgstRate) {
		this.cgstRate = cgstRate;
	}
	public BigDecimal getCgstValue() {
		return cgstValue;
	}
	public void setCgstValue(BigDecimal cgstValue) {
		this.cgstValue = cgstValue;
	}
	public BigDecimal getSgstRate() {
		return sgstRate;
	}
	public void setSgstRate(BigDecimal sgstRate) {
		this.sgstRate = sgstRate;
	}
	public BigDecimal getSgstValue() {
		return sgstValue;
	}
	public void setSgstValue(BigDecimal sgstValue) {
		this.sgstValue = sgstValue;
	}
	public BigDecimal getIgstRate() {
		return igstRate;
	}
	public void setIgstRate(BigDecimal igstRate) {
		this.igstRate = igstRate;
	}
	public BigDecimal getIgstValue() {
		return igstValue;
	}
	public void setIgstValue(BigDecimal igstValue) {
		this.igstValue = igstValue;
	}
	public String getPoRef() {
		return poRef;
	}
	public void setPoRef(String poRef) {
		this.poRef = poRef;
	}
	public String getQuoteRef() {
		return quoteRef;
	}
	public void setQuoteRef(String quoteRef) {
		this.quoteRef = quoteRef;
	}
	public List<String> getNextActivities() {
		return nextActivities;
	}
	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}
	public Double getSub_total() {
		return sub_total;
	}
	public void setSub_total(Double sub_total) {
		this.sub_total = sub_total;
	}
	public String getDeliveryLocation() {
		return deliveryLocation;
	}
	public void setDeliveryLocation(String deliveryLocation) {
		this.deliveryLocation = deliveryLocation;
	}
	public String getOrderStartDate() {
		return orderStartDate;
	}
	public void setOrderStartDate(String orderStartDate) {
		this.orderStartDate = orderStartDate;
	}
	public String getOrderEndDate() {
		return orderEndDate;
	}
	public void setOrderEndDate(String orderEndDate) {
		this.orderEndDate = orderEndDate;
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
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
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
	public String getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getOrdereDate() {
		return ordereDate;
	}
	public void setOrdereDate(String ordereDate) {
		this.ordereDate = ordereDate;
	}
	public List<PurchaseOrderShipmentLocation> getShipmentLocations() {
		return shipmentLocations;
	}
	public void setShipmentLocations(
			List<PurchaseOrderShipmentLocation> shipmentLocations) {
		this.shipmentLocations = shipmentLocations;
	}
	public List<LocationBean> getSelectedLocationList() {
		return selectedLocationList;
	}
	public void setSelectedLocationList(List<LocationBean> selectedLocationList) {
		this.selectedLocationList = selectedLocationList;
	}
	public List<PurchaseOrderShipmentLocation> getpOShipmentLocations() {
		return pOShipmentLocations;
	}
	public void setpOShipmentLocations(
			List<PurchaseOrderShipmentLocation> pOShipmentLocations) {
		this.pOShipmentLocations = pOShipmentLocations;
	}
	public String getDeliveryLocations() {
		return deliveryLocations;
	}
	public void setDeliveryLocations(String deliveryLocations) {
		this.deliveryLocations = deliveryLocations;
	}
	public List<PurchaseOrderItems> getPurchaseItems() {
		return purchaseItems;
	}
	public void setPurchaseItems(List<PurchaseOrderItems> purchaseItems) {
		this.purchaseItems = purchaseItems;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<PurchaseOrder> getOrdersList() {
		return ordersList;
	}
	public void setOrdersList(List<PurchaseOrder> ordersList) {
		this.ordersList = ordersList;
	}
	public Double getShipping_cost() {
		return shipping_cost;
	}
	public void setShipping_cost(Double shipping_cost) {
		this.shipping_cost = shipping_cost;
	}
	public Double getProducts_cost() {
		return products_cost;
	}
	public void setProducts_cost(Double products_cost) {
		this.products_cost = products_cost;
	}
	public Double getTotal_tax() {
		return total_tax;
	}
	public void setTotal_tax(Double total_tax) {
		this.total_tax = total_tax;
	}
	public Double getTotal_po_value() {
		return total_po_value;
	}
	public void setTotal_po_value(Double total_po_value) {
		this.total_po_value = total_po_value;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getOrder_submitted_by() {
		return order_submitted_by;
	}
	public void setOrder_submitted_by(String order_submitted_by) {
		this.order_submitted_by = order_submitted_by;
	}
	public String getOrder_approved_by() {
		return order_approved_by;
	}
	public void setOrder_approved_by(String order_approved_by) {
		this.order_approved_by = order_approved_by;
	}
	public String getItemDetails() {
		return itemDetails;
	}
	public void setItemDetails(String itemDetails) {
		this.itemDetails = itemDetails;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPO_Ref() {
		return PO_Ref;
	}
	public void setPO_Ref(String pO_Ref) {
		PO_Ref = pO_Ref;
	}
	public String getpO_Ref() {
		return pO_Ref;
	}
	public void setpO_Ref(String pO_Ref) {
		this.pO_Ref = pO_Ref;
	}
	public String getSupplier_Id() {
		return supplier_Id;
	}
	public void setSupplier_Id(String supplier_Id) {
		this.supplier_Id = supplier_Id;
	}
	public String getSupplier_name() {
		return supplier_name;
	}
	public void setSupplier_name(String supplier_name) {
		this.supplier_name = supplier_name;
	}
	public String getSupplier_contact_name() {
		return supplier_contact_name;
	}
	public void setSupplier_contact_name(String supplier_contact_name) {
		this.supplier_contact_name = supplier_contact_name;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getShipping_address_street() {
		return shipping_address_street;
	}
	public void setShipping_address_street(String shipping_address_street) {
		this.shipping_address_street = shipping_address_street;
	}
	public String getShipping_address_doorNo() {
		return shipping_address_doorNo;
	}
	public void setShipping_address_doorNo(String shipping_address_doorNo) {
		this.shipping_address_doorNo = shipping_address_doorNo;
	}
	public String getShipping_address_location() {
		return shipping_address_location;
	}
	public void setShipping_address_location(String shipping_address_location) {
		this.shipping_address_location = shipping_address_location;
	}
	public String getWarehouse_location() {
		return warehouse_location;
	}
	public void setWarehouse_location(String warehouse_location) {
		this.warehouse_location = warehouse_location;
	}
	public String getShipping_address_city() {
		return shipping_address_city;
	}
	public void setShipping_address_city(String shipping_address_city) {
		this.shipping_address_city = shipping_address_city;
	}
	public String getShipping_mode() {
		return shipping_mode;
	}
	public void setShipping_mode(String shipping_mode) {
		this.shipping_mode = shipping_mode;
	}
	
	public String getShipping_terms() {
		return shipping_terms;
	}
	public void setShipping_terms(String shipping_terms) {
		this.shipping_terms = shipping_terms;
	}
	public String getDelivery_due_date() {
		return delivery_due_date;
	}
	public void setDelivery_due_date(String delivery_due_date) {
		this.delivery_due_date = delivery_due_date;
	}
	public String getCredit_terms() {
		return credit_terms;
	}
	public void setCredit_terms(String credit_terms) {
		this.credit_terms = credit_terms;
	}
	public String getPayment_terms() {
		return payment_terms;
	}
	public void setPayment_terms(String payment_terms) {
		this.payment_terms = payment_terms;
	}
		
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public List<WHPurchaseOrderItems> getWhPurchaseItems() {
		return whPurchaseItems;
	}
	public void setWhPurchaseItems(List<WHPurchaseOrderItems> whPurchaseItems) {
		this.whPurchaseItems = whPurchaseItems;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public String getTotalOrders() {
		return totalOrders;
	}
	public void setTotalOrders(String totalOrders) {
		this.totalOrders = totalOrders;
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
	public List<WarehousePurchaseOrderShipmentLocations> getWhPOShipmentLocations() {
		return whPOShipmentLocations;
	}
	public void setWhPOShipmentLocations(List<WarehousePurchaseOrderShipmentLocations> whPOShipmentLocations) {
		this.whPOShipmentLocations = whPOShipmentLocations;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public Boolean getItemsFlag() {
		return itemsFlag;
	}
	public void setItemsFlag(Boolean itemsFlag) {
		this.itemsFlag = itemsFlag;
	}
	
	public List<String> getQuantity() {
		return quantity;
	}
	public void setQuantity(List<String> quantity) {
		this.quantity = quantity;
	}
	public List<String> getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(List<String> itemPrice) {
		this.itemPrice = itemPrice;
	}
	public List<String> getId() {
		return id;
	}
	public void setId(List<String> id) {
		this.id = id;
	}
	public List<WHPurchaseOrderItems> getItemsList() {
		return itemsList;
	}
	public void setItemsList(List<WHPurchaseOrderItems> itemsList) {
		this.itemsList = itemsList;
	}
	public List<WarehousePurchaseOrderShipmentLocations> getLocationsList() {
		return locationsList;
	}
	public void setLocationsList(List<WarehousePurchaseOrderShipmentLocations> locationsList) {
		this.locationsList = locationsList;
	}
/*	public String getOrderPlacedDate() {
		return orderPlacedDate;
	}
	public void setOrderPlacedDate(String orderPlacedDate) {
		this.orderPlacedDate = orderPlacedDate;
	}*/
	public String getOrderPlacedDateStr() {
		return orderPlacedDateStr;
	}
	public void setOrderPlacedDateStr(String orderPlacedDateStr) {
		this.orderPlacedDateStr = orderPlacedDateStr;
	}
	public List<String> getWhPurchaseOrderRefList() {
		return whPurchaseOrderRefList;
	}
	public void setWhPurchaseOrderRefList(List<String> whPurchaseOrderRefList) {
		this.whPurchaseOrderRefList = whPurchaseOrderRefList;
	}
	public BigDecimal getTotalPOValue() {
		return totalPOValue;
	}
	public void setTotalPOValue(BigDecimal totalPOValue) {
		this.totalPOValue = totalPOValue;
	}
	public BigDecimal getTotalIndentQty() {
		return totalIndentQty;
	}
	public void setTotalIndentQty(BigDecimal totalIndentQty) {
		this.totalIndentQty = totalIndentQty;
	}
	public BigDecimal getTotalPoQty() {
		return totalPoQty;
	}
	public void setTotalPoQty(BigDecimal totalPoQty) {
		this.totalPoQty = totalPoQty;
	}
	public String getUpdatedDateStr() {
		return updatedDateStr;
	}
	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}
	public String getUrlOfPdf() {
		return urlOfPdf;
	}
	public void setUrlOfPdf(String urlOfPdf) {
		this.urlOfPdf = urlOfPdf;
	}
	public BigDecimal getDiscount() {
		return discount;
	}
	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}
	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
		
	}
	
	
	

}
