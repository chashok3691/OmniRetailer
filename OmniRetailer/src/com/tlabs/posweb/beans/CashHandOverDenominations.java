
package com.tlabs.posweb.beans;

public class CashHandOverDenominations {

	private int sno;
	private String reportId;
	private String reportDate;
	private int cashDenomination;
	private int denominationCount;
	private float paidAmount;
	private String reportDateStr;
	
	

	public String getReportDateStr() {
		return reportDateStr;
	}

	public void setReportDateStr(String reportDateStr) {
		this.reportDateStr = reportDateStr;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public int getCashDenomination() {
		return cashDenomination;
	}

	public void setCashDenomination(int cashDenomination) {
		this.cashDenomination = cashDenomination;
	}

	public int getDenominationCount() {
		return denominationCount;
	}

	public void setDenominationCount(int denominationCount) {
		this.denominationCount = denominationCount;
	}

	public float getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(float paidAmount) {
		this.paidAmount = paidAmount;
	}



}
