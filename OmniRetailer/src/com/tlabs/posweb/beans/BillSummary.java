package com.tlabs.posweb.beans;

import java.util.List;

public class BillSummary {
	private float amount;
	private String billId;
	private List<Transactions> transactions;
	private String serialNum;
	private Double returnedAmt;
	private Double exchangedAmt;
	private String serialBillId;
	private String cashierId;
	
	
	

	public String getSerialBillId() {
		return serialBillId;
	}
	public void setSerialBillId(String serialBillId) {
		this.serialBillId = serialBillId;
	}
	public String getCashierId() {
		return cashierId;
	}
	public void setCashierId(String cashierId) {
		this.cashierId = cashierId;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public List<Transactions> getTransactions() {
		return transactions;
	}
	public void setTransactions(List<Transactions> transactions) {
		this.transactions = transactions;
	}
	public String getBillId() {
		return billId;
	}
	public void setBillId(String billId) {
		this.billId = billId;
	}
	public String getSerialNum() {
		return serialNum;
	}
	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}
	public Double getReturnedAmt() {
		return returnedAmt;
	}
	public void setReturnedAmt(Double returnedAmt) {
		this.returnedAmt = returnedAmt;
	}
	public Double getExchangedAmt() {
		return exchangedAmt;
	}
	public void setExchangedAmt(Double exchangedAmt) {
		this.exchangedAmt = exchangedAmt;
	}
	
}
