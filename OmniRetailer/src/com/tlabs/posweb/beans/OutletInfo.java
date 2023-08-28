package com.tlabs.posweb.beans;

import java.util.List;



/**
 * @author mythri
 *
 */
/**
 * @author Mandeep
 *
 */
public class OutletInfo {
	private float minimumOrderValue;
	private boolean allStoreReturnBill;
	private boolean creditNoteOtp;
	private boolean shiftReportMandatory;
	private String companyName;
	private String instructions;
	
	private String storeCode;
	private String storeName;
	private String fax;
	private String phone;
	private int storeStatus;
	private String locationId=null;
	private String location;
	private String currency;
	private String language;
	private String startTime;
	private String endTime;
	private boolean remoteBilling;
	private boolean foodCoupons;
	private String minPayAmount;
	private boolean printing;
	private String gstIn;
	/* new fields for outlet */
	private String gpsLongitude;
	private String gpsLatitude;
	private String category;
	private String requiredRecords;
	private boolean dooorDelivery;
	private boolean exchange;
	private boolean returns;
	private String returnMode;
	private String street;

	private int draftAllowDays;
	
	private int stockSaleAllowDays;
	private String fssaiNumber;
	
    private boolean ftpUploadRequired;
    private String ftpServer;
    private String ftpPort;
    private String userId;
    private String password;
    private boolean posStockDisplay;
    private boolean autoSync;
    
    private Float b2cMaxValue;
    
    private boolean billOtp;
    
    private int expectedDeliveryTime;
    private String businessActivity;
    private int priceListCount;
    
    
    public int getPriceListCount() {
		return priceListCount;
	}
	public void setPriceListCount(int priceListCount) {
		this.priceListCount = priceListCount;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getInstructions() {
		return instructions;
	}
	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}
	public String getBusinessActivity() {
		return businessActivity;
	}
	public void setBusinessActivity(String businessActivity) {
		this.businessActivity = businessActivity;
	}
	public int getExpectedDeliveryTime() {
		return expectedDeliveryTime;
	}
	public void setExpectedDeliveryTime(int expectedDeliveryTime) {
		this.expectedDeliveryTime = expectedDeliveryTime;
	}
    
