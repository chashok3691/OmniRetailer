package com.tlabs.posweb.beans;

public class CategorySummary {
	private String totalQuantity;
	private String totalPrice;
	
	private Float totalSupplyQuantity;
	private Float totalAvgSupplyPrice;
	
	
	public Float getTotalSupplyQuantity() {
		return totalSupplyQuantity;
	}
	public void setTotalSupplyQuantity(Float totalSupplyQuantity) {
		this.totalSupplyQuantity = totalSupplyQuantity;
	}
	public Float getTotalAvgSupplyPrice() {
		return totalAvgSupplyPrice;
	}
	public void setTotalAvgSupplyPrice(Float totalAvgSupplyPrice) {
		this.totalAvgSupplyPrice = totalAvgSupplyPrice;
	}
	public String getTotalQuantity() {
		return totalQuantity;
	}
	public void setTotalQuantity(String totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}
