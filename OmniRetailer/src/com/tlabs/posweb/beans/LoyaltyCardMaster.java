package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;
//import java.util.Set;
import java.util.Set;

public class LoyaltyCardMaster {
	
	private RequestHeader requestHeader;
	private String loyaltyProgramNumber;
	private String loyaltyProgramName;
	private String loyaltyCardType;
	private String loyalityProgramDescription;
	private String country;
	private String states;
	private String validFrom;
	private String validTo;
	private Integer validityPeriod;
	private String rewardType;
	private Integer rewardLifeTime;
	private Float rewardConversionRatio;
	private String status;
	private BigDecimal maxPointsPerDay;
	private BigDecimal redeemTime;

	
	private float  minRedeemPoints;
	
	private String searchCriteria;
	private boolean saveLoyaltyCardFlag;
	private String filePath;
	private String validFromStr;
	private String validToStr;
	
	private String StartDateStr;
	private String EndDateStr;
	private boolean customerLoyaltyCardFlag;
	
	private String enrolDate;
    private Double minPoints= 0.0;
    private Double maxPoints= 0.0;
    private Double basePointsConvertions= 0.0;
    
    private Double purchasePoints;
    
	
	
	
    
    
	public BigDecimal getMaxPointsPerDay() {
		return maxPointsPerDay;
	}
	public void setMaxPointsPerDay(BigDecimal maxPointsPerDay) {
		this.maxPointsPerDay = maxPointsPerDay;
	}
	public BigDecimal getRedeemTime() {
		return redeemTime;
	}
	public void setRedeemTime(BigDecimal redeemTime) {
		this.redeemTime = redeemTime;
	}
	public Double getPurchasePoints() {
		return purchasePoints;
	}
	public void setPurchasePoints(Double purchasePoints) {
		this.purchasePoints = purchasePoints;
	}
	public String getEnrolDate() {
		return enrolDate;
	}
	public void setEnrolDate(String enrolDate) {
		this.enrolDate = enrolDate;
	}
	public Double getMinPoints() {
		return minPoints;
	}
	public void setMinPoints(Double minPoints) {
		this.minPoints = minPoints;
	}
	public Double getMaxPoints() {
		return maxPoints;
	}
	public void setMaxPoints(Double maxPoints) {
		this.maxPoints = maxPoints;
	}
	public Double getBasePointsConvertions() {
		return basePointsConvertions;
	}
	public void setBasePointsConvertions(Double basePointsConvertions) {
		this.basePointsConvertions = basePointsConvertions;
	}
	public boolean isCustomerLoyaltyCardFlag() {
		return customerLoyaltyCardFlag;
	}
	public void setCustomerLoyaltyCardFlag(boolean customerLoyaltyCardFlag) {
		this.customerLoyaltyCardFlag = customerLoyaltyCardFlag;
	}
	public String getStartDateStr() {
		return StartDateStr;
	}
	public void setStartDateStr(String startDateStr) {
		StartDateStr = startDateStr;
	}
	public String getEndDateStr() {
		return EndDateStr;
	}
	public void setEndDateStr(String endDateStr) {
		EndDateStr = endDateStr;
	}
	private List<String> loyaltyCardsIds;
	
	
	private List<String> customerLoyaltyCardsIds;
   
