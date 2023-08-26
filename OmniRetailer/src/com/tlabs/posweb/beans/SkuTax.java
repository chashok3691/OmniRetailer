package com.tlabs.posweb.beans;

import java.util.List;

public class SkuTax {

	private String taxCategory;
	private String taxType;
	private Float taxRate;
	private List<StoreTaxation> saleRangesList;
	private String taxCode;
	
	
	
	
	

	public String getTaxCode() {
		return taxCode;
	}
	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}
	public List<StoreTaxation> getSaleRangesList() {
		return saleRangesList;
	}
	public void setSaleRangesList(List<StoreTaxation> saleRangesList) {
		this.saleRangesList = saleRangesList;
	}
	public String getTaxCategory() {
		return taxCategory;
	}
	public void setTaxCategory(String taxCategory) {
		this.taxCategory = taxCategory;
	}
	public String getTaxType() {
		return taxType;
	}
	public void setTaxType(String taxType) {
		this.taxType = taxType;
	}
	public Float getTaxRate() {
		return taxRate;
	}
	public void setTaxRate(Float taxRate) {
		this.taxRate = taxRate;
	}
	
	
}
