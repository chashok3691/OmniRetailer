package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;
import java.util.Set;


public class CustomerReferralMaster {

	
	private boolean customerDataRequired;
 	
	private boolean referralCodesRequired;
		 	
	private boolean locationDataRequired;

	
	
	
	    public boolean isCustomerDataRequired() {
		return customerDataRequired;
	}

	public void setCustomerDataRequired(boolean customerDataRequired) {
		this.customerDataRequired = customerDataRequired;
	}

	public boolean isReferralCodesRequired() {
		return referralCodesRequired;
	}

	public void setReferralCodesRequired(boolean referralCodesRequired) {
		this.referralCodesRequired = referralCodesRequired;
	}

	public boolean isLocationDataRequired() {
		return locationDataRequired;
	}

	public void setLocationDataRequired(boolean locationDataRequired) {
		this.locationDataRequired = locationDataRequired;
	}

		private String referralProgramId;
	 	

	 	private String programDescription;
	    
	    private String couponBatchReference;
	    
	    private String minumumPurchaseAmount;
	    
	    private int noOfReferrals;
	     
	    private String referralPriority;
	    
	    private Date startDate;
	    
	    private Date endDate;
	    
	    private Date createdDate;
	 	
	    private Date updatedDate;
	    
	    private Date expiryDate;
	 		 	
	 	private String startIndex;
	 	private String maxRecords;
	 	private String totalRecords;
	 	private String searchCriteria;
	 	private RequestHeader requestHeader;
	 	private ResponseHeader responseHeader;
	    
		private boolean saveFlag;
	 	
		private String filePath;
		private String productGroup;
		private int validatePeriod=0;
		private boolean assignedReferral=false;
		private boolean otpRequired=false;
		private boolean multiUser;
		private float referralValue;
		private String discountType;
		private boolean autoGenerated;
		
		
		
		
	 	public boolean isAutoGenerated() {
			return autoGenerated;
		}

		public void setAutoGenerated(boolean autoGenerated) {
			this.autoGenerated = autoGenerated;
		}

		public String getDiscountType() {
			return discountType;
		}

		public void setDiscountType(String discountType) {
			this.discountType = discountType;
		}

		public boolean isMultiUser() {
			return multiUser;
		}

		public void setMultiUser(boolean multiUser) {
			this.multiUser = multiUser;
		}

		public float getReferralValue() {
			return referralValue;
		}

		public void setReferralValue(float referralValue) {
			this.referralValue = referralValue;
		}

		public Date getExpiryDate() {
			return expiryDate;
		}

		public void setExpiryDate(Date expiryDate) {
			this.expiryDate = expiryDate;
		}

		public String getProductGroup() {
			return productGroup;
		}

		public void setProductGroup(String productGroup) {
			this.productGroup = productGroup;
		}

		public int getValidatePeriod() {
			return validatePeriod;
		}

		public void setValidatePeriod(int validatePeriod) {
			this.validatePeriod = validatePeriod;
		}

		public boolean isAssignedReferral() {
			return assignedReferral;
		}

		public void setAssignedReferral(boolean assignedReferral) {
			this.assignedReferral = assignedReferral;
		}

		public boolean isOtpRequired() {
			return otpRequired;
		}

		public void setOtpRequired(boolean otpRequired) {
			this.otpRequired = otpRequired;
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

		private boolean status;
	 	
	  public boolean isStatus() {
			return status;
		}

		public void setStatus(boolean status) {
			this.status = status;
		}

	    private String startDateStr;
	    
	    
	    
	    private String endDateStr;
	    
	    private String expiryDateStr;
	    
	    private String country;
		private String states;
		private String locations;
		
		private List<String> zones;
		private List<String> zoneLocations;
	   
		
		
	public String getCountry() {
			return country;
		}

		public void setCountry(String country) {
			this.country = country;
		}

		public String getStates() {
			return states;
		}

		public void setStates(String states) {
			this.states = states;
		}

		public String getLocations() {
			return locations;
		}

		public void setLocations(String locations) {
			this.locations = locations;
		}

		public List<String> getZones() {
			return zones;
		}

		public void setZones(List<String> zones) {
			this.zones = zones;
		}

		public List<String> getZoneLocations() {
			return zoneLocations;
		}

		public void setZoneLocations(List<String> zoneLocations) {
			this.zoneLocations = zoneLocations;
		}

	public String getExpiryDateStr() {
			return expiryDateStr;
		}

		public void setExpiryDateStr(String expiryDateStr) {
			this.expiryDateStr = expiryDateStr;
		}

		private Set<CustomerReferrals> customerReferrals;
	 	
		private List<CustomerReferralMaster> customerReferralsList;
		private Set<CustomerReferralsLocation> CustomerReferralsLocation;
		
		
		
		
	    public Set<CustomerReferralsLocation> getCustomerReferralsLocation() {
			return CustomerReferralsLocation;
		}

		public void setCustomerReferralsLocation(Set<CustomerReferralsLocation> customerReferralsLocation) {
			CustomerReferralsLocation = customerReferralsLocation;
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


	    
	 	
	 	public String getReferralProgramId() {
			return referralProgramId;
		}

		public void setReferralProgramId(String referralProgramId) {
			this.referralProgramId = referralProgramId;
		}

		public String getProgramDescription() {
			return programDescription;
		}

		public void setProgramDescription(String programDescription) {
			this.programDescription = programDescription;
		}

		public String getCouponBatchReference() {
			return couponBatchReference;
		}

		public void setCouponBatchReference(String couponBatchReference) {
			this.couponBatchReference = couponBatchReference;
		}

		public String getMinumumPurchaseAmount() {
			return minumumPurchaseAmount;
		}

		public void setMinumumPurchaseAmount(String minumumPurchaseAmount) {
			this.minumumPurchaseAmount = minumumPurchaseAmount;
		}

		public int getNoOfReferrals() {
			return noOfReferrals;
		}

		public void setNoOfReferrals(int noOfReferrals) {
			this.noOfReferrals = noOfReferrals;
		}

		public String getReferralPriority() {
			return referralPriority;
		}

		public void setReferralPriority(String referralPriority) {
			this.referralPriority = referralPriority;
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

		public String getTotalRecords() {
			return totalRecords;
		}

		public void setTotalRecords(String totalRecords) {
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

		public Set<CustomerReferrals> getCustomerReferrals() {
			return customerReferrals;
		}

		public void setCustomerReferrals(Set<CustomerReferrals> customerReferrals) {
			this.customerReferrals = customerReferrals;
		}

		public List<CustomerReferralMaster> getCustomerReferralsList() {
			return customerReferralsList;
		}

		public void setCustomerReferralsList(List<CustomerReferralMaster> customerReferralsList) {
			this.customerReferralsList = customerReferralsList;
		}
    

}