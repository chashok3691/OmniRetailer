package com.tlabs.posweb.beans;

public class ReportsDenomination {

	private int slNo;
	private String currCode;
	private String currencyName;
	private Float denomination;
	private int collection;
	
	private int paidCollection;
	private Float paidAmount;
	private int returnCollection;
	private Float returnAmount;
	private Float amount;
	//private int totalCollection;
//	private int remainingCollection;
	
	
	public Float getPaidAmount() {
		return paidAmount;
	}



	public Float getDenomination() {
		return denomination;
	}



	public void setDenomination(Float denomination) {
		this.denomination = denomination;
	}



	public int getPaidCollection() {
		return paidCollection;
	}



	public void setPaidCollection(int paidCollection) {
		this.paidCollection = paidCollection;
	}



	public void setPaidAmount(Float paidAmount) {
		this.paidAmount = paidAmount;
	}



	public int getReturnCollection() {
		return returnCollection;
	}



	public void setReturnCollection(int returnCollection) {
		this.returnCollection = returnCollection;
	}



	public Float getReturnAmount() {
		return returnAmount;
	}



	public void setReturnAmount(Float returnAmount) {
		this.returnAmount = returnAmount;
	}



	
	public boolean equals(ReportsDenomination denominations){
		boolean flag = false;
		if(denominations.getDenomination() == denomination){
			flag = true;
			}
		return flag;
	}
	
	
	
	public int getCollection() {
		return collection;
	}



	public void setCollection(int collection) {
		this.collection = collection;
	}



	public Float getAmount() {
		return amount;
	}



	public void setAmount(Float amount) {
		this.amount = amount;
	}



	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public String getCurrCode() {
		return currCode;
	}
	public void setCurrCode(String currCode) {
		this.currCode = currCode;
	}
	public String getCurrencyName() {
		return currencyName;
	}
	public void setCurrencyName(String currencyName) {
		this.currencyName = currencyName;
	}
}


/*package com.tlabs.omniretailerservices.beans;

public class ReportsDenomination {

	private int slNo;
	private String currCode;
	private String currencyName;
	private int denomination;
	private int collection;
	private Float amount;
	
	
	private Float paidAmount;
	private int returnCollection;
	private Float returnAmount;
	private Float amount;
	private int totalCollection;
	private int remainingCollection;
	
	
	public boolean equals(ReportsDenomination denominations){
		boolean flag = false;
		if(denominations.getDenomination() == denomination){
			flag = true;
			}
		return flag;
	}
	
	
	
	public int getCollection() {
		return collection;
	}



	public void setCollection(int collection) {
		this.collection = collection;
	}



	public Float getAmount() {
		return amount;
	}



	public void setAmount(Float amount) {
		this.amount = amount;
	}



	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public String getCurrCode() {
		return currCode;
	}
	public void setCurrCode(String currCode) {
		this.currCode = currCode;
	}
	public String getCurrencyName() {
		return currencyName;
	}
	public void setCurrencyName(String currencyName) {
		this.currencyName = currencyName;
	}
	public int getDenomination() {
		return denomination;
	}
	public void setDenomination(int denomination) {
		this.denomination = denomination;
	}
	
}
*/