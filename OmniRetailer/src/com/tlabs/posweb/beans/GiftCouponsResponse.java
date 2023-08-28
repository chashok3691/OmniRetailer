package com.tlabs.posweb.beans;

import java.util.List;
/*
import com.tlabs.omniretailerservices.models.CouponsMaster;
import com.tlabs.omniretailerservices.models.CustomerGiftCoupons;
import com.tlabs.omniretailerservices.models.GiftCoupons;
import com.tlabs.omniretailerservices.models.GiftCouponsMaster;*/

public class GiftCouponsResponse implements Cloneable{
	public GiftCouponsResponse clone(){
		GiftCouponsResponse giftCouponsInfo=null;
		try {
			giftCouponsInfo=(GiftCouponsResponse)super.clone();
		}
		catch(Exception e)
		{e.printStackTrace(); }
		return giftCouponsInfo;
	}
	private String filePath;
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	private ResponseHeader responseHeader;
	private List<GiftCouponsMaster> giftCouponsList;
	private boolean claimStatus;
	private GiftCoupons coupon;
//	private CouponsMaster couponDetails;
	private int totalRecords;
	private List<CustomerGiftCoupons> customerGiftCouponsList;
	private List<GiftCoupons> giftCoupons;

	
	public int getTotalRecords() {
		return totalRecords;
	}
	public List<GiftCoupons> getGiftCoupons() {
		return giftCoupons;
	}
	public void setGiftCoupons(List<GiftCoupons> giftCoupons) {
		this.giftCoupons = giftCoupons;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public List<GiftCouponsMaster> getGiftCouponsList() {
		return giftCouponsList;
	}
	public void setGiftCouponsList(List<GiftCouponsMaster> giftCouponsList) {
		this.giftCouponsList = giftCouponsList;
	}
	public boolean isClaimStatus() {
		return claimStatus;
	}
	public void setClaimStatus(boolean claimStatus) {
		this.claimStatus = claimStatus;
	}
	public GiftCoupons getCoupon() {
		return coupon;
	}
	public void setCoupon(GiftCoupons coupon) {
		this.coupon = coupon;
	}
	
	public List<CustomerGiftCoupons> getCustomerGiftCouponsList() {
		return customerGiftCouponsList;
	}
	public void setCustomerGiftCouponsList(List<CustomerGiftCoupons> customerGiftCouponsList) {
		this.customerGiftCouponsList = customerGiftCouponsList;
	}
	/*public CouponsMaster getCouponDetails() {
		return couponDetails;
	}
	public void setCouponDetails(CouponsMaster couponDetails) {
		this.couponDetails = couponDetails;
	}*/
	


}