	private String loyaltyCardsIdsstr;
	
	
	private String customerLoyaltyCardsIdsstr;
	
	
	
	
	
	
  
public String getLoyaltyCardsIdsstr() {
		return loyaltyCardsIdsstr;
	}
	public void setLoyaltyCardsIdsstr(String loyaltyCardsIdsstr) {
		this.loyaltyCardsIdsstr = loyaltyCardsIdsstr;
	}
	public String getCustomerLoyaltyCardsIdsstr() {
		return customerLoyaltyCardsIdsstr;
	}
	public void setCustomerLoyaltyCardsIdsstr(String customerLoyaltyCardsIdsstr) {
		this.customerLoyaltyCardsIdsstr = customerLoyaltyCardsIdsstr;
	}
	public List<String> getLoyaltyCardsIds() {
		return loyaltyCardsIds;
	}
	public void setLoyaltyCardsIds(List<String> loyaltyCardsIds) {
		this.loyaltyCardsIds = loyaltyCardsIds;
	}
	public List<String> getCustomerLoyaltyCardsIds() {
		return customerLoyaltyCardsIds;
	}
	public void setCustomerLoyaltyCardsIds(List<String> customerLoyaltyCardsIds) {
		this.customerLoyaltyCardsIds = customerLoyaltyCardsIds;
	}

public String getValidFromStr() {
		return validFromStr;
	}
	public void setValidFromStr(String validFromStr) {
		this.validFromStr = validFromStr;
	}
	public String getValidToStr() {
		return validToStr;
	}
	public void setValidToStr(String validToStr) {
		this.validToStr = validToStr;
	}
	
public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public boolean isSaveLoyaltyCardFlag() {
		return saveLoyaltyCardFlag;
	}
	public void setSaveLoyaltyCardFlag(boolean saveLoyaltyCardFlag) {
		this.saveLoyaltyCardFlag = saveLoyaltyCardFlag;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	//	@Column(name = "min_claim_points")
	private BigDecimal minClaimPoints =new BigDecimal("0");
	
	private int totalLoyaltyCards;
	
	public int getTotalLoyaltyCards() {
		return totalLoyaltyCards;
	}
	public void setTotalLoyaltyCards(int totalLoyaltyCards) {
		this.totalLoyaltyCards = totalLoyaltyCards;
	}
	public BigDecimal getMinClaimPoints() {
		return minClaimPoints;
	}
	public void setMinClaimPoints(BigDecimal minClaimPoints) {
		this.minClaimPoints = minClaimPoints;
	}
	public float getMinRedeemPoints() {
		return minRedeemPoints;
	}
	public void setMinRedeemPoints(float minRedeemPoints) {
		this.minRedeemPoints = minRedeemPoints;
	}
	private String deletePlusItem;
	
	public String getDeletePlusItem() {
		return deletePlusItem;
	}
	public void setDeletePlusItem(String deletePlusItem) {
		this.deletePlusItem = deletePlusItem;
	}
	private boolean autoIssue;
	
	public boolean isAutoIssue() {
		return autoIssue;
	}
	public void setAutoIssue(boolean autoIssue) {
		this.autoIssue = autoIssue;
	}
	private String items;
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
	}
	
	private String customerLoyaltyCardsitems;
	
	
	public String getCustomerLoyaltyCardsitems() {
		return customerLoyaltyCardsitems;
	}
	public void setCustomerLoyaltyCardsitems(String customerLoyaltyCardsitems) {
		this.customerLoyaltyCardsitems = customerLoyaltyCardsitems;
	}
	private Integer quantity;
	private List<LoyaltyCards> loyaltyCards;
	private List<CustomerLoyaltyCards> customerLoyaltyCards;
	private String startIndex;
	private String totalRecords;
	
	private List<LoyaltyPurchaseRanges> loyaltyPurcahseRanges;
	
/*	private int totalRecords;*/
	
	
	private boolean OTPRequirement;
	public List<LoyaltyPurchaseRanges> getLoyaltyPurcahseRanges() {
		return loyaltyPurcahseRanges;
	}
	public void setLoyaltyPurcahseRanges(List<LoyaltyPurchaseRanges> loyaltyPurcahseRanges) {
		this.loyaltyPurcahseRanges = loyaltyPurcahseRanges;
	}
	private float purchaseRangeStart;
	private float purchaseRangeEnd;
	private String startDate;
	private String endTo;
	private String zone;
	private String endDate;
	private String requiredOTP="";
	private int noOfCards;
	private String maxRecords;
	private String rewardCriteria;
	//private List<ZoneMaster> loyaltyZones;
	private Set<LoyaltyZones> loyaltyZones;
	private List<LoyaltyCardMaster> loyaltyCardsList;
	private float  pointsConversionRatio;
	private String loyaltyProgramDescription;
	/*private String updatedDate;*/
	private String userName;
	/*private String createdDate;*/
	private String roleName;
	private LoyaltyCardMaster loyaltyCardMaster;
	private ResponseHeader  responseHeader;
	private String loyaltyZonesdetails;
	private String loyaltyCardsdetails;

