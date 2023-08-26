package com.tlabs.posweb.beans;

import java.util.Comparator;
import java.util.Date;
import java.util.List;

//import com.tlabs.omniretailerservices.models.OfferRanges;

public class ApplyOffer implements Cloneable {
	/*
	 * creational pattern prototype is used for this object should implement the
	 * clone method
	 */
	public ApplyOffer clone() {
		ApplyOffer applyOffer = null;
		try {
			applyOffer = (ApplyOffer) super.clone();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return applyOffer;
	}

	private String offerID;

	public String getOfferID() {
		return offerID;
	}

	public void setOfferID(String offerID) {
		this.offerID = offerID;
	}

	private String offerName;
	private String offerDescription;
	private String offerCategory;
	private int claimCoupons_int;
	private int claimLoyaltypoints_int;
	private int claimgiftvouchers_int;
	private String sellProducts;
	private String rewardType;
	private String sellSkuids;
	private List<OfferRanges> offerRangesList;
	private Boolean repeat;
	private String sellGroupID;
	private Boolean allowMultipleDiscounts;

	private boolean combo;
	private boolean lowestPriceItem;

	/* for sorting the offers based on the quantity and  */
	private Float minimumPurchaseQty;
	private Float minimumPurchaseAmt;
	private Float rewardValue;
	private List<String> rangesGroupIdsList;
	private boolean employeeSpecific;
	private boolean isPriorityOffer;
	private int accessSequenceNum;
	private Date createdDate;
	private Date updatedDate;
	private boolean priceBasedConfigurationFlag;
	private boolean applyForAllItems;

	public Float getMinimumPurchaseAmt() {
		return minimumPurchaseAmt;
	}

	public void setMinimumPurchaseAmt(Float minimumPurchaseAmt) {
		this.minimumPurchaseAmt = minimumPurchaseAmt;
	}

	public Float getRewardValue() {
		return rewardValue;
	}

	public void setRewardValue(Float rewardValue) {
		this.rewardValue = rewardValue;
	}

	public Float getMinimumPurchaseQty() {
		return minimumPurchaseQty;
	}

	public void setMinimumPurchaseQty(Float minimumPurchaseQty) {
		this.minimumPurchaseQty = minimumPurchaseQty;
	}

	public boolean isLowestPriceItem() {
		return lowestPriceItem;
	}

	public void setLowestPriceItem(boolean lowestPriceItem) {
		this.lowestPriceItem = lowestPriceItem;
	}

	public boolean isCombo() {
		return combo;
	}

	public void setCombo(boolean combo) {
		this.combo = combo;
	}

	public Boolean getRepeat() {
		return repeat;
	}

	public void setRepeat(Boolean repeat) {
		this.repeat = repeat;
	}

	public String getSellGroupID() {
		return sellGroupID;
	}

	public void setSellGroupID(String sellGroupID) {
		this.sellGroupID = sellGroupID;
	}

	public Boolean getAllowMultipleDiscounts() {
		return allowMultipleDiscounts;
	}

	public void setAllowMultipleDiscounts(Boolean allowMultipleDiscounts) {
		this.allowMultipleDiscounts = allowMultipleDiscounts;
	}

	public String getOfferName() {
		return offerName;
	}

	public void setOfferName(String offerName) {
		this.offerName = offerName;
	}

	public String getOfferDescription() {
		return offerDescription;
	}

	public void setOfferDescription(String offerDescription) {
		this.offerDescription = offerDescription;
	}

	public String getOfferCategory() {
		return offerCategory;
	}

	public void setOfferCategory(String offerCategory) {
		this.offerCategory = offerCategory;
	}

	public int getClaimCoupons_int() {
		return claimCoupons_int;
	}

	public void setClaimCoupons_int(int claimCoupons_int) {
		this.claimCoupons_int = claimCoupons_int;
	}

	public int getClaimLoyaltypoints_int() {
		return claimLoyaltypoints_int;
	}

	public void setClaimLoyaltypoints_int(int claimLoyaltypoints_int) {
		this.claimLoyaltypoints_int = claimLoyaltypoints_int;
	}

	public int getClaimgiftvouchers_int() {
		return claimgiftvouchers_int;
	}

	public void setClaimgiftvouchers_int(int claimgiftvouchers_int) {
		this.claimgiftvouchers_int = claimgiftvouchers_int;
	}

	public String getSellProducts() {
		return sellProducts;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public int getAccessSequenceNum() {
		return accessSequenceNum;
	}

	public void setAccessSequenceNum(int accessSequenceNum) {
		this.accessSequenceNum = accessSequenceNum;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public boolean isPriorityOffer() {
		return isPriorityOffer;
	}

	public void setPriorityOffer(boolean isPriorityOffer) {
		this.isPriorityOffer = isPriorityOffer;
	}

	public boolean isEmployeeSpecific() {
		return employeeSpecific;
	}

	public void setEmployeeSpecific(boolean employeeSpecific) {
		this.employeeSpecific = employeeSpecific;
	}

	public List<String> getRangesGroupIdsList() {
		return rangesGroupIdsList;
	}

	public void setRangesGroupIdsList(List<String> rangesGroupIdsList) {
		this.rangesGroupIdsList = rangesGroupIdsList;
	}

	public void setSellProducts(String sellProducts) {
		this.sellProducts = sellProducts;
	}

	public String getSellSkuids() {
		return sellSkuids;
	}

	public void setSellSkuids(String sellSkuids) {
		this.sellSkuids = sellSkuids;
	}

	public List<OfferRanges> getOfferRangesList() {
		return offerRangesList;
	}

	public void setOfferRangesList(List<OfferRanges> offerRangesList) {
		this.offerRangesList = offerRangesList;
	}

	public String getRewardType() {
		return rewardType;
	}

	public void setRewardType(String rewardType) {
		this.rewardType = rewardType;
	}

	public static Comparator<ApplyOffer> minimumPurchaseQuantity = new Comparator<ApplyOffer>() {
		public int compare(ApplyOffer reportsBean1, ApplyOffer reportsBean2) {

			float value1 = reportsBean1.getMinimumPurchaseQty();
			float value2 = reportsBean2.getMinimumPurchaseQty();
			return (int) (value2 - value1); //descending order

		}
	};
	public static Comparator<ApplyOffer> minimumPurchaseAmountt = new Comparator<ApplyOffer>() {
		public int compare(ApplyOffer reportsBean1, ApplyOffer reportsBean2) {
			float value1 = reportsBean1.getMinimumPurchaseAmt();
			float value2 = reportsBean2.getMinimumPurchaseAmt();
			return (int) (value2 - value1); //descending order
		}
	};

	public boolean equals(ApplyOffer offer) {
		boolean flag = false;
		try {
			if (offer.getMinimumPurchaseQty() == this.minimumPurchaseQty) {
				flag = true;
			}
		} catch (Exception exe) {
			exe.printStackTrace();
		}
		return flag;
	}

	public boolean isPriceBasedConfigurationFlag() {
		return priceBasedConfigurationFlag;
	}

	public void setPriceBasedConfigurationFlag(boolean priceBasedConfigurationFlag) {
		this.priceBasedConfigurationFlag = priceBasedConfigurationFlag;
	}

	public boolean isApplyForAllItems() {
		return applyForAllItems;
	}

	public void setApplyForAllItems(boolean applyForAllItems) {
		this.applyForAllItems = applyForAllItems;
	}

}
