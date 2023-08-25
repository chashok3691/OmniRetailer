package com.tlabs.posweb.beans;

public class Transactions {
	private float amount;
	private String paymentMode;
	private float returnAmount;
	private String bankName;
	private String type;
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public float getReturnAmount() {
		return returnAmount;
	}
	public void setReturnAmount(float returnAmount) {
		this.returnAmount = returnAmount;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
