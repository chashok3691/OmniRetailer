package com.tlabs.posweb.beans;

import java.util.List;

/*This bean useful for carrying the room booking information in json format
 * @author: Prasad Y Oct 31 2015
 * */
/**
 * @author mythri
 *
 */
public class RoomBooking {
 private RequestHeader requestHeader;
 private ResponseHeader responseHeader;
 //i.Bookings fields
 private String bookingId;
 private String bookingType;
 private String bookingChannel;
 private String locationId;
 private String companyName;
 private String gender;
 private String designation;
 private String phoneNumber;
 private String addressLine1;
 private String addressLine2;
 private String landMark;
 private String city;
 private String state;
 private String country;
 private String alternatePhoneNumber;
 private String email;
 private String idProofType;
 private String dobStr;
 private String purposeOfVisit;
 private String arrivedFrom;
 private String proceedingTo;
 private String checkInDateStr;
 private String checkOutDateStr;
 private String bookingStatus;
 private String dateTimeStr;
 private boolean vegetarian;
 private boolean pickUpRequired;
 private boolean dropRequired;
 private boolean dayCabRequired;
 private String pickUpTimeStr;
 private String dropTimeStr;
 private String taxyType;
 private String customerName;
 private Double rentalAmount;
 private Double totalTaxes;
 private Double totalDiscounts;
 private Double netToBePaid;
 private Double balanceAmount;
 private String lastUpdatedDateTimeStr;

 //ii.BookingTransactions fields
 private String transactionId;
 private String modeOfPayment;
 private String cardType;
 private String couponNumber;
 private Double paidAmount;
 private String checkInId;
 private Double loyaltyRewards;
 private Double dealsAndOffers;
 private Double taxes;
 private Double specialDiscounts;
 private String approvalCode;
 private String cardInfo;
 
 //iii.additional fields
// private List<Room> requiredRoomsInfo;
 private List<RoomBooking> bookingsInfo;
 //private List<HotelCustomer> customers;
 private String totalRecords;
 private String checkInStatus;
 private List<RoomBooking> transactions;
 
 //iv.check in fields
 private String description;
 private String roomNo;
 
 
 private String noOfCustomers;
 private String categoryName;
 
 private String totalBillAmount;
 
