package com.tlabs.posweb.beans;

import java.util.List;

import com.tlabs.posweb.beans.WHInvoiceItems;



public class InvoiceBean {
	private String invoiceId;
	private String orderId;
	private String shipmentId;
	private String shipmentNoteId;
	private String customerName;
	private String buildingNo;
	private String streetName;
	private String city;
	private String country;
	private double zip_code;
	private int noOfPackages;
	private String shipmentAgency;
	private float totalItemCost;
	private float shipmentCost;
	private float tax;
	private float insuranceCost;
	private String paymentTerms;
	private String remarks;
	private String invoiceDate;
	private String invoiceStatus;
	private String warehouse_location;
	
	private String gstn;
	
	private String supplierName;

	//@Column(name = "supplier_id")
	

	
	public String getEmail() {
		return email;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	private String email;
	
	private String shippedToZipCode;
	public String getShippedToZipCode() {
		return shippedToZipCode;
	}
	public void setShippedToZipCode(String shippedToZipCode) {
		this.shippedToZipCode = shippedToZipCode;
	}
	public String getGstn() {
		return gstn;
	}
	public void setGstn(String gstn) {
		this.gstn = gstn;
	}
	private String maxRecords;
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	private RequestHeader requestHeader;
	private String startIndex;
	private List<WHInvoiceItems> invoiceItems;
	
	
	
	
	private String gstin;
	private String stateName;
	private String cin;
	private String emailId;
	private String counter;
	private String goodsReceiptNoteRef ;
	private String buyersOrder;
	private String deliveryBy;
	private String buyer;
	private String deliveryNote;
	private String deliveryNoteDate;
	private String shipmentPaymentMode;
	private String shipmentDispatches;
	private String deliveryDate; 
	private String supplierId;
	private String shipmentMode;
	private String invoice_Date;
	private String createdOn;
	private String warehouseLocation; 
	private String shippedToCountry;
	private List<WHInvoiceItems> whInvoiceItemsList;
	private List<InvoiceBean> whInvoiceList;
	 private int totalRecords;
	
	
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getGstin() {
		return gstin;
	}
	public void setGstin(String gstin) {
		this.gstin = gstin;
	}
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	public String getCin() {
		return cin;
	}
	public void setCin(String cin) {
		this.cin = cin;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getCounter() {
		return counter;
	}
	public void setCounter(String counter) {
		this.counter = counter;
	}
	public String getGoodsReceiptNoteRef() {
		return goodsReceiptNoteRef;
	}
	public void setGoodsReceiptNoteRef(String goodsReceiptNoteRef) {
		this.goodsReceiptNoteRef = goodsReceiptNoteRef;
	}
	public String getBuyersOrder() {
		return buyersOrder;
	}
	public void setBuyersOrder(String buyersOrder) {
		this.buyersOrder = buyersOrder;
	}
	public String getDeliveryBy() {
		return deliveryBy;
	}
	public void setDeliveryBy(String deliveryBy) {
		this.deliveryBy = deliveryBy;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public String getDeliveryNote() {
		return deliveryNote;
	}
	public void setDeliveryNote(String deliveryNote) {
		this.deliveryNote = deliveryNote;
	}
	public String getDeliveryNoteDate() {
		return deliveryNoteDate;
	}
	public void setDeliveryNoteDate(String deliveryNoteDate) {
		this.deliveryNoteDate = deliveryNoteDate;
	}
	public String getShipmentPaymentMode() {
		return shipmentPaymentMode;
	}
	public void setShipmentPaymentMode(String shipmentPaymentMode) {
		this.shipmentPaymentMode = shipmentPaymentMode;
	}
	public String getShipmentDispatches() {
		return shipmentDispatches;
	}
	public void setShipmentDispatches(String shipmentDispatches) {
		this.shipmentDispatches = shipmentDispatches;
	}
	public String getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	public String getShipmentMode() {
		return shipmentMode;
	}
	public void setShipmentMode(String shipmentMode) {
		this.shipmentMode = shipmentMode;
	}
	public String getInvoice_Date() {
		return invoice_Date;
	}
	public void setInvoice_Date(String invoice_Date) {
		this.invoice_Date = invoice_Date;
	}
	public String getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}
	public String getWarehouseLocation() {
		return warehouseLocation;
	}
	public void setWarehouseLocation(String warehouseLocation) {
		this.warehouseLocation = warehouseLocation;
	}
	public String getShippedToCountry() {
		return shippedToCountry;
	}
	public void setShippedToCountry(String shippedToCountry) {
		this.shippedToCountry = shippedToCountry;
	}
	public List<WHInvoiceItems> getWhInvoiceItemsList() {
		return whInvoiceItemsList;
	}
	public void setWhInvoiceItemsList(List<WHInvoiceItems> whInvoiceItemsList) {
		this.whInvoiceItemsList = whInvoiceItemsList;
	}
	public List<InvoiceBean> getWhInvoiceList() {
		return whInvoiceList;
	}
	public void setWhInvoiceList(List<InvoiceBean> whInvoiceList) {
		this.whInvoiceList = whInvoiceList;
	}
	public String getInvoiceStatus() {
		return invoiceStatus;
	}
	public void setInvoiceStatus(String invoiceStatus) {
		this.invoiceStatus = invoiceStatus;
	}
	public String getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public List<WHInvoiceItems> getInvoiceItems() {
		return invoiceItems;
	}
	public void setInvoiceItems(List<WHInvoiceItems> invoiceItems) {
		this.invoiceItems = invoiceItems;
	}
	public String getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(String invoiceId) {
		this.invoiceId = invoiceId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getShipmentId() {
		return shipmentId;
	}
	public void setShipmentId(String shipmentId) {
		this.shipmentId = shipmentId;
	}
	public String getShipmentNoteId() {
		return shipmentNoteId;
	}
	public void setShipmentNoteId(String shipmentNoteId) {
		this.shipmentNoteId = shipmentNoteId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getBuildingNo() {
		return buildingNo;
	}
	public void setBuildingNo(String buildingNo) {
		this.buildingNo = buildingNo;
	}
	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public double getZip_code() {
		return zip_code;
	}
	public void setZip_code(double zip_code) {
		this.zip_code = zip_code;
	}
	public int getNoOfPackages() {
		return noOfPackages;
	}
	public void setNoOfPackages(int noOfPackages) {
		this.noOfPackages = noOfPackages;
	}
	public String getShipmentAgency() {
		return shipmentAgency;
	}
	public void setShipmentAgency(String shipmentAgency) {
		this.shipmentAgency = shipmentAgency;
	}
	public float getTotalItemCost() {
		return totalItemCost;
	}
	public void setTotalItemCost(float totalItemCost) {
		this.totalItemCost = totalItemCost;
	}
	public float getShipmentCost() {
		return shipmentCost;
	}
	public void setShipmentCost(float shipmentCost) {
		this.shipmentCost = shipmentCost;
	}
	public float getTax() {
		return tax;
	}
	public void setTax(float tax) {
		this.tax = tax;
	}
	public float getInsuranceCost() {
		return insuranceCost;
	}
	public void setInsuranceCost(float insuranceCost) {
		this.insuranceCost = insuranceCost;
	}
	public String getPaymentTerms() {
		return paymentTerms;
	}
	public void setPaymentTerms(String paymentTerms) {
		this.paymentTerms = paymentTerms;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getWarehouse_location() {
		return warehouse_location;
	}
	public void setWarehouse_location(String warehouse_location) {
		this.warehouse_location = warehouse_location;
	}
	
}
