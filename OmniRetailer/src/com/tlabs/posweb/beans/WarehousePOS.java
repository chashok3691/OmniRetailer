package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;


public class WarehousePOS {

	
	private String location;
	
	
	private String warehouseId;
	
	private String currency;
	
	private String language;
	
	private String startTime;
	
	private String endTime;
	
	private boolean remoteBilling;
	
	private boolean foodCoupons;
	
	private String minPayAmount;
	
	private boolean printing;
	
	//@Length(max=50,message="STORE_NAME_LENGTH_OUTLET")
	//@Column(name="store_name")
	//private String storeName;
	
	private String gpsLongitude;
	
	private String gpsLatitude;
	
	private String category;
	
	private boolean doorDelivery;
	
	private boolean returns;
	
	private boolean exchange;
	
	private String role;
	
	private String user;
	
	private String returnMode;
	
	private String street;
	
	private String locality;
	
	private String email;
	
	private Float periphery;
	
	private boolean secured;
	
	private boolean remoteMonitoring;
	
	private boolean employeeSaleId;
	
	private boolean requiredCustomerNumber;
	
	//@Column(name="multiple_stock_receipts")
	//private boolean multipleStockReceipts;

	private boolean allStoreReturnBill=false;
	
	private boolean orderNotification;
	
	private int orderTimePeriod;
	
	
	//minimum_order_value
	private Double minimumOrderValue=0.0;
	
private boolean autoSync;
	
	private boolean shifReportMandatory;
	private boolean posStockDisplay;
	private int stockMaintainDays;
	
	private boolean billOtp;
	
	
	
	 
	
	
	//@Column(name="stock_sale_allow_days")
	//private int stockSaleAllowDays=0;
	
	
	
	/*public int getStockSaleAllowDays() {
		return stockSaleAllowDays;
	}

	public void setStockSaleAllowDays(int stockSaleAllowDays) {
		this.stockSaleAllowDays = stockSaleAllowDays;
	}*/

	public boolean isBillOtp() {
		return billOtp;
	}

	public void setBillOtp(boolean billOtp) {
		this.billOtp = billOtp;
	}

	public boolean isAutoSync() {
		return autoSync;
	}

	public void setAutoSync(boolean autoSync) {
		this.autoSync = autoSync;
	}

	public boolean isShifReportMandatory() {
		return shifReportMandatory;
	}

	public void setShifReportMandatory(boolean shifReportMandatory) {
		this.shifReportMandatory = shifReportMandatory;
	}

	public boolean isPosStockDisplay() {
		return posStockDisplay;
	}

	public void setPosStockDisplay(boolean posStockDisplay) {
		this.posStockDisplay = posStockDisplay;
	}

	public int getStockMaintainDays() {
		return stockMaintainDays;
	}

	public void setStockMaintainDays(int stockMaintainDays) {
		this.stockMaintainDays = stockMaintainDays;
	}

	public Double getMinimumOrderValue() {
		return minimumOrderValue;
	}

