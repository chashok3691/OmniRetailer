package com.tlabs.posweb.beans;

import java.util.List;

/*This method used to view all the table bookings for FandB
 * @author: Prasad Y Dec 4 2015
 * */
public class TableBookings {
	//i..authentication fields
    private ResponseHeader responseHeader;
    
    //ii.orders fields
	private String orderReference;
	private String customerId;
	private String email=null;
	private String mobileNumber=null;
	private String salesExecutive ;
	private String orderType;
	private String shipmentAddress1;
	private String shipmentAddress2;
	private String shipmentContact;
	private String salesLocation;
	private String status;
	private Float subTotal;
	private Float tax;
	private Float grandTotal;
	private String storeLocation;
	
	private String dateStr;
	private String createdOnStr;
	private String arrivedTimeStr;
	/*fields added during the BBQN on Dec 2 2015 Prasad y start*/
	private String callId;
	private String slotId;
	private Integer adultPax;
	private Integer childPax;
	private String reservationStatusId;
	private Integer actualAdultPax;
	private Integer actualChildPax;
	private String specialInstructions;
	private String reservationTypeId;
	private String bookingId;
	private String occasionId;
	private String createdBy;
	private String adultFoodTypeVeg;
	private String adultFoodTypeNonVeg;
	private String childFoodTypeVegNonVeg;
	private Integer childBelow6;
	private Double adultVegPrice;
	private Double adultNonVegPrice;
	private Double childPrice;
	private Double swachTax;
	private String deviceId;
	private String outletName;
	private String occasionDesc;
	private String customerName;
	private Double serviceCharges;
	private Double vat;
	private String reservationDateTimeStr;
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	private String seatingDateTimeStr;
	private String settlementdateTimeStr;
	private Double serviceTax;
	private String lastModifiedBy;
	private String lastModifiedDateStr;

