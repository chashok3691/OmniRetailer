package com.tlabs.posweb.beans;

import java.util.Set;
import java.util.List;

public class GiftCouponsMaster {
	private String couponProgramCode;
	private String promoName;
	private Float unitCashValue;
	private Float totalCashValue;
	private String createdOn;
	
	private String expiryDate;
	private Integer validityPeriod;
	private String totolGiftCoupons;
	private boolean limitedUseCoupon;
	private boolean  assignedStatus;
	private int noOfClaimsLimited;

	private String limitedUseCouponStr;
	private String assignedStatusStr;
	private String uploadedfilePath;
	
	private String customerMobile;
	
	
	private String noOfCoupons;
	
	private String totalCoupons;
	
	private String startDateStr;
	private String endDateStr;
	private String productGroupMaster;
	
	private boolean assignedCoupon;
	private List<String> couponids;
	private List<String> customerCouponids;
	private String couponidsStr;
	private String customerCouponidsStr;
	private boolean couponUpdate;
	private String customerGroup;
	private int perUserClaims;
	private String splitPeriod;
	private boolean isDiscountCoupon;
	private String couponType;
	private String renewCoupon;
	private boolean  isRenewalCoupon;
	
	
	public String getRenewCoupon() {
		return renewCoupon;
	}
	public void setRenewCoupon(String renewCoupon) {
		this.renewCoupon = renewCoupon;
	}
	public boolean isRenewalCoupon() {
		return isRenewalCoupon;
	}
	public void setRenewalCoupon(boolean isRenewalCoupon) {
		this.isRenewalCoupon = isRenewalCoupon;
	}
	public boolean isDiscountCoupon() {
		return isDiscountCoupon;
	}
	public void setDiscountCoupon(boolean isDiscountCoupon) {
		this.isDiscountCoupon = isDiscountCoupon;
	}
	public String getCouponType() {
		return couponType;
	}
	public void setCouponType(String couponType) {
		this.couponType = couponType;
	}
	public String getSplitPeriod() {
		return splitPeriod;
	}
	public void setSplitPeriod(String splitPeriod) {
		this.splitPeriod = splitPeriod;
	}
	public int getPerUserClaims() {
		return perUserClaims;
	}
	public void setPerUserClaims(int perUserClaims) {
		this.perUserClaims = perUserClaims;
	}
	public String getCustomerGroup() {
		return customerGroup;
	}
	public void setCustomerGroup(String customerGroup) {
		this.customerGroup = customerGroup;
	}
	public String getCouponidsStr() {
		return couponidsStr;
	}
	public void setCouponidsStr(String couponidsStr) {
		this.couponidsStr = couponidsStr;
	}
	public String getCustomerCouponidsStr() {
		return customerCouponidsStr;
	}
	public void setCustomerCouponidsStr(String customerCouponidsStr) {
		this.customerCouponidsStr = customerCouponidsStr;
	}
	public List<String> getCouponids() {
		return couponids;
	}
	public void setCouponids(List<String> couponids) {
		this.couponids = couponids;
	}
	public List<String> getCustomerCouponids() {
		return customerCouponids;
	}
	public void setCustomerCouponids(List<String> customerCouponids) {
		this.customerCouponids = customerCouponids;
	}
	public boolean isCouponUpdate() {
		return couponUpdate;
	}
	public void setCouponUpdate(boolean couponUpdate) {
		this.couponUpdate = couponUpdate;
	}
	public boolean isAssignedCoupon() {
		return assignedCoupon;
	}
	public void setAssignedCoupon(boolean assignedCoupon) {
		this.assignedCoupon = assignedCoupon;
	}
	public String getProductGroupMaster() {
		return productGroupMaster;
	}
	public void setProductGroupMaster(String productGroupMaster) {
		this.productGroupMaster = productGroupMaster;
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
	public String getNoOfCoupons() {
		return noOfCoupons;
	}
	public void setNoOfCoupons(String noOfCoupons) {
		this.noOfCoupons = noOfCoupons;
	}
	public String getUploadedfilePath() {
		return uploadedfilePath;
	}
	public void setUploadedfilePath(String uploadedfilePath) {
		this.uploadedfilePath = uploadedfilePath;
	}
	public String getLimitedUseCouponStr() {
		return limitedUseCouponStr;
	}
	public void setLimitedUseCouponStr(String limitedUseCouponStr) {
		this.limitedUseCouponStr = limitedUseCouponStr;
	}
	public String getAssignedStatusStr() {
		return assignedStatusStr;
	}
	public void setAssignedStatusStr(String assignedStatusStr) {
		this.assignedStatusStr = assignedStatusStr;
	}
	public boolean isAssignedStatus() {
		return assignedStatus;
	}
	public void setAssignedStatus(boolean assignedStatus) {
		this.assignedStatus = assignedStatus;
	}
	public boolean isLimitedUseCoupon() {
		return limitedUseCoupon;
	}
	public void setLimitedUseCoupon(boolean limitedUseCoupon) {
		this.limitedUseCoupon = limitedUseCoupon;
	}
	public int getNoOfClaimsLimited() {
		return noOfClaimsLimited;
	}
	public void setNoOfClaimsLimited(int noOfClaimsLimited) {
		this.noOfClaimsLimited = noOfClaimsLimited;
	}
	private boolean saveGRNFlag;
	private String filePath;
	
	public boolean isSaveGRNFlag() {
		return saveGRNFlag;
	}
	public void setSaveGRNFlag(boolean saveGRNFlag) {
		this.saveGRNFlag = saveGRNFlag;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getTotolGiftCoupons() {
		return totolGiftCoupons;
	}
	public void setTotolGiftCoupons(String totolGiftCoupons) {
		this.totolGiftCoupons = totolGiftCoupons;
	}
	public Float getMin_sale_amount() {
		return min_sale_amount;
	}
	public void setMin_sale_amount(Float min_sale_amount) {
		this.min_sale_amount = min_sale_amount;
	}
	public Float getMax_discount_amount() {
		return max_discount_amount;
	}
	public void setMax_discount_amount(Float max_discount_amount) {
		this.max_discount_amount = max_discount_amount;
	}
	private Float min_sale_amount;
    private Float max_discount_amount;
    private float max_sale_amount;
    
	 public float getMax_sale_amount() {
		return max_sale_amount;
	}
	public void setMax_sale_amount(float max_sale_amount) {
		this.max_sale_amount = max_sale_amount;
	}
	private List<String> allLocationsList;
	 
	public List<String> getAllLocationsList() {
		return allLocationsList;
	}
	public void setAllLocationsList(List<String> allLocationsList) {
		this.allLocationsList = allLocationsList;
	}
	private String zoneId;
	public String getZoneId() {
		return zoneId;
	}
	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}
	private String startDate;
	private String endDate;
	
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
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	private String searchCriteria;
	
	private int noOfCliams;
	
	public int getNoOfCliams() {
		return noOfCliams;
	}
	public void setNoOfCliams(int noOfCliams) {
		this.noOfCliams = noOfCliams;
	}
	private List<GiftCouponLocations> couponLocationsList;
	
	
	
	public List<GiftCouponLocations> getCouponLocationsList() {
		return couponLocationsList;
	}
	public void setCouponLocationsList(List<GiftCouponLocations> couponLocationsList) {
		this.couponLocationsList = couponLocationsList;
	}
	public List<String> getZoneLocations() {
		return zoneLocations;
	}
	public void setZoneLocations(List<String> zoneLocations) {
		this.zoneLocations = zoneLocations;
	}
	private List<String> zoneLocations;
	
	
//	@Transient
	private List<String> zones;
	
//	@Transient
//	private List<String> locations;
	
	public String getDiscountType() {
		return discountType;
	}
	public List<String> getZones() {
		return zones;
	}
	public void setZones(List<String> zones) {
		this.zones = zones;
	}
	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}
	public boolean isOtpRequirement() {
		return otpRequirement;
	}
	public void setOtpRequirement(boolean otpRequirement) {
		this.otpRequirement = otpRequirement;
	}
	public boolean isMultiples() {
		return multiples;
	}
	public void setMultiples(boolean multiples) {
		this.multiples = multiples;
	}
	private String country;
	private String states;
	private String locations;
	private String status;
	private String description;
	private Integer quantity;
	private List<GiftCoupons> giftCoupons;
	private List<GiftCoupons> giftCouponsMasters;
	private List<CustomerGiftCoupons> customerGiftCoupons;
	private RequestHeader requestHeader;
	private String startIndex;
	private String totalRecords;
	private String[] locationsList;
	private String createdOnStr;
	private String expiryDateStr;
	
