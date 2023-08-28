package com.tlabs.posweb.beans;

import java.util.List;

//import java.util.Date;
//import java.util.List;

public class GiftCoupons {
	private String couponCode;
	private String couponProgramCode;
	
	private GiftCoupons  coupon;
	
	private String customerMobile;
	
	public String getCustomerMobile() {
		return customerMobile;
	}
	public void setCustomerMobile(String customerMobile) {
		this.customerMobile = customerMobile;
	}
	private String totolGiftCoupons;
	
	private String claimStatus;
	
	
	private String couponState;
	
	
	
	
	
	public String getCouponState() {
		return couponState;
	}
	public void setCouponState(String couponState) {
		this.couponState = couponState;
	}
	private String filePath;
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getTotolGiftCoupons() {
		return totolGiftCoupons;
	}
	public void setTotolGiftCoupons(String totolGiftCoupons) {
		this.totolGiftCoupons = totolGiftCoupons;
	}
	public GiftCoupons getCoupon() {
		return coupon;
	}
	public void setCoupon(GiftCoupons coupon) {
		this.coupon = coupon;
	}
	private boolean assignedStatus;
	private boolean couponStatus;
	
	private int totalRecords;
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public boolean isAssignedStatus() {
		return assignedStatus;
	}
	public void setAssignedStatus(boolean assignedStatus) {
		this.assignedStatus = assignedStatus;
	}
	public boolean isCouponStatus() {
		return couponStatus;
	}
	public void setCouponStatus(boolean couponStatus) {
		this.couponStatus = couponStatus;
	}
	private String couponId;
	private int noOfCliams;
	private int noOfClaims;
	
	private String startDateStr;
	private String endDateStr;
	
	
	
	public int getNoOfClaims() {
		return noOfClaims;
	}
	public void setNoOfClaims(int noOfClaims) {
		this.noOfClaims = noOfClaims;
	}
	public String getStartDateStr() {
		return startDateStr;
	}
	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}
	public String getEndDateStr() {
		return endDateStr;
	}
	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}
	public int getNoOfCliams() {
		return noOfCliams;
	}
	public void setNoOfCliams(int noOfCliams) {
		this.noOfCliams = noOfCliams;
	}
	private String startDate;
	private List<String> zoneLocations;

	private String endDate;
	public String getCouponId() {
		return couponId;
	}
	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}
	public String getCouponCode() {
		return couponCode;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	public String getCouponProgramCode() {
		return couponProgramCode;
	}
	public void setCouponProgramCode(String couponProgramCode) {
		this.couponProgramCode = couponProgramCode;
	}
	public List<String> getZoneLocations() {
		return zoneLocations;
	}
	public void setZoneLocations(List<String> zoneLocations) {
		this.zoneLocations = zoneLocations;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getClaimStatus() {
		return claimStatus;
	}
	public void setClaimStatus(String claimStatus) {
		this.claimStatus = claimStatus;
	}
	
	private List<GiftCoupons> giftCoupons;
	private Integer quantity;
	private String noOfCoupons;
	private List<String> couponids;

	
	
	public List<String> getCouponids() {
		return couponids;
	}

	public void setCouponids(List<String> couponids) {
		this.couponids = couponids;
	}

	public String getNoOfCoupons() {
		return noOfCoupons;
	}

	public void setNoOfCoupons(String noOfCoupons) {
		this.noOfCoupons = noOfCoupons;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public List<GiftCoupons> getGiftCoupons() {
		return giftCoupons;
	}

	public void setGiftCoupons(List<GiftCoupons> giftCoupons) {
		this.giftCoupons = giftCoupons;
	}

	
	
	
}
