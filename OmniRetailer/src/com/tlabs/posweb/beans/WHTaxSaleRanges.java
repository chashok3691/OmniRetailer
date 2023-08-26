package com.tlabs.posweb.beans;

import java.math.BigDecimal;



public class WHTaxSaleRanges {

	
	private int autoNumber;
	
	private String taxCode;
	
	private BigDecimal saleValueFrom;
	
	private BigDecimal saleValueTo;
 
	private Float taxRate;
	
	public int getAutoNumber() {
		return autoNumber;
	}


	public void setAutoNumber(int autoNumber) {
		this.autoNumber = autoNumber;
	}


	public String getTaxCode() {
		return taxCode;
	}


	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}

 

	public Float getTaxRate() {
		return taxRate;
	}


	public void setTaxRate(Float taxRate) {
		this.taxRate = taxRate;
	}


	public BigDecimal getSaleValueFrom() {
		return saleValueFrom;
	}


	public void setSaleValueFrom(BigDecimal saleValueFrom) {
		this.saleValueFrom = saleValueFrom;
	}


	public BigDecimal getSaleValueTo() {
		return saleValueTo;
	}


	public void setSaleValueTo(BigDecimal saleValueTo) {
		this.saleValueTo = saleValueTo;
	}



	
	
}
