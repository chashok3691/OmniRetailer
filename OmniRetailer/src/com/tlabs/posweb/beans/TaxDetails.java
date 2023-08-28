package com.tlabs.posweb.beans;

public class TaxDetails {

	private String taxNo;
	private String location;
	private String taxType;
	private String taxName;
	private String taxRate;
	private String remarks;
	private float taxPercentage;
	private int taxId;
	
	public String getTaxNo() {
		return taxNo;
	}
	public void setTaxNo(String taxNo) {
		this.taxNo = taxNo;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTaxType() {
		return taxType;
	}
	public void setTaxType(String taxType) {
		this.taxType = taxType;
	}
	public String getTaxName() {
		return taxName;
	}
	public void setTaxName(String taxName) {
		this.taxName = taxName;
	}
	public String getTaxRate() {
		return taxRate;
	}
	public void setTaxRate(String taxRate) {
		this.taxRate = taxRate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public float getTaxPercentage() {
		return taxPercentage;
	}
	public void setTaxPercentage(float taxPercentage) {
		this.taxPercentage = taxPercentage;
	}
	public int getTaxId() {
		return taxId;
	}
	public void setTaxId(int taxId) {
		this.taxId = taxId;
	}
	
	
}
