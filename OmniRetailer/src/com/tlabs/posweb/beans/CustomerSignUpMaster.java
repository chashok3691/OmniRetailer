

package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Set;



/*@Entity
@Table(name = "customer_signup_master")*/
public class CustomerSignUpMaster {
	
	
	/*@Id
    @Column(name = "campaign_id", unique = true, nullable = false)
	@Length(min = 0, max=50 , message = "CAMPAIGN_ID_LENGTH")*/
    private String campaignId;
	
 /*	@Column(name= "campaign_description")
 	@Length(min = 0,max = 100, message = "CAMPAIGN_DESCRIPTION_LENGTH")*/
 	private String campaignDescription;
    
 /*	@Column(name = "coupon_batch_reference",nullable = false)
    @Length(min = 0,max = 50, message = "GIFT_COUPON_REFERENCE_LENGTH")*/
    private String couponBatchReference;
    
// 	@Column(name = "minimum_purchase_amount",nullable = false)
    private Double minimumPurchaseAmount;
    
 	public Double getMinimumPurchaseAmount() {
		return minimumPurchaseAmount;
	}
	public void setMinimumPurchaseAmount(Double minimumPurchaseAmount) {
		this.minimumPurchaseAmount = minimumPurchaseAmount;
	}
//	@Column(name = "no_of_signups",nullable = false)
//	@Transient
    private int noOfSignUps;
    
// 	@Column(name = "signup_priority",nullable = false)
    private String signupPriority;
    
// 	@Column(name = "start_date",nullable = false)
    private Date startDate;
    
// 	@Column(name = "end_date",nullable = false)
    private Date endDate;
 	
// 	@Column(name = "created_date")
    private Date createdDate;
// 	@Column(name = "updated_date")
    private Date updatedDate;
// 	@Column(name = "status")
    private boolean status;
// 	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//	@Valid
//	@JoinColumn(name = "customer_campaign_id")
	private Set<CustomerSignUp> customerSignUp;
 	
 	
//	@Transient
 	private String startIndex;
//    @Transient
 	private String maxRecords;
//    @Transient
 	private int totalRecords;
//    @Transient
 	private String searchCriteria;
//    @Transient
 	private RequestHeader requestHeader;
//    @Transient
 	private ResponseHeader responseHeader;
//    @Transient
    private String startDateStr;
//    @Transient
    private String endDateStr;
//    @Transient
	private List<CustomerSignUpMaster> customerSignUpList;
    
//	@Transient
	private boolean saveFlag;
 	
// 	@Transient
	private String filePath;
    
	private String createdDateStr;
	
	
	
	private BigDecimal signupCash;
	private String rewardType;
	private String loyaltyPlan;
	 private String customerType;
		private String offerId;
	
		
	public BigDecimal getSignupCash() {
			return signupCash;
		}
		public void setSignupCash(BigDecimal signupCash) {
			this.signupCash = signupCash;
		}
		public String getRewardType() {
			return rewardType;
		}
		public void setRewardType(String rewardType) {
			this.rewardType = rewardType;
		}
		public String getLoyaltyPlan() {
			return loyaltyPlan;
		}
		public void setLoyaltyPlan(String loyaltyPlan) {
			this.loyaltyPlan = loyaltyPlan;
		}
		public String getCustomerType() {
			return customerType;
		}
		public void setCustomerType(String customerType) {
			this.customerType = customerType;
		}
		public String getOfferId() {
			return offerId;
		}
		public void setOfferId(String offerId) {
			this.offerId = offerId;
		}
	public String getCreatedDateStr() {
		return createdDateStr;
	}
	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}
	public boolean isSaveFlag() {
		return saveFlag;
	}
	public void setSaveFlag(boolean saveFlag) {
		this.saveFlag = saveFlag;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getCampaignId() {
		return campaignId;
	}
	public void setCampaignId(String campaignId) {
		this.campaignId = campaignId;
	}
	public String getCampaignDescription() {
		return campaignDescription;
	}
	public void setCampaignDescription(String campaignDescription) {
		this.campaignDescription = campaignDescription;
	}
	public String getCouponBatchReference() {
		return couponBatchReference;
	}
	public void setCouponBatchReference(String couponBatchReference) {
		this.couponBatchReference = couponBatchReference;
	}

	public int getNoOfSignUps() {
		return noOfSignUps;
	}
	public void setNoOfSignUps(int noOfSignUps) {
		this.noOfSignUps = noOfSignUps;
	}
	public String getSignupPriority() {
		return signupPriority;
	}
	public void setSignupPriority(String signupPriority) {
		this.signupPriority = signupPriority;
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
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Set<CustomerSignUp> getCustomerSignUp() {
		return customerSignUp;
	}
	public void setCustomerSignUp(Set<CustomerSignUp> customerSignUp) {
		this.customerSignUp = customerSignUp;
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
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
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
	public List<CustomerSignUpMaster> getCustomerSignUpList() {
		return customerSignUpList;
	}
	public void setCustomerSignUpList(List<CustomerSignUpMaster> customerSignUpList) {
		this.customerSignUpList = customerSignUpList;
	}
	
}
