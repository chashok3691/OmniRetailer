package com.tlabs.posweb.beans;

import java.math.BigDecimal;


public class DebitNoteItems {
	
	private int autoNum;
	
	private int sno;
	
	private String debitNoteRef;
	
	private String skuId;
	private BigDecimal taxRate;
	private String description;
	private BigDecimal quantity;
	
	private BigDecimal costPrice;
	private BigDecimal cost;
	
	private String reasonForReturn;

	
	public BigDecimal getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(BigDecimal taxRate) {
		this.taxRate = taxRate;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getDebitNoteRef() {
		return debitNoteRef;
	}

	public void setDebitNoteRef(String debitNoteRef) {
		this.debitNoteRef = debitNoteRef;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(BigDecimal costPrice) {
		this.costPrice = costPrice;
	}

	public BigDecimal getCost() {
		return cost;
	}

	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}

	public String getReasonForReturn() {
		return reasonForReturn;
	}

	public void setReasonForReturn(String reasonForReturn) {
		this.reasonForReturn = reasonForReturn;
	}

	public int getAutoNum() {
		return autoNum;
	}

	public void setAutoNum(int autoNum) {
		this.autoNum = autoNum;
	}
	
	
	
	
}