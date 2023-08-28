package com.tlabs.posweb.beans;


public class BillingDiscounts {

	private int serialNum;
	private String billId;
	private String discountType;
	private String discountId;
	private String itemName;
	private String skuId;
	private Float discountPrice;
	private Float itemPrice;
	private String date;
	private String remarks;
	private String billDate = null;
	private String discountAmt = null;
	private String itemAmt = null;
	
	
	public String getDiscountAmt() {
		return discountAmt;
	}

	public void setDiscountAmt(String discountAmt) {
		this.discountAmt = discountAmt;
	}

	public String getItemAmt() {
		return itemAmt;
	}

	public void setItemAmt(String itemAmt) {
		this.itemAmt = itemAmt;
	}

	public int getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(int serialNum) {
		this.serialNum = serialNum;
	}

	public String getBillId() {
		return billId;
	}

	public void setBillId(String billId) {
		this.billId = billId;
	}

	public String getDiscountType() {
		return discountType;
	}

	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}

	public String getDiscountId() {
		return discountId;
	}

	public void setDiscountId(String discountId) {
		this.discountId = discountId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public Float getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(Float discountPrice) {
		this.discountPrice = discountPrice;
	}

	public Float getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(Float itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	
	
}
