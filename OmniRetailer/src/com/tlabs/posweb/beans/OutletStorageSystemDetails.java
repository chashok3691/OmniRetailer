package com.tlabs.posweb.beans;

import java.util.List;

public class OutletStorageSystemDetails {

	private String serialNum;
	private String storageSystemId;
	private String level;
	private String column;
	private String product;
	private String quantity;
	private String description;
	private String category;
	private String skuId;
	private String notation;
	
	private List<OutletStorageSystemDetails> outletStorageSystemsDetails;
	
	
	public String getSerialNum() {
		return serialNum;
	}
	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}
	public List<OutletStorageSystemDetails> getOutletStorageSystemsDetails() {
		return outletStorageSystemsDetails;
	}
	public void setOutletStorageSystemsDetails(
			List<OutletStorageSystemDetails> outletStorageSystemsDetails) {
		this.outletStorageSystemsDetails = outletStorageSystemsDetails;
	}
	public String getStorageSystemId() {
		return storageSystemId;
	}
	public void setStorageSystemId(String storageSystemId) {
		this.storageSystemId = storageSystemId;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getColumn() {
		return column;
	}
	public void setColumn(String column) {
		this.column = column;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public String getNotation() {
		return notation;
	}
	public void setNotation(String notation) {
		this.notation = notation;
	}
	
	
	
}
