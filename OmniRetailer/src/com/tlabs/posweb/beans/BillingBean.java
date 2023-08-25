package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;

public class BillingBean {

	private ResponseHeader responseHeader;
	
	private List<Billing> billsList;
	
	private List<Billing> billing;
	
	private List<BillItems> billItems;
	
	private List<BillingTransactions> billTransactions;
	
	private List<BillItems> returnItems;
	private List<BillItems> exchangeItems;
	private String searchBillsFilePath;
	private String searchBillsReportResponse;
	private Double grandTotalValue;
	private BigDecimal grandTotalBillsValue;
	
	private String serailBillIdYearly;
	private String customerGstin;
	private boolean billSyncStatus=false;

	
	public String getCustomerGstin() {
		return customerGstin;
	}

	public void setCustomerGstin(String customerGstin) {
		this.customerGstin = customerGstin;
	}

	public boolean isBillSyncStatus() {
		return billSyncStatus;
	}

	public void setBillSyncStatus(boolean billSyncStatus) {
		this.billSyncStatus = billSyncStatus;
	}

	public String getSerailBillIdYearly() {
		return serailBillIdYearly;
	}

	public void setSerailBillIdYearly(String serailBillIdYearly) {
		this.serailBillIdYearly = serailBillIdYearly;
	}
	
	public BigDecimal getGrandTotalBillsValue() {
		return grandTotalBillsValue;
	}

	public void setGrandTotalBillsValue(BigDecimal grandTotalBillsValue) {
		this.grandTotalBillsValue = grandTotalBillsValue;
	}

	public Double getGrandTotalValue() {
		return grandTotalValue;
	}

	public void setGrandTotalValue(Double grandTotalValue) {
		this.grandTotalValue = grandTotalValue;
	}

	public List<Billing> getBilling() {
		return billing;
	}

	public void setBilling(List<Billing> billing) {
		this.billing = billing;
	}

	public List<BillItems> getBillItems() {
		return billItems;
	}

	public void setBillItems(List<BillItems> billItems) {
		this.billItems = billItems;
	}

	public List<BillingTransactions> getBillTransactions() {
		return billTransactions;
	}

	public void setBillTransactions(List<BillingTransactions> billTransactions) {
		this.billTransactions = billTransactions;
	}

	public List<BillItems> getReturnItems() {
		return returnItems;
	}

	public void setReturnItems(List<BillItems> returnItems) {
		this.returnItems = returnItems;
	}

	public List<BillItems> getExchangeItems() {
		return exchangeItems;
	}

	public void setExchangeItems(List<BillItems> exchangeItems) {
		this.exchangeItems = exchangeItems;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public List<Billing> getBillsList() {
		return billsList;
	}

	public void setBillsList(List<Billing> billsList) {
		this.billsList = billsList;
	}

	public String getSearchBillsFilePath() {
		return searchBillsFilePath;
	}

	public void setSearchBillsFilePath(String searchBillsFilePath) {
		this.searchBillsFilePath = searchBillsFilePath;
	}

	public String getSearchBillsReportResponse() {
		return searchBillsReportResponse;
	}

	public void setSearchBillsReportResponse(String searchBillsReportResponse) {
		this.searchBillsReportResponse = searchBillsReportResponse;
	}
	
	
}
