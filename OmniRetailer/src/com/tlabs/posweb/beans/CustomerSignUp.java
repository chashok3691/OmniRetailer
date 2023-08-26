package com.tlabs.posweb.beans;

import java.util.Date;
/*
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.Length;

import com.tlabs.omniretailerservices.beans.RequestHeader;
import com.tlabs.omniretailerservices.beans.ResponseHeader;
*/
//@Entity
//@Table(name = "customer_signup")
public class CustomerSignUp {
	
//		@Id
//		@Column(name="signup_id")
//		@Length(min = 3,max = 50, message = "SIGN_UP_ID_LENGTH")
		public String signUpId;
		
//		@Column(name="customer_campaign_id")
//		@Length(min = 3,max = 50, message = "CUSTOMER_CAMPAIGN_ID")
	    private String customerCampaignId;
		
//		@Column(name="customer_id")
		private String customerId;
	
//		@Column(name="minimum_purchase_amount")
		private Double minimumPurchaseAmount;
		
	    public String getCustomerType() {
			return customerType;
		}
		public void setCustomerType(String customerType) {
			this.customerType = customerType;
		}
		public String getCreatedDateStr() {
			return createdDateStr;
		}
		public void setCreatedDateStr(String createdDateStr) {
			this.createdDateStr = createdDateStr;
		}
		private String customerType;
	    
    	private String createdDateStr;
//		@Column(name="signup_date")
		private Date signUpDate;
		
//		@Column(name = "assigned_status")
		private boolean AssignedStatus;
		
//		@Column(name="customer_name")
//		@Length(min = 3,max = 50, message = "CUSTOMER_NAME_LENGTH")
		private String customerName; 
		
		
//		@Column(name="coupon_id")
		private String couponId;
		
//		@Column(name="phone_number")
//		@Length(min = 9,max = 14, message = "PHONE_NUMBER_LENGTH")
		private String phoneNumber;
	    	
//		@Transient
		private RequestHeader requestHeader;
//		@Transient
		private ResponseHeader responseHeader;
		public String getSignUpId() {
			return signUpId;
		}
		public void setSignUpId(String signUpId) {
			this.signUpId = signUpId;
		}
	
		public String getCustomerCampaignId() {
			return customerCampaignId;
		}
		public void setCustomerCampaignId(String customerCampaignId) {
			this.customerCampaignId = customerCampaignId;
		}
		public String getCustomerId() {
			return customerId;
		}
		public void setCustomerId(String customerId) {
			this.customerId = customerId;
		}
	
		
		public Double getMinimumPurchaseAmount() {
			return minimumPurchaseAmount;
		}
		public void setMinimumPurchaseAmount(Double minimumPurchaseAmount) {
			this.minimumPurchaseAmount = minimumPurchaseAmount;
		}
		public Date getSignUpDate() {
			return signUpDate;
		}
		public void setSignUpDate(Date signUpDate) {
			this.signUpDate = signUpDate;
		}
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
		public String getCouponId() {
			return couponId;
		}
		public void setCouponId(String couponId) {
			this.couponId = couponId;
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
		
		
		
		    
		

}
