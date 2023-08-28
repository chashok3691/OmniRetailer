package com.tlabs.posweb.beans;

import java.math.BigDecimal;

public class TrialBalanceBean {

	private String accountId;
	
	private String accountName;
	
	private String accountType;
	
	private BigDecimal totalCreditAmount;
	
	private BigDecimal totalDebitAmount;

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public BigDecimal getTotalCreditAmount() {
		return totalCreditAmount;
	}

	public void setTotalCreditAmount(BigDecimal totalCreditAmount) {
		this.totalCreditAmount = totalCreditAmount;
	}

	public BigDecimal getTotalDebitAmount() {
		return totalDebitAmount;
	}

	public void setTotalDebitAmount(BigDecimal totalDebitAmount) {
		this.totalDebitAmount = totalDebitAmount;
	}
	
	
}
