package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;
import java.util.Set;

public class MembershipMaster {


	private String membershipProgramCode;
	
	
	private String promoName;
	
	private List<String> membershipIds;
	
	private String membershipIdsStr;
	private List<String> customerMembershipIds;
    private String customerMembershipIdsStr;

	private Float unitCashValue;
	private String membershipId;
 private int  isAutoRenewal;
 private int isOnline;
 
 
	private String customer_category;
	
	
	
	public String getCustomer_category() {
		return customer_category;
	}



	public void setCustomer_category(String customer_category) {
		this.customer_category = customer_category;
	}



	public int getIsAutoRenewal() {
	return isAutoRenewal;
}



public void setIsAutoRenewal(int isAutoRenewal) {
	this.isAutoRenewal = isAutoRenewal;
}



public int getIsOnline() {
	return isOnline;
}



public void setIsOnline(int isOnline) {
	this.isOnline = isOnline;
}




	public String getMembershipId() {
		return membershipId;
	}

	public void setMembershipId(String membershipId) {
		this.membershipId = membershipId;
	}
	private Float membershipFee;
	private Date createdDate;
	private Date updatedDate;
	private Date expiryDate;
	private Integer validityPeriod;
	private String country;
	private String states;
	private String status;
	private String description;
	private String expiryStatus;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private Integer startIndex;
	private Integer maxRecords;
	private String searchCriteria;
	private String startDateStr;
	private String endDateStr;
	private String createdDateStr;
	private String updatedDateStr;
	private String expiryDateStr;
	private int totalRecords;

	private boolean saveReport;

	private String filePath;
	private String membershipCode;


	
	
	public String getCustomerMembershipIdsStr() {
		return customerMembershipIdsStr;
	}

	public void setCustomerMembershipIdsStr(String customerMembershipIdsStr) {
		this.customerMembershipIdsStr = customerMembershipIdsStr;
	}

	public String getMembershipCode() {
		return membershipCode;
	}

	public void setMembershipCode(String membershipCode) {
		this.membershipCode = membershipCode;
	}

	public boolean isSaveReport() {
		return saveReport;
	}