 private int slNo;
 
public int getSlNo() {
	return slNo;
}
public void setSlNo(int slNo) {
	this.slNo = slNo;
}
public String getTotalBillAmount() {
	return totalBillAmount;
}
public void setTotalBillAmount(String totalBillAmount) {
	this.totalBillAmount = totalBillAmount;
}
public String getCategoryName() {
	return categoryName;
}
public void setCategoryName(String categoryName) {
	this.categoryName = categoryName;
}
public String getNoOfCustomers() {
	return noOfCustomers;
}
public void setNoOfCustomers(String noOfCustomers) {
	this.noOfCustomers = noOfCustomers;
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
public String getBookingChannel() {
	return bookingChannel;
}
public void setBookingChannel(String bookingChannel) {
	this.bookingChannel = bookingChannel;
}
public String getLocationId() {
	return locationId;
}
public void setLocationId(String locationId) {
	this.locationId = locationId;
}
public String getCompanyName() {
	return companyName;
}
public void setCompanyName(String companyName) {
	this.companyName = companyName;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getDesignation() {
	return designation;
}
public void setDesignation(String designation) {
	this.designation = designation;
}
public String getPhoneNumber() {
	return phoneNumber;
}
public void setPhoneNumber(String phoneNumber) {
	this.phoneNumber = phoneNumber;
}
public String getAddressLine1() {
	return addressLine1;
}
public void setAddressLine1(String addressLine1) {
	this.addressLine1 = addressLine1;
}
public String getAddressLine2() {
	return addressLine2;
}
public void setAddressLine2(String addressLine2) {
	this.addressLine2 = addressLine2;
}
public String getLandMark() {
	return landMark;
}
public void setLandMark(String landMark) {
	this.landMark = landMark;
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
public String getAlternatePhoneNumber() {
	return alternatePhoneNumber;
}
public void setAlternatePhoneNumber(String alternatePhoneNumber) {
	this.alternatePhoneNumber = alternatePhoneNumber;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getIdProofType() {
	return idProofType;
}
public void setIdProofType(String idProofType) {
	this.idProofType = idProofType;
}
public String getDobStr() {
	return dobStr;
}
public void setDobStr(String dobStr) {
	this.dobStr = dobStr;
}
public String getPurposeOfVisit() {
	return purposeOfVisit;
}
public void setPurposeOfVisit(String purposeOfVisit) {
	this.purposeOfVisit = purposeOfVisit;
}

public String getArrivedFrom() {
	return arrivedFrom;
}
public void setArrivedFrom(String arrivedFrom) {
	this.arrivedFrom = arrivedFrom;
}
public String getProceedingTo() {
	return proceedingTo;
}
public void setProceedingTo(String proceedingTo) {
	this.proceedingTo = proceedingTo;
}
public String getCheckInDateStr() {
	return checkInDateStr;
}
public void setCheckInDateStr(String checkInDateStr) {
	this.checkInDateStr = checkInDateStr;
}
public String getCheckOutDateStr() {
	return checkOutDateStr;
}
public void setCheckOutDateStr(String checkOutDateStr) {
	this.checkOutDateStr = checkOutDateStr;
}
public String getBookingStatus() {
	return bookingStatus;
}
public void setBookingStatus(String bookingStatus) {
	this.bookingStatus = bookingStatus;
}
public String getDateTimeStr() {
	return dateTimeStr;
}
public void setDateTimeStr(String dateTimeStr) {
	this.dateTimeStr = dateTimeStr;
}
public boolean isVegetarian() {
	return vegetarian;
}
public void setVegetarian(boolean vegetarian) {
	this.vegetarian = vegetarian;
}
public String getTransactionId() {
	return transactionId;
}
public void setTransactionId(String transactionId) {
	this.transactionId = transactionId;
}
public String getModeOfPayment() {
	return modeOfPayment;
}
public void setModeOfPayment(String modeOfPayment) {
	this.modeOfPayment = modeOfPayment;
}
public String getCardType() {
	return cardType;
}
public void setCardType(String cardType) {
	this.cardType = cardType;
}
public String getCouponNumber() {
	return couponNumber;
}
public void setCouponNumber(String couponNumber) {
	this.couponNumber = couponNumber;
}
public Double getPaidAmount() {
	return paidAmount;
}
public void setPaidAmount(Double paidAmount) {
	this.paidAmount = paidAmount;
}
public RequestHeader getRequestHeader() {
	return requestHeader;
}
public void setRequestHeader(RequestHeader requestHeader) {
	this.requestHeader = requestHeader;
}
public boolean isPickUpRequired() {
	return pickUpRequired;
}
public void setPickUpRequired(boolean pickUpRequired) {
	this.pickUpRequired = pickUpRequired;
}
public boolean isDropRequired() {
	return dropRequired;
}
public void setDropRequired(boolean dropRequired) {
	this.dropRequired = dropRequired;
}
public boolean isDayCabRequired() {
	return dayCabRequired;
}
public void setDayCabRequired(boolean dayCabRequired) {
	this.dayCabRequired = dayCabRequired;
}
public String getPickUpTimeStr() {
	return pickUpTimeStr;
}
public void setPickUpTimeStr(String pickUpTimeStr) {
	this.pickUpTimeStr = pickUpTimeStr;
}
public String getDropTimeStr() {
	return dropTimeStr;
}
public void setDropTimeStr(String dropTimeStr) {
	this.dropTimeStr = dropTimeStr;
}
public String getTaxyType() {
	return taxyType;
}
public void setTaxyType(String taxyType) {
	this.taxyType = taxyType;
}
public String getCustomerName() {
	return customerName;
}
public void setCustomerName(String customerName) {
	this.customerName = customerName;
}

public ResponseHeader getResponseHeader() {
	return responseHeader;
}
public void setResponseHeader(ResponseHeader responseHeader) {
	this.responseHeader = responseHeader;
}
public List<RoomBooking> getBookingsInfo() {
	return bookingsInfo;
}
public void setBookingsInfo(List<RoomBooking> bookingsInfo) {
	this.bookingsInfo = bookingsInfo;
}
public String getCheckInId() {
	return checkInId;
}
public void setCheckInId(String checkInId) {
	this.checkInId = checkInId;
}
public Double getLoyaltyRewards() {
	return loyaltyRewards;
}
public void setLoyaltyRewards(Double loyaltyRewards) {
	this.loyaltyRewards = loyaltyRewards;
}
public Double getDealsAndOffers() {
	return dealsAndOffers;
}
public void setDealsAndOffers(Double dealsAndOffers) {
	this.dealsAndOffers = dealsAndOffers;
}
public Double getTaxes() {
	return taxes;
}
public void setTaxes(Double taxes) {
	this.taxes = taxes;
}
public Double getSpecialDiscounts() {
	return specialDiscounts;
}
public void setSpecialDiscounts(Double specialDiscounts) {
	this.specialDiscounts = specialDiscounts;
}

public Double getRentalAmount() {
	return rentalAmount;
}
public void setRentalAmount(Double rentalAmount) {
	this.rentalAmount = rentalAmount;
}
public Double getTotalTaxes() {
	return totalTaxes;
}
public void setTotalTaxes(Double totalTaxes) {
	this.totalTaxes = totalTaxes;
}
public Double getTotalDiscounts() {
	return totalDiscounts;
}
public void setTotalDiscounts(Double totalDiscounts) {
	this.totalDiscounts = totalDiscounts;
}
public Double getNetToBePaid() {
	return netToBePaid;
}
public void setNetToBePaid(Double netToBePaid) {
	this.netToBePaid = netToBePaid;
}
public Double getBalanceAmount() {
	return balanceAmount;
}
public void setBalanceAmount(Double balanceAmount) {
	this.balanceAmount = balanceAmount;
}
public String getApprovalCode() {
	return approvalCode;
}
public void setApprovalCode(String approvalCode) {
	this.approvalCode = approvalCode;
}
public String getCardInfo() {
	return cardInfo;
}
public void setCardInfo(String cardInfo) {
	this.cardInfo = cardInfo;
}
public String getTotalRecords() {
	return totalRecords;
}
public void setTotalRecords(String totalRecords) {
	this.totalRecords = totalRecords;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getRoomNo() {
	return roomNo;
}
public void setRoomNo(String roomNo) {
	this.roomNo = roomNo;
}
public String getCheckInStatus() {
	return checkInStatus;
}
public void setCheckInStatus(String checkInStatus) {
	this.checkInStatus = checkInStatus;
}
public List<RoomBooking> getTransactions() {
	return transactions;
}
public void setTransactions(List<RoomBooking> transactions) {
	this.transactions = transactions;
}
public String getLastUpdatedDateTimeStr() {
	return lastUpdatedDateTimeStr;
}
public void setLastUpdatedDateTimeStr(String lastUpdatedDateTimeStr) {
	this.lastUpdatedDateTimeStr = lastUpdatedDateTimeStr;
}

}
