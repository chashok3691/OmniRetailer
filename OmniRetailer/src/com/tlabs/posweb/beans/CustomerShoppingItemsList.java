package com.tlabs.posweb.beans;


public class CustomerShoppingItemsList {

	private Integer sno;
	

	private String listIdRef;

	private String pluCode;
	

	private String skuId;

	private String skuDescription;
	

	private String productRange;
	

	private String measurementRange;
	

	private String uomLabel;	

	private String groupId;	

	private String categoryId;	
	

	private float orderQty;


	private Float salePrice;
	
	public Integer getSno() {
		return sno;
	}

	public void setSno(Integer sno) {
		this.sno = sno;
	}

	public String getListIdRef() {
		return listIdRef;
	}

	public void setListIdRef(String listIdRef) {
		this.listIdRef = listIdRef;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getSkuDescription() {
		return skuDescription;
	}

	public void setSkuDescription(String skuDescription) {
		this.skuDescription = skuDescription;
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

	public String getUomLabel() {
		return uomLabel;
	}

	public Float getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Float salePrice) {
		this.salePrice = salePrice;
	}

	public void setUomLabel(String uomLabel) {
		this.uomLabel = uomLabel;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public float getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(float orderQty) {
		this.orderQty = orderQty;
	}
	
}
