package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;




public class CustomerWallets {

	
	private String walletId;
	
	
	private String walletProgramId;
	
	
	private String phoneNumber;
	
	
	private String customerName;
	
	
	private Date startDate;
	
	
	private Date endDate;
	
	
	private boolean status;
	
	
	private String startdate;
	
	
	private String enddate;
	
	private BigDecimal maxBillAmt;

	private BigDecimal maxCashDepositNum;

	private List<CustomerWallets> customerWallets;
	private String startIndex;
	private String maxRecords;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String walletSearchCriteria;
	private int totalRecords;
	
	
	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<CustomerWallets> getCustomerWallets() {
		return customerWallets;
	}

	public void setCustomerWallets(List<CustomerWallets> customerWallets) {
		this.customerWallets = customerWallets;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public String getWalletSearchCriteria() {
		return walletSearchCriteria;
	}

	public void setWalletSearchCriteria(String walletSearchCriteria) {
		this.walletSearchCriteria = walletSearchCriteria;
	}

	public BigDecimal getMaxBillAmt() {
		return maxBillAmt;
	}

	public void setMaxBillAmt(BigDecimal maxBillAmt) {
		this.maxBillAmt = maxBillAmt;
	}

	public BigDecimal getMaxCashDepositNum() {
		return maxCashDepositNum;
	}

	public void setMaxCashDepositNum(BigDecimal maxCashDepositNum) {
		this.maxCashDepositNum = maxCashDepositNum;
	}

	private List<CustomerLedger> customerLedgers;
	private List<String> customerWalletLocations;
	
	
	public List<String> getCustomerWalletLocations() {
		return customerWalletLocations;
	}

	public void setCustomerWalletLocations(List<String> customerWalletLocations) {
		this.customerWalletLocations = customerWalletLocations;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public List<CustomerLedger> getCustomerLedgers() {
		return customerLedgers;
	}

	public void setCustomerLedgers(List<CustomerLedger> customerLedgers) {
		this.customerLedgers = customerLedgers;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getWalletId() {
		return walletId;
	}

	public void setWalletId(String walletId) {
		this.walletId = walletId;
	}

	public String getWalletProgramId() {
		return walletProgramId;
	}

	public void setWalletProgramId(String walletProgramId) {
		this.walletProgramId = walletProgramId;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
}
