package com.tlabs.posweb.beans;


public class CustomerGiftCoupons {
	private String couponCode;
	private String couponProgramCode;
	private String issuedTo;
	private String issueDate;
	private String issuedAt;
	private String customerName;
	private String customerEmail;
	private String customerMobile;
	private int claimStatus;
	private String claimedAt;
	private String billRef;
	private Float couponValue;
	private String validityDate;
	private String couponId;
	
	private String startDateStr;
	private String endDateStr;
	private int totalRecords;
	private int noOfClaims;
	private String issuedAtStr;
	private String validityDateStr;
	
	private int sNo;
	
	
	
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public int getNoOfClaims() {
		return noOfClaims;
	}
	public void setNoOfClaims(int noOfClaims) {
		this.noOfClaims = noOfClaims;
	}
	public String getValidityDateStr() {
		return validityDateStr;
	}
	public void setValidityDateStr(String validityDateStr) {
		this.validityDateStr = validityDateStr;
	}
	public String getIssuedAtStr() {
		return issuedAtStr;
	}
	public void setIssuedAtStr(String issuedAtStr) {
		this.issuedAtStr = issuedAtStr;
	}
	
	
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getStartDateStr() {
		return startDateStr;
	}
	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}
	public String getEndDateStr() {
		return endDateStr;
	}
	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}
	public String getCouponId() {
		return couponId;
	}
	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}
	public String getCouponCode() {
		return couponCode;
	}
	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}
	public String getCouponProgramCode() {
		return couponProgramCode;
	}
	public void setCouponProgramCode(String couponProgramCode) {
		this.couponProgramCode = couponProgramCode;
	}
	public String getIssuedTo() {
		return issuedTo;
	}
	public void setIssuedTo(String issuedTo) {
		this.issuedTo = issuedTo;
	}
	
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	public String getCustomerMobile() {
		return customerMobile;
	}
	public void setCustomerMobile(String customerMobile) {
		this.customerMobile = customerMobile;
	}
	
	public int getClaimStatus() {
		return claimStatus;
	}
	public void setClaimStatus(int claimStatus) {
		this.claimStatus = claimStatus;
	}
	public String getClaimedAt() {
		return claimedAt;
	}
	public void setClaimedAt(String claimedAt) {
		this.claimedAt = claimedAt;
	}
	public String getBillRef() {
		return billRef;
	}
	public void setBillRef(String billRef) {
		this.billRef = billRef;
	}
	public Float getCouponValue() {
		return couponValue;
	}
	public void setCouponValue(Float couponValue) {
		this.couponValue = couponValue;
	}
	
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	public String getIssuedAt() {
		return issuedAt;
	}
	public void setIssuedAt(String issuedAt) {
		this.issuedAt = issuedAt;
	}
	public String getValidityDate() {
		return validityDate;
	}
	public void setValidityDate(String validityDate) {
		this.validityDate = validityDate;
	}
	
	
}
