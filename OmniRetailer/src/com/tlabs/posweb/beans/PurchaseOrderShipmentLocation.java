package com.tlabs.posweb.beans;

//import java.util.Date;


public class PurchaseOrderShipmentLocation {

//	private int sno;
	private String purchaseOrderId;
	private String skuId;
	private String skuName;
	private String pluCode;
	private float skuPrice;
	private String storeLocation;
	private String quantity;
	private String remarks;
	//private Date date;
	private String dateStr;
	private String quantityStr;
	private String skuPriceStr;
	private RequestHeader requestHeader;
	private double totalCost;
	private String make;
	private String shipmentNoteRef;
	
	public String getShipmentNoteRef() {
		return shipmentNoteRef;
	}

	public void setShipmentNoteRef(String shipmentNoteRef) {
		this.shipmentNoteRef = shipmentNoteRef;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public double getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
	}

	public String getPurchaseOrderId() {
		return purchaseOrderId;
	}

	public void setPurchaseOrderId(String purchaseOrderId) {
		this.purchaseOrderId = purchaseOrderId;
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

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public float getSkuPrice() {
		return skuPrice;
	}

	public void setSkuPrice(float skuPrice) {
		this.skuPrice = skuPrice;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	

	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}

	public String getQuantityStr() {
		return quantityStr;
	}

	public void setQuantityStr(String quantityStr) {
		this.quantityStr = quantityStr;
	}

	public String getSkuPriceStr() {
		return skuPriceStr;
	}

	public void setSkuPriceStr(String skuPriceStr) {
		this.skuPriceStr = skuPriceStr;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
}
