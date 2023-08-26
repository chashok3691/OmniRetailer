package com.tlabs.posweb.beans;

import java.util.List;
import java.util.Set;

public class GiftVoucherMaster {
	private RequestHeader requestHeader;
	private String voucherProgramCode;
	private String promoName;
	private Float unitCashValue;
	private Float totalCashValue;
	private String createdOn;
	private String expiryDate;
	private Integer validityPeriod;
	private String country;
	private String states;
	private String locations;
	private String status;
	private String description;
	private Integer quantity;
	private Set<GiftVouchers> giftVouchers;
	private Set<CustomerGiftVouchers> customerGiftVouchers;
	
	private List<GiftVoucherMaster> giftVouchersList;
	
	
	
	
	public List<GiftVoucherMaster> getGiftVouchersList() {
		return giftVouchersList;
	}
	public void setGiftVouchersList(List<GiftVoucherMaster> giftVouchersList) {
		this.giftVouchersList = giftVouchersList;
	}
	private String startIndex;
	private String totalRecords;
	private String[] locationsList;
	private String createdOnStr;
	private String expiryDateStr;
	
	private List<String> voucherids;
	private String voucheridsStr;
	private List<String> customerVoucherids;
	private boolean voucherUpdate;
	private boolean voucherUpdateFlag;
	private String tenderName;
	private String productGroup;
	private String vouchers;
	
	
	
	public String getVouchers() {
		return vouchers;
	}
	public void setVouchers(String vouchers) {
		this.vouchers = vouchers;
	}
	public String getTenderName() {
		return tenderName;
	}
	public void setTenderName(String tenderName) {
		this.tenderName = tenderName;
	}
	public String getProductGroup() {
		return productGroup;
	}
	public void setProductGroup(String productGroup) {
		this.productGroup = productGroup;
	}
	public String getVoucheridsStr() {
		return voucheridsStr;
	}
	public void setVoucheridsStr(String voucheridsStr) {
		this.voucheridsStr = voucheridsStr;
	}
	public boolean isVoucherUpdateFlag() {
		return voucherUpdateFlag;
	}
	public void setVoucherUpdateFlag(boolean voucherUpdateFlag) {
		this.voucherUpdateFlag = voucherUpdateFlag;
	}
	public List<String> getVoucherids() {
		return voucherids;
	}
	public void setVoucherids(List<String> voucherids) {
		this.voucherids = voucherids;
	}
	public List<String> getCustomerVoucherids() {
		return customerVoucherids;
	}
	public void setCustomerVoucherids(List<String> customerVoucherids) {
		this.customerVoucherids = customerVoucherids;
	}
	public boolean isVoucherUpdate() {
		return voucherUpdate;
	}
	public void setVoucherUpdate(boolean voucherUpdate) {
		this.voucherUpdate = voucherUpdate;
	}
	private boolean saveGiftVoucherFlag;
	
	private boolean isPaid;
	
	private String isPaidFlag;
	
	private boolean assignedStatus;
	
	private String assignedStatusStr;
	
	private boolean assigned_voucher=false;
	   
	private String isOTPFlag;
		
	private boolean otp_requirement;
		
	private boolean on_discounted_bill_price;
	
	
	public boolean isOn_discounted_bill_price() {
		return on_discounted_bill_price;
	}
	public void setOn_discounted_bill_price(boolean on_discounted_bill_price) {
		this.on_discounted_bill_price = on_discounted_bill_price;
	}
	public String getIsOTPFlag() {
			return isOTPFlag;
		}
		public void setIsOTPFlag(String isOTPFlag) {
			this.isOTPFlag = isOTPFlag;
		}
		public boolean isOtp_requirement() {
			return otp_requirement;
		}
		public void setOtp_requirement(boolean otp_requirement) {
			this.otp_requirement = otp_requirement;
		}
	public boolean isAssigned_voucher() {
		return assigned_voucher;
	}
	public void setAssigned_voucher(boolean assigned_voucher) {
		this.assigned_voucher = assigned_voucher;
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
	public boolean isPaid() {
		return isPaid;
	}
	public void setPaid(boolean isPaid) {
		this.isPaid = isPaid;
	}
	public String getIsPaidFlag() {
		return isPaidFlag;
	}
	public void setIsPaidFlag(String isPaidFlag) {
		this.isPaidFlag = isPaidFlag;
	}
	private Integer multipleInt;
	
	
	public Integer getMultipleInt() {
		return multipleInt;
	}
	public void setMultipleInt(Integer multipleInt) {
		this.multipleInt = multipleInt;
	}
	public boolean isSaveGiftVoucherFlag() {
		return saveGiftVoucherFlag;
	}
	public void setSaveGiftVoucherFlag(boolean saveGiftVoucherFlag) {
		this.saveGiftVoucherFlag = saveGiftVoucherFlag;
	}
	private List<String> zones;
	private String filePath;
	private String maxRecords;
	
	public List<GiftVoucherLocations> getVouchersLocaionsList() {
		return vouchersLocaionsList;
	}
	public void setVouchersLocaionsList(List<GiftVoucherLocations> vouchersLocaionsList) {
		this.vouchersLocaionsList = vouchersLocaionsList;
	}
	private List<CustomerGiftVouchers> giftVouchersChildList;
	private  List<GiftVoucherLocations> vouchersLocaionsList;
	
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public List<CustomerGiftVouchers> getGiftVouchersChildList() {
		return giftVouchersChildList;
	}
	public void setGiftVouchersChildList(List<CustomerGiftVouchers> giftVouchersChildList) {
		this.giftVouchersChildList = giftVouchersChildList;
	}
	private String searchCriteria;
	private List<String> zoneLocations;
	private String zone;
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public List<String> getZoneLocations() {
		return zoneLocations;
	}
	public void setZoneLocations(List<String> zoneLocations) {
		this.zoneLocations = zoneLocations;
	}
	
	
	public List<String> getZones() {
		return zones;
	}
	public void setZones(List<String> zones) {
		this.zones = zones;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getMin_bill_amount() {
		return min_bill_amount;
	}
	public void setMin_bill_amount(String min_bill_amount) {
		this.min_bill_amount = min_bill_amount;
	}

	public boolean isMultiple() {
		return multiple;
	}
	public void setMultiple(boolean multiple) {
		this.multiple = multiple;
	}
	private String  min_bill_amount;
	private boolean multiple;
	
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
	public String getVoucherProgramCode() {
		return voucherProgramCode;
	}
	public void setVoucherProgramCode(String voucherProgramCode) {
		this.voucherProgramCode = voucherProgramCode;
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
	public Set<GiftVouchers> getGiftVouchers() {
		return giftVouchers;
	}
	public void setGiftVouchers(Set<GiftVouchers> giftVouchers) {
		this.giftVouchers = giftVouchers;
	}
	public Set<CustomerGiftVouchers> getCustomerGiftVouchers() {
		return customerGiftVouchers;
	}
	public void setCustomerGiftVouchers(
			Set<CustomerGiftVouchers> customerGiftVouchers) {
		this.customerGiftVouchers = customerGiftVouchers;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getLocations() {
		return locations;
	}
	public void setLocations(String locations) {
		this.locations = locations;
	}
	
	
}