	public void setMinimumOrderValue(Double minimumOrderValue) {
		this.minimumOrderValue = minimumOrderValue;
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

	public boolean isAllStoreReturnBill() {
		return allStoreReturnBill;
	}

	public void setAllStoreReturnBill(boolean allStoreReturnBill) {
		this.allStoreReturnBill = allStoreReturnBill;
	}

	/*public boolean isMultipleStockReceipts() {
		return multipleStockReceipts;
	}

	public void setMultipleStockReceipts(boolean multipleStockReceipts) {
		this.multipleStockReceipts = multipleStockReceipts;
	}*/

	public boolean isRequiredCustomerNumber() {
		return requiredCustomerNumber;
	}

	public void setRequiredCustomerNumber(boolean requiredCustomerNumber) {
		this.requiredCustomerNumber = requiredCustomerNumber;
	}
/*
	@Transient
	private String storeCodeId;
*/	
	
	private boolean activeStatus;
	
	/*@Transient
	private List<Counter> fixedCounters;
	
	@Transient
	private List<Counter> mobileCounters;
	
	@Transient
	private List<OutletSettings> outletSettingsObj;
	*/
	
	private boolean testStore;

	private boolean editPrice;

	private boolean masterFlag;
	
	private boolean dayStartSync;
	
    private Boolean offlineDuplicateBill;
    
    private boolean counterOTP;
    
    
    private boolean hybrid_mode;
    
   	private Float maximumCashLimit;
    
	private boolean creditNoteMultipleClaims;
	
	private int creditNoteExpiryDays;
    
	
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

	public Float getMaximumCashLimit() {
		return maximumCashLimit;
	}

	public void setMaximumCashLimit(Float maximumCashLimit) {
		this.maximumCashLimit = maximumCashLimit;
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

	public void setCounterOTP(boolean counterOTP) {
		this.counterOTP = counterOTP;
	}



	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	/*public String getStoreCode() {
		return storeCode;
	}

	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}*/

	private String signature;

	//@Length(max=20,message="STORE_CODE_LENGTH_OUTLET")
	//@Column(name = "store_id")
	//private String storeCode;


	public String getSigantureImageRef() {
		return sigantureImageRef;
	}

	public void setSigantureImageRef(String sigantureImageRef) {
		this.sigantureImageRef = sigantureImageRef;
	}

	private String sigantureImageRef;


	public boolean isCampaignExists() {
		return campaignExists;
	}

	public void setCampaignExists(boolean campaignExists) {
		this.campaignExists = campaignExists;
	}

	private boolean campaignExists;

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
	
	private Integer leadTime;
	
	private boolean productsMenu=false;
	


	private Boolean telephonicOrders=false;

	private Boolean onlineOrders=false;
	private Boolean attendanceEnabled=false;
	private Boolean offlineMode=false;
	private Boolean mobileSecurity=false;
	
	private String outletType;
	
	private Boolean outletStatus;
	
	private String companyOwned;
	
	//@Length(max=50,message="STOCK_VERI_TYPE_LENGTH_OUTLET")
	//@Column(name = "stock_verification_type")
	//private String stockVerificationType;
	
	private String phone;
	
	private String fax;
	
	private Integer offLineDataTimedOutDays;
	
	private Integer offLineDataTimedOutHours;

	private String zoneId;

	private Boolean billId;
	
	private Boolean roundingRequired;
	
	private String tollFreeNum;
	
	private boolean zeroStock;
	
	private String gstIn;
	
     private boolean enforceDenominations;
     
     private boolean enforceVoidItemsReason;
     
     private boolean enforceBillCancelReason;

     
	private ResponseHeader responseHeader;
	
	
	private boolean latestCampaigns;
	
	public String type;
	public String operation;
	
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getBarcodeType() {
		return barcodeType;
	}

	public void setBarcodeType(String barcodeType) {
		this.barcodeType = barcodeType;
	}

	private String barcodeType;
	
	private String discountCalculatedOn;
	
	private String discountTaxation;
	
	private boolean manualDiscounts;
	
	private boolean employeeDiscounts;
	
	private boolean dayOpenMandatory;
	
	private String suspendReason;
		
	//@Transient
	//private List<StoreTaxation> taxes;
	
	

	private RequestHeader requestHeader;

	private String startIndex;

	private String maxRecords;
	
	private List<WarehousePOS> posList;
	
	private List<String> locations;
	
	

	// @Column(name="stock_request")
	//private boolean stockRequest;
	
	//@Column(name="stock_receipt")
	//private boolean stockReciept;
	
	//@Column(name="stock_issue")
	//private boolean stockIssue;
	
	//@Column(name="stock_return")
	//private boolean stockReturn;
	
	public List<String> getLocations() {
		return locations;
	}

	public void setLocations(List<String> locations) {
		this.locations = locations;
	}

	public List<WarehousePOS> getPosList() {
		return posList;
	}

	public void setPosList(List<WarehousePOS> posList) {
		this.posList = posList;
	}

	private boolean outletGrn; 
	
	private String exchangeMode;


	//added by M.Srivani
	private Boolean cardInfo;

	private Date timeOut;

	private Boolean isVirtualStore;

	private Boolean isInventoryRequired;

	//added by M.Srivani on 3/1/2018
	private String createdDate;

	private String updatedDate;

	private int exchangeAllowDays;
	private int returnAllowDays;
	private int cancelAllowDays;
	private String totalRecords;
	
	private int draftAllowDays;
	
	private String weekDays;
	
	//@Column(name = "stock_maintain_days")
	//private int stockMaintainDays;
	
	private boolean returnBillRefRequired = false;
	
	private String outletImage1;
	
	private String outletImage2;
	
	private String outletImage3;
	
	private boolean ftpUploadRequired;
	
	private String ftpServer;
	
	private String ftpPort;
	
	private String userId;
	
	private String password;
	
	private boolean creditNoteOtp;
	
	private String createdDateStr;
	
	private String updatedDateStr;
	
	private String timeOutStr;
	
	
	
	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
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

	public String getTimeOutStr() {
		return timeOutStr;
	}

	public void setTimeOutStr(String timeOutStr) {
		this.timeOutStr = timeOutStr;
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

	public boolean isReturnBillRefRequired() {
		return returnBillRefRequired;
	}

	public void setReturnBillRefRequired(boolean returnBillRefRequired) {
		this.returnBillRefRequired = returnBillRefRequired;
	}

	public String getWeekDays() {
		return weekDays;
	}

	public void setWeekDays(String weekDays) {
		this.weekDays = weekDays;
	}

	/*public int getStockMaintainDays() {
		return stockMaintainDays;
	}

	public void setStockMaintainDays(int stockMaintainDays) {
		this.stockMaintainDays = stockMaintainDays;
	}*/

	public String getSuspendReason() {
		return suspendReason;
	}

	public void setSuspendReason(String suspendReason) {
		this.suspendReason = suspendReason;
	}

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

	public Boolean getIsVirtualStore()
	{
		return isVirtualStore;
	}

	public void setIsVirtualStore(Boolean isVirtualStore)
	{
		this.isVirtualStore = isVirtualStore;
	}

	public Boolean getIsInventoryRequired()
	{
		return isInventoryRequired;
	}

	public void setIsInventoryRequired(Boolean isInventoryRequired)
	{
		this.isInventoryRequired = isInventoryRequired;
	}

	public Date getTimeOut() {
		return timeOut;
	}

	public void setTimeOut(Date timeOut) {
		this.timeOut = timeOut;
	}
	
	
	/*
	@Transient
	private boolean stockRequest;
	
	@Transient
	private boolean stockReciept;
	
	@Transient
	private boolean stockIssue;
	
	@Transient
	private boolean stockReturn;
	
	@Transient
	private boolean outletGrn;*/
	/*@Transient
	private String userId;
	*/

	
	
	/*public List<StoreTaxation> getTaxes() {
		return taxes;
	}*/

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
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

	public boolean isZeroStock() {
		return zeroStock;
	}

	public void setZeroStock(boolean zeroStock) {
		this.zeroStock = zeroStock;
	}

	public String getGstIn() {
		return gstIn;
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

	public String getTollFreeNum() {
		return tollFreeNum;
	}

	public void setTollFreeNum(String tollFreeNum) {
		this.tollFreeNum = tollFreeNum;
	}

	public Boolean getOutletStatus() {
		return outletStatus;
	}

	public void setOutletStatus(Boolean outletStatus) {
		this.outletStatus = outletStatus;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public boolean isDoorDelivery() {
		return doorDelivery;
	}

	public void setDoorDelivery(boolean doorDelivery) {
		this.doorDelivery = doorDelivery;
	}

	public boolean isReturns() {
		return returns;
	}

	public void setReturns(boolean returns) {
		this.returns = returns;
	}

	public Boolean getRoundingRequired() {
		return roundingRequired;
	}

	public void setRoundingRequired(Boolean roundingRequired) {
		this.roundingRequired = roundingRequired;
	}

	public boolean isExchange() {
		return exchange;
	}

	public void setExchange(boolean exchange) {
		this.exchange = exchange;
	}

	public String getMinPayAmount() {
		return minPayAmount;
	}

	public Boolean getTelephonicOrders() {
		return telephonicOrders;
	}

	public void setTelephonicOrders(Boolean telephonicOrders) {
		this.telephonicOrders = telephonicOrders;
	}

	/*public boolean isStockRequest() {
		return stockRequest;
	}

	public void setStockRequest(boolean stockRequest) {
		this.stockRequest = stockRequest;
	}

	public boolean isStockReciept() {
		return stockReciept;
	}*/

	public String getExchangeMode() {
		return exchangeMode;
	}

	public void setExchangeMode(String exchangeMode) {
		this.exchangeMode = exchangeMode;
	}

	/*public void setStockReciept(boolean stockReciept) {
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
	}*/

	public boolean isOutletGrn() {
		return outletGrn;
	}

	public void setOutletGrn(boolean outletGrn) {
		this.outletGrn = outletGrn;
	}

	public Boolean getOnlineOrders() {
		return onlineOrders;
	}

	public void setOnlineOrders(Boolean onlineOrders) {
		this.onlineOrders = onlineOrders;
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

	 
	public String getCompanyOwned() {
		return companyOwned;
	}

	public void setCompanyOwned(String companyOwned) {
		this.companyOwned = companyOwned;
	}

	/*public String getStockVerificationType() {
		return stockVerificationType;
	}

	public void setStockVerificationType(String stockVerificationType) {
		this.stockVerificationType = stockVerificationType;
	}*/

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
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

	public Boolean getBillId() {
		return billId;
	}

	public void setBillId(Boolean billId) {
		this.billId = billId;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public boolean isProductsMenu() {
		return productsMenu;
	}

	public void setProductsMenu(boolean productsMenu) {
		this.productsMenu = productsMenu;
	}

	public void setMinPayAmount(String minPayAmount) {
		this.minPayAmount = minPayAmount;
	}

	/*public void setTaxes(List<StoreTaxation> taxes) {
		this.taxes = taxes;
	}*/

	/*public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}*/

	public String getLocation() {
		return location;
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

	public boolean isManualDiscounts() {
		return manualDiscounts;
	}

	public void setManualDiscounts(boolean manualDiscounts) {
		this.manualDiscounts = manualDiscounts;
	}

	public boolean isEmployeeDiscounts() {
		return employeeDiscounts;
	}

	public void setEmployeeDiscounts(boolean employeeDiscounts) {
		this.employeeDiscounts = employeeDiscounts;
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

	

	public String getWarehouseId() {
		return warehouseId;
	}

	public void setWarehouseId(String warehouseId) {
		this.warehouseId = warehouseId;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
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

	public Integer getLeadTime() {
		return leadTime;
	}

	public void setLeadTime(Integer leadTime) {
		this.leadTime = leadTime;
	}

	public boolean isEmployeeSaleId() {
		return employeeSaleId;
	}

	public void setEmployeeSaleId(boolean employeeSaleId) {
		this.employeeSaleId = employeeSaleId;
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

	public String getReturnMode() {
		return returnMode;
	}

	public void setReturnMode(String returnMode) {
		this.returnMode = returnMode;
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

	
	public boolean isPrinting() {
		return printing;
	}

	public void setPrinting(boolean printing) {
		this.printing = printing;
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

	public boolean isDayStartSync() {
		return dayStartSync;
	}



	public void setDayStartSync(boolean dayStartSync) {
		this.dayStartSync = dayStartSync;
	}



	public void setOfflineDuplicateBill(Boolean offlineDuplicateBill) {
		this.offlineDuplicateBill = offlineDuplicateBill;
	}

	public Boolean getCardInfo() {
		return cardInfo;
	}

	public void setCardInfo(Boolean cardInfo) {
		this.cardInfo = cardInfo;
	}

	public boolean isHybrid_mode() {
		return hybrid_mode;
	}

	public void setHybrid_mode(boolean hybrid_mode) {
		this.hybrid_mode = hybrid_mode;
	}

	public boolean isActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(boolean activeStatus) {
		this.activeStatus = activeStatus;
	}
}
