package com.tlabs.posweb.beans;

import java.util.List;




public class WarehouseBean {

	private String warehouseId;
	private RequestHeader requestHeader;
	private String warehouse_code;
	private String warehouse_name;
	private String warehouse_type;
	private String address_1;
	private String address_2;
	private String fax;
	private String phone_number;
	private String city;
	private String state;
	private String zip;
	private String warehouse_status;
	private String startIndex;
	private String country;
	private List<WarehouseStorageSystems> storageSystems;
	private String warehouseLocation = null;
	private String type;
	private List<?> warehouseIds;
	private ResponseHeader responseHeader;
	
	private String gpsLongitude;
	private String gpsLatitude;
	private String category;
	
	private boolean isWarehouse;

	
	
	private String locality;
	
	private String email;
	
	private Float periphery;
	
	private boolean secured;
	
	private boolean remoteMonitoring;
	
	private boolean employeeSaleId;
	
	private boolean testWarehouse;

	private boolean masterFlag;
	
	private String companyOwned;
	
	private String stockVerificationType;
	
	private boolean stockRequest;
	
	private boolean stockReciept;
	
	private boolean stockIssue;
	
	private boolean stockReturn;
	
	private boolean warehouseGrn; 
	
	 
	private boolean authorizedPicklist; 
	
	private boolean posEnabled;
	
	private boolean isItFranchise;
	
	private boolean isItDistributionCenter;
	
	private boolean storageSystemEnabled;
	
	private String gstin;
	
	private int radius;
	
	private String createdDateStr;
	
	private String updatedDateStr;
	
	private String startTimeStr;
	
	private String endTimeStr;
	
	private boolean stockAlerts;
	
	private boolean onlineOrder;
	
	private boolean telephonicOrder;
	
	private boolean billingAndDelivery;
	
	private boolean purchaseOrder;
	
	private boolean shipmentReturn;
	
	private String mainWarehouse;
	


	private String storeCode;
	private String storeName;
	//private String fax;
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
	private int stockSaleAllowDays;
	
	private boolean billOtp;
	
	
	
	public boolean isBillOtp() {
		return billOtp;
	}

	public void setBillOtp(boolean billOtp) {
		this.billOtp = billOtp;
	}

	public int getStockSaleAllowDays() {
		return stockSaleAllowDays;
	}

	public void setStockSaleAllowDays(int stockSaleAllowDays) {
		this.stockSaleAllowDays = stockSaleAllowDays;
	}

	private Double minOrderValue;
	/* new fields for outlet */
	//private String gpsLongitude;
	//private String gpsLatitude;
	//private String category;
	
	private boolean dooorDelivery;
	private boolean exchange;
	private boolean returns;
	
	/*new table for facilities info */
	private List<StoreFacilities> facilitiesInfo;
	
	/* for logging info */
	private String userName;
	private String roleName;
	private String returnMode;
	private String street;
	//private String locality;
	//private String email;
	//private Float periphery;
	//private boolean secured;
	//private boolean remoteMonitoring;
	//private boolean employeeSaleId;
	//private String warehouseId;
	private Integer leadTime;
	private String barcodeType;
	
	//private RequestHeader requestHeader;

	private Boolean telephonicOrders;
	private Boolean onlineOrders;
	private Boolean attendanceEnabled;
	private Boolean offlineMode;
	private Boolean mobileSecurity;
	private String outletType;
	//private String companyOwned;
	//private String stockVerificationType;
	private Integer offLineDataTimedOutDays;
	private Integer offLineDataTimedOutHours;
	private int countersCount;

	private String zoneId;
	private Boolean billId;
	private boolean multipleStockReceipts;
	private int stockMaintainDays;
	private boolean orderNotification;
	private int orderTimePeriod;
	private String weekDays;
	private boolean returnBillRefRequired;
	private String outletImage1;
	private String outletImage2;
	private String outletImage3;
	
	private boolean ftpUploadRequired;
	private String ftpServer;
	private String ftpPort;
	private String userId;
	private String password;
	
	private boolean creditNoteOtp;
	
	private Boolean cardInfo;
	
	

	
    public Boolean getCardInfo() {
		return cardInfo;
	}

	public void setCardInfo(Boolean cardInfo) {
		this.cardInfo = cardInfo;
	}

	public boolean isCreditNoteOtp() {
		return creditNoteOtp;
	}