	//iii.additional fields
    private	List<TableBookings> tableBookings;
	
    
    //added...
    private String totalRecords;
	private String store_location;
	private String date;
	private String noOfVegAdults;
	private String noOfNonVegAdult;
	private String noOfVegChildren;
	private String createdOn;
	private String customer_Id;
	private String arrivedTime;
	private String seatingDateTime;
	private String settlementdateTime;
	private int slNo;
	
   
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public String getSettlementdateTime() {
		return settlementdateTime;
	}
	public void setSettlementdateTime(String settlementdateTime) {
		this.settlementdateTime = settlementdateTime;
	}
	public String getSeatingDateTime() {
		return seatingDateTime;
	}
	public void setSeatingDateTime(String seatingDateTime) {
		this.seatingDateTime = seatingDateTime;
	}
	public String getArrivedTime() {
		return arrivedTime;
	}
	public void setArrivedTime(String arrivedTime) {
		this.arrivedTime = arrivedTime;
	}
	public String getCustomer_Id() {
		return customer_Id;
	}
	public void setCustomer_Id(String customer_Id) {
		this.customer_Id = customer_Id;
	}
	public String getStore_location() {
		return store_location;
	}
	public String getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}
	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}

    
    
    
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public String getOrderReference() {
		return orderReference;
	}
	public void setOrderReference(String orderReference) {
		this.orderReference = orderReference;
	}
	public String getDateStr() {
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getSalesExecutive() {
		return salesExecutive;
	}
	public void setSalesExecutive(String salesExecutive) {
		this.salesExecutive = salesExecutive;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getShipmentAddress1() {
		return shipmentAddress1;
	}
	public void setShipmentAddress1(String shipmentAddress1) {
		this.shipmentAddress1 = shipmentAddress1;
	}
	public String getShipmentAddress2() {
		return shipmentAddress2;
	}
	public void setShipmentAddress2(String shipmentAddress2) {
		this.shipmentAddress2 = shipmentAddress2;
	}
	public String getShipmentContact() {
		return shipmentContact;
	}
	public void setShipmentContact(String shipmentContact) {
		this.shipmentContact = shipmentContact;
	}
	public String getSalesLocation() {
		return salesLocation;
	}
	public void setSalesLocation(String salesLocation) {
		this.salesLocation = salesLocation;
	}
	public String getStatus() {
		return status;
	}
	public String getNoOfVegAdults() {
		return noOfVegAdults;
	}
	public void setNoOfVegAdults(String noOfVegAdults) {
		this.noOfVegAdults = noOfVegAdults;
	}
	public String getNoOfNonVegAdult() {
		return noOfNonVegAdult;
	}
	public void setNoOfNonVegAdult(String noOfNonVegAdult) {
		this.noOfNonVegAdult = noOfNonVegAdult;
	}
	public String getNoOfVegChildren() {
		return noOfVegChildren;
	}
	public void setNoOfVegChildren(String noOfVegChildren) {
		this.noOfVegChildren = noOfVegChildren;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Float getSubTotal() {
		return subTotal;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setSubTotal(Float subTotal) {
		this.subTotal = subTotal;
	}
	public Float getTax() {
		return tax;
	}
	public void setTax(Float tax) {
		this.tax = tax;
	}
	public Float getGrandTotal() {
		return grandTotal;
	}
	public void setGrandTotal(Float grandTotal) {
		this.grandTotal = grandTotal;
	}
	
	public String getCreatedOnStr() {
		return createdOnStr;
	}
	public void setCreatedOnStr(String createdOnStr) {
		this.createdOnStr = createdOnStr;
	}
	public String getCallId() {
		return callId;
	}
	public void setCallId(String callId) {
		this.callId = callId;
	}
	public String getSlotId() {
		return slotId;
	}
	public void setSlotId(String slotId) {
		this.slotId = slotId;
	}
	public Integer getAdultPax() {
		return adultPax;
	}
	public void setAdultPax(Integer adultPax) {
		this.adultPax = adultPax;
	}
	public Integer getChildPax() {
		return childPax;
	}
	public void setChildPax(Integer childPax) {
		this.childPax = childPax;
	}
	public String getReservationStatusId() {
		return reservationStatusId;
	}
	public void setReservationStatusId(String reservationStatusId) {
		this.reservationStatusId = reservationStatusId;
	}
	public Integer getActualAdultPax() {
		return actualAdultPax;
	}
	public void setActualAdultPax(Integer actualAdultPax) {
		this.actualAdultPax = actualAdultPax;
	}
	public Integer getActualChildPax() {
		return actualChildPax;
	}
	public void setActualChildPax(Integer actualChildPax) {
		this.actualChildPax = actualChildPax;
	}
	public String getArrivedTimeStr() {
		return arrivedTimeStr;
	}
	public void setArrivedTimeStr(String arrivedTimeStr) {
		this.arrivedTimeStr = arrivedTimeStr;
	}
	public String getSpecialInstructions() {
		return specialInstructions;
	}
	public void setSpecialInstructions(String specialInstructions) {
		this.specialInstructions = specialInstructions;
	}
	public String getReservationTypeId() {
		return reservationTypeId;
	}
	public void setReservationTypeId(String reservationTypeId) {
		this.reservationTypeId = reservationTypeId;
	}
	public String getBookingId() {
		return bookingId;
	}
	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}
	public String getOccasionId() {
		return occasionId;
	}
	public void setOccasionId(String occasionId) {
		this.occasionId = occasionId;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getAdultFoodTypeVeg() {
		return adultFoodTypeVeg;
	}
	public void setAdultFoodTypeVeg(String adultFoodTypeVeg) {
		this.adultFoodTypeVeg = adultFoodTypeVeg;
	}
	public String getAdultFoodTypeNonVeg() {
		return adultFoodTypeNonVeg;
	}
	public void setAdultFoodTypeNonVeg(String adultFoodTypeNonVeg) {
		this.adultFoodTypeNonVeg = adultFoodTypeNonVeg;
	}
	public String getChildFoodTypeVegNonVeg() {
		return childFoodTypeVegNonVeg;
	}
	public void setChildFoodTypeVegNonVeg(String childFoodTypeVegNonVeg) {
		this.childFoodTypeVegNonVeg = childFoodTypeVegNonVeg;
	}
	public Integer getChildBelow6() {
		return childBelow6;
	}
	public void setChildBelow6(Integer childBelow6) {
		this.childBelow6 = childBelow6;
	}
	public Double getAdultVegPrice() {
		return adultVegPrice;
	}
	public void setAdultVegPrice(Double adultVegPrice) {
		this.adultVegPrice = adultVegPrice;
	}
	public Double getAdultNonVegPrice() {
		return adultNonVegPrice;
	}
	public void setAdultNonVegPrice(Double adultNonVegPrice) {
		this.adultNonVegPrice = adultNonVegPrice;
	}
	public Double getChildPrice() {
		return childPrice;
	}
	public void setChildPrice(Double childPrice) {
		this.childPrice = childPrice;
	}
	public Double getSwachTax() {
		return swachTax;
	}
	public void setSwachTax(Double swachTax) {
		this.swachTax = swachTax;
	}
	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	public String getOutletName() {
		return outletName;
	}
	public void setOutletName(String outletName) {
		this.outletName = outletName;
	}
	public String getOccasionDesc() {
		return occasionDesc;
	}
	public void setOccasionDesc(String occasionDesc) {
		this.occasionDesc = occasionDesc;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public Double getServiceCharges() {
		return serviceCharges;
	}
	public void setServiceCharges(Double serviceCharges) {
		this.serviceCharges = serviceCharges;
	}
	public Double getVat() {
		return vat;
	}
	public void setVat(Double vat) {
		this.vat = vat;
	}
	public String getReservationDateTimeStr() {
		return reservationDateTimeStr;
	}
	public void setReservationDateTimeStr(String reservationDateTimeStr) {
		this.reservationDateTimeStr = reservationDateTimeStr;
	}
	public String getSeatingDateTimeStr() {
		return seatingDateTimeStr;
	}
	public void setSeatingDateTimeStr(String seatingDateTimeStr) {
		this.seatingDateTimeStr = seatingDateTimeStr;
	}
	public String getSettlementdateTimeStr() {
		return settlementdateTimeStr;
	}
	public void setSettlementdateTimeStr(String settlementdateTimeStr) {
		this.settlementdateTimeStr = settlementdateTimeStr;
	}
	public Double getServiceTax() {
		return serviceTax;
	}
	public void setServiceTax(Double serviceTax) {
		this.serviceTax = serviceTax;
	}
	public String getLastModifiedBy() {
		return lastModifiedBy;
	}
	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}
	public String getLastModifiedDateStr() {
		return lastModifiedDateStr;
	}
	public void setLastModifiedDateStr(String lastModifiedDateStr) {
		this.lastModifiedDateStr = lastModifiedDateStr;
	}
	public List<TableBookings> getTableBookings() {
		return tableBookings;
	}
	public void setTableBookings(List<TableBookings> tableBookings) {
		this.tableBookings = tableBookings;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	
	
	
}
