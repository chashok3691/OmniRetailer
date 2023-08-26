package com.tlabs.posweb.beans;

import java.util.List;

public class FilterInput {
    private RequestHeader requestHeader;
    private String searchCriteria;
	private String category;//can be customer Category for customer view services
	private String storeName;
	private String wareHouseName;
	
	private String stockType;
	private String status;
	private String startDateStr;
	private String endDateStr;
	private String startIndex;
	private String storeLocation;
	  private boolean saveCustomer;
	//customer view filters
	private String age;
	private String gender;
	private String productCategory;
	private String city;
	private String state;
	private String country;
	private String productName;
	private String priceRange;
	private String purchaseChannel;
	private Integer toAge;
	private Integer fromAge;
	private Integer priceRangeStartAmount;
	private Integer priceRangeEndAmount;
	private String customerType;
//	private boolean saveCustomer;
	//customer notification 
	private String group_id;
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	private String notification_channel;
	public String getNotification_channel() {
		return notification_channel;
	}
	public void setNotification_channel(String notification_channel) {
		this.notification_channel = notification_channel;
	}
	private String message;
	private String notificationType;//mail,sms,all
	private String subject;
	private String cc;
	private String bcc;
	
	  private String referralProgramId;
	public String getReferralProgramId() {
		return referralProgramId;
	}
	public void setReferralProgramId(String referralProgramId) {
		this.referralProgramId = referralProgramId;
	}
	//enable notification fields
	private String eventType;
	private boolean enable;
	private String eventStartDateStr;
	private String eventEndDateStr;
	private Integer periodInDays;
	private Integer periodInHours;
	private String batchName;
	private String filterId;;
	private String calendarType;
	private String notificationCategory;
	private String notificationSubCategory;
	
	//specific messages
	private String birthDayMessage;
	private String marriageDayMessage;
	private String festivalMessage;
	private String offerMessage;
	private String dealMessage;
	private String periodicMessage;
	private String outletMessage;
	private String newArrivalMessage;
		
	//specific status
	private boolean birthDayEnable;
	private boolean marriageDayEnable;
	private boolean festivalEnable;
	private boolean offerEnable;
	private boolean dealEnable;
	private boolean periodicEnable;
	private boolean outletEnable;
	private boolean newArrivalEnable;

	//specific subject
	private String birthDaySubject;
	private String marriageDaySubject;
	private String festivalSubject;
	private String offerSubject;
	private String dealSubject;
	private String periodicSubject;
	private String outletSubject;
	private String newArrivalSubject;

	//specific startDateStr,endDateStr
	private String offerStartDateStr;
	private String offerEndDateStr;
	private String dealStartDateStr;
	private String dealEndDateStr;
	private String periodicStartDateStr;
	private String periodicEndDateStr;
	
	//specific periodInDays,periodInHours
	private int offerPeriodInDays;
	private int offerPeriodInHours;
	private int dealPeriodInDays;
	private int dealPeriodInHours;
	private int periodicPeriodInDays;
	private int periodicPeriodInHours;
	
	private String offerName;
	private String dealName;
	private String customerCategory;
	private String notificationChannel;
	private String totalRecords;
	/*private String startPrice;
	private String endPrice;*/
	
	private String notify;
  
private String filePath;
	
	//customer view filters



	//specific messages
	
    public String getFilePath() {
	return filePath;
}
public void setFilePath(String filePath) {
	this.filePath = filePath;
}
	private String level;
    private String bookingId;
    private String bookingType;
    private String checkInId;
    private String roomNo;
    private String phoneNumber;
    private String slot;
    private String orderId;
    private String response;
    private String orderType;
    private String maxRecords;
	
