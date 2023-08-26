package com.tlabs.posweb.beans;

public class CustomerLoyaltyCards{

	private String loyaltyCardNumber;
	private String customerName;
	private String phoneNum;
	private String email;
	private float pointsEarned;
	private float pointsUsed;
	private float pointsRemaining;
	private float cash;
	private String idCardType;
	private String idCardNumber;
	private String status;
	private String loyaltyProgramNumber;
	private String cardId;
	
	
	private Boolean otpRequired;

	
	ResponseHeader responseHeader;

	
	RequestHeader requestHeader;
	
	private String validFrom;
	
	private String validTo;
	
	private String loyaltyProgramName;
	
	
	
	private String issuedOn;
	private String issueTo;
	private String issuedOnStr;
     private String issueToStr;

	
	
	/*private String createdDate;
	
	
	private String updatedDate;*/
	
	
	public String getIssuedOnStr() {
		return issuedOnStr;
	}
	public void setIssuedOnStr(String issuedOnStr) {
		this.issuedOnStr = issuedOnStr;
	}
	public String getIssueToStr() {
		return issueToStr;
	}
	public void setIssueToStr(String issueToStr) {
		this.issueToStr = issueToStr;
	}
	public String getIssueTo() {
		return issueTo;
	}
	public void setIssueTo(String issueTo) {
		this.issueTo = issueTo;
	}
	private String userName;
	

	private String roleName;
	
	
	private String createdDateStr;
	

	private String updatedDateStr;
	
private Float minRedeemPoints;
	
	private Float minClaimPoints;
	
	private Float rewardConversionRatio;
	
	
	
	
	
	public Float getMinRedeemPoints() {
		return minRedeemPoints;
	}
	public void setMinRedeemPoints(Float minRedeemPoints) {
		this.minRedeemPoints = minRedeemPoints;
	}
	public Float getMinClaimPoints() {
		return minClaimPoints;
	}
	public void setMinClaimPoints(Float minClaimPoints) {
		this.minClaimPoints = minClaimPoints;
	}
	public Float getRewardConversionRatio() {
		return rewardConversionRatio;
	}
	public void setRewardConversionRatio(Float rewardConversionRatio) {
		this.rewardConversionRatio = rewardConversionRatio;
	}
	public Boolean getOtpRequired() {
		return otpRequired;
	}
	public void setOtpRequired(Boolean otpRequired) {
		this.otpRequired = otpRequired;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
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
	public String getLoyaltyProgramName() {
		return loyaltyProgramName;
	}
	public void setLoyaltyProgramName(String loyaltyProgramName) {
		this.loyaltyProgramName = loyaltyProgramName;
	}

	public String getIssuedOn() {
		return issuedOn;
	}
	public void setIssuedOn(String issuedOn) {
		this.issuedOn = issuedOn;
	}
	/*public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getUpdatedDate() {
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
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
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
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public String getLoyaltyCardNumber() {
		return loyaltyCardNumber;
	}
	public void setLoyaltyCardNumber(String loyaltyCardNumber) {
		this.loyaltyCardNumber = loyaltyCardNumber;
	}
	
	public String getLoyaltyProgramNumber() {
		return loyaltyProgramNumber;
	}
	public void setLoyaltyProgramNumber(String loyaltyProgramNumber) {
		this.loyaltyProgramNumber = loyaltyProgramNumber;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public float getPointsEarned() {
		return pointsEarned;
	}
	public void setPointsEarned(float pointsEarned) {
		this.pointsEarned = pointsEarned;
	}
	public float getPointsUsed() {
		return pointsUsed;
	}
	public void setPointsUsed(float pointsUsed) {
		this.pointsUsed = pointsUsed;
	}
	public float getPointsRemaining() {
		return pointsRemaining;
	}
	public void setPointsRemaining(float pointsRemaining) {
		this.pointsRemaining = pointsRemaining;
	}
	
	public float getCash() {
		return cash;
	}
	public void setCash(float cash) {
		this.cash = cash;
	}
	public String getIdCardType() {
		return idCardType;
	}
	public void setIdCardType(String idCardType) {
		this.idCardType = idCardType;
	}
	public String getIdCardNumber() {
		return idCardNumber;
	}
	public void setIdCardNumber(String idCardNumber) {
		this.idCardNumber = idCardNumber;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	
}
