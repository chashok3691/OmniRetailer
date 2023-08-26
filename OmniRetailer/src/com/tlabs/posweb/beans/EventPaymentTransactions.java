package com.tlabs.posweb.beans;


import java.util.Date;


public class EventPaymentTransactions {
	
	private String eventTransactionId;
	
	private String eventReference;
	
	private String modeOfPayment;
	
	private String cardType;
	
	private String paymentRefNumber;
	
	private Double paidAmount=0.0;
	
	private Double receivedAmount=0.0;
	
	private Double changeReturn=0.0;
	
	private Date transactionDate= new Date();
	
	private String tenderMode="";
	
	private Integer tenderKey=0;
	
	private Date updatedDate  = new Date();
	
	private String bankName;
	private String bankReference;
	
	
	
	
	

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankReference() {
		return bankReference;
	}

	public void setBankReference(String bankReference) {
		this.bankReference = bankReference;
	}

	public String getEventTransactionId() {
		return eventTransactionId;
	}

	public void setEventTransactionId(String eventTransactionId) {
		this.eventTransactionId = eventTransactionId;
	}

	public String getEventReference() {
		return eventReference;
	}

	public void setEventReference(String eventReference) {
		this.eventReference = eventReference;
	}

	public String getModeOfPayment() {
		return modeOfPayment;
	}

	public void setModeOfPayment(String modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getPaymentRefNumber() {
		return paymentRefNumber;
	}

	public void setPaymentRefNumber(String paymentRefNumber) {
		this.paymentRefNumber = paymentRefNumber;
	}

	public Double getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(Double paidAmount) {
		this.paidAmount = paidAmount;
	}

	public Double getReceivedAmount() {
		return receivedAmount;
	}

	public void setReceivedAmount(Double receivedAmount) {
		this.receivedAmount = receivedAmount;
	}

	public Double getChangeReturn() {
		return changeReturn;
	}

	public void setChangeReturn(Double changeReturn) {
		this.changeReturn = changeReturn;
	}

	public Date getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}

	public String getTenderMode() {
		return tenderMode;
	}

	public void setTenderMode(String tenderMode) {
		this.tenderMode = tenderMode;
	}

	public Integer getTenderKey() {
		return tenderKey;
	}

	public void setTenderKey(Integer tenderKey) {
		this.tenderKey = tenderKey;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	
	
}

	