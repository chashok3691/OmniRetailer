package com.tlabs.posweb.beans;

import java.util.Date;

//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.Id;
//import javax.persistence.Table;


/**
 * Created by vijay on 04/06/2018.
 */
//@Entity
//@Table(name = "customers_referrals")
public class CustomerReferrals {
	
	//@Id
	//@Column(name="referral_id")
	public String referralId;
	
	//@Column(name="referral_program_id")
    private String referralProgramId;
	
	//@Column(name="referral_date")
	private Date referralDate;
	
	//@Column(name="referred_to")
	private String referredTo;
	//@Column(name="referral_amount")
	private Double referralAmount;
	//@Column(name="cummulative_amount")
	private Double cummulativeAmount;
	private boolean AssignedStatus;
	private String customerName;
	private String emailId;
	private String phoneNumber;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	
	
    
	public boolean isAssignedStatus() {
		return AssignedStatus;
	}
	public void setAssignedStatus(boolean assignedStatus) {
		AssignedStatus = assignedStatus;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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
	public String getReferralId() {
		return referralId;
	}
	public void setReferralId(String referralId) {
		this.referralId = referralId;
	}
	public String getReferralProgramId() {
		return referralProgramId;
	}
	public void setReferralProgramId(String referralProgramId) {
		this.referralProgramId = referralProgramId;
	}
	public Date getReferralDate() {
		return referralDate;
	}
	public void setReferralDate(Date referralDate) {
		this.referralDate = referralDate;
	}
	public String getReferredTo() {
		return referredTo;
	}
	public void setReferredTo(String referredTo) {
		this.referredTo = referredTo;
	}
	public Double getReferralAmount() {
		return referralAmount;
	}
	public void setReferralAmount(Double referralAmount) {
		this.referralAmount = referralAmount;
	}
	public Double getCummulativeAmount() {
		return cummulativeAmount;
	}
	public void setCummulativeAmount(Double cummulativeAmount) {
		this.cummulativeAmount = cummulativeAmount;
	}
	
	
	

}
