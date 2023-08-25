package com.tlabs.posweb.beans;

import java.math.BigDecimal;

public class BoneyardStockSummary {

	private String location;
	private String category;
	private String skuId;
	private String description;
	private BigDecimal costPrice;
	private BigDecimal salePrice;
	private BigDecimal availableQty;
	private BigDecimal scrapedQty;
	private String date;

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(BigDecimal costPrice) {
		this.costPrice = costPrice;
	}

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	public BigDecimal getAvailableQty() {
		return availableQty;
	}

	public void setAvailableQty(BigDecimal availableQty) {
		this.availableQty = availableQty;
	}

	public BigDecimal getScrapedQty() {
		return scrapedQty;
	}

	public void setScrapedQty(BigDecimal scrapedQty) {
		this.scrapedQty = scrapedQty;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
