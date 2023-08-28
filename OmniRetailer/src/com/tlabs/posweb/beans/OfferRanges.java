
package com.tlabs.posweb.beans;

public class OfferRanges {

	private String offerId;
	private String range;
	private String minimumPurchaseQuantityString;
	private String minimumPurchaseamountString;
	private String rewardValueString;
	private String description;
	private String groupId;
	private String itemId;
	private String pluCode;
	private String rangeRewardType;
	private String rangeMode;
	private String rewardQty;
	
	private float startPrice;

	private float endPrice;
	
	private String couponProgramId;
	
	
	
	
	public String getCouponProgramId() {
		return couponProgramId;
	}
	public void setCouponProgramId(String couponProgramId) {
		this.couponProgramId = couponProgramId;
	}
	public float getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(float startPrice) {
		this.startPrice = startPrice;
	}
	public float getEndPrice() {
		return endPrice;
	}
	public void setEndPrice(float endPrice) {
		this.endPrice = endPrice;
	}
	public String getRewardQty() {
		return rewardQty;
	}
	public void setRewardQty(String rewardQty) {
		this.rewardQty = rewardQty;
	}
	public String getRangeMode() {
		return rangeMode;
	}
	public void setRangeMode(String rangeMode) {
		this.rangeMode = rangeMode;
	}
	public String getRangeRewardType() {
		return rangeRewardType;
	}
	public void setRangeRewardType(String rangeRewardType) {
		this.rangeRewardType = rangeRewardType;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getOfferId() {
		return offerId;
	}
	public void setOfferId(String offerId) {
		this.offerId = offerId;
	}
	public String getRange() {
		return range;
	}
	public void setRange(String range) {
		this.range = range;
	}
	public String getMinimumPurchaseQuantityString() {
		return minimumPurchaseQuantityString;
	}
	public void setMinimumPurchaseQuantityString(
			String minimumPurchaseQuantityString) {
		this.minimumPurchaseQuantityString = minimumPurchaseQuantityString;
	}
	public String getMinimumPurchaseamountString() {
		return minimumPurchaseamountString;
	}
	public void setMinimumPurchaseamountString(String minimumPurchaseamountString) {
		this.minimumPurchaseamountString = minimumPurchaseamountString;
	}
	public String getRewardValueString() {
		return rewardValueString;
	}
	public void setRewardValueString(String rewardValueString) {
		this.rewardValueString = rewardValueString;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
}
