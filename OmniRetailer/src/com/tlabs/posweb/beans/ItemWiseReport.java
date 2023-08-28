package com.tlabs.posweb.beans;

import java.util.List;


public class ItemWiseReport {
	private String skuId;
	private String itemDescription;
	private double soldQty;
	private double totalCost;
	private float itemUnitPrice;
	private double returnedQty;
	private double exchangedQty;
	private String pluCode;
	private float exchangedAmt;
	private float returnedAmt;
	private double totalExchangedAmt;
	private double totalReturnAmt;
	private String dateStr;
	private List<ItemWiseReport> itemDetails;
	private float priceDiff;
	private float priceVar;
	private String color;
	private String size;
	private String model;
	private String productRange;
	private String category;
	private String subCategory;
	private String section;
	private String brand;
	private String ean;
	
	private List<String> availItemsList;
	
	
public List<String> getAvailItemsList() {
		return availItemsList;
	}
	public void setAvailItemsList(List<String> availItemsList) {
		this.availItemsList = availItemsList;
	}
public String getSkuId() {
	return skuId;
}
public void setSkuId(String skuId) {
	this.skuId = skuId;
}
public String getItemDescription() {
	return itemDescription;
}
public void setItemDescription(String itemDescription) {
	this.itemDescription = itemDescription;
}
public double getSoldQty() {
	return soldQty;
}
public void setSoldQty(double soldQty) {
	this.soldQty = soldQty;
}
public double getTotalCost() {
	return totalCost;
}
public void setTotalCost(double totalCost) {
	this.totalCost = totalCost;
}
public float getItemUnitPrice() {
	return itemUnitPrice;
}
public void setItemUnitPrice(float itemUnitPrice) {
	this.itemUnitPrice = itemUnitPrice;
}
public double getReturnedQty() {
	return returnedQty;
}
public void setReturnedQty(double returnedQty) {
	this.returnedQty = returnedQty;
}
public double getExchangedQty() {
	return exchangedQty;
}
public void setExchangedQty(double exchangedQty) {
	this.exchangedQty = exchangedQty;
}
public String getPluCode() {
	return pluCode;
}
public void setPluCode(String pluCode) {
	this.pluCode = pluCode;
}
public float getExchangedAmt() {
	return exchangedAmt;
}
public void setExchangedAmt(float exchangedAmt) {
	this.exchangedAmt = exchangedAmt;
}
public float getReturnedAmt() {
	return returnedAmt;
}
public void setReturnedAmt(float returnedAmt) {
	this.returnedAmt = returnedAmt;
}
public double getTotalExchangedAmt() {
	return totalExchangedAmt;
}
public void setTotalExchangedAmt(double totalExchangedAmt) {
	this.totalExchangedAmt = totalExchangedAmt;
}
public double getTotalReturnAmt() {
	return totalReturnAmt;
}
public void setTotalReturnAmt(double totalReturnAmt) {
	this.totalReturnAmt = totalReturnAmt;
}
public String getDateStr() {
	return dateStr;
}
public void setDateStr(String dateStr) {
	this.dateStr = dateStr;
}
public List<ItemWiseReport> getItemDetails() {
	return itemDetails;
}
public void setItemDetails(List<ItemWiseReport> itemDetails) {
	this.itemDetails = itemDetails;
}
public String getColor() {
	return color;
}
public void setColor(String color) {
	this.color = color;
}
public String getSize() {
	return size;
}
public void setSize(String size) {
	this.size = size;
}
public String getModel() {
	return model;
}
public void setModel(String model) {
	this.model = model;
}
public String getProductRange() {
	return productRange;
}
public void setProductRange(String productRange) {
	this.productRange = productRange;
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
public String getSection() {
	return section;
}
public void setSection(String section) {
	this.section = section;
}
public String getBrand() {
	return brand;
}
public void setBrand(String brand) {
	this.brand = brand;
}
public String getEan() {
	return ean;
}
public void setEan(String ean) {
	this.ean = ean;
}
public float getPriceDiff() {
	return priceDiff;
}
public void setPriceDiff(float priceDiff) {
	this.priceDiff = priceDiff;
}
public float getPriceVar() {
	return priceVar;
}
public void setPriceVar(float priceVar) {
	this.priceVar = priceVar;
}

}