    public boolean isBillOtp() {
		return billOtp;
	}
	public void setBillOtp(boolean billOtp) {
		this.billOtp = billOtp;
	}
	
	
	public String getFssaiNumber() {
		return fssaiNumber;
	}
	public Float getB2cMaxValue() {
		return b2cMaxValue;
	}
	public void setB2cMaxValue(Float b2cMaxValue) {
		this.b2cMaxValue = b2cMaxValue;
	}
	public void setFssaiNumber(String fssaiNumber) {
		this.fssaiNumber = fssaiNumber;
	}
	public boolean isAutoSync() {
		return autoSync;
	}
	public void setAutoSync(boolean autoSync) {
		this.autoSync = autoSync;
	}
	public boolean isPosStockDisplay() {
		return posStockDisplay;
	}
	public void setPosStockDisplay(boolean posStockDisplay) {
		this.posStockDisplay = posStockDisplay;
	}
	public float getMinimumOrderValue() {
		return minimumOrderValue;
	}
	public void setMinimumOrderValue(float minimumOrderValue) {
		this.minimumOrderValue = minimumOrderValue;
	}
	public boolean isAllStoreReturnBill() {
		return allStoreReturnBill;
	}
	public void setAllStoreReturnBill(boolean allStoreReturnBill) {
		this.allStoreReturnBill = allStoreReturnBill;
	}
	public boolean isCreditNoteOtp() {
		return creditNoteOtp;
	}
	public void setCreditNoteOtp(boolean creditNoteOtp) {
		this.creditNoteOtp = creditNoteOtp;
	}
	public boolean isShiftReportMandatory() {
		return shiftReportMandatory;
	}
	public void setShiftReportMandatory(boolean shiftReportMandatory) {
		this.shiftReportMandatory = shiftReportMandatory;
	}
	public boolean isFtpUploadRequired() {
		return ftpUploadRequired;
	}
	public void setFtpUploadRequired(boolean ftpUploadRequired) {
		this.ftpUploadRequired = ftpUploadRequired;
	}
	public String getFtpServer() {
		return ftpServer;
	}
	public void setFtpServer(String ftpServer) {
		this.ftpServer = ftpServer;
	}
	public String getFtpPort() {
		return ftpPort;
	}
	public void setFtpPort(String ftpPort) {
		this.ftpPort = ftpPort;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getStockSaleAllowDays() {
		return stockSaleAllowDays;
	}
	public void setStockSaleAllowDays(int stockSaleAllowDays) {
		this.stockSaleAllowDays = stockSaleAllowDays;
	}
	public int getDraftAllowDays() {
		return draftAllowDays;
	}
	public void setDraftAllowDays(int draftAllowDays) {
		this.draftAllowDays = draftAllowDays;
	}
	private boolean offlineDuplicateBill;
	private boolean creditNoteMultipleClaims;
	private boolean counterOTP;
	private boolean returnBillRefRequired;
	private String suspendReason;
	
	
	
	public boolean isReturnBillRefRequired() {
		return returnBillRefRequired;
	}
	public void setReturnBillRefRequired(boolean returnBillRefRequired) {
		this.returnBillRefRequired = returnBillRefRequired;
	}
	public String getSuspendReason() {
		return suspendReason;
	}
	public void setSuspendReason(String suspendReason) {
		this.suspendReason = suspendReason;
	}
	public boolean isCreditNoteMultipleClaims() {
		return creditNoteMultipleClaims;
	}
	public void setCreditNoteMultipleClaims(boolean creditNoteMultipleClaims) {
		this.creditNoteMultipleClaims = creditNoteMultipleClaims;
	}
	public boolean isOfflineDuplicateBill() {
		return offlineDuplicateBill;
	}
	public void setOfflineDuplicateBill(boolean offlineDuplicateBill) {
		this.offlineDuplicateBill = offlineDuplicateBill;
	}
	public boolean isCounterOTP() {
		return counterOTP;
	}
	public void setCounterOTP(boolean counterOTP) {
		this.counterOTP = counterOTP;
	}
	private int exchangeAllowDays;
	private int returnAllowDays;
	private int cancelAllowDays;
	public int getExchangeAllowDays() {
		return exchangeAllowDays;
	}
	public void setExchangeAllowDays(int exchangeAllowDays) {
		this.exchangeAllowDays = exchangeAllowDays;
	}
	public int getReturnAllowDays() {
		return returnAllowDays;
	}
	public void setReturnAllowDays(int returnAllowDays) {
		this.returnAllowDays = returnAllowDays;
	}
	public int getCancelAllowDays() {
		return cancelAllowDays;
	}
	public void setCancelAllowDays(int cancelAllowDays) {
		this.cancelAllowDays = cancelAllowDays;
	}
	private String signature;
	
	private String sigantureImageRef;
	
	public String getSigantureImageRef() {
		return sigantureImageRef;
	}
	public void setSigantureImageRef(String sigantureImageRef) {
		this.sigantureImageRef = sigantureImageRef;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	private String locality;
	private String email;
	private Float periphery;
	private boolean secured;
	private boolean remoteMonitoring;
	/*new table for facilities info */
	private List<StoreFacilities> facilitiesInfo;
	private String startIndex;
	private List<OutletInfo> outlets;
	private boolean employeeSaleId;
	private String warehouseId;
	private Integer leadTime;
	/* for logging info */
	private String userName;
	private String roleName;
	RequestHeader requestHeader;
	ResponseHeader responseHeader;
	private String type;
	private String totalRecords;
	private int slNo;
	private String barcodeType;
	private String exchangeMode;
	private boolean telephonicOrders;
	private boolean onlineOrders;
	private boolean attendanceEnabled;
	private boolean offlineMode;
	private boolean mobileSecurity;
	private String outletType;
	private boolean outletStatus;
	private String companyOwned;
	private String stockVerificationType;
	private Integer offLineDataTimedOutDays;
	private Integer offLineDataTimedOutHours;
	private String zoneId;
	private boolean manualDiscounts;
	private String discountCalculatedOn;
	private String discountTaxation;
	private boolean employeeDiscounts;
	private Boolean roundingRequired;
	private boolean productsMenu;
	private boolean stockRequest;
	private boolean stockReciept;
	private String tollFreeNum;
	 private boolean stockIssue;
	 private boolean zeroStock;
	 private boolean stockReturn;
	 private boolean outletGrn;
	 private boolean latestCampaigns;
	private int countersCount;
	private Boolean billId = false;
	private boolean enforceDenominations;
	private boolean enforceVoidItemsReason;
	private boolean enforceBillCancelReason;
	private boolean dayStartSync;
	
	private String createdDatestr;
	private String updatedDatestr;
	
	private Float maximumCashLimit;
	private boolean requiredCustomerNumber;
	private int creditNoteExpiryDays;
	
	
	private boolean dayOpenMandatory;
	private boolean multipleStockReceipts;
	private int stockMaintainDays;
	
	
	
	
	
	
	
	
	public int getStockMaintainDays() {
		return stockMaintainDays;
	}
	public void setStockMaintainDays(int stockMaintainDays) {
		this.stockMaintainDays = stockMaintainDays;
	}
	public boolean isMultipleStockReceipts() {
		return multipleStockReceipts;
	}
	public void setMultipleStockReceipts(boolean multipleStockReceipts) {
		this.multipleStockReceipts = multipleStockReceipts;
	}
	public int getCreditNoteExpiryDays() {
		return creditNoteExpiryDays;
	}
	public void setCreditNoteExpiryDays(int creditNoteExpiryDays) {
		this.creditNoteExpiryDays = creditNoteExpiryDays;
	}
	public boolean isRequiredCustomerNumber() {
		return requiredCustomerNumber;
	}
	public void setRequiredCustomerNumber(boolean requiredCustomerNumber) {
		this.requiredCustomerNumber = requiredCustomerNumber;
	}
	public Float getMaximumCashLimit() {
		return maximumCashLimit;
	}
	public void setMaximumCashLimit(Float maximumCashLimit) {
		this.maximumCashLimit = maximumCashLimit;
	}
	public boolean isDayOpenMandatory() {
		return dayOpenMandatory;
	}
	public void setDayOpenMandatory(boolean dayOpenMandatory) {
		this.dayOpenMandatory = dayOpenMandatory;
	}
	public String getCreatedDatestr() {
		return createdDatestr;
	}
	public void setCreatedDatestr(String createdDatestr) {
		this.createdDatestr = createdDatestr;
	}
	public String getUpdatedDatestr() {
		return updatedDatestr;
	}
	public void setUpdatedDatestr(String updatedDatestr) {
		this.updatedDatestr = updatedDatestr;
	}
	private String timeOutStr;
	private Boolean isInventoryRequired;
	private Boolean isVirtualStore;
	private Boolean cardinfo;

	
	
	//@Column(name = "test_store")
	private boolean testStore;

	public String getTimeOutStr() {
		return timeOutStr;
	}
	public void setTimeOutStr(String timeOutStr) {
		this.timeOutStr = timeOutStr;
	}
	public Boolean getIsInventoryRequired() {
		return isInventoryRequired;
	}
	public void setIsInventoryRequired(Boolean isInventoryRequired) {
		this.isInventoryRequired = isInventoryRequired;
	}
	public Boolean getIsVirtualStore() {
		return isVirtualStore;
	}
	public void setIsVirtualStore(Boolean isVirtualStore) {
		this.isVirtualStore = isVirtualStore;
	}
	public Boolean getCardinfo() {
		return cardinfo;
	}
	public void setCardinfo(Boolean cardinfo) {
		this.cardinfo = cardinfo;
	}
	//@Column(name = "edit_price")
	private boolean editPrice;

	//@Column(name = "master_flag")
	private boolean masterFlag;
	
	private boolean hybrid_mode;
	
	public boolean isHybrid_mode() {
		return hybrid_mode;
	}
	public void setHybrid_mode(boolean hybrid_mode) {
		this.hybrid_mode = hybrid_mode;
	}
	public boolean isTestStore() {
		return testStore;
	}
	public void setTestStore(boolean testStore) {
		this.testStore = testStore;
	}
	public boolean isEditPrice() {
		return editPrice;
	}
	public void setEditPrice(boolean editPrice) {
		this.editPrice = editPrice;
	}
	public boolean isMasterFlag() {
		return masterFlag;
	}
	public void setMasterFlag(boolean masterFlag) {
		this.masterFlag = masterFlag;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getLocality() {
		return locality;
	}
	public void setLocality(String locality) {
		this.locality = locality;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Float getPeriphery() {
		return periphery;
	}
	public void setPeriphery(Float periphery) {
		this.periphery = periphery;
	}
	public boolean isSecured() {
		return secured;
	}
	public void setSecured(boolean secured) {
		this.secured = secured;
	}
	public boolean isRemoteMonitoring() {
		return remoteMonitoring;
	}
	public void setRemoteMonitoring(boolean remoteMonitoring) {
		this.remoteMonitoring = remoteMonitoring;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<OutletInfo> getOutlets() {
		return outlets;
	}
	public void setOutlets(List<OutletInfo> outlets) {
		this.outlets = outlets;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
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
	public List<StoreFacilities> getFacilitiesInfo() {
		return facilitiesInfo;
	}
	public void setFacilitiesInfo(List<StoreFacilities> facilitiesInfo) {
		this.facilitiesInfo = facilitiesInfo;
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
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getStoreStatus() {
		return storeStatus;
	}
	public void setStoreStatus(int storeStatus) {
		this.storeStatus = storeStatus;
	}
	public String getLocationId() {
		return locationId;
	}
	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public boolean isRemoteBilling() {
		return remoteBilling;
	}
	public void setRemoteBilling(boolean remoteBilling) {
		this.remoteBilling = remoteBilling;
	}
	public boolean isFoodCoupons() {
		return foodCoupons;
	}
	public void setFoodCoupons(boolean foodCoupons) {
		this.foodCoupons = foodCoupons;
	}
	public String getMinPayAmount() {
		return minPayAmount;
	}
	public void setMinPayAmount(String minPayAmount) {
		this.minPayAmount = minPayAmount;
	}
	public boolean isPrinting() {
		return printing;
	}
	public void setPrinting(boolean printing) {
		this.printing = printing;
	}
	public String getGpsLongitude() {
		return gpsLongitude;
	}
	public void setGpsLongitude(String gpsLongitude) {
		this.gpsLongitude = gpsLongitude;
	}
	public String getGpsLatitude() {
		return gpsLatitude;
	}
	public void setGpsLatitude(String gpsLatitude) {
		this.gpsLatitude = gpsLatitude;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public boolean isDooorDelivery() {
		return dooorDelivery;
	}
	public void setDooorDelivery(boolean dooorDelivery) {
		this.dooorDelivery = dooorDelivery;
	}
	public boolean isExchange() {
		return exchange;
	}
	public void setExchange(boolean exchange) {
		this.exchange = exchange;
	}
	public boolean isReturns() {
		return returns;
	}
	public void setReturns(boolean returns) {
		this.returns = returns;
	}
	public String getReturnMode() {
		return returnMode;
	}
	public void setReturnMode(String returnMode) {
		this.returnMode = returnMode;
	}
	public boolean isEmployeeSaleId() {
		return employeeSaleId;
	}
	public void setEmployeeSaleId(boolean employeeSaleId) {
		this.employeeSaleId = employeeSaleId;
	}
	public String getWarehouseId() {
		return warehouseId;
	}
	public void setWarehouseId(String warehouseId) {
		this.warehouseId = warehouseId;
	}
	public Integer getLeadTime() {
		return leadTime;
	}
	public void setLeadTime(Integer leadTime) {
		this.leadTime = leadTime;
	}
	public String getBarcodeType() {
		return barcodeType;
	}
	public void setBarcodeType(String barcodeType) {
		this.barcodeType = barcodeType;
	}
	public boolean isTelephonicOrders() {
		return telephonicOrders;
	}
	public void setTelephonicOrders(boolean telephonicOrders) {
		this.telephonicOrders = telephonicOrders;
	}
	public boolean isOnlineOrders() {
		return onlineOrders;
	}
	public void setOnlineOrders(boolean onlineOrders) {
		this.onlineOrders = onlineOrders;
	}
	public boolean isAttendanceEnabled() {
		return attendanceEnabled;
	}
	public void setAttendanceEnabled(boolean attendanceEnabled) {
		this.attendanceEnabled = attendanceEnabled;
	}
	public boolean isOfflineMode() {
		return offlineMode;
	}
	public void setOfflineMode(boolean offlineMode) {
		this.offlineMode = offlineMode;
	}
	public boolean isMobileSecurity() {
		return mobileSecurity;
	}
	public void setMobileSecurity(boolean mobileSecurity) {
		this.mobileSecurity = mobileSecurity;
	}
	public String getOutletType() {
		return outletType;
	}
	public void setOutletType(String outletType) {
		this.outletType = outletType;
	}
	public String getCompanyOwned() {
		return companyOwned;
	}
	public void setCompanyOwned(String companyOwned) {
		this.companyOwned = companyOwned;
	}
	public String getStockVerificationType() {
		return stockVerificationType;
	}
	public void setStockVerificationType(String stockVerificationType) {
		this.stockVerificationType = stockVerificationType;
	}
	public Integer getOffLineDataTimedOutDays() {
		return offLineDataTimedOutDays;
	}
	public void setOffLineDataTimedOutDays(Integer offLineDataTimedOutDays) {
		this.offLineDataTimedOutDays = offLineDataTimedOutDays;
	}
	public Integer getOffLineDataTimedOutHours() {
		return offLineDataTimedOutHours;
	}
	public void setOffLineDataTimedOutHours(Integer offLineDataTimedOutHours) {
		this.offLineDataTimedOutHours = offLineDataTimedOutHours;
	}
	public String getZoneId() {
		return zoneId;
	}
	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}
	public boolean isManualDiscounts() {
		return manualDiscounts;
	}
	public void setManualDiscounts(boolean manualDiscounts) {
		this.manualDiscounts = manualDiscounts;
	}
	public String getDiscountCalculatedOn() {
		return discountCalculatedOn;
	}
	public void setDiscountCalculatedOn(String discountCalculatedOn) {
		this.discountCalculatedOn = discountCalculatedOn;
	}
	public String getDiscountTaxation() {
		return discountTaxation;
	}
	public void setDiscountTaxation(String discountTaxation) {
		this.discountTaxation = discountTaxation;
	}
	public boolean isEmployeeDiscounts() {
		return employeeDiscounts;
	}
	public void setEmployeeDiscounts(boolean employeeDiscounts) {
		this.employeeDiscounts = employeeDiscounts;
	}
	public boolean isProductsMenu() {
		return productsMenu;
	}
	public void setProductsMenu(boolean productsMenu) {
		this.productsMenu = productsMenu;
	}
	public int getCountersCount() {
		return countersCount;
	}
	public void setCountersCount(int countersCount) {
		this.countersCount = countersCount;
	}
	public Boolean getOutletStatus() {
		return outletStatus;
	}
	public void setOutletStatus(Boolean outletStatus) {
		this.outletStatus = outletStatus;
	}
	public Boolean getBillId() {
		return billId;
	}
	public void setBillId(Boolean billId) {
		this.billId = billId;
	}
	public Boolean getRoundingRequired() {
		return roundingRequired;
	}
	public void setRoundingRequired(Boolean roundingRequired) {
		this.roundingRequired = roundingRequired;
	}
	public boolean isStockRequest() {
		return stockRequest;
	}
	public void setStockRequest(boolean stockRequest) {
		this.stockRequest = stockRequest;
	}
	public boolean isStockReciept() {
		return stockReciept;
	}
	public void setStockReciept(boolean stockReciept) {
		this.stockReciept = stockReciept;
	}
	public boolean isStockIssue() {
		return stockIssue;
	}
	public void setStockIssue(boolean stockIssue) {
		this.stockIssue = stockIssue;
	}
	public boolean isStockReturn() {
		return stockReturn;
	}
	public void setStockReturn(boolean stockReturn) {
		this.stockReturn = stockReturn;
	}
	public boolean isOutletGrn() {
		return outletGrn;
	}
	public void setOutletGrn(boolean outletGrn) {
		this.outletGrn = outletGrn;
	}
	public String getExchangeMode() {
		return exchangeMode;
	}
	public void setExchangeMode(String exchangeMode) {
		this.exchangeMode = exchangeMode;
	}
	public String getTollFreeNum() {
		return tollFreeNum;
	}
	public void setTollFreeNum(String tollFreeNum) {
		this.tollFreeNum = tollFreeNum;
	}
	public boolean isZeroStock() {
		return zeroStock;
	}
	public void setZeroStock(boolean zeroStock) {
		this.zeroStock = zeroStock;
	}
	public boolean isLatestCampaigns() {
		return latestCampaigns;
	}
	public void setLatestCampaigns(boolean latestCampaigns) {
		this.latestCampaigns = latestCampaigns;
	}
	public String getGstIn() {
		return gstIn;
	}
	public void setGstIn(String gstIn) {
		this.gstIn = gstIn;
	}
	public String getRequiredRecords() {
		return requiredRecords;
	}
	public void setRequiredRecords(String requiredRecords) {
		this.requiredRecords = requiredRecords;
	}
	public boolean isEnforceDenominations() {
		return enforceDenominations;
	}
	public void setEnforceDenominations(boolean enforceDenominations) {
		this.enforceDenominations = enforceDenominations;
	}
	public boolean isEnforceVoidItemsReason() {
		return enforceVoidItemsReason;
	}
	public void setEnforceVoidItemsReason(boolean enforceVoidItemsReason) {
		this.enforceVoidItemsReason = enforceVoidItemsReason;
	}
	public boolean isEnforceBillCancelReason() {
		return enforceBillCancelReason;
	}
	public void setEnforceBillCancelReason(boolean enforceBillCancelReason) {
		this.enforceBillCancelReason = enforceBillCancelReason;
	}
	public boolean isDayStartSync() {
		return dayStartSync;
	}
	public void setDayStartSync(boolean dayStartSync) {
		this.dayStartSync = dayStartSync;
	}
	
	
}
