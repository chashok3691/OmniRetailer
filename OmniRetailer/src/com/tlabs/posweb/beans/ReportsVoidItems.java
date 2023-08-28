package com.tlabs.posweb.beans;

public class ReportsVoidItems {

	private String billId;
	private String time;
	private Float refund;
	private Float voidAmount;
	private Float discount;
	
	
	public String getBillId() {
		return billId;
	}
	public void setBillId(String billId) {
		this.billId = billId;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Float getRefund() {
		return refund;
	}
	public void setRefund(Float refund) {
		this.refund = refund;
	}
	public Float getVoidAmount() {
		return voidAmount;
	}
	public void setVoidAmount(Float voidAmount) {
		this.voidAmount = voidAmount;
	}
	public Float getDiscount() {
		return discount;
	}
	public void setDiscount(Float discount) {
		this.discount = discount;
	}
	
	
}