	private int cardsDetails_length;
	
	
	
	public List<GiftCoupons> getGiftCouponsMasters() {
		return giftCouponsMasters;
	}
	public void setGiftCouponsMasters(List<GiftCoupons> giftCouponsMasters) {
		this.giftCouponsMasters = giftCouponsMasters;
	}
	private List<GiftCoupons> coupon;

	public List<GiftCoupons> getCoupon() {
		return coupon;
	}
	public void setCoupon(List<GiftCoupons> coupon) {
		this.coupon = coupon;
	}
	public int getCardsDetails_length() {
		return cardsDetails_length;
	}
	public void setCardsDetails_length(int cardsDetails_length) {
		this.cardsDetails_length = cardsDetails_length;
	}
	private String multiplesStr;
	
	public String getMultiplesStr() {
		return multiplesStr;
	}
	public void setMultiplesStr(String multiplesStr) {
		this.multiplesStr = multiplesStr;
	}
	private String selectdZones;
    public String getSelectdZones() {
		return selectdZones;
	}
	public void setSelectdZones(String selectdZones) {
		this.selectdZones = selectdZones;
	}
	//	@Column(name="discount_type")
	private String discountType;
	
//	@Column(name="otp_requirement")
	private boolean otpRequirement;
	
	private String maxRecords;
public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	//	@Column(name="multiples")
	private boolean multiples;
	private String requiredOTP="";
	private String genareteCoupons;
	private boolean isImportCoupons;
	
	
	public String getGenareteCoupons() {
		return genareteCoupons;
	}
	public void setGenareteCoupons(String genareteCoupons) {
		this.genareteCoupons = genareteCoupons;
	}
	public boolean isImportCoupons() {
		return isImportCoupons;
	}
	public void setImportCoupons(boolean isImportCoupons) {
		this.isImportCoupons = isImportCoupons;
	}
	public String getRequiredOTP() {
		return requiredOTP;
	}
	public void setRequiredOTP(String requiredOTP) {
		this.requiredOTP = requiredOTP;
	}
	public String getCreatedOnStr() {
		return createdOnStr;
	}
	public void setCreatedOnStr(String createdOnStr) {
		this.createdOnStr = createdOnStr;
	}
	public String getExpiryDateStr() {
		return expiryDateStr;
	}
	public void setExpiryDateStr(String expiryDateStr) {
		this.expiryDateStr = expiryDateStr;
	}
	public String[] getLocationsList() {
		return locationsList;
	}
	public void setLocationsList(String[] locationsList) {
		this.locationsList = locationsList;
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
	public String getCouponProgramCode() {
		return couponProgramCode;
	}
	public void setCouponProgramCode(String couponProgramCode) {
		this.couponProgramCode = couponProgramCode;
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
	public Float getTotalCashValue() {
		return totalCashValue;
	}
	public void setTotalCashValue(Float totalCashValue) {
		this.totalCashValue = totalCashValue;
	}
	public String getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
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
	public String getLocations() {
		return locations;
	}
	public void setLocations(String locations) {
		this.locations = locations;
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
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public List<GiftCoupons> getGiftCoupons() {
		return giftCoupons;
	}
	public void setGiftCoupons(List<GiftCoupons> giftCoupons) {
		this.giftCoupons = giftCoupons;
	}
	public List<CustomerGiftCoupons> getCustomerGiftCoupons() {
		return customerGiftCoupons;
	}
	public void setCustomerGiftCoupons(List<CustomerGiftCoupons> customerGiftCoupons) {
		this.customerGiftCoupons = customerGiftCoupons;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getCustomerMobile() {
		return customerMobile;
	}
	public void setCustomerMobile(String customerMobile) {
		this.customerMobile = customerMobile;
	}
	public String getTotalCoupons() {
		return totalCoupons;
	}
	public void setTotalCoupons(String totalCoupons) {
		this.totalCoupons = totalCoupons;
	}
	
	
	
}