	private int cardDetails_length;
	private String location;
	
	private List<String> deletePurchaseRangesBySno;
	
	
	private String autoIssueFlag="";
	private float basePoints;
	
	
	
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public List<String> getDeletePurchaseRangesBySno() {
		return deletePurchaseRangesBySno;
	}
	public void setDeletePurchaseRangesBySno(List<String> deletePurchaseRangesBySno) {
		this.deletePurchaseRangesBySno = deletePurchaseRangesBySno;
	}
	public float getBasePoints() {
		return basePoints;
	}
	public void setBasePoints(float basePoints) {
		this.basePoints = basePoints;
	}
	public String getAutoIssueFlag() {
		return autoIssueFlag;
	}
	public void setAutoIssueFlag(String autoIssueFlag) {
		this.autoIssueFlag = autoIssueFlag;
	}
	public boolean isOTPRequirement() {
		return OTPRequirement;
	}
	public void setOTPRequirement(boolean oTPRequirement) {
		OTPRequirement = oTPRequirement;
	}
	public float getPurchaseRangeStart() {
		return purchaseRangeStart;
	}
	public void setPurchaseRangeStart(float purchaseRangeStart) {
		this.purchaseRangeStart = purchaseRangeStart;
	}
	public float getPurchaseRangeEnd() {
		return purchaseRangeEnd;
	}
	public void setPurchaseRangeEnd(float purchaseRangeEnd) {
		this.purchaseRangeEnd = purchaseRangeEnd;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndTo() {
		return endTo;
	}
	public void setEndTo(String endTo) {
		this.endTo = endTo;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getRequiredOTP() {
		return requiredOTP;
	}
	public void setRequiredOTP(String requiredOTP) {
		this.requiredOTP = requiredOTP;
	}
	public int getNoOfCards() {
		return noOfCards;
	}
	public void setNoOfCards(int noOfCards) {
		this.noOfCards = noOfCards;
	}
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public String getRewardCriteria() {
		return rewardCriteria;
	}
	public void setRewardCriteria(String rewardCriteria) {
		this.rewardCriteria = rewardCriteria;
	}
/*	public List<ZoneMaster> getLoyaltyZones() {
		return loyaltyZones;
	}
	public void setLoyaltyZones(List<ZoneMaster> loyaltyZones) {
		this.loyaltyZones = loyaltyZones;
	}*/
	
	
	
	public List<LoyaltyCardMaster> getLoyaltyCardsList() {
		return loyaltyCardsList;
	}
	public String getLoyaltyZonesdetails() {
		return loyaltyZonesdetails;
	}
	public void setLoyaltyZonesdetails(String loyaltyZonesdetails) {
		this.loyaltyZonesdetails = loyaltyZonesdetails;
	}
	public String getLoyaltyCardsdetails() {
		return loyaltyCardsdetails;
	}
	public void setLoyaltyCardsdetails(String loyaltyCardsdetails) {
		this.loyaltyCardsdetails = loyaltyCardsdetails;
	}
	public Set<LoyaltyZones> getLoyaltyZones() {
		return loyaltyZones;
	}
	public void setLoyaltyZones(Set<LoyaltyZones> loyaltyZones) {
		this.loyaltyZones = loyaltyZones;
	}
	public void setLoyaltyCardsList(List<LoyaltyCardMaster> loyaltyCardsList) {
		this.loyaltyCardsList = loyaltyCardsList;
	}
	public float getPointsConversionRatio() {
		return pointsConversionRatio;
	}
	public void setPointsConversionRatio(float pointsConversionRatio) {
		this.pointsConversionRatio = pointsConversionRatio;
	}
	public String getLoyaltyProgramDescription() {
		return loyaltyProgramDescription;
	}
	public void setLoyaltyProgramDescription(String loyaltyProgramDescription) {
		this.loyaltyProgramDescription = loyaltyProgramDescription;
	}
	/*public String getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}*/
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/*public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}*/
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public LoyaltyCardMaster getLoyaltyCardMaster() {
		return loyaltyCardMaster;
	}
	public void setLoyaltyCardMaster(LoyaltyCardMaster loyaltyCardMaster) {
		this.loyaltyCardMaster = loyaltyCardMaster;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public int getCardDetails_length() {
		return cardDetails_length;
	}
	public void setCardDetails_length(int cardDetails_length) {
		this.cardDetails_length = cardDetails_length;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getLoyaltyProgramNumber() {
		return loyaltyProgramNumber;
	}
	public void setLoyaltyProgramNumber(String loyaltyProgramNumber) {
		this.loyaltyProgramNumber = loyaltyProgramNumber;
	}
	public String getLoyaltyProgramName() {
		return loyaltyProgramName;
	}
	public void setLoyaltyProgramName(String loyaltyProgramName) {
		this.loyaltyProgramName = loyaltyProgramName;
	}
	public String getLoyalityProgramDescription() {
		return loyalityProgramDescription;
	}
	public void setLoyalityProgramDescription(String loyalityProgramDescription) {
		this.loyalityProgramDescription = loyalityProgramDescription;
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
	public String getValidFrom() {
		return validFrom;
	}
	public void setValidFrom(String validFrom) {
		this.validFrom = validFrom;
	}
	public String getValidTo() {
		return validTo;
	}
	public void setValidTo(String validTo) {
		this.validTo = validTo;
	}
	public Integer getValidityPeriod() {
		return validityPeriod;
	}
	public void setValidityPeriod(Integer validityPeriod) {
		this.validityPeriod = validityPeriod;
	}
	public String getRewardType() {
		return rewardType;
	}
	public void setRewardType(String rewardType) {
		this.rewardType = rewardType;
	}
	public Integer getRewardLifeTime() {
		return rewardLifeTime;
	}
	public void setRewardLifeTime(Integer rewardLifeTime) {
		this.rewardLifeTime = rewardLifeTime;
	}
	public Float getRewardConversionRatio() {
		return rewardConversionRatio;
	}
	public void setRewardConversionRatio(Float rewardConversionRatio) {
		this.rewardConversionRatio = rewardConversionRatio;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getLoyaltyCardType() {
		return loyaltyCardType;
	}
	public void setLoyaltyCardType(String loyaltyCardType) {
		this.loyaltyCardType = loyaltyCardType;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public List<LoyaltyCards> getLoyaltyCards() {
		return loyaltyCards;
	}
	public void setLoyaltyCards(List<LoyaltyCards> loyaltyCards) {
		this.loyaltyCards = loyaltyCards;
	}
	public List<CustomerLoyaltyCards> getCustomerLoyaltyCards() {
		return customerLoyaltyCards;
	}
	public void setCustomerLoyaltyCards(
			List<CustomerLoyaltyCards> customerLoyaltyCards) {
		this.customerLoyaltyCards = customerLoyaltyCards;
	}
	public LoyaltyCardMaster clone()
	{
		LoyaltyCardMaster loyaltyCardsInfo = null;
		try
		{
			loyaltyCardsInfo = (LoyaltyCardMaster) super.clone();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return loyaltyCardsInfo;
	}
	
	
	 public List<String> getLoyaltyProgramNumbers() {
		return loyaltyProgramNumbers;
	}
	public void setLoyaltyProgramNumbers(List<String> loyaltyProgramNumbers) {
		this.loyaltyProgramNumbers = loyaltyProgramNumbers;
	}
	private List<String> loyaltyProgramNumbers;
	
}
