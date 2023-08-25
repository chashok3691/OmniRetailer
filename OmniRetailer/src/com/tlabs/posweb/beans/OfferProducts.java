package com.tlabs.posweb.beans;

//import java.math.BigDecimal;



public class OfferProducts {
	private Integer sno;

	private String offerId;

	private String skuId;

	private String category;

	private String itemDesc;

	private float rewardValue;

	private float minPurchaseQty;

	private String subCategory;

	private String brand;

	private String section;

	private String department;

	private String model;

	private float rewardQty;
	
	private boolean exclusionItem;
	
	

	public boolean isExclusionItem() {
		return exclusionItem;
	}

	public void setExclusionItem(boolean exclusionItem) {
		this.exclusionItem = exclusionItem;
	}
	
	public float getRewardQty() {
		return rewardQty;
	}

	public void setRewardQty(float rewardQty) {
		this.rewardQty = rewardQty;
	}

	private String plucode;
	public String getPlucode() {
		return plucode;
	}

	public void setPlucode(String plucode) {
		this.plucode = plucode;
	}

	//@Column(name = "ean")
	private String ean;
	
	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getDiscountType() {
		return discountType;
	}

	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}

	//@Column(name = "size")
	private String size;
	
	//@Column(name = "discount_type")
	private String discountType;
	
	public Integer getSno() {
		return sno;
	}

	public void setSno(Integer sno) {
		this.sno = sno;
	}

	public String getOfferId() {
		return offerId;
	}

	public void setOfferId(String offerId) {
		this.offerId = offerId;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public float getRewardValue() {
		return rewardValue;
	}

	public void setRewardValue(float rewardValue) {
		this.rewardValue = rewardValue;
	}

	public float getMinPurchaseQty() {
		return minPurchaseQty;
	}

	public void setMinPurchaseQty(float minPurchaseQty) {
		this.minPurchaseQty = minPurchaseQty;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}
 
	
}
