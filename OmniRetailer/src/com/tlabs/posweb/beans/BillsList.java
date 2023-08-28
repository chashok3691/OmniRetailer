package com.tlabs.posweb.beans;

public class BillsList {
	private String billId;
	private String billDate;
	private float amount;
	private float cashAmount = 0.0f;
    private float cardAmount = 0.0f;
    private float sodexoAmount = 0.0f;
    private float returnAmount = 0.0f;
    private float ticketAmount = 0.0f;
    private float giftvouchers = 0.0f;
    private float creditNote = 0.0f;
    private float credits = 0.0f;
    private float exchangeAmount = 0.0f;
    private String salesReportFilePath;
    private String storeLocation;
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
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	public String getBillId() {
		return billId;
	}
	public void setBillId(String billId) {
		this.billId = billId;
	}
	public String getBillDate() {
		return billDate;
	}
	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	public float getCashAmount() {
		return cashAmount;
	}
	public void setCashAmount(float cashAmount) {
		this.cashAmount = cashAmount;
	}
	public float getCardAmount() {
		return cardAmount;
	}
	public void setCardAmount(float cardAmount) {
		this.cardAmount = cardAmount;
	}
	public float getSodexoAmount() {
		return sodexoAmount;
	}
	public void setSodexoAmount(float sodexoAmount) {
		this.sodexoAmount = sodexoAmount;
	}
	public float getReturnAmount() {
		return returnAmount;
	}
	public void setReturnAmount(float returnAmount) {
		this.returnAmount = returnAmount;
	}
	public float getTicketAmount() {
		return ticketAmount;
	}
	public void setTicketAmount(float ticketAmount) {
		this.ticketAmount = ticketAmount;
	}
	public float getGiftvouchers() {
		return giftvouchers;
	}
	public void setGiftvouchers(float giftvouchers) {
		this.giftvouchers = giftvouchers;
	}
	public float getCreditNote() {
		return creditNote;
	}
	public void setCreditNote(float creditNote) {
		this.creditNote = creditNote;
	}
	public float getCredits() {
		return credits;
	}
	public void setCredits(float credits) {
		this.credits = credits;
	}
	public float getExchangeAmount() {
		return exchangeAmount;
	}
	public void setExchangeAmount(float exchangeAmount) {
		this.exchangeAmount = exchangeAmount;
	}
	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}
	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}
    
}