    private List<String>locationsList;
    
    
    public List<String> getLocationsList() {
		return locationsList;
	}
	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}
	private String zoneID;
	/*public String getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(String startPrice) {
		this.startPrice = startPrice;
	}
	public String getEndPrice() {
		return endPrice;
	}
	public void setEndPrice(String endPrice) {
		this.endPrice = endPrice;
	}*/
	
	
	private String endDate;
	private String startDate;
	
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getZoneID() {
		return zoneID;
	}
	public void setZoneID(String zoneID) {
		this.zoneID = zoneID;
	}
	public String getMaxRecords() {
		return maxRecords;
	}
	public String getNotify() {
		return notify;
	}
	public void setNotify(String notify) {
		this.notify = notify;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	public String getNotificationChannel() {
		return notificationChannel;
	}
	public void setNotificationChannel(String notificationChannel) {
		this.notificationChannel = notificationChannel;
	}
	public String getOfferStartDateStr() {
		return offerStartDateStr;
	}
	public void setOfferStartDateStr(String offerStartDateStr) {
		this.offerStartDateStr = offerStartDateStr;
	}
	public String getOfferEndDateStr() {
		return offerEndDateStr;
	}
	public void setOfferEndDateStr(String offerEndDateStr) {
		this.offerEndDateStr = offerEndDateStr;
	}
	public String getDealStartDateStr() {
		return dealStartDateStr;
	}
	public void setDealStartDateStr(String dealStartDateStr) {
		this.dealStartDateStr = dealStartDateStr;
	}
	public String getDealEndDateStr() {
		return dealEndDateStr;
	}
	public void setDealEndDateStr(String dealEndDateStr) {
		this.dealEndDateStr = dealEndDateStr;
	}
	public String getPeriodicStartDateStr() {
		return periodicStartDateStr;
	}
	public void setPeriodicStartDateStr(String periodicStartDateStr) {
		this.periodicStartDateStr = periodicStartDateStr;
	}
	public String getPeriodicEndDateStr() {
		return periodicEndDateStr;
	}
	public void setPeriodicEndDateStr(String periodicEndDateStr) {
		this.periodicEndDateStr = periodicEndDateStr;
	}
	public int getOfferPeriodInDays() {
		return offerPeriodInDays;
	}
	public void setOfferPeriodInDays(int offerPeriodInDays) {
		this.offerPeriodInDays = offerPeriodInDays;
	}
	public int getOfferPeriodInHours() {
		return offerPeriodInHours;
	}
	public void setOfferPeriodInHours(int offerPeriodInHours) {
		this.offerPeriodInHours = offerPeriodInHours;
	}
	public int getDealPeriodInDays() {
		return dealPeriodInDays;
	}
	public void setDealPeriodInDays(int dealPeriodInDays) {
		this.dealPeriodInDays = dealPeriodInDays;
	}
	public int getDealPeriodInHours() {
		return dealPeriodInHours;
	}
	public void setDealPeriodInHours(int dealPeriodInHours) {
		this.dealPeriodInHours = dealPeriodInHours;
	}
	public int getPeriodicPeriodInDays() {
		return periodicPeriodInDays;
	}
	public void setPeriodicPeriodInDays(int periodicPeriodInDays) {
		this.periodicPeriodInDays = periodicPeriodInDays;
	}
	public int getPeriodicPeriodInHours() {
		return periodicPeriodInHours;
	}
	public void setPeriodicPeriodInHours(int periodicPeriodInHours) {
		this.periodicPeriodInHours = periodicPeriodInHours;
	}
	public String getOfferName() {
		return offerName;
	}
	public void setOfferName(String offerName) {
		this.offerName = offerName;
	}
	public String getDealName() {
		return dealName;
	}
	public void setDealName(String dealName) {
		this.dealName = dealName;
	}
	public String getCustomerCategory() {
		return customerCategory;
	}
	public void setCustomerCategory(String customerCategory) {
		this.customerCategory = customerCategory;
	}
	public boolean isBirthDayEnable() {
		return birthDayEnable;
	}
	public void setBirthDayEnable(boolean birthDayEnable) {
		this.birthDayEnable = birthDayEnable;
	}
	public boolean isMarriageDayEnable() {
		return marriageDayEnable;
	}
	public void setMarriageDayEnable(boolean marriageDayEnable) {
		this.marriageDayEnable = marriageDayEnable;
	}
	public boolean isFestivalEnable() {
		return festivalEnable;
	}
	public void setFestivalEnable(boolean festivalEnable) {
		this.festivalEnable = festivalEnable;
	}
	public boolean isOfferEnable() {
		return offerEnable;
	}
	public void setOfferEnable(boolean offerEnable) {
		this.offerEnable = offerEnable;
	}
	public boolean isDealEnable() {
		return dealEnable;
	}
	public void setDealEnable(boolean dealEnable) {
		this.dealEnable = dealEnable;
	}
	public boolean isPeriodicEnable() {
		return periodicEnable;
	}
	public void setPeriodicEnable(boolean periodicEnable) {
		this.periodicEnable = periodicEnable;
	}
	public boolean isOutletEnable() {
		return outletEnable;
	}
	public void setOutletEnable(boolean outletEnable) {
		this.outletEnable = outletEnable;
	}
	public boolean isNewArrivalEnable() {
		return newArrivalEnable;
	}
	public void setNewArrivalEnable(boolean newArrivalEnable) {
		this.newArrivalEnable = newArrivalEnable;
	}
	public String getBirthDaySubject() {
		return birthDaySubject;
	}
	public void setBirthDaySubject(String birthDaySubject) {
		this.birthDaySubject = birthDaySubject;
	}
	public String getMarriageDaySubject() {
		return marriageDaySubject;
	}
	public void setMarriageDaySubject(String marriageDaySubject) {
		this.marriageDaySubject = marriageDaySubject;
	}
	public String getFestivalSubject() {
		return festivalSubject;
	}
	public void setFestivalSubject(String festivalSubject) {
		this.festivalSubject = festivalSubject;
	}
	public String getOfferSubject() {
		return offerSubject;
	}
	public void setOfferSubject(String offerSubject) {
		this.offerSubject = offerSubject;
	}
	public String getDealSubject() {
		return dealSubject;
	}
	public void setDealSubject(String dealSubject) {
		this.dealSubject = dealSubject;
	}
	public String getPeriodicSubject() {
		return periodicSubject;
	}
	public void setPeriodicSubject(String periodicSubject) {
		this.periodicSubject = periodicSubject;
	}
	public String getOutletSubject() {
		return outletSubject;
	}
	public void setOutletSubject(String outletSubject) {
		this.outletSubject = outletSubject;
	}
	public String getNewArrivalSubject() {
		return newArrivalSubject;
	}
	public void setNewArrivalSubject(String newArrivalSubject) {
		this.newArrivalSubject = newArrivalSubject;
	}
	public String getFilterId() {
		return filterId;
	}
	public void setFilterId(String filterId) {
		this.filterId = filterId;
	}
	public String getNotificationCategory() {
		return notificationCategory;
	}
	public void setNotificationCategory(String notificationCategory) {
		this.notificationCategory = notificationCategory;
	}
	public String getNotificationSubCategory() {
		return notificationSubCategory;
	}
	public void setNotificationSubCategory(String notificationSubCategory) {
		this.notificationSubCategory = notificationSubCategory;
	}
	public String getBirthDayMessage() {
		return birthDayMessage;
	}
	public void setBirthDayMessage(String birthDayMessage) {
		this.birthDayMessage = birthDayMessage;
	}
	public String getMarriageDayMessage() {
		return marriageDayMessage;
	}
	public void setMarriageDayMessage(String marriageDayMessage) {
		this.marriageDayMessage = marriageDayMessage;
	}
	public String getFestivalMessage() {
		return festivalMessage;
	}
	public void setFestivalMessage(String festivalMessage) {
		this.festivalMessage = festivalMessage;
	}
	public String getOfferMessage() {
		return offerMessage;
	}
	public void setOfferMessage(String offerMessage) {
		this.offerMessage = offerMessage;
	}
	public String getDealMessage() {
		return dealMessage;
	}
	public void setDealMessage(String dealMessage) {
		this.dealMessage = dealMessage;
	}
	public String getPeriodicMessage() {
		return periodicMessage;
	}
	public void setPeriodicMessage(String periodicMessage) {
		this.periodicMessage = periodicMessage;
	}
	public String getOutletMessage() {
		return outletMessage;
	}
	public void setOutletMessage(String outletMessage) {
		this.outletMessage = outletMessage;
	}
	public String getNewArrivalMessage() {
		return newArrivalMessage;
	}
	public void setNewArrivalMessage(String newArrivalMessage) {
		this.newArrivalMessage = newArrivalMessage;
	}
	private List<FilterInput> notificationMessages;
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getWareHouseName() {
		return wareHouseName;
	}
	public void setWareHouseName(String wareHouseName) {
		this.wareHouseName = wareHouseName;
	}
	public String getStockType() {
		return stockType;
	}
	public void setStockType(String stockType) {
		this.stockType = stockType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
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
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPriceRange() {
		return priceRange;
	}
	public void setPriceRange(String priceRange) {
		this.priceRange = priceRange;
	}
	public String getPurchaseChannel() {
		return purchaseChannel;
	}
	public void setPurchaseChannel(String purchaseChannel) {
		this.purchaseChannel = purchaseChannel;
	}
	public Integer getToAge() {
		return toAge;
	}
	public void setToAge(Integer toAge) {
		this.toAge = toAge;
	}
	public Integer getFromAge() {
		return fromAge;
	}
	public void setFromAge(Integer fromAge) {
		this.fromAge = fromAge;
	}
	public Integer getPriceRangeStartAmount() {
		return priceRangeStartAmount;
	}
	public void setPriceRangeStartAmount(Integer priceRangeStartAmount) {
		this.priceRangeStartAmount = priceRangeStartAmount;
	}
	public Integer getPriceRangeEndAmount() {
		return priceRangeEndAmount;
	}
	public void setPriceRangeEndAmount(Integer priceRangeEndAmount) {
		this.priceRangeEndAmount = priceRangeEndAmount;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getNotificationType() {
		return notificationType;
	}
	public void setNotificationType(String notificationType) {
		this.notificationType = notificationType;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public String getBcc() {
		return bcc;
	}
	public void setBcc(String bcc) {
		this.bcc = bcc;
	}
	public String getEventType() {
		return eventType;
	}
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
	public boolean isEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	public String getEventStartDateStr() {
		return eventStartDateStr;
	}
	public void setEventStartDateStr(String eventStartDateStr) {
		this.eventStartDateStr = eventStartDateStr;
	}
	public String getEventEndDateStr() {
		return eventEndDateStr;
	}
	public void setEventEndDateStr(String eventEndDateStr) {
		this.eventEndDateStr = eventEndDateStr;
	}
	public Integer getPeriodInDays() {
		return periodInDays;
	}
	public void setPeriodInDays(Integer periodInDays) {
		this.periodInDays = periodInDays;
	}
	public Integer getPeriodInHours() {
		return periodInHours;
	}
	public void setPeriodInHours(Integer periodInHours) {
		this.periodInHours = periodInHours;
	}
	public String getBatchName() {
		return batchName;
	}
	public void setBatchName(String batchName) {
		this.batchName = batchName;
	}
	public String getCalendarType() {
		return calendarType;
	}
	public void setCalendarType(String calendarType) {
		this.calendarType = calendarType;
	}
	public List<FilterInput> getNotificationMessages() {
		return notificationMessages;
	}
	public void setNotificationMessages(List<FilterInput> notificationMessages) {
		this.notificationMessages = notificationMessages;
	}
	public boolean isSaveCustomer() {
		return saveCustomer;
	}
	public void setSaveCustomer(boolean saveCustomer) {
		this.saveCustomer = saveCustomer;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getBookingId() {
		return bookingId;
	}
	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}
	public String getBookingType() {
		return bookingType;
	}
	public void setBookingType(String bookingType) {
		this.bookingType = bookingType;
	}
	public String getCheckInId() {
		return checkInId;
	}
	public void setCheckInId(String checkInId) {
		this.checkInId = checkInId;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getSlot() {
		return slot;
	}
	public void setSlot(String slot) {
		this.slot = slot;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getCustomerType() {
		return customerType;
	}
	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}
	
	
}
