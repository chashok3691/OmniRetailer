package com.tlabs.posweb.beans;

import java.util.ArrayList;
import java.util.List;

//import javax.persistence.Transient;

//import com.tlabs.omniretailerservices.models.Offer;

public class ApplyCampaignsRequest {

	private List<String> skuIdArrList;
	private List<String> pluCodeArrList;
	private List<Float> unitPriceArrList;
	private List<Float> qtyArrList;
	private List<Float> totalPriceArrList;
	private List<String> itemStatusArrList;
	private List<Float> mFreeQtyArrayList;
	private List<String> mProductDealQty;
	private List<ArrayList<String>> freeItemLists;
	private List<ArrayList<Float>> freeItemQtyLists;
	private List<Float> dealDiscount;
	private List<String> mProductDealDescription;
	private List<Boolean> mAllowMultipleDiscounts;
	private List<Boolean> repeatArrayList;
	private List<String> appliedDealIdList;
	private List<Boolean> isDealApplied;
	private List<String> discountPriceStrArrayList;
	private List<String> discountTypeArrayList;
	private List<Float> productOptionalDiscountArr;
	private List<String> discountIdArrayList;
	private List<Integer> mProductOptionalDiscount;
	private List<List<ApplyOffer>> mItemOffersList;
	private List<Float> mProductOfferPrice;
	private List<ApplyOffer> comboList;
	private List<ApplyOffer> appliedOffers;
	private ArrayList<String> dealSkuListAll;
	private List<String> mProductOfferDescription;
	private List<String> mProductOfferType;
	private List<List<Offer>> availableOffers;
	private List<Boolean> isComboApplied;
	private List<Float> comboDiscount;
	private String item_total_price;
	private String quantity;
	private String totalBillAmount;
	private String storeLocation;
	private String sku_id;
	private RequestHeader requestHeader;
	private String productID;
	private String phonenumber;
	private String purchaseChannel;
	private ArrayList<Sku> skuList;
	private String employeeCode;
	private String department;
	private String subDepartment;
	private boolean latestCampaigns;
private float turnOverOfferDsiscount;
	
	public float getTurnOverOfferDsiscount() {
	return turnOverOfferDsiscount;
}

public void setTurnOverOfferDsiscount(float turnOverOfferDsiscount) {
	this.turnOverOfferDsiscount = turnOverOfferDsiscount;
}

	public String getItem_total_price() {
		return item_total_price;
	}

