package com.tlabs.posweb.beans;

import java.math.BigDecimal;

public class StockRequestItems {

private String id;
private String stockRequestId;
private String skuId;
private String productId;
private String uom;
private String itemDesc;
private BigDecimal  itemPrice;
private BigDecimal  quantity;
private String statusName;
private String color;
private String make;
private String model;
private String size;
private String pluCode;
private BigDecimal  totalCost;
private String fromLocation;
private String deliveryDateStr;
private BigDecimal  approvedQty;
private String requestedBy;
private BigDecimal avlQty;
/*private BigDecimal projectedQty;*/
private BigDecimal prvIndentQty;
private String productRange;
private String measurementRange;
private String category;
private String brand;
private String ean;
private String utility;
private String itemScanCode;


private BigDecimal  reqQty;


public BigDecimal getReqQty() {
	return reqQty;
}
public void setReqQty(BigDecimal reqQty) {
	this.reqQty = reqQty;
}
public String getItemScanCode() {
	return itemScanCode;
}
public void setItemScanCode(String itemScanCode) {
	this.itemScanCode = itemScanCode;
}
private boolean trackingRequired;

public boolean isTrackingRequired() {
	return trackingRequired;
}
public void setTrackingRequired(boolean trackingRequired) {
	this.trackingRequired = trackingRequired;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getStockRequestId() {
	return stockRequestId;
}
public void setStockRequestId(String stockRequestId) {
	this.stockRequestId = stockRequestId;
}
public String getSkuId() {
	return skuId;
}
public void setSkuId(String skuId) {
	this.skuId = skuId;
}
public String getProductId() {
	return productId;
}
public void setProductId(String productId) {
	this.productId = productId;
}
public String getUom() {
	return uom;
}
public void setUom(String uom) {
	this.uom = uom;
}
public String getItemDesc() {
	return itemDesc;
}
public void setItemDesc(String itemDesc) {
	this.itemDesc = itemDesc;
}
public BigDecimal getItemPrice() {
	return itemPrice;
}
public void setItemPrice(BigDecimal itemPrice) {
	this.itemPrice = itemPrice;
}
public BigDecimal getQuantity() {
	return quantity;
}
public void setQuantity(BigDecimal quantity) {
	this.quantity = quantity;
}
public String getStatusName() {
	return statusName;
}
public void setStatusName(String statusName) {
	this.statusName = statusName;
}
public String getColor() {
	return color;
}
public void setColor(String color) {
	this.color = color;
}
public String getMake() {
	return make;
}
public void setMake(String make) {
	this.make = make;
}
public String getModel() {
	return model;
}
public void setModel(String model) {
	this.model = model;
}
public String getSize() {
	return size;
}
public void setSize(String size) {
	this.size = size;
}
public String getPluCode() {
	return pluCode;
}
public void setPluCode(String pluCode) {
	this.pluCode = pluCode;
}
public BigDecimal getTotalCost() {
	return totalCost;
}
public void setTotalCost(BigDecimal totalCost) {
	this.totalCost = totalCost;
}
public String getFromLocation() {
	return fromLocation;
}
public void setFromLocation(String fromLocation) {
	this.fromLocation = fromLocation;
}
public String getDeliveryDateStr() {
	return deliveryDateStr;
}
public void setDeliveryDateStr(String deliveryDateStr) {
	this.deliveryDateStr = deliveryDateStr;
}
public BigDecimal getApprovedQty() {
	return approvedQty;
}
public void setApprovedQty(BigDecimal approvedQty) {
	this.approvedQty = approvedQty;
}
public String getRequestedBy() {
	return requestedBy;
}
public void setRequestedBy(String requestedBy) {
	this.requestedBy = requestedBy;
}


public BigDecimal getPrvIndentQty() {
	return prvIndentQty;
}
public void setPrvIndentQty(BigDecimal prvIndentQty) {
	this.prvIndentQty = prvIndentQty;
}
public String getProductRange() {
	return productRange;
}
public void setProductRange(String productRange) {
	this.productRange = productRange;
}
public String getMeasurementRange() {
	return measurementRange;
}
public void setMeasurementRange(String measurementRange) {
	this.measurementRange = measurementRange;
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
public BigDecimal getAvlQty() {
	return avlQty;
}
public void setAvlQty(BigDecimal avlQty) {
	this.avlQty = avlQty;
}
public String getEan() {
	return ean;
}
public void setEan(String ean) {
	this.ean = ean;
}
public String getUtility() {
	return utility;
}
public void setUtility(String utility) {
	this.utility = utility;
}
		


}
