package com.tlabs.posweb.beans;

import java.util.List;


public class UpdateDto {

	private String skuID;
	private Float purchasedQuantity;
	private Float OrderedQuantity;
	private Float price;
	private String storeLocation;
	private String pluCode;
	private String ean;
	private String itemname;
	private String storageRef;
	/* for daily tracking  */
	private Float mrp;
	private Float discount;
	private String productRange;
	private String measureRange;
	private String size;
	private String color;
	private String utility;
	private boolean eanexists;
	private String itemScanCode;
	private boolean updateBlockedQty;
	private Float supplyPrice;
	private String status;
	private String voidReson;
    private Float originalMRP;
	private String priceUpdateType;
	private float pickListQty;
	private List<WHStorageSystemDetails> storageSystemDetails;
	private String responseMsg;
	
	
	
	

	

	public String getResponseMsg() {
		return responseMsg;
	}

	public void setResponseMsg(String responseMsg) {
		this.responseMsg = responseMsg;
	}

	public List<WHStorageSystemDetails> getStorageSystemDetails() {
		return storageSystemDetails;
	}

	public void setStorageSystemDetails(List<WHStorageSystemDetails> storageSystemDetails) {
		this.storageSystemDetails = storageSystemDetails;
	}

	public float getPickListQty() {
		return pickListQty;
	}

	public void setPickListQty(float pickListQty) {
		this.pickListQty = pickListQty;
	}

	public String getStorageRef() {
		return storageRef;
	}

	public void setStorageRef(String storageRef) {
		this.storageRef = storageRef;
	}

	public Float getOrderedQuantity() {
		return OrderedQuantity;
	}

	public void setOrderedQuantity(Float orderedQuantity) {
		OrderedQuantity = orderedQuantity;
	}

	public String getPriceUpdateType() {
		return priceUpdateType;
	}

	public void setPriceUpdateType(String priceUpdateType) {
		this.priceUpdateType = priceUpdateType;
	}

	public Float getOriginalMRP() {
		return originalMRP;
	}

	public void setOriginalMRP(Float originalMRP) {
		this.originalMRP = originalMRP;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getVoidReson() {
		return voidReson;
	}

	public void setVoidReson(String voidReson) {
		this.voidReson = voidReson;
	}

	public Float getSupplyPrice() {
		return supplyPrice;
	}

	public void setSupplyPrice(Float supplyPrice) {
		this.supplyPrice = supplyPrice;
	}

	public boolean isUpdateBlockedQty() {
		return updateBlockedQty;
	}

	public void setUpdateBlockedQty(boolean updateBlockedQty) {
		this.updateBlockedQty = updateBlockedQty;
	}

	public String getBatchNum() {
		return batchNum;
	}

	public void setBatchNum(String batchNum) {
		this.batchNum = batchNum;
	}

	private String batchNum;
	/*added for costprice update*/
	private Float costPrice;

	public boolean isTrackingRecquired() {
		return trackingRecquired;
	}

	public void setTrackingRecquired(boolean trackingRecquired) {
		this.trackingRecquired = trackingRecquired;
	}

	private boolean trackingRecquired;
	
	public Float getMrp() {
		return mrp;
	}
	public void setMrp(Float mrp) {
		this.mrp = mrp;
	}
	public Float getDiscount() {
		return discount;
	}
	public void setDiscount(Float discount) {
		this.discount = discount;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public String getSkuID() {
		return skuID;
	}
	public void setSkuID(String skuID) {
		this.skuID = skuID;
	}
	public Float getPurchasedQuantity() {
		return purchasedQuantity;
	}
	public void setPurchasedQuantity(Float purchasedQuantity) {
		this.purchasedQuantity = purchasedQuantity;
	}
	public String getProductRange() {
		return productRange;
	}
	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}
	public String getMeasureRange() {
		return measureRange;
	}
	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Float getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(Float costPrice) {
		this.costPrice = costPrice;
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
	public boolean isEanexists() {
		return eanexists;
	}
	public void setEanexists(boolean eanexists) {
		this.eanexists = eanexists;
	}
	public String getItemScanCode() {
		return itemScanCode;
	}
	public void setItemScanCode(String itemScanCode) {
		this.itemScanCode = itemScanCode;
	}
	
}