	public void setItem_total_price(String item_total_price) {
		this.item_total_price = item_total_price;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getTotalBillAmount() {
		return totalBillAmount;
	}

	public void setTotalBillAmount(String totalBillAmount) {
		this.totalBillAmount = totalBillAmount;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public String getSku_id() {
		return sku_id;
	}

	public void setSku_id(String sku_id) {
		this.sku_id = sku_id;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getPurchaseChannel() {
		return purchaseChannel;
	}

	public void setPurchaseChannel(String purchaseChannel) {
		this.purchaseChannel = purchaseChannel;
	}

	public ArrayList<Sku> getSkuList() {
		return skuList;
	}

	public void setSkuList(ArrayList<Sku> skuList) {
		this.skuList = skuList;
	}

	public List<Float> getProductOptionalDiscountArr() {
		return productOptionalDiscountArr;
	}

	public void setProductOptionalDiscountArr(List<Float> productOptionalDiscountArr) {
		this.productOptionalDiscountArr = productOptionalDiscountArr;
	}

	public List<String> getSkuIdArrList() {
		return skuIdArrList;
	}

	public void setSkuIdArrList(List<String> skuIdArrList) {
		this.skuIdArrList = skuIdArrList;
	}

	public List<String> getPluCodeArrList() {
		return pluCodeArrList;
	}

	public void setPluCodeArrList(List<String> pluCodeArrList) {
		this.pluCodeArrList = pluCodeArrList;
	}

	public boolean isLatestCampaigns() {
		return latestCampaigns;
	}

	public void setLatestCampaigns(boolean latestCampaigns) {
		this.latestCampaigns = latestCampaigns;
	}

	public List<Float> getUnitPriceArrList() {
		return unitPriceArrList;
	}

	public void setUnitPriceArrList(List<Float> unitPriceArrList) {
		this.unitPriceArrList = unitPriceArrList;
	}

	public List<Float> getQtyArrList() {
		return qtyArrList;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getSubDepartment() {
		return subDepartment;
	}

	public void setSubDepartment(String subDepartment) {
		this.subDepartment = subDepartment;
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}

	public void setQtyArrList(List<Float> qtyArrList) {
		this.qtyArrList = qtyArrList;
	}

	public List<Float> getTotalPriceArrList() {
		return totalPriceArrList;
	}

	public void setTotalPriceArrList(List<Float> totalPriceArrList) {
		this.totalPriceArrList = totalPriceArrList;
	}

	public List<String> getItemStatusArrList() {
		return itemStatusArrList;
	}

	public void setItemStatusArrList(List<String> itemStatusArrList) {
		this.itemStatusArrList = itemStatusArrList;
	}

	public List<Float> getmFreeQtyArrayList() {
		return mFreeQtyArrayList;
	}

	public void setmFreeQtyArrayList(List<Float> mFreeQtyArrayList) {
		this.mFreeQtyArrayList = mFreeQtyArrayList;
	}

	public List<String> getmProductDealQty() {
		return mProductDealQty;
	}

	public void setmProductDealQty(List<String> mProductDealQty) {
		this.mProductDealQty = mProductDealQty;
	}

	public List<ArrayList<String>> getFreeItemLists() {
		return freeItemLists;
	}

	public void setFreeItemLists(List<ArrayList<String>> freeItemLists) {
		this.freeItemLists = freeItemLists;
	}

	public List<ArrayList<Float>> getFreeItemQtyLists() {
		return freeItemQtyLists;
	}

	public void setFreeItemQtyLists(List<ArrayList<Float>> freeItemQtyLists) {
		this.freeItemQtyLists = freeItemQtyLists;
	}

	public List<Float> getDealDiscount() {
		return dealDiscount;
	}

	public void setDealDiscount(List<Float> dealDiscount) {
		this.dealDiscount = dealDiscount;
	}

	public List<String> getmProductDealDescription() {
		return mProductDealDescription;
	}

	public void setmProductDealDescription(List<String> mProductDealDescription) {
		this.mProductDealDescription = mProductDealDescription;
	}

	public List<Boolean> getmAllowMultipleDiscounts() {
		return mAllowMultipleDiscounts;
	}

	public void setmAllowMultipleDiscounts(List<Boolean> mAllowMultipleDiscounts) {
		this.mAllowMultipleDiscounts = mAllowMultipleDiscounts;
	}

	public List<Boolean> getRepeatArrayList() {
		return repeatArrayList;
	}

	public void setRepeatArrayList(List<Boolean> repeatArrayList) {
		this.repeatArrayList = repeatArrayList;
	}

	public List<String> getAppliedDealIdList() {
		return appliedDealIdList;
	}

	public void setAppliedDealIdList(List<String> appliedDealIdList) {
		this.appliedDealIdList = appliedDealIdList;
	}

	public List<Boolean> getIsDealApplied() {
		return isDealApplied;
	}

	public void setIsDealApplied(List<Boolean> isDealApplied) {
		this.isDealApplied = isDealApplied;
	}

	public List<String> getDiscountPriceStrArrayList() {
		return discountPriceStrArrayList;
	}

	public void setDiscountPriceStrArrayList(List<String> discountPriceStrArrayList) {
		this.discountPriceStrArrayList = discountPriceStrArrayList;
	}

	public List<String> getDiscountTypeArrayList() {
		return discountTypeArrayList;
	}

	public void setDiscountTypeArrayList(List<String> discountTypeArrayList) {
		this.discountTypeArrayList = discountTypeArrayList;
	}

	public List<String> getDiscountIdArrayList() {
		return discountIdArrayList;
	}

	public void setDiscountIdArrayList(List<String> discountIdArrayList) {
		this.discountIdArrayList = discountIdArrayList;
	}

	public List<Integer> getmProductOptionalDiscount() {
		return mProductOptionalDiscount;
	}

	public void setmProductOptionalDiscount(List<Integer> mProductOptionalDiscount) {
		this.mProductOptionalDiscount = mProductOptionalDiscount;
	}

	public List<List<ApplyOffer>> getmItemOffersList() {
		return mItemOffersList;
	}

	public void setmItemOffersList(List<List<ApplyOffer>> mItemOffersList) {
		this.mItemOffersList = mItemOffersList;
	}

	public List<Float> getmProductOfferPrice() {
		return mProductOfferPrice;
	}

	public void setmProductOfferPrice(List<Float> mProductOfferPrice) {
		this.mProductOfferPrice = mProductOfferPrice;
	}

	public List<ApplyOffer> getComboList() {
		return comboList;
	}

	public void setComboList(List<ApplyOffer> comboList) {
		this.comboList = comboList;
	}

	public List<ApplyOffer> getAppliedOffers() {
		return appliedOffers;
	}

	public void setAppliedOffers(List<ApplyOffer> appliedOffers) {
		this.appliedOffers = appliedOffers;
	}

	public ArrayList<String> getDealSkuListAll() {
		return dealSkuListAll;
	}

	public void setDealSkuListAll(ArrayList<String> dealSkuListAll) {
		this.dealSkuListAll = dealSkuListAll;
	}

	public List<String> getmProductOfferDescription() {
		return mProductOfferDescription;
	}

	public void setmProductOfferDescription(List<String> mProductOfferDescription) {
		this.mProductOfferDescription = mProductOfferDescription;
	}

	public List<String> getmProductOfferType() {
		return mProductOfferType;
	}

	public void setmProductOfferType(List<String> mProductOfferType) {
		this.mProductOfferType = mProductOfferType;
	}

	public List<List<Offer>> getAvailableOffers() {
		return availableOffers;
	}

	public void setAvailableOffers(List<List<Offer>> availableOffers) {
		this.availableOffers = availableOffers;
	}

	public List<Boolean> getIsComboApplied() {
		return isComboApplied;
	}

	public void setIsComboApplied(List<Boolean> isComboApplied) {
		this.isComboApplied = isComboApplied;
	}

	public List<Float> getComboDiscount() {
		return comboDiscount;
	}

	public void setComboDiscount(List<Float> comboDiscount) {
		this.comboDiscount = comboDiscount;
	}

}
