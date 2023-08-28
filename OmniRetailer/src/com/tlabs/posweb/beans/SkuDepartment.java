package com.tlabs.posweb.beans;
public class SkuDepartment {
	private String skuId;
	private String primaryDepartment;
	private String subDepartment;
	private String description;
	private String uom;
	private Float price;
	private int totalRecorsds;
	private int index;
	private int totalValue;
	
	public int getTotalRecorsds() {
		return totalRecorsds;
	}
	public void setTotalRecorsds(int totalRecorsds) {
		this.totalRecorsds = totalRecorsds;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getTotalValue() {
		return totalValue;
	}
	public void setTotalValue(int totalValue) {
		this.totalValue = totalValue;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public String getPrimaryDepartment() {
		return primaryDepartment;
	}
	public void setPrimaryDepartment(String primaryDepartment) {
		this.primaryDepartment = primaryDepartment;
	}
	public String getSubDepartment() {
		return subDepartment;
	}
	public void setSubDepartment(String subDepartment) {
		this.subDepartment = subDepartment;
	}
}