	public void setSaveReport(boolean saveReport) {
		this.saveReport = saveReport;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	private boolean membershipStatus;
	public boolean isMembershipStatus() {
		return membershipStatus;
	}

	public void setMembershipStatus(boolean membershipStatus) {
		this.membershipStatus = membershipStatus;
	}
	private boolean assignedStatus;
	
	public boolean isAssignedStatus() {
		return assignedStatus;
	}

	public void setAssignedStatus(boolean assignedStatus) {
		this.assignedStatus = assignedStatus;
	}
	private List<MembershipMaster> membershipMasters;
	private List<MembershipChild> memberships;
	private List<MemberShips> customerMemberships;
	private List<MembershipLocations> membershipLocations;
	private boolean importFlag;

	private boolean childRequired;
	private boolean customerMembershipRequired;
	private boolean locationRequired;
	
	 private String name;
		private String renewalDateStr;
		private String phone_num;
		
		private String uploadedfilePath;
		
		
		
		public String getUploadedfilePath() {
			return uploadedfilePath;
		}



		public void setUploadedfilePath(String uploadedfilePath) {
			this.uploadedfilePath = uploadedfilePath;
		}



		public boolean isImportFlag() {
			return importFlag;
		}



		public void setImportFlag(boolean importFlag) {
			this.importFlag = importFlag;
		}
		private Float activationPoints;
		
		
		private Float creditAmount;
		
		
		
	
	public Float getActivationPoints() {
			return activationPoints;
		}



		public void setActivationPoints(Float activationPoints) {
			this.activationPoints = activationPoints;
		}



		public Float getCreditAmount() {
			return creditAmount;
		}



		public void setCreditAmount(Float creditAmount) {
			this.creditAmount = creditAmount;
		}



	public String getPhone_num() {
			return phone_num;
		}

		public void setPhone_num(String phone_num) {
			this.phone_num = phone_num;
		}

	public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getRenewalDateStr() {
			return renewalDateStr;
		}

		public void setRenewalDateStr(String renewalDateStr) {
			this.renewalDateStr = renewalDateStr;
		}

	public boolean isChildRequired() {
		return childRequired;
	}

	public void setChildRequired(boolean childRequired) {
		this.childRequired = childRequired;
	}

	public boolean isCustomerMembershipRequired() {
		return customerMembershipRequired;
	}

	public void setCustomerMembershipRequired(boolean customerMembershipRequired) {
		this.customerMembershipRequired = customerMembershipRequired;
	}

	public boolean isLocationRequired() {
		return locationRequired;
	}

	public void setLocationRequired(boolean locationRequired) {
		this.locationRequired = locationRequired;
	}
	private List<String> zoneLocations;

	private List<String> zones;

	private Integer quantity;
	
	private String zoneId;
	
	private Set<String> allLocationsList;
	
	private String locations;
	
	
	private Boolean otpRequired;
	
	private Float renewalPrice;
	private int gracePeriod;
	
	private int childStartIndex;
	
	
	
	
	
	public int getChildStartIndex() {
		return childStartIndex;
	}

	public void setChildStartIndex(int childStartIndex) {
		this.childStartIndex = childStartIndex;
	}

	public List<MembershipChild> getMemberships() {
		return memberships;
	}

	public void setMemberships(List<MembershipChild> memberships) {
		this.memberships = memberships;
	}

	public Float getRenewalPrice() {
		return renewalPrice;
	}

	
	
	public String getMembershipIdsStr() {
		return membershipIdsStr;
	}

	public void setMembershipIdsStr(String membershipIdsStr) {
		this.membershipIdsStr = membershipIdsStr;
	}

	public void setRenewalPrice(Float renewalPrice) {
		this.renewalPrice = renewalPrice;
	}

	public int getGracePeriod() {
		return gracePeriod;
	}

	public void setGracePeriod(int gracePeriod) {
		this.gracePeriod = gracePeriod;
	}

	public Boolean getOtpRequired() {
		return otpRequired;
	}

	public void setOtpRequired(Boolean otpRequired) {
		this.otpRequired = otpRequired;
	}
	private String membershipType;
	
	public String getMembershipType() {
		return membershipType;
	}

	public void setMembershipType(String membershipType) {
		this.membershipType = membershipType;
	}

	public List<MembershipMaster> getMembershipMasters() {
		return membershipMasters;
	}

	public void setMembershipMasters(List<MembershipMaster> membershipMasters) {
		this.membershipMasters = membershipMasters;
	}

	public Set<String> getAllLocationsList() {
		return allLocationsList;
	}

	public void setAllLocationsList(Set<String> allLocationsList) {
		this.allLocationsList = allLocationsList;
	}

	public String getLocations() {
		return locations;
	}

	public void setLocations(String locations) {
		this.locations = locations;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getExpiryStatus() {
		return expiryStatus;
	}

	public void setExpiryStatus(String expiryStatus) {
		this.expiryStatus = expiryStatus;
	}

	
	
	public List<String> getMembershipIds() {
		return membershipIds;
	}

	public void setMembershipIds(List<String> membershipIds) {
		this.membershipIds = membershipIds;
	}

	public List<String> getCustomerMembershipIds() {
		return customerMembershipIds;
	}

	public void setCustomerMembershipIds(List<String> customerMembershipIds) {
		this.customerMembershipIds = customerMembershipIds;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public List<String> getZoneLocations() {
		return zoneLocations;
	}

	public void setZoneLocations(List<String> zoneLocations) {
		this.zoneLocations = zoneLocations;
	}
	private String selectedZones;

	public String getSelectedZones() {
		return selectedZones;
	}

	public void setSelectedZones(String selectedZones) {
		this.selectedZones = selectedZones;
	}

	public List<String> getZones() {
		return zones;
	}

	public void setZones(List<String> zones) {
		this.zones = zones;
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

	public Integer getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}

	public Integer getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(Integer maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getStartDateStr() {
		return startDateStr;
	}
	private String startDate;
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
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

	public String getExpiryDateStr() {
		return expiryDateStr;
	}

	public void setExpiryDateStr(String expiryDateStr) {
		this.expiryDateStr = expiryDateStr;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
/*
	public List<MembershipChild> getMemberships() {
		return memberships;
	}

	public void setMemberships(List<MembershipChild> memberships) {
		this.memberships = memberships;
	}
*/
	public List<MembershipLocations> getMembershipLocations() {
		return membershipLocations;
	}

	public void setMembershipLocations(List<MembershipLocations> membershipLocations) {
		this.membershipLocations = membershipLocations;
	}

	public List<MemberShips> getCustomerMemberships() {
		return customerMemberships;
	}

	public void setCustomerMemberships(List<MemberShips> customerMemberships) {
		this.customerMemberships = customerMemberships;
	}

	public String getMembershipProgramCode() {
		return membershipProgramCode;
	}

	public void setMembershipProgramCode(String membershipProgramCode) {
		this.membershipProgramCode = membershipProgramCode;
	}

	public String getPromoName() {
		return promoName;
	}

	public void setPromoName(String promoName) {
		this.promoName = promoName;
	}

	public Float getUnitCashValue() {
		return unitCashValue;
	}

	public void setUnitCashValue(Float unitCashValue) {
		this.unitCashValue = unitCashValue;
	}

	public Float getMembershipFee() {
		return membershipFee;
	}

	public void setMembershipFee(Float membershipFee) {
		this.membershipFee = membershipFee;
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

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	public Integer getValidityPeriod() {
		return validityPeriod;
	}

	public void setValidityPeriod(Integer validityPeriod) {
		this.validityPeriod = validityPeriod;
	}

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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
