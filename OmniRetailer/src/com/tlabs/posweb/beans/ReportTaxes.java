package com.tlabs.posweb.beans;

public class ReportTaxes {

	private String taxCode;
	private Float percentage;
	private Float amount;
	
	public boolean equals(ReportTaxes taxInfo){
		boolean flag = false;
		if(taxInfo.getTaxCode() != null)
		if(taxInfo.getTaxCode().equalsIgnoreCase(taxCode)){
			flag = true;
			}
		return flag;
	}
	
	
	public String getTaxCode() {
		return taxCode;
	}


	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}


	public Float getPercentage() {
		return percentage;
	}
	public void setPercentage(Float percentage) {
		this.percentage = percentage;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	
	
	
}
