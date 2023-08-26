package com.tlabs.posweb.beans;

/**
 * @author chennakesav.a
 * createdOn   : 15-03-2016
 * Description : This model class is used to hold the values and interact with quote_items table in database.
 * */
public class QuoteItems {
	private int sno;
	private String itemId;
	private String itemDescription;
	private String color;
	private String size;
	private String unitOfMeasurement;
	private String quoteRef;
	private float price;
	private float quantity;
	private float total;
	private String skuId;
	private String model;
	private String make;
	private String pluCode;
	private String priceStr;
	private String quantityStr;
	private String totalStr;
	private String remarks;
	
	
	//These fields are added by Ravi Teja
	private Float demandForecast;
	private Float minQty;

	
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getItemDescription() {
		return itemDescription;
	}
	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
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
	public String getUnitOfMeasurement() {
		return unitOfMeasurement;
	}
	public void setUnitOfMeasurement(String unitOfMeasurement) {
		this.unitOfMeasurement = unitOfMeasurement;
	}
	public String getQuoteRef() {
		return quoteRef;
	}
	public void setQuoteRef(String quoteRef) {
		this.quoteRef = quoteRef;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getQuantity() {
		return quantity;
	}
	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public String getPriceStr() {
		return priceStr;
	}
	public void setPriceStr(String priceStr) {
		this.priceStr = priceStr;
	}
	public String getQuantityStr() {
		return quantityStr;
	}
	public void setQuantityStr(String quantityStr) {
		this.quantityStr = quantityStr;
	}
	public String getTotalStr() {
		return totalStr;
	}
	public void setTotalStr(String totalStr) {
		this.totalStr = totalStr;
	}
	public Float getDemandForecast() {
		return demandForecast;
	}
	public void setDemandForecast(Float demandForecast) {
		this.demandForecast = demandForecast;
	}
	public Float getMinQty() {
		return minQty;
	}
	public void setMinQty(Float minQty) {
		this.minQty = minQty;
	}
	
	
 
}
