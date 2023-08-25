package com.tlabs.posweb.beans;


public class DealRanges implements Cloneable{

	public DealRanges clone(){
		DealRanges deals=null;
 	   try {
 		  deals=(DealRanges)super.clone();
 	    }
 	   catch(Exception e)
 	   {e.printStackTrace(); }
 	      return deals;
 	   }
	
	
	private int sNo;
	private String dealId;
	private String range;
	private float minimumPurchaseQuantity_float;
	private float minimumPurchaseamount_float;
	private Float maximumPurchaseamount_float;
	private float dealQuantity_float;
	private String description;
	private String groupId;
	private String saleGroupId;
	private String itemId;
	private String rangeRewardType;
	private String rangeMode;
	private float saleMinimumPurchaseQuantity_float;
	private float saleMinimumPurchaseamount_float;
	private Float saleMaximumPurchaseamount_float;
	private float saleQuantity_float;
	private String saleQescription;
	private String saleItemId;
	private String saleRangeRewardType;
	private String saleRangeMode;
	private String minimumPurchaseQuantity;
	private String minimumPurchaseamount;
	private String maximumPurchaseAmount;
	private String dealQuantity;
	private String saleMinimumPurchaseQuantity;
	private String saleMinimumPurchaseamount;
	private String saleMaximumPurchaseAmount;
	private String saleQuantity;
	private String pluCode;
	

	public String getPluCode() {
		return pluCode;
	}



	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}



	public float getSaleMinimumPurchaseQuantity_float() {
		return saleMinimumPurchaseQuantity_float;
	}



	public void setSaleMinimumPurchaseQuantity_float(float saleMinimumPurchaseQuantity_float) {
		this.saleMinimumPurchaseQuantity_float = saleMinimumPurchaseQuantity_float;
	}



	public float getSaleMinimumPurchaseamount_float() {
		return saleMinimumPurchaseamount_float;
	}



	public void setSaleMinimumPurchaseamount_float(float saleMinimumPurchaseamount_float) {
		this.saleMinimumPurchaseamount_float = saleMinimumPurchaseamount_float;
	}



	public Float getSaleMaximumPurchaseamount_float() {
		return saleMaximumPurchaseamount_float;
	}



	public void setSaleMaximumPurchaseamount_float(Float saleMaximumPurchaseamount_float) {
		this.saleMaximumPurchaseamount_float = saleMaximumPurchaseamount_float;
	}



	public float getSaleQuantity_float() {
		return saleQuantity_float;
	}



	public void setSaleQuantity_float(float saleQuantity_float) {
		this.saleQuantity_float = saleQuantity_float;
	}



	public String getSaleQescription() {
		return saleQescription;
	}



	public void setSaleQescription(String saleQescription) {
		this.saleQescription = saleQescription;
	}



	public String getSaleItemId() {
		return saleItemId;
	}



	public void setSaleItemId(String saleItemId) {
		this.saleItemId = saleItemId;
	}



	public String getSaleRangeRewardType() {
		return saleRangeRewardType;
	}



	public void setSaleRangeRewardType(String saleRangeRewardType) {
		this.saleRangeRewardType = saleRangeRewardType;
	}



	public String getSaleRangeMode() {
		return saleRangeMode;
	}



	public void setSaleRangeMode(String saleRangeMode) {
		this.saleRangeMode = saleRangeMode;
	}



	public String getSaleMinimumPurchaseQuantity() {
		return saleMinimumPurchaseQuantity;
	}



	public void setSaleMinimumPurchaseQuantity(String saleMinimumPurchaseQuantity) {
		this.saleMinimumPurchaseQuantity = saleMinimumPurchaseQuantity;
	}



	public String getSaleMinimumPurchaseamount() {
		return saleMinimumPurchaseamount;
	}



	public void setSaleMinimumPurchaseamount(String saleMinimumPurchaseamount) {
		this.saleMinimumPurchaseamount = saleMinimumPurchaseamount;
	}



	public String getSaleMaximumPurchaseAmount() {
		return saleMaximumPurchaseAmount;
	}



	public void setSaleMaximumPurchaseAmount(String saleMaximumPurchaseAmount) {
		this.saleMaximumPurchaseAmount = saleMaximumPurchaseAmount;
	}



	public String getSaleQuantity() {
		return saleQuantity;
	}



	public void setSaleQuantity(String saleQuantity) {
		this.saleQuantity = saleQuantity;
	}



	public String getRangeMode() {
		return rangeMode;
	}

	

	public Float getMaximumPurchaseamount_float() {
		return maximumPurchaseamount_float;
	}



	public void setMaximumPurchaseamount_float(Float maximumPurchaseamount_float) {
		this.maximumPurchaseamount_float = maximumPurchaseamount_float;
	}



	public String getMaximumPurchaseAmount() {
		return maximumPurchaseAmount;
	}

	public void setMaximumPurchaseAmount(String maximumPurchaseAmount) {
		this.maximumPurchaseAmount = maximumPurchaseAmount;
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

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getDealId() {
		return dealId;
	}

	public void setDealId(String dealId) {
		this.dealId = dealId;
	}

	public String getRange() {
		return range;
	}

	public void setRange(String range) {
		this.range = range;
	}

	public float getMinimumPurchaseQuantity_float() {
		return minimumPurchaseQuantity_float;
	}

	public void setMinimumPurchaseQuantity_float(float minimumPurchaseQuantity_float) {
		this.minimumPurchaseQuantity_float = minimumPurchaseQuantity_float;
	}

	public float getMinimumPurchaseamount_float() {
		return minimumPurchaseamount_float;
	}

	public void setMinimumPurchaseamount_float(float minimumPurchaseamount_float) {
		this.minimumPurchaseamount_float = minimumPurchaseamount_float;
	}

	public float getDealQuantity_float() {
		return dealQuantity_float;
	}

	public void setDealQuantity_float(float dealQuantity_float) {
		this.dealQuantity_float = dealQuantity_float;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMinimumPurchaseQuantity() {
		return minimumPurchaseQuantity;
	}

	public void setMinimumPurchaseQuantity(String minimumPurchaseQuantity) {
		this.minimumPurchaseQuantity = minimumPurchaseQuantity;
	}

	public String getMinimumPurchaseamount() {
		return minimumPurchaseamount;
	}

	public void setMinimumPurchaseamount(String minimumPurchaseamount) {
		this.minimumPurchaseamount = minimumPurchaseamount;
	}

	public String getDealQuantity() {
		return dealQuantity;
	}

	public void setDealQuantity(String dealQuantity) {
		this.dealQuantity = dealQuantity;
	}

	public String getSaleGroupId() {
		return saleGroupId;
	}

	public void setSaleGroupId(String saleGroupId) {
		this.saleGroupId = saleGroupId;
	}
}