	public void setCreditNoteOtp(boolean creditNoteOtp) {
		this.creditNoteOtp = creditNoteOtp;
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

	public String getOutletImage1() {
		return outletImage1;
	}

	public void setOutletImage1(String outletImage1) {
		this.outletImage1 = outletImage1;
	}

	public String getOutletImage2() {
		return outletImage2;
	}

	public void setOutletImage2(String outletImage2) {
		this.outletImage2 = outletImage2;
	}

	public String getOutletImage3() {
		return outletImage3;
	}

	public void setOutletImage3(String outletImage3) {
		this.outletImage3 = outletImage3;
	}

	public String getWeekDays() {
		return weekDays;
	}

	public boolean isReturnBillRefRequired() {
		return returnBillRefRequired;
	}

	public void setReturnBillRefRequired(boolean returnBillRefRequired) {
		this.returnBillRefRequired = returnBillRefRequired;
	}

	public void setWeekDays(String weekDays) {
		this.weekDays = weekDays;
	}

	public Double getMinOrderValue() {
		return minOrderValue;
	}

	public void setMinOrderValue(Double minOrderValue) {
		this.minOrderValue = minOrderValue;
	}

	private boolean offlineDuplicateBill;
    
    private boolean counterOTP;
    
    private boolean hybrid_mode;
    private String suspendReason;
	

	public String getSuspendReason() {
		return suspendReason;
	}

	public void setSuspendReason(String suspendReason) {
		this.suspendReason = suspendReason;
	}

	public boolean isOrderNotification() {
		return orderNotification;
	}

	public void setOrderNotification(boolean orderNotification) {
		this.orderNotification = orderNotification;
	}

	public int getOrderTimePeriod() {
		return orderTimePeriod;
	}

	public void setOrderTimePeriod(int orderTimePeriod) {
		this.orderTimePeriod = orderTimePeriod;
	}

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

	public boolean getOfflineDuplicateBill() {
		return offlineDuplicateBill;
	}

	public void setOfflineDuplicateBill(boolean offlineDuplicateBill) {
		this.offlineDuplicateBill = offlineDuplicateBill;
	}

	public boolean getCounterOTP() {
		return counterOTP;
	}

	public void setCounterOTP(boolean    counterOTP) {
		this.counterOTP = counterOTP;
	}

	/*new fields added on 30-1-2017 */
	private boolean manualDiscounts;
	private String discountCalculatedOn;
	private String discountTaxation;
	private boolean employeeDiscounts;
	private boolean productsMenu;
	
	//private boolean stockRequest;
	//private boolean stockReciept;
	//private boolean stockIssue;
	//private boolean stockReturn;
	private boolean outletGrn;
	
	private boolean roundingRequired;
	private boolean outletStatus;
	private String exchangeMode;
	private String tollFreeNum;
	private boolean zeroStock;
	private boolean latestCampaigns;

	private String gstIn;
	
    private boolean enforceDenominations;
    
    private boolean enforceVoidItemsReason;
    
    private boolean enforceBillCancelReason;
    private boolean testStore;

	private boolean editPrice;

	//private boolean masterFlag;
	private boolean dayStartSync;
	private Boolean cardinfo;
	private String timeOutStr;
	private Boolean isInventoryRequired;
	private Boolean isVirtualStore;


	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getSigantureImageRef() {
		return sigantureImageRef;
	}

	public void setSigantureImageRef(String sigantureImageRef) {
		this.sigantureImageRef = sigantureImageRef;
	}

	private String signature;


	//private String storeCode;
	private String sigantureImageRef;



//added by M.Srivani on 3/1/2018

	private String createdDatestr;
	private String updatedDatestr;
	private int exchangeAllowDays;
	private int returnAllowDays;
	private int cancelAllowDays;
	private int draftAllowDays;
	private Float maximumCashLimit;
	private boolean requiredCustomerNumber;
	private boolean creditNoteMultipleClaims;
	private int creditNoteExpiryDays;
	private String operation;
	
	
	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public boolean isCreditNoteMultipleClaims() {
		return creditNoteMultipleClaims;
	}

	public void setCreditNoteMultipleClaims(boolean creditNoteMultipleClaims) {
		this.creditNoteMultipleClaims = creditNoteMultipleClaims;
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

	private boolean dayOpenMandatory;

	public boolean isDayOpenMandatory() {
		return dayOpenMandatory;
	}

	public void setDayOpenMandatory(boolean dayOpenMandatory) {
		this.dayOpenMandatory = dayOpenMandatory;
	}

	public int getDraftAllowDays() {
		return draftAllowDays;
	}

	public void setDraftAllowDays(int draftAllowDays) {
		this.draftAllowDays = draftAllowDays;
	}

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

	public Boolean getCardinfo()
	{
		return cardinfo;
	}

	public void setCardinfo(Boolean cardinfo)
	{
		this.cardinfo = cardinfo;
	}

	public String getTimeOutStr()
	{
		return timeOutStr;
	}

	public void setTimeOutStr(String timeOutStr)
	{
		this.timeOutStr = timeOutStr;
	}

	public Boolean getIsInventoryRequired()
	{
		return isInventoryRequired;
	}

	public void setIsInventoryRequired(Boolean isInventoryRequired)
	{
		this.isInventoryRequired = isInventoryRequired;
	}

	public Boolean getIsVirtualStore()
	{
		return isVirtualStore;
	}

	public void setIsVirtualStore(Boolean isVirtualStore)
	{
		this.isVirtualStore = isVirtualStore;
	}

    
	public boolean isRoundingRequired() {
		return roundingRequired;
	}
	public void setRoundingRequired(boolean roundingRequired) {
		this.roundingRequired = roundingRequired;
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
	public String getGstIn() {
		return gstIn;
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
	public void setGstIn(String gstIn) {
		this.gstIn = gstIn;
	}
	public boolean isLatestCampaigns() {
		return latestCampaigns;
	}
	public void setLatestCampaigns(boolean latestCampaigns) {
		this.latestCampaigns = latestCampaigns;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public boolean isZeroStock() {
		return zeroStock;
	}
	public void setZeroStock(boolean zeroStock) {
		this.zeroStock = zeroStock;
	}
	public String getExchangeMode() {
		return exchangeMode;
	}
	public String getTollFreeNum() {
		return tollFreeNum;
	}
	public void setTollFreeNum(String tollFreeNum) {
		this.tollFreeNum = tollFreeNum;
	}
	public void setExchangeMode(String exchangeMode) {
		this.exchangeMode = exchangeMode;
	}
	public String getEndTime() {
		return endTime;
	}
	public boolean isOutletStatus() {
		return outletStatus;
	}
	public void setOutletStatus(boolean outletStatus) {
		this.outletStatus = outletStatus;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	
	public boolean isWarehouse() {
		return isWarehouse;
	}

	public void setWarehouse(boolean isWarehouse) {
		this.isWarehouse = isWarehouse;
	}

	public boolean isRemoteBilling() {
		return remoteBilling;
	}
	public boolean isOutletGrn() {
		return outletGrn;
	}
	public void setOutletGrn(boolean outletGrn) {
		this.outletGrn = outletGrn;
	}
	public Boolean getTelephonicOrders() {
		return telephonicOrders;
	}
	public void setTelephonicOrders(Boolean telephonicOrders) {
		this.telephonicOrders = telephonicOrders;
	}
	public Boolean getOnlineOrders() {
		return onlineOrders;
	}
	public void setOnlineOrders(Boolean onlineOrders) {
		this.onlineOrders = onlineOrders;
	}
	
	
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public Boolean getAttendanceEnabled() {
		return attendanceEnabled;
	}
	public void setAttendanceEnabled(Boolean attendanceEnabled) {
		this.attendanceEnabled = attendanceEnabled;
	}
	public Boolean getOfflineMode() {
		return offlineMode;
	}
	public void setOfflineMode(Boolean offlineMode) {
		this.offlineMode = offlineMode;
	}
	public Boolean getMobileSecurity() {
		return mobileSecurity;
	}
	public void setMobileSecurity(Boolean mobileSecurity) {
		this.mobileSecurity = mobileSecurity;
	}
	public String getOutletType() {
		return outletType;
	}
	public void setOutletType(String outletType) {
		this.outletType = outletType;
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
	public int getCountersCount() {
		return countersCount;
	}
	public void setCountersCount(int countersCount) {
		this.countersCount = countersCount;
	}
	public String getZoneId() {
		return zoneId;
	}
	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}
	public Boolean getBillId() {
		return billId;
	}
	public void setBillId(Boolean billId) {
		this.billId = billId;
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
	public String getBarcodeType() {
		return barcodeType;
	}
	public void setBarcodeType(String barcodeType) {
		this.barcodeType = barcodeType;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getReturnMode() {
		return returnMode;
	}
	public void setReturnMode(String returnMode) {
		this.returnMode = returnMode;
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
	public Integer getLeadTime() {
		return leadTime;
	}
	public void setLeadTime(Integer leadTime) {
		this.leadTime = leadTime;
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
	public boolean isDayStartSync() {
		return dayStartSync;
	}
	public void setDayStartSync(boolean dayStartSync) {
		this.dayStartSync = dayStartSync;
	}

	public boolean isHybrid_mode() {
		return hybrid_mode;
	}

	public void setHybrid_mode(boolean hybrid_mode) {
		this.hybrid_mode = hybrid_mode;
	}

	
	

	
	
	
	
	public String getMainWarehouse() {
		return mainWarehouse;
	}
	public void setMainWarehouse(String mainWarehouse) {
		this.mainWarehouse = mainWarehouse;
	}
	public boolean isStockAlerts() {
		return stockAlerts;
	}
	public void setStockAlerts(boolean stockAlerts) {
		this.stockAlerts = stockAlerts;
	}
	public boolean isOnlineOrder() {
		return onlineOrder;
	}
	public void setOnlineOrder(boolean onlineOrder) {
		this.onlineOrder = onlineOrder;
	}
	public boolean isTelephonicOrder() {
		return telephonicOrder;
	}
	public void setTelephonicOrder(boolean telephonicOrder) {
		this.telephonicOrder = telephonicOrder;
	}
	public boolean isBillingAndDelivery() {
		return billingAndDelivery;
	}
	public void setBillingAndDelivery(boolean billingAndDelivery) {
		this.billingAndDelivery = billingAndDelivery;
	}
	public boolean isPurchaseOrder() {
		return purchaseOrder;
	}
	public void setPurchaseOrder(boolean purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
	}
	public boolean isShipmentReturn() {
		return shipmentReturn;
	}
	public void setShipmentReturn(boolean shipmentReturn) {
		this.shipmentReturn = shipmentReturn;
	}
	public boolean isPosEnabled() {
		return posEnabled;
	}
	public void setPosEnabled(boolean posEnabled) {
		this.posEnabled = posEnabled;
	}
	public boolean isItFranchise() {
		return isItFranchise;
	}
	public void setItFranchise(boolean isItFranchise) {
		this.isItFranchise = isItFranchise;
	}
	public boolean isItDistributionCenter() {
		return isItDistributionCenter;
	}
	public void setItDistributionCenter(boolean isItDistributionCenter) {
		this.isItDistributionCenter = isItDistributionCenter;
	}
	public boolean isStorageSystemEnabled() {
		return storageSystemEnabled;
	}
	public void setStorageSystemEnabled(boolean storageSystemEnabled) {
		this.storageSystemEnabled = storageSystemEnabled;
	}
	public String getGstin() {
		return gstin;
	}
	public void setGstin(String gstin) {
		this.gstin = gstin;
	}
	public int getRadius() {
		return radius;
	}
	public void setRadius(int radius) {
		this.radius = radius;
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
	public String getStartTimeStr() {
		return startTimeStr;
	}
	public void setStartTimeStr(String startTimeStr) {
		this.startTimeStr = startTimeStr;
	}
	public String getEndTimeStr() {
		return endTimeStr;
	}
	public void setEndTimeStr(String endTimeStr) {
		this.endTimeStr = endTimeStr;
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
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getWarehouse_code() {
		return warehouse_code;
	}
	public void setWarehouse_code(String warehouse_code) {
		this.warehouse_code = warehouse_code;
	}
	public String getWarehouse_name() {
		return warehouse_name;
	}
	public void setWarehouse_name(String warehouse_name) {
		this.warehouse_name = warehouse_name;
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
	public boolean isEmployeeSaleId() {
		return employeeSaleId;
	}
	public void setEmployeeSaleId(boolean employeeSaleId) {
		this.employeeSaleId = employeeSaleId;
	}
	public boolean isTestWarehouse() {
		return testWarehouse;
	}
	public void setTestWarehouse(boolean testWarehouse) {
		this.testWarehouse = testWarehouse;
	}
	public boolean isMasterFlag() {
		return masterFlag;
	}
	public void setMasterFlag(boolean masterFlag) {
		this.masterFlag = masterFlag;
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
	public boolean isWarehouseGrn() {
		return warehouseGrn;
	}
	public void setWarehouseGrn(boolean warehouseGrn) {
		this.warehouseGrn = warehouseGrn;
	}
	public boolean isAuthorizedPicklist() {
		return authorizedPicklist;
	}
	public void setAuthorizedPicklist(boolean authorizedPicklist) {
		this.authorizedPicklist = authorizedPicklist;
	}
	public String getWarehouse_type() {
		return warehouse_type;
	}
	public void setWarehouse_type(String warehouse_type) {
		this.warehouse_type = warehouse_type;
	}
	public String getAddress_1() {
		return address_1;
	}
	public void setAddress_1(String address_1) {
		this.address_1 = address_1;
	}
	public String getAddress_2() {
		return address_2;
	}
	public void setAddress_2(String address_2) {
		this.address_2 = address_2;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getWarehouse_status() {
		return warehouse_status;
	}
	public void setWarehouse_status(String warehouse_status) {
		this.warehouse_status = warehouse_status;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public List<WarehouseStorageSystems> getStorageSystems() {
		return storageSystems;
	}
	public void setStorageSystems(List<WarehouseStorageSystems> storageSystems) {
		this.storageSystems = storageSystems;
	}
	public String getWarehouseLocation() {
		return warehouseLocation;
	}
	public void setWarehouseLocation(String warehouseLocation) {
		this.warehouseLocation = warehouseLocation;
	}
	public String getWarehouseId() {
		return warehouseId;
	}
	public void setWarehouseId(String warehouseId) {
		this.warehouseId = warehouseId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<?> getWarehouseIds() {
		return warehouseIds;
	}
	public void setWarehouseIds(List<?> warehouseIds) {
		this.warehouseIds = warehouseIds;
	}
	
	
	
}
