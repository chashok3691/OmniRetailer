package com.tlabs.posweb.beans;

import java.io.Serializable;

public class CashDenominations implements Serializable{

	private static final long serialVersionUID = -4325677579069535570L;

	private int sNo;
	private String date;
	private String transactionId;
	private Float denomination;
	private String remarks;
	private String billId;
	private int paidDenominationNo;
	private int returnDenominationNo;
	private Float paidAmount;
	private Float returnAmount;
	private String billDate;


	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}



	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	
	public Float getDenomination() {
		return denomination;
	}

	public void setDenomination(Float denomination) {
		this.denomination = denomination;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getBillId() {
		return billId;
	}

	public void setBillId(String billId) {
		this.billId = billId;
	}

	public int getPaidDenominationNo() {
		return paidDenominationNo;
	}

	public void setPaidDenominationNo(int paidDenominationNo) {
		this.paidDenominationNo = paidDenominationNo;
	}

	public int getReturnDenominationNo() {
		return returnDenominationNo;
	}

	public void setReturnDenominationNo(int returnDenominationNo) {
		this.returnDenominationNo = returnDenominationNo;
	}

	public Float getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(Float paidAmount) {
		this.paidAmount = paidAmount;
	}

	public Float getReturnAmount() {
		return returnAmount;
	}

	public void setReturnAmount(Float returnAmount) {
		this.returnAmount = returnAmount;
	}
	
	
}
