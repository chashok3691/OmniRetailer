package com.tlabs.posweb.beans;

import java.util.List;

public class PurchaseOrderBean {

	private String invoiceNo;
	private String supplierName;
	
	private String supplierId;
	
	 private String supplier_state ;
	 
	 
	 
	
	
	
	public String getSupplier_state() {
		return supplier_state;
	}

	public void setSupplier_state(String supplier_state) {
		this.supplier_state = supplier_state;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getInvoiceNo() {
		return invoiceNo;
	}

	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}

	private PurchaseOrder WhPurchaseOrder;
	
	private List<PurchaseOrderItems> itemDetails;

	private PurchaseOrder purchaseOrder;
	private List<PurchaseOrderShipmentLocation> locationsList;
	public PurchaseOrder getPurchaseOrder() {
		return purchaseOrder;
	}

	public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
	}

	public PurchaseOrder getWhPurchaseOrder() {
		return WhPurchaseOrder;
	}

	public void setWhPurchaseOrder(PurchaseOrder WhPurchaseOrder) {
		this.WhPurchaseOrder = WhPurchaseOrder;
	}

	public List<PurchaseOrderItems> getItemDetails() {
		return itemDetails;
	}

	public void setItemDetails(List<PurchaseOrderItems> itemDetails) {
		this.itemDetails = itemDetails;
	}

	public List<PurchaseOrderShipmentLocation> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(List<PurchaseOrderShipmentLocation> locationsList) {
		this.locationsList = locationsList;
	}
	
}
