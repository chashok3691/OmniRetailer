package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;
import java.util.Set;




/**
 * Created by Ramu on 03/10/2022.
 */

public class CustomerSubscription {
	
	
	private String subscriptionId;
	
	private String mobileNum;
	private String customerName;
	
	private String subscriptionName;
    private String rewardPrice;
	private String rewardType;
	private int SubcriptionNo;
	
	private String period;
	
	
	private float discount;
	
	
	private String discountType;
	
	
	private String remarks;
	
	
	private String userName;
	
	
	private String roleName;
	private String previousOrderDateStr;
	
	
	
	
	
	/*private Date createdDate;
	
	
	private Date updatedDate;

	
	private Date startDate;
	
	
	private Date endDate;*/

	
	

	private String status;
	
	
	public String getPreviousOrderDateStr() {
		return previousOrderDateStr;
	}

	public void setPreviousOrderDateStr(String previousOrderDateStr) {
		this.previousOrderDateStr = previousOrderDateStr;
	}


	private String searchCriteria;
	
	
	private String subscriptionStatus;
	private Set<String> allLocationsList;
	
	private List<CustomerSubscription> CustomerSubscription;
	
	private List<CustomerSubscription> customerSubscriptionDetails;
	
	
	
	public List<CustomerSubscription> getCustomerSubscription() {
		return CustomerSubscription;
	}

	public void setCustomerSubscription(List<CustomerSubscription> customerSubscription) {
		CustomerSubscription = customerSubscription;
	}
	public String getSubscriptionId() {
		return subscriptionId;
	}

	public void setSubscriptionId(String subscriptionId) {
		this.subscriptionId = subscriptionId;
	}

	public List<CustomerSubscription> getCustomerSubscriptionDetails() {
		return customerSubscriptionDetails;
	}

	public void setCustomerSubscriptionDetails(List<CustomerSubscription> customerSubscriptionDetails) {
		this.customerSubscriptionDetails = customerSubscriptionDetails;
	}

	public Set<String> getAllLocationsList() {
		return allLocationsList;
	}

	public void setAllLocationsList(Set<String> allLocationsList) {
		this.allLocationsList = allLocationsList;
	}

	public String getSubscriptionStatus() {
		return subscriptionStatus;
	}

	public void setSubscriptionStatus(String subscriptionStatus) {
		this.subscriptionStatus = subscriptionStatus;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getDiscountType() {
		return discountType;
	}

	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}


	private List<SubscriptionProducts> subscriptionProductsList;
	

	private RequestHeader requestHeader;
	

	private String startDateStr;
	
	
	private String endDateStr;
	
	
	private String createdDateStr;
	
	
	private String updatedDateStr;
	
	
	private int startIndex;
	
	
	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}


	private String maxRecords;
	
	private String expiryDateStr;
	
	 private String name;
	 private String phone_num;
	 private String renewalDateStr;
	 private boolean assignedStatus;
	 private String subscriptionIdsStr;
	 private String subscriptionType;
	 
	 private int totalRecords;
	 
	 
	

		public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

		public String getSubscriptionType() {
		return subscriptionType;
	}

	public void setSubscriptionType(String subscriptionType) {
		this.subscriptionType = subscriptionType;
	}

		public String getSubscriptionIdsStr() {
		return subscriptionIdsStr;
	}

	public void setSubscriptionIdsStr(String subscriptionIdsStr) {
		this.subscriptionIdsStr = subscriptionIdsStr;
	}

		public boolean isAssignedStatus() {
			return assignedStatus;
		}

		public void setAssignedStatus(boolean assignedStatus) {
			this.assignedStatus = assignedStatus;
		}
		
	public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getPhone_num() {
			return phone_num;
		}

		public void setPhone_num(String phone_num) {
			this.phone_num = phone_num;
		}

		public String getRenewalDateStr() {
			return renewalDateStr;
		}

		public void setRenewalDateStr(String renewalDateStr) {
			this.renewalDateStr = renewalDateStr;
		}

	public String getExpiryDateStr() {
		return expiryDateStr;
	}

	public void setExpiryDateStr(String expiryDateStr) {
		this.expiryDateStr = expiryDateStr;
	}

	

	

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
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

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public String getUpdatedDateStr() {
		return updatedDateStr;
	}

	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	
	public String getMobileNum() {
		return mobileNum;
	}

	public void setMobileNum(String mobileNum) {
		this.mobileNum = mobileNum;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}


	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	/*public Date getCreatedDate() {
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
	}*/

	
	
	public List<SubscriptionProducts> getSubscriptionProductsList() {
		return subscriptionProductsList;
	}

	public void setSubscriptionProductsList(List<SubscriptionProducts> subscriptionProductsList) {
		this.subscriptionProductsList = subscriptionProductsList;
	}


	private String selectedZones;

	public String getSelectedZones() {
		return selectedZones;
	}

	public void setSelectedZones(String selectedZones) {
		this.selectedZones = selectedZones;
	}
	
	
	private List<String> zones;
	public List<String> getZones() {
		return zones;
	}

	public void setZones(List<String> zones) {
		this.zones = zones;
	}
	
	
	private String locations;
	public String getLocations() {
		return locations;} 
	
	public void setLocations(String locations) {
		this.locations = locations;
	}

	private List<String> zoneLocations;
	public List<String> getZoneLocations() {
		return zoneLocations;
	}

	public void setZoneLocations(List<String> zoneLocations) {
		this.zoneLocations = zoneLocations;
	}
	
	
	
	private String zoneId;
	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}
	
	private String subscriptionProgramCode;


	public String getSubscriptionProgramCode() {
		return subscriptionProgramCode;
	}

	public void setSubscriptionProgramCode(String subscriptionProgramCode) {
		this.subscriptionProgramCode = subscriptionProgramCode;
	}
	
	
	private String promoName;


	public String getPromoName() {
		return promoName;
	}

	public void setPromoName(String promoName) {
		this.promoName = promoName;
	}

	public String getSubscriptionName() {
		return subscriptionName;
	}

	public void setSubscriptionName(String subscriptionName) {
		this.subscriptionName = subscriptionName;
	}

	public String getRewardPrice() {
		return rewardPrice;
	}

	public void setRewardPrice(String rewardPrice) {
		this.rewardPrice = rewardPrice;
	}

	public String getRewardType() {
		return rewardType;
	}

	public void setRewardType(String rewardType) {
		this.rewardType = rewardType;
	}

	public int getSubcriptionNo() {
		return SubcriptionNo;
	}

	public void setSubcriptionNo(int subcriptionNo) {
		SubcriptionNo = subcriptionNo;
	}
	
	
	public int getQuantity() {
		// TODO Auto-generated method stub
		return 0;
	}

	

	
		
	}
	
