package com.tlabs.posweb.beans;

import java.math.BigDecimal;


public class CreditNoteItems {
	
	private int autoNum;
	
	private int sno;
	
	private String creditNoteRef;
	
	private String skuId;
	
	private String description;
	
	private BigDecimal quantity;
	
	private BigDecimal salePrice;
	
	private BigDecimal cost;
	
	private BigDecimal taxRate;
	
	private String reasonForReturn;

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
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

	public String getCreditNoteRef() {
		return creditNoteRef;
	}

	public void setCreditNoteRef(String creditNoteRef) {
		this.creditNoteRef = creditNoteRef;
	}

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	public BigDecimal getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(BigDecimal taxRate) {
		this.taxRate = taxRate;
	}
	
	
	
	
}