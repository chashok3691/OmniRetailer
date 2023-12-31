package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;




public class CustomerWalletMaster {

	
	private String walletProgramId;
	
	
	private String walletProgramName;
	

	private String walletType;
	
	
	private boolean otpRequired;
	
	
	private String createdDate;
	
	
	private String updatedDate;
	
	
	private String startDate;
	
	
	private String endDate;
	
	
	private Float minBillAmount;
	
	
	private Float maxBillAmount;
	
	
	private Float minCashDeposit;
	
	
	private Float maxCashDeposit;
	
	
	private Float signupCash;
	
	
	private Float activationFee;
	
	
	private Float renewalFee;
	
	
	private int renewalPeriod;
	
	
	private boolean status;
	
	
	private boolean autoAssigned;
	

	private String userName;
	
	
	private String roleName;
	
	
	private String createdDateStr;
	
	
	private String updatedDateStr;
	
	private float memberPrice;
	
	
	private BigDecimal maxBillAmt;

	private BigDecimal maxCashDepositNum;
	private String walletSearchCriteria;
	
	private boolean importFlag;
	private String uploadedfilePath;
	private Integer quantity;
	private boolean autoGenerated;
	private Integer noOfWallets;
	private Float maxTopupAmt;
	private String filePath;
	
	
	
	
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Float getMaxTopupAmt() {
		return maxTopupAmt;
	}
	public void setMaxTopupAmt(Float maxTopupAmt) {
		this.maxTopupAmt = maxTopupAmt;
	}
	public Integer getNoOfWallets() {
		return noOfWallets;
	}
	public void setNoOfWallets(Integer noOfWallets) {
		this.noOfWallets = noOfWallets;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public boolean isAutoGenerated() {
		return autoGenerated;
	}
	public void setAutoGenerated(boolean autoGenerated) {
		this.autoGenerated = autoGenerated;
	}
	public boolean isImportFlag() {
		return importFlag;
	}
	public void setImportFlag(boolean importFlag) {
		this.importFlag = importFlag;
	}
	public String getUploadedfilePath() {
		return uploadedfilePath;
	}
	public void setUploadedfilePath(String uploadedfilePath) {
		this.uploadedfilePath = uploadedfilePath;
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
	

	private List<CustomerWallets> wallets;
	
    private List<CustomerWalletLocations> customerWalletLocations;
	

	
	
	
	public List<CustomerWalletLocations> getCustomerWalletLocations() {
		return customerWalletLocations;
	}
	public void setCustomerWalletLocations(List<CustomerWalletLocations> customerWalletLocations) {
		this.customerWalletLocations = customerWalletLocations;
	}
	
	
	
	public String getZone() {
		return zone;
	}

	private String startDateStr;
	
	
	private String endDateStr;
	
	private int validityPeriod;
	
	private String country;
	
	private String zone;
	private List<String> zoneList;
	private String responseMessage;
	
	private String startIndex;
	private int totalRecords;
	private int totalWallets;
	
	
	
	

	
	
	public int getTotalWallets() {
		return totalWallets;
	}
	public void setTotalWallets(int totalWallets) {
		this.totalWallets = totalWallets;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getResponseMessage() {
		return responseMessage;
	}

	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}

	private List<String> locationsList;
	
	private String location;
	
	private RequestHeader requestHeader;
	
	
	public List<String> getZoneList() {
		return zoneList;
	}

	public void setZoneList(List<String> zoneList) {
		this.zoneList = zoneList;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}


	public List<String> getLocationsList() {
		return locationsList;
	}

	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}

	public int getValidityPeriod() {
		return validityPeriod;
	}

	public void setValidityPeriod(int validityPeriod) {
		this.validityPeriod = validityPeriod;
	}

	public float getMemberPrice() {
		return memberPrice;
	}

	public void setMemberPrice(float memberPrice) {
		this.memberPrice = memberPrice;
	}

	public String getWalletType() {
		return walletType;
	}

	public void setWalletType(String walletType) {
		this.walletType = walletType;
	}

	public List<CustomerWallets> getWallets() {
		return wallets;
	}

	public void setWallets(List<CustomerWallets> wallets) {
		this.wallets = wallets;
	}

	public boolean isAutoAssigned() {
		return autoAssigned;
	}

	public void setAutoAssigned(boolean autoAssigned) {
		this.autoAssigned = autoAssigned;
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

	public Float getRenewalFee() {
		return renewalFee;
	}

	public void setRenewalFee(Float renewalFee) {
		this.renewalFee = renewalFee;
	}

	public int getRenewalPeriod() {
		return renewalPeriod;
	}

	public void setRenewalPeriod(int renewalPeriod) {
		this.renewalPeriod = renewalPeriod;
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

	public List<CustomerLedger> getCustomerLedgers() {
		return customerLedgers;
	}

	public void setCustomerLedgers(List<CustomerLedger> customerLedgers) {
		this.customerLedgers = customerLedgers;
	}

	public boolean isOtpRequired() {
		return otpRequired;
	}

	public String getWalletProgramId() {
		return walletProgramId;
	}

	public void setWalletProgramId(String walletProgramId) {
		this.walletProgramId = walletProgramId;
	}

	public String getWalletProgramName() {
		return walletProgramName;
	}

	public void setWalletProgramName(String walletProgramName) {
		this.walletProgramName = walletProgramName;
	}



	public Float getMinBillAmount() {
		return minBillAmount;
	}

	public void setMinBillAmount(Float minBillAmount) {
		this.minBillAmount = minBillAmount;
	}

	public Float getMaxBillAmount() {
		return maxBillAmount;
	}

	public void setMaxBillAmount(Float maxBillAmount) {
		this.maxBillAmount = maxBillAmount;
	}

	public Float getMinCashDeposit() {
		return minCashDeposit;
	}

	public void setMinCashDeposit(Float minCashDeposit) {
		this.minCashDeposit = minCashDeposit;
	}

	public Float getMaxCashDeposit() {
		return maxCashDeposit;
	}

	public void setMaxCashDeposit(Float maxCashDeposit) {
		this.maxCashDeposit = maxCashDeposit;
	}

	public Float getSignupCash() {
		return signupCash;
	}

	public void setSignupCash(Float signupCash) {
		this.signupCash = signupCash;
	}

	public Float getActivationFee() {
		return activationFee;
	}

	public void setActivationFee(Float activationFee) {
		this.activationFee = activationFee;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public void setOtpRequired(boolean otpRequired) {
		this.otpRequired = otpRequired;
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

	

	public String getCreatedDate() {
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
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
}
