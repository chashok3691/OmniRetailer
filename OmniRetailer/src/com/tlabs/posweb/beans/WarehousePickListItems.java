package com.tlabs.posweb.beans;



public class WarehousePickListItems {
	
	private int sno;
	
	private String pickListId;
	
	private String skuId;
	
	private String skuDescription;
	
	private String pluCode;
	
	private String batchId;
	
	private float costPrice;
	
	private String storageArea;
	
	private String storageSystemId;
	
	private float storageQty;
	
	private float openQty;
	
	private float pickListQty;
	
	private float pickedQty;
	
	private String pickerName;
	
	private String ean;
	
	private float damagedQty;
	
	private float closedQty;
	
	
	
	
	public float getClosedQty() {
		return closedQty;
	}
	public void setClosedQty(float closedQty) {
		this.closedQty = closedQty;
	}
	public float getDamagedQty() {
		return damagedQty;
	}
	public void setDamagedQty(float damagedQty) {
		this.damagedQty = damagedQty;
	}
	public String getEan() {
		return ean;
	}
	public void setEan(String ean) {
		this.ean = ean;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getPickListId() {
		return pickListId;
	}
	public void setPickListId(String pickListId) {
		this.pickListId = pickListId;
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
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public String getBatchId() {
		return batchId;
	}
	public void setBatchId(String batchId) {
		this.batchId = batchId;
	}
	
	public String getStorageArea() {
		return storageArea;
	}
	public void setStorageArea(String storageArea) {
		this.storageArea = storageArea;
	}
	public String getStorageSystemId() {
		return storageSystemId;
	}
	public void setStorageSystemId(String storageSystemId) {
		this.storageSystemId = storageSystemId;
	}
	
	public String getPickerName() {
		return pickerName;
	}
	public void setPickerName(String pickerName) {
		this.pickerName = pickerName;
	}
	public void setPickedQty(float floatValue) {
		// TODO Auto-generated method stub
		
	}
	public float getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(float costPrice) {
		this.costPrice = costPrice;
	}
	public float getStorageQty() {
		return storageQty;
	}
	public void setStorageQty(float storageQty) {
		this.storageQty = storageQty;
	}
	public float getOpenQty() {
		return openQty;
	}
	public void setOpenQty(float openQty) {
		this.openQty = openQty;
	}
	public float getPickListQty() {
		return pickListQty;
	}
	public void setPickListQty(float pickListQty) {
		this.pickListQty = pickListQty;
	}
	public float getPickedQty() {
		return pickedQty;
	}
	
	
	
	
	
	
	
	
	


	
}
