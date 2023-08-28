/**
 * 
 */
package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * @author Sambaiah Y
 *
 */
public class OrderDetails {
	
	private String searchCriteria;
	private String orderId;
	private String CustomerId;
	private String orderDate;
	private String sales_executive_name;
	private String email_id;
	private String mobile_num;
	private String deliveryDate;
	private String confirmedDate;
	private String shipement_address_street;
	private String shipement_address_location;
	private String shipement_address_city;
	private String shipement_address_doorNo;
	private String billing_address_street;
	private String billing_address_location;
	private String billing_address_city;
	private String billing_address_doorNo;
	private String customer_address_street;
	private String customer_address_location;
	private String customer_address_city;
	private String customer_address_doorNo;
	private String orderChannel;
	private String orderDeliveryType;
	private String shipmentMode;
	private String shipperId;
	private double orderTotalCost;
	private double orderTax;
	private String shipmentCharges;
	private double totalOrderAmount;
	private String paymentType;
	private String paymentMode;
	private String orderStatus;
	private String saleLocation;
	private String customerFeedback;
	private String remarks;
	private List<OrderedItems> itemDetails;
	private List<OrderedItems> orderedItemsList;
	private List<WHOrderedItems> whOrderedItemsList;
	private RequestHeader requestHeader;
	private String startIndex;
	private String items;
	private String operation;
	private String totalRecords;
	private int slNo;
	private String orderStartDate;
	private String orderEndDate;
	private String maxRecords;
	private String flowUnder;
	private String delivery_date;
	private String order_date;
	private List<String> nextActivities;
	private String status;
	private String selectedStatus;
	private boolean outletAll;
	private boolean warehouseAll;
	private boolean isForShipment;
	private boolean shippedOrders;
	private String shipmentName;
	private String shipmentContact;
	private String shipmentState;
	private String shipmentCountry;
	private String cartId;
	private String address;
	private List<CustomerAddress> addressList;
	private String subTotal;
	private String latitude;
	private String longitude;
	private String viewOrEdit;
	private String mobile_num_code;
	private String shipmentContactCode;
	private String country;
	private String custAddressId;
	private String deliverySlotStartTime;
	private String deliverySlotEndTime;
	private String confirmedSlotEndTime;
	private String confirmedSlotStartTime;
	private String delivery_slot;
	private Date orderPlacedDate;
	private String orderPlacedDateStr;
	private boolean  isSaveFlag;
	private String urlOfSaveOrders;
	private String zoneId;
	
	
	private String billId;
	private String logisticsOrderStatus;
	
	

	public String getLogisticsOrderStatus() {
		return logisticsOrderStatus;
	}

	public void setLogisticsOrderStatus(String logisticsOrderStatus) {
		this.logisticsOrderStatus = logisticsOrderStatus;
	}

	public String getBillId() {
		return billId;
	}

	public void setBillId(String billId) {
		this.billId = billId;
	}

	
	
	
	
	
	private List<String> zoneList;
	
	
	
	public List<String> getZoneList() {
		return zoneList;
	}

