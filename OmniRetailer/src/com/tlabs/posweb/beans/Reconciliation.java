package com.tlabs.posweb.beans;

import java.util.Date;


public class Reconciliation {
	
	private int sNo; 
	
	private String reconciliationId;
	
	private Date transactionDate;
	
	private String transactionDescription;
		
	private float creditAmount;
	
	private float debitAmount;
	
	private boolean isBankTransaction;
	
	private String transactionDateStr;
	private String bankTransactionStr;
	
	private float transactionCreditAmount;
	
	private float transactionDebitAmount;
	
	private float bankStatementCreditAmount;
	
	private float bankStatementDebitAmount;
	
	
	private String  assetTransactionDescription;
	private String assetTransactionDateStr;
	private String bankTransactionDateStr;
	private String bankTransactionDescription;
		
	
	public String getBankTransactionStr() {
		return bankTransactionStr;
	}

	public void setBankTransactionStr(String bankTransactionStr) {
		this.bankTransactionStr = bankTransactionStr;
	}

	public String getAssetTransactionDescription() {
		return assetTransactionDescription;
	}

	public void setAssetTransactionDescription(String assetTransactionDescription) {
		this.assetTransactionDescription = assetTransactionDescription;
	}

	public String getAssetTransactionDateStr() {
		return assetTransactionDateStr;
	}

	public void setAssetTransactionDateStr(String assetTransactionDateStr) {
		this.assetTransactionDateStr = assetTransactionDateStr;
	}

	public String getBankTransactionDateStr() {
		return bankTransactionDateStr;
	}

	public void setBankTransactionDateStr(String bankTransactionDateStr) {
		this.bankTransactionDateStr = bankTransactionDateStr;
	}

	public String getBankTransactionDescription() {
		return bankTransactionDescription;
	}

	public void setBankTransactionDescription(String bankTransactionDescription) {
		this.bankTransactionDescription = bankTransactionDescription;
	}

	public float getTransactionCreditAmount() {
		return transactionCreditAmount;
	}

	public void setTransactionCreditAmount(float transactionCreditAmount) {
		this.transactionCreditAmount = transactionCreditAmount;
	}

	public float getTransactionDebitAmount() {
		return transactionDebitAmount;
	}

	public void setTransactionDebitAmount(float transactionDebitAmount) {
		this.transactionDebitAmount = transactionDebitAmount;
	}

	public float getBankStatementCreditAmount() {
		return bankStatementCreditAmount;
	}

	public void setBankStatementCreditAmount(float bankStatementCreditAmount) {
		this.bankStatementCreditAmount = bankStatementCreditAmount;
	}

	public float getBankStatementDebitAmount() {
		return bankStatementDebitAmount;
	}

	public void setBankStatementDebitAmount(float bankStatementDebitAmount) {
		this.bankStatementDebitAmount = bankStatementDebitAmount;
	}
	
	
	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	
	public String getReconciliationId() {
		return reconciliationId;
	}

	public void setReconciliationId(String reconciliationId) {
		this.reconciliationId = reconciliationId;
	}

	public Date getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}

	public String getTransactionDescription() {
		return transactionDescription;
	}

	public void setTransactionDescription(String transactionDescription) {
		this.transactionDescription = transactionDescription;
	}

	public float getCreditAmount() {
		return creditAmount;
	}

	public void setCreditAmount(float creditAmount) {
		this.creditAmount = creditAmount;
	}

	public float getDebitAmount() {
		return debitAmount;
	}

	public void setDebitAmount(float debitAmount) {
		this.debitAmount = debitAmount;
	}

	public boolean isBankTransaction() {
		return isBankTransaction;
	}

	public void setBankTransaction(boolean isBankTransaction) {
		this.isBankTransaction = isBankTransaction;
	}

	public String getTransactionDateStr() {
		return transactionDateStr;
	}

	public void setTransactionDateStr(String transactionDateStr) {
		this.transactionDateStr = transactionDateStr;
	}
	
	

	
	
	
	
	
	

}