	public void setZoneList(List<String> zoneList) {
		this.zoneList = zoneList;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getUrlOfSaveOrders() {
		return urlOfSaveOrders;
	}
	public void setUrlOfSaveOrders(String urlOfSaveOrders) {
		this.urlOfSaveOrders = urlOfSaveOrders;
	}
	
	public boolean isSaveFlag() {
		return isSaveFlag;
	}

	public void setSaveFlag(boolean isSaveFlag) {
		this.isSaveFlag = isSaveFlag;
	}

	public String getConfirmedDate() {
		return confirmedDate;
	}

	public void setConfirmedDate(String confirmedDate) {
		this.confirmedDate = confirmedDate;
	}

	public Date getOrderPlacedDate() {
		return orderPlacedDate;
	}

	public void setOrderPlacedDate(Date orderPlacedDate) {
		this.orderPlacedDate = orderPlacedDate;
	}

	public String getOrderPlacedDateStr() {
		return orderPlacedDateStr;
	}

	public void setOrderPlacedDateStr(String orderPlacedDateStr) {
		this.orderPlacedDateStr = orderPlacedDateStr;
	}

	public String getDeliverySlotStartTime() {
		return deliverySlotStartTime;
	}

	public void setDeliverySlotStartTime(String deliverySlotStartTime) {
		this.deliverySlotStartTime = deliverySlotStartTime;
	}

	public String getDeliverySlotEndTime() {
		return deliverySlotEndTime;
	}

	public void setDeliverySlotEndTime(String deliverySlotEndTime) {
		this.deliverySlotEndTime = deliverySlotEndTime;
	}

	public String getConfirmedSlotEndTime() {
		return confirmedSlotEndTime;
	}

	public void setConfirmedSlotEndTime(String confirmedSlotEndTime) {
		this.confirmedSlotEndTime = confirmedSlotEndTime;
	}

	public String getConfirmedSlotStartTime() {
		return confirmedSlotStartTime;
	}

	public void setConfirmedSlotStartTime(String confirmedSlotStartTime) {
		this.confirmedSlotStartTime = confirmedSlotStartTime;
	}

	public String getDelivery_slot() {
		return delivery_slot;
	}

	public void setDelivery_slot(String delivery_slot) {
		this.delivery_slot = delivery_slot;
	}

	private String custphoneNumberCode;
	private String billphoneNumberCode;
	
	  private String discountId;
      public String getDiscountId() {
		return discountId;
	}

	public void setDiscountId(String discountId) {
		this.discountId = discountId;
	}

	public BigDecimal getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(BigDecimal subtotal) {
		this.subtotal = subtotal;
	}

	private BigDecimal subtotal=new BigDecimal("0"); 
	
	public String getCustphoneNumberCode() {
		return custphoneNumberCode;
	}

	public void setCustphoneNumberCode(String custphoneNumberCode) {
		this.custphoneNumberCode = custphoneNumberCode;
	}

	public String getBillphoneNumberCode() {
		return billphoneNumberCode;
	}

	public void setBillphoneNumberCode(String billphoneNumberCode) {
		this.billphoneNumberCode = billphoneNumberCode;
	}

	private String customer_map_link;
	private String billing_map_link;
	private String customer_pinNo;
	private String billing_pinNo;
	private String paymentRef;
	private String referredBy;
	private BigDecimal specialDiscount=new BigDecimal("0");
	private String sales_executive_id;
	private String billingMobileNo;
	
	public String getBillingMobileNo() {
		return billingMobileNo;
	}

	public void setBillingMobileNo(String billingMobileNo) {
		this.billingMobileNo = billingMobileNo;
	}

	public String getCustomerContactNum() {
		return customerContactNum;
	}

	public void setCustomerContactNum(String customerContactNum) {
		this.customerContactNum = customerContactNum;
	}

	private String customerContactNum;
	
	public String getCustomer_map_link() {
		return customer_map_link;
	}

	public void setCustomer_map_link(String customer_map_link) {
		this.customer_map_link = customer_map_link;
	}

	public String getBilling_map_link() {
		return billing_map_link;
	}

	public void setBilling_map_link(String billing_map_link) {
		this.billing_map_link = billing_map_link;
	}

	public String getCustomer_pinNo() {
		return customer_pinNo;
	}

	public void setCustomer_pinNo(String customer_pinNo) {
		this.customer_pinNo = customer_pinNo;
	}

	public String getBilling_pinNo() {
		return billing_pinNo;
	}

	public void setBilling_pinNo(String billing_pinNo) {
		this.billing_pinNo = billing_pinNo;
	}

	public String getPaymentRef() {
		return paymentRef;
	}

	public void setPaymentRef(String paymentRef) {
		this.paymentRef = paymentRef;
	}

	public String getReferredBy() {
		return referredBy;
	}

	public void setReferredBy(String referredBy) {
		this.referredBy = referredBy;
	}

	public BigDecimal getSpecialDiscount() {
		return specialDiscount;
	}

	public void setSpecialDiscount(BigDecimal specialDiscount) {
		this.specialDiscount = specialDiscount;
	}

	public String getSales_executive_id() {
		return sales_executive_id;
	}

	public void setSales_executive_id(String sales_executive_id) {
		this.sales_executive_id = sales_executive_id;
	}

	private BigDecimal cgstAmt=new BigDecimal("0");
	
	public BigDecimal getCgstAmt() {
		return cgstAmt;
	}

	public void setCgstAmt(BigDecimal cgstAmt) {
		this.cgstAmt = cgstAmt;
	}

	public BigDecimal getSgstAmt() {
		return sgstAmt;
	}

	public void setSgstAmt(BigDecimal sgstAmt) {
		this.sgstAmt = sgstAmt;
	}

	public BigDecimal getIsgstAmt() {
		return isgstAmt;
	}

	public void setIsgstAmt(BigDecimal isgstAmt) {
		this.isgstAmt = isgstAmt;
	}

	public BigDecimal getOtherTaxAmt() {
		return otherTaxAmt;
	}

	public void setOtherTaxAmt(BigDecimal otherTaxAmt) {
		this.otherTaxAmt = otherTaxAmt;
	}

	public BigDecimal getDueAmount() {
		return dueAmount;
	}

	public void setDueAmount(BigDecimal dueAmount) {
		this.dueAmount = dueAmount;
	}

	public BigDecimal getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(BigDecimal paidAmount) {
		this.paidAmount = paidAmount;
	}

	public BigDecimal getOtherDiscounts() {
		return otherDiscounts;
	}

	public void setOtherDiscounts(BigDecimal otherDiscounts) {
		this.otherDiscounts = otherDiscounts;
	}

	private BigDecimal sgstAmt=new BigDecimal("0");;
	private BigDecimal isgstAmt=new BigDecimal("0");;
	
	private BigDecimal otherTaxAmt=new BigDecimal("0");;
	private BigDecimal dueAmount=new BigDecimal("0");;
	private BigDecimal paidAmount=new BigDecimal("0");;
	private BigDecimal otherDiscounts=new BigDecimal("0");;
	
	private String orderStartValue;
	private String orderEndValue;
	
	public String getOrderStartValue() {
		return orderStartValue;
	}

	public void setOrderStartValue(String orderStartValue) {
		this.orderStartValue = orderStartValue;
	}

	public String getOrderEndValue() {
		return orderEndValue;
	}

	public void setOrderEndValue(String orderEndValue) {
		this.orderEndValue = orderEndValue;
	}

	public String getCustAddressId() {
		return custAddressId;
	}

	public void setCustAddressId(String custAddressId) {
		this.custAddressId = custAddressId;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getMobile_num_code() {
		return mobile_num_code;
	}

	public void setMobile_num_code(String mobile_num_code) {
		this.mobile_num_code = mobile_num_code;
	}

	public String getShipmentContactCode() {
		return shipmentContactCode;
	}

	public void setShipmentContactCode(String shipmentContactCode) {
		this.shipmentContactCode = shipmentContactCode;
	}

	public String getViewOrEdit() {
		return viewOrEdit;
	}

	public void setViewOrEdit(String viewOrEdit) {
		this.viewOrEdit = viewOrEdit;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(String subTotal) {
		this.subTotal = subTotal;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<CustomerAddress> getAddressList() {
		return addressList;
	}

	public void setAddressList(List<CustomerAddress> addressList) {
		this.addressList = addressList;
	}

	public String getShipmentName() {
		return shipmentName;
	}

	public void setShipmentName(String shipmentName) {
		this.shipmentName = shipmentName;
	}

	public String getShipmentContact() {
		return shipmentContact;
	}

	public void setShipmentContact(String shipmentContact) {
		this.shipmentContact = shipmentContact;
	}

	public String getShipmentState() {
		return shipmentState;
	}

	public void setShipmentState(String shipmentState) {
		this.shipmentState = shipmentState;
	}

	public String getShipmentCountry() {
		return shipmentCountry;
	}

	public void setShipmentCountry(String shipmentCountry) {
		this.shipmentCountry = shipmentCountry;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public boolean isShippedOrders() {
		return shippedOrders;
	}

	public void setShippedOrders(boolean shippedOrders) {
		this.shippedOrders = shippedOrders;
	}

	public boolean isForShipment() {
		return isForShipment;
	}

	public void setForShipment(boolean isForShipment) {
		this.isForShipment = isForShipment;
	}

	public boolean isOutletAll() {
		return outletAll;
	}

	public void setOutletAll(boolean outletAll) {
		this.outletAll = outletAll;
	}

	public boolean isWarehouseAll() {
		return warehouseAll;
	}

	public void setWarehouseAll(boolean warehouseAll) {
		this.warehouseAll = warehouseAll;
	}

	public String getSelectedStatus() {
		return selectedStatus;
	}

	public void setSelectedStatus(String selectedStatus) {
		this.selectedStatus = selectedStatus;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDelivery_date() {
		return delivery_date;
	}

	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public List<String> getNextActivities() {
		return nextActivities;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

	public String getFlowUnder() {
		return flowUnder;
	}

	public void setFlowUnder(String flowUnder) {
		this.flowUnder = flowUnder;
	}

	public String getOrderStartDate() {
		return orderStartDate;
	}

	public void setOrderStartDate(String orderStartDate) {
		this.orderStartDate = orderStartDate;
	}

	public String getOrderEndDate() {
		return orderEndDate;
	}

	public void setOrderEndDate(String orderEndDate) {
		this.orderEndDate = orderEndDate;
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

	public List<WHOrderedItems> getWhOrderedItemsList() {
		return whOrderedItemsList;
	}

	public void setWhOrderedItemsList(List<WHOrderedItems> whOrderedItemsList) {
		this.whOrderedItemsList = whOrderedItemsList;
	}

	public String getItems() {
		return items;
	}

	public void setItems(String items) {
		this.items = items;
	}

	public String getShipement_address_doorNo() {
		return shipement_address_doorNo;
	}

	public void setShipement_address_doorNo(String shipement_address_doorNo) {
		this.shipement_address_doorNo = shipement_address_doorNo;
	}

	public String getBilling_address_doorNo() {
		return billing_address_doorNo;
	}

	public void setBilling_address_doorNo(String billing_address_doorNo) {
		this.billing_address_doorNo = billing_address_doorNo;
	}

	public String getCustomer_address_doorNo() {
		return customer_address_doorNo;
	}

	public void setCustomer_address_doorNo(String customer_address_doorNo) {
		this.customer_address_doorNo = customer_address_doorNo;
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

	
	public List<OrderedItems> getItemDetails() {
		return itemDetails;
	}

	public void setItemDetails(List<OrderedItems> itemDetails) {
		this.itemDetails = itemDetails;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getCustomerId() {
		return CustomerId;
	}

	public void setCustomerId(String customerId) {
		CustomerId = customerId;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getSales_executive_name() {
		return sales_executive_name;
	}

	public void setSales_executive_name(String sales_executive_name) {
		this.sales_executive_name = sales_executive_name;
	}

	public String getEmail_id() {
		return email_id;
	}

	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}

	public String getMobile_num() {
		return mobile_num;
	}

	public void setMobile_num(String mobile_num) {
		this.mobile_num = mobile_num;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public String getShipement_address_street() {
		return shipement_address_street;
	}

	public void setShipement_address_street(String shipement_address_street) {
		this.shipement_address_street = shipement_address_street;
	}

	public String getShipement_address_location() {
		return shipement_address_location;
	}

	public void setShipement_address_location(String shipement_address_location) {
		this.shipement_address_location = shipement_address_location;
	}

	public String getShipement_address_city() {
		return shipement_address_city;
	}

	public void setShipement_address_city(String shipement_address_city) {
		this.shipement_address_city = shipement_address_city;
	}

	public String getBilling_address_street() {
		return billing_address_street;
	}

	public void setBilling_address_street(String billing_address_street) {
		this.billing_address_street = billing_address_street;
	}

	public String getBilling_address_location() {
		return billing_address_location;
	}

	public void setBilling_address_location(String billing_address_location) {
		this.billing_address_location = billing_address_location;
	}

	public String getBilling_address_city() {
		return billing_address_city;
	}

	public void setBilling_address_city(String billing_address_city) {
		this.billing_address_city = billing_address_city;
	}

	public String getCustomer_address_street() {
		return customer_address_street;
	}

	public void setCustomer_address_street(String customer_address_street) {
		this.customer_address_street = customer_address_street;
	}

	public String getCustomer_address_location() {
		return customer_address_location;
	}

	public void setCustomer_address_location(String customer_address_location) {
		this.customer_address_location = customer_address_location;
	}

	public String getCustomer_address_city() {
		return customer_address_city;
	}

	public void setCustomer_address_city(String customer_address_city) {
		this.customer_address_city = customer_address_city;
	}

	public String getOrderChannel() {
		return orderChannel;
	}

	public void setOrderChannel(String orderChannel) {
		this.orderChannel = orderChannel;
	}

	public String getOrderDeliveryType() {
		return orderDeliveryType;
	}

	public void setOrderDeliveryType(String orderDeliveryType) {
		this.orderDeliveryType = orderDeliveryType;
	}

	public String getShipmentMode() {
		return shipmentMode;
	}

	public void setShipmentMode(String shipmentMode) {
		this.shipmentMode = shipmentMode;
	}

	public String getShipperId() {
		return shipperId;
	}

	public void setShipperId(String shipperId) {
		this.shipperId = shipperId;
	}

	public double getOrderTotalCost() {
		return orderTotalCost;
	}

	public void setOrderTotalCost(double orderTotalCost) {
		this.orderTotalCost = orderTotalCost;
	}

	public double getOrderTax() {
		return orderTax;
	}

	public void setOrderTax(double orderTax) {
		this.orderTax = orderTax;
	}


	public String getShipmentCharges() {
		return shipmentCharges;
	}

	public void setShipmentCharges(String shipmentCharges) {
		this.shipmentCharges = shipmentCharges;
	}

	public double getTotalOrderAmount() {
		return totalOrderAmount;
	}

	public void setTotalOrderAmount(double totalOrderAmount) {
		this.totalOrderAmount = totalOrderAmount;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getSaleLocation() {
		return saleLocation;
	}

	public void setSaleLocation(String saleLocation) {
		this.saleLocation = saleLocation;
	}

	public String getCustomerFeedback() {
		return customerFeedback;
	}

	public void setCustomerFeedback(String customerFeedback) {
		this.customerFeedback = customerFeedback;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public List<OrderedItems> getOrderedItemsList() {
		return orderedItemsList;
	}

	public void setOrderedItemsList(List<OrderedItems> orderedItemsList) {
		this.orderedItemsList = orderedItemsList;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}



	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	
	
}
