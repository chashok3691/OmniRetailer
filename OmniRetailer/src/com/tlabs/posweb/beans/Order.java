/**
 * 
 */
package com.tlabs.posweb.beans;

import java.math.BigDecimal;
//import java.util.Date;
import java.util.List;
import java.util.Set;
/*
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.Length;

import com.tlabs.omniretailerservices.beans.RequestHeader;
*/
/**
 * @author Sambaiah Y
 *
 */
//@Entity
//@Table(name = "orders")
public class Order {

	
	private String totalOrders;
	public String getTotalOrders() {
		return totalOrders;
	}

	public void setTotalOrders(String totalOrders) {
		this.totalOrders = totalOrders;
	}

	private List<Order> ordersList;
	
	public List<Order> getOrdersList() {
		return ordersList;
	}

	public void setOrdersList(List<Order> ordersList) {
		this.ordersList = ordersList;
	}
	private String instructions;
	private String totalRecords;
	public String getTotalRecords() {
		return totalRecords;
	}

	public String getInstructions() {
		return instructions;
	}

	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

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

public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getViewOrEdit() {
		return viewOrEdit;
	}

	public void setViewOrEdit(String viewOrEdit) {
		this.viewOrEdit = viewOrEdit;
	}

	//	@Id
//	@Column(name = "order_id")
//	@Length(min = 0, max=255 ,message = "ORDEREID_LENGTH")
	private String orderId;

	private List<String> orderIdsList; 
	
	public List<String> getOrderIdsList() {
		return orderIdsList;
	}

	public void setOrderIdsList(List<String> orderIdsList) {
		this.orderIdsList = orderIdsList;
	}

	private String startIndex;
//	@Column(name = "order_date")
//	private Date order_date;
	private List<OrderedItems> itemDetails;
	private String address;
	private String viewOrEdit;
	private String maxRecords;
	private String flowUnder;
	private String orderStartDate = null;
	private String orderEndDate = null;
	
	private String deliveryPersonName;
	private String deliveryPeronPhone;
	
	private float couponDiscounts;
	
	
	
	public float getCouponDiscounts() {
		return couponDiscounts;
	}

	public void setCouponDiscounts(float couponDiscounts) {
		this.couponDiscounts = couponDiscounts;
	}

	public String getDeliveryPersonName() {
		return deliveryPersonName;
	}

	public void setDeliveryPersonName(String deliveryPersonName) {
		this.deliveryPersonName = deliveryPersonName;
	}

	public String getDeliveryPeronPhone() {
		return deliveryPeronPhone;
	}

	public void setDeliveryPeronPhone(String deliveryPeronPhone) {
		this.deliveryPeronPhone = deliveryPeronPhone;
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

public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getFlowUnder() {
		return flowUnder;
	}

	public void setFlowUnder(String flowUnder) {
		this.flowUnder = flowUnder;
	}

public List<OrderedItems> getItemDetails() {
		return itemDetails;
	}

	public void setItemDetails(List<OrderedItems> itemDetails) {
		this.itemDetails = itemDetails;
	}

public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	private String items;
	
	private String taxationItems;
	private String transactionItems;
	
	
	public String getTaxationItems() {
		return taxationItems;
	}

	public void setTaxationItems(String taxationItems) {
		this.taxationItems = taxationItems;
	}

	public String getTransactionItems() {
		return transactionItems;
	}

	public void setTransactionItems(String transactionItems) {
		this.transactionItems = transactionItems;
	}

	public String getItems() {
		return items;
	}

	public void setItems(String items) {
		this.items = items;
	}

	//	@Column(name = "sales_executive_name")
//	@Length(min = 0, max=255 ,message = "SALES_EXECUTIVE_NAME_LENGTH")
	private String sales_executive_name;

//	@Column(name = "email_id")
//	@Length(min = 0, max=255 ,message = "EMAIL_ID_LENGTH")
	private String email_id;

//	@Column(name = "customer_mobile_no")
//	@Length(min = 0, max=255 ,message = "MOBILE_NUM_LENGTH")
	private String mobile_num;

//	@Column(name = "delivery_date")
//	private Date delivery_date;

//	@Column(name = "shipement_address_street")
//	@Length(min = 0, max=255 ,message = "SHIPEMENT_ADDRESS_STREET_LENGTH")
	private String shipement_address_street;

//	@Column(name = "shipement_address_location")
//	@Length(min = 0, max=255 ,message = "SHIPEMENT_ADDRESS_LOCATION_LENGTH")
	private String shipement_address_location;

//	@Column(name = "shipement_address_city")
//	@Length(min = 0, max=255 ,message = "SHIPEMENT_ADDRESS_CITY_LENGTH")
	private String shipement_address_city;

	private String shipmentPinNo;
//	@Column(name = "billing_address_street")
//	@Length(min = 0, max=255 ,message = "BILLING_ADDRESS_STREET_LENGTH")
	private String billing_address_street;

//	@Column(name = "billing_address_location")
//	@Length(min = 0, max=255 ,message = "BILLING_ADDRESS_LOCATION_LENGTH")
	private String billing_address_location;

//	@Column(name = "billing_address_city")
//	@Length(min = 0, max=255 ,message = "BILLING_ADDRESS_CITY_LENGTH")
	private String billing_address_city;

//	@Column(name = "customer_address_street")
//	@Length(min = 0, max=255 ,message = "CUSTOMER_ADDRESS_STREET_LENGTH")
	private String customer_address_street;

//	@Column(name = "customer_address_location")
//	@Length(min = 0, max=255 ,message = "CUSTOMER_ADDRESS_LOCATION_LENGTH")
	private String customer_address_location;

//	@Column(name = "customer_address_city")
//	@Length(min = 0, max=255 ,message = "CUSTOMER_ADDRESS_CITY_LENGTH")
	private String customer_address_city;

//	@Column(name = "order_channel")
//	@Length(min = 0, max=255 ,message = "ORDER_CHANNEL_LENGTH")
	private String orderChannel;

//	@Column(name = "order_delivery_type")
//	@Length(min = 0, max=255 ,message = "ORDER_DELIVERY_TYPE_LENGTH")
	private String orderDeliveryType;
	private String  deliveryModel;
	
	
public String getShipmentPinNo() {
		return shipmentPinNo;
	}

	public void setShipmentPinNo(String shipmentPinNo) {
		this.shipmentPinNo = shipmentPinNo;
	}

public String getDeliveryModel() {
		return deliveryModel;
	}

	public void setDeliveryModel(String deliveryModel) {
		this.deliveryModel = deliveryModel;
	}

	//	@Column(name = "shipment_mode")
//	@Length(min = 0, max=255 ,message = "SHIPMENT_MODE_LENGTH")
	private String shipmentMode;

//	@Column(name = "shipper_id")
//	@Length(min = 0, max=255 ,message = "SHIPPER_ID_LENGTH")
	private String shipperId;

//	@Column(name = "order_total_cost")
	private float orderTotalCost;

//	@Column(name = "order_tax")
	private float orderTax;

//	@Column(name = "shipment_charges")
	private Float shipmentCharges = 0.0f;

//	@Column(name = "total_order_amount")
	private float totalOrderAmount;



//	@Column(name = "payment_mode")
//	@Length(min = 0, max=255 ,message = "PAYMENT_MODE_LENGTH")
	private String paymentMode;

//	@Column(name = "order_status")
//	@Length(min = 0, max=255 ,message = "ORDER_STATUS_LENGTH")
	private String orderStatus;

//	@Column(name = "sale_location")
//	@Length(min = 0, max=255 ,message = "SALE_LOCATION_LENGTH")
	private String saleLocation;

//	@Column(name = "customer_feedback")
//	@Length(min = 0, max=255 ,message = "CUSTOMER_FEEDBACK_LENGTH")
	private String customerFeedback;

//	@Column(name = "Remarks")
//	@Length(min = 0, max=255 ,message = "REMARKS_LENGTH")
	private String remarks;

//	@Column(name = "order_placed_on")
//	private Date orderPlacedDate;

//	@Column(name = "billing_door_no")
//	@Length(min = 0, max=255 ,message = "BILLING_ADDRESS_DOORNO_LENGTH")
	private String billing_address_doorNo;

//	@Column(name = "shipment_door_no")
//	@Length(min = 0, max=255 ,message = "SHIPEMENT_ADDRESS_DOORNO_LENGTH")
	private String shipement_address_doorNo;

//	@Column(name = "customer_door_no")
//	@Length(min = 0, max=255 ,message = "CUSTOMER_ADDRESS_DOORNO_LENGTH")
	private String customer_address_doorNo;

//	@Column(name = "shipment_name")
//	@Length(min = 0, max=255 ,message = "SHIPMENT_NAME_LENGTH")
	private String shipmentName;

//	@Column(name = "shipment_contact")
//	@Length(min = 0, max=255 ,message = "SHIPMENT_CONTACT_LENGTH")
	private String shipmentContact;

//	@Column(name = "shipment_state")
//	@Length(min = 0, max=255 ,message = "SHIPMENT_STATE_LENGTH")
	private String shipmentState;

//	@Column(name = "shipment_country")
//	@Length(min = 0, max=255 ,message = "SHIPMENT_COUNTRY_LENGTH")
	private String shipmentCountry;

//	@Column(name = "cart_id")
//	@Length(min = 0, max=255 ,message = "CART_ID_LENGTH")
	private String cartId;

//	@Column(name = "latitude")
//	@Length(min = 0, max=255 ,message = "LATITUDE_LENGTH")
	private String latitude;

//	@Column(name = "longitude")
//	@Length(min = 0, max=255 ,message = "LONGITUDE_LENGTH")
	private String longitude;

//	@Column(name = "country")
//	@Length(min = 0, max=255 ,message = "COUNTRY_LENGTH")
	private String country;

//	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//	@JoinColumn(name = "order_id")
	private Set<OrderTransactions> orderTransactions;
	private String logisticsOrderStatus;
	
	
	private String shipmentApartmentName;
    
	 private String customerApartmentName;
	    
	 private String billingApartmentName;
	 
	 
	

	public String getShipmentApartmentName() {
		return shipmentApartmentName;
	}

	public void setShipmentApartmentName(String shipmentApartmentName) {
		this.shipmentApartmentName = shipmentApartmentName;
	}

	public String getCustomerApartmentName() {
		return customerApartmentName;
	}

	public void setCustomerApartmentName(String customerApartmentName) {
		this.customerApartmentName = customerApartmentName;
	}

	public String getBillingApartmentName() {
		return billingApartmentName;
	}

	public void setBillingApartmentName(String billingApartmentName) {
		this.billingApartmentName = billingApartmentName;
	}

	public String getLogisticsOrderStatus() {
		return logisticsOrderStatus;
	}

	public void setLogisticsOrderStatus(String logisticsOrderStatus) {
		this.logisticsOrderStatus = logisticsOrderStatus;
	}

	private List<CustomerAddress> addressList;

public List<CustomerAddress> getAddressList() {
		return addressList;
	}

	public void setAddressList(List<CustomerAddress> addressList) {
		this.addressList = addressList;
	}


	//	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//	@JoinColumn(name = "order_id")
	private Set<OrderItemTaxes> orderItemTaxesList;
	
//	
//	
//	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//	@JoinColumn(name = "order_id")
	private Set<OrderDiscounts> orderDiscountsList;
	
	
//	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//	@JoinColumn(name = "order_id")
	private List<OrderedItems> orderedItemsList;


    private String discountItems;


	
  public String getDiscountItems() {
		return discountItems;
	}

	public void setDiscountItems(String discountItems) {
		this.discountItems = discountItems;
	}

	//	@Column(name = "business_category")
//	@Length( max = 15,message = "BUSINESS_CATEGORY_LENGTH")
	private String businessCategory;

//	@Column(name = "business_sub_category")
//	@Length(max = 15,message = "BUSINESS_SUB_CATEGORY_LENGTH")
	private String businessSubCategory;

	

//	@Column(name = "subtotal")
	private BigDecimal subtotal = new BigDecimal("0");
	
	
//	@Column(name = "no_of_items")
	private int no_of_items;
	
	
	
//	@Column(name = "total_qty")
	private BigDecimal total_qty = new BigDecimal("0");
	
	private String selectedStatus;
	
public String getSelectedStatus() {
		return selectedStatus;
	}

	public void setSelectedStatus(String selectedStatus) {
		this.selectedStatus = selectedStatus;
	}

	//	@Column(name = "delivery_slot")
	private String delivery_slot;
	
//	@Column(name = "payment_type")
//	@Length(min = 0, max=50 ,message = "PAYMENT_TYPE_LENGTH")
	private String paymentType;
	
	
	
	public BigDecimal getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(BigDecimal subtotal) {
		this.subtotal = subtotal;
	}

	public String getBusinessCategory()
	{
		return businessCategory;
	}

	public void setBusinessCategory(String businessCategory)
	{
		this.businessCategory = businessCategory;
	}

	public String getBusinessSubCategory()
	{
		return businessSubCategory;
	}

	public void setBusinessSubCategory(String businessSubCategory)
	{
		this.businessSubCategory = businessSubCategory;
	}

	
//	@Transient
	private String deliveryDate;
	public List<OrderedItems> getOrderedItemsList() {
		return orderedItemsList;
	}

	public void setOrderedItemsList(List<OrderedItems> orderedItemsList) {
		this.orderedItemsList = orderedItemsList;
	}




//	@Transient
	private String orderDate;
	private String salesmanName;
	private String deliverySlotStartTime;
	private String deliverySlotEndTime;
	private String confirmedSlotEndTime;
	private String confirmedSlotStartTime;
	private String confirmedDate;
	
	
public String getConfirmedDate() {
		return confirmedDate;
	}

	public void setConfirmedDate(String confirmedDate) {
		this.confirmedDate = confirmedDate;
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

public String getSalesmanName() {
		return salesmanName;
	}

	public void setSalesmanName(String salesmanName) {
		this.salesmanName = salesmanName;
	}

	//	@Transient
	private List<String> nextActivities;

	private List<String> nextWorkFlowStates;
	//	@Transient
	private List<String> workFlowList;
//	@Transient
	private String shipmentCostStr;

public List<String> getNextWorkFlowStates() {
		return nextWorkFlowStates;
	}

	public void setNextWorkFlowStates(List<String> nextWorkFlowStates) {
		this.nextWorkFlowStates = nextWorkFlowStates;
	}

	//	@Transient
	private String orderPlacedOn;

//	@Transient
	private String saleLocationPhNO;

//	@Transient
	private List<String> previousActivityStatusList;

	//added by M.Srivani on 4/1/2018
	/*@Column(name = "cgst_amt")
	private BigDecimal cgstAmt;

	@Column(name = "sgst_amt")
	private BigDecimal sgstAmt;

	@Column(name = "other_tax_amt")
	private BigDecimal otherTaxAmt;*/

//	@Column(name = "due_amt")
	private BigDecimal dueAmount = new BigDecimal("0");

//	@Column(name = "paid_amt")
	private BigDecimal paidAmount = new BigDecimal("0");

//	@Column(name = "other_discounts")
	private BigDecimal otherDiscounts = new BigDecimal("0");

/*	@Column(name = "isgst_amt")
	private BigDecimal isgstAmt;*/

	//added by M.Srivani on 9/1/2018
//	@Column(name = "customer_map_link")
//	@Length(min = 0, max=255 ,message = "CUSTOMER_MAP_LINK_LENGTH")
	private String customer_map_link;

//	@Column(name = "billing_map_link")
//	@Length(min = 0, max=255 ,message = "BILLING_MAP_LINK_LENGTH")
	private String billing_map_link;

//	@Column(name = "customer_pin")
//	@Length(min = 0, max=255 ,message = "CUSTOMER_PINNO_LENGTH")
	private String customer_pinNo;

//	@Column(name = "billing_pin")
//	@Length(min = 0, max=255 ,message = "BILLING_PIN_NO_LENGTH")
	private String billing_pinNo;

/*	@Column(name = "payment_ref")
	@Length(min = 0, max=255 ,message = "PAYMENT_REF_LENGTH")
	private String paymentRef;*/

//	@Column(name = "referred_by")
//	@Length(min = 0, max=255 ,message = "REFFERED_BY_LENGTH")
	private String referredBy;

//	@Column(name = "special_discount")
	private BigDecimal specialDiscount = new BigDecimal("0");;

//	@Column(name = "sales_executive_id")
//	@Length(min = 0, max=255 ,message = "SALES_EXECUTIVE_ID_LENGTH")
	private String sales_executive_id;

//	@Column(name = "billing_mobile_no")
//	@Length(min = 0, max=255 ,message = "BILLING_MOBILE_NO_LENGTH")
	private String billingMobileNo;

	/*@Column(name = "customer_contact_no")
	@Length(min = 0, max=50 ,message = "CUSTOMER_CONTACT_NO_LENGTH")*/
	private String customerContactNum;
	
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

	//	@Transient
	private RequestHeader requestHeader;
	private String customerGstin;

	
	private String paymentRef;
	
	
	




	
	

	public String getPaymentRef() {
		return paymentRef;
	}

	public void setPaymentRef(String paymentRef) {
		this.paymentRef = paymentRef;
	}

	public String getCustomerGstin() {
		return customerGstin;
	}

	public void setCustomerGstin(String customerGstin) {
		this.customerGstin = customerGstin;
	}

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

	

	
	public String getShipmentCostStr() {
		return shipmentCostStr;
	}

	public void setShipmentCostStr(String shipmentCostStr) {
		this.shipmentCostStr = shipmentCostStr;
	}

	public List<String> getNextActivities() {
		return nextActivities;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}



	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
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

	

	public String getLatitude() {
		return latitude;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
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

	public String getShipement_address_street() {
		return shipement_address_street;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public List<String> getPreviousActivityStatusList() {
		return previousActivityStatusList;
	}

	public void setPreviousActivityStatusList(List<String> previousActivityStatusList) {
		this.previousActivityStatusList = previousActivityStatusList;
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

	public List<String> getWorkFlowList() {
		return workFlowList;
	}

	public void setWorkFlowList(List<String> workFlowList) {
		this.workFlowList = workFlowList;
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

	public String getSaleLocationPhNO() {
		return saleLocationPhNO;
	}

	public void setSaleLocationPhNO(String saleLocationPhNO) {
		this.saleLocationPhNO = saleLocationPhNO;
	}

	public String getOrderPlacedOn() {
		return orderPlacedOn;
	}

	public void setOrderPlacedOn(String orderPlacedOn) {
		this.orderPlacedOn = orderPlacedOn;
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

	/*public Date getOrderPlacedDate() {
		return orderPlacedDate;
	}

	public void setOrderPlacedDate(Date orderPlacedDate) {
		this.orderPlacedDate = orderPlacedDate;
	}*/

	public String getBilling_address_doorNo() {
		return billing_address_doorNo;
	}

	public void setBilling_address_doorNo(String billing_address_doorNo) {
		this.billing_address_doorNo = billing_address_doorNo;
	}

	public String getShipement_address_doorNo() {
		return shipement_address_doorNo;
	}

	public void setShipement_address_doorNo(String shipement_address_doorNo) {
		this.shipement_address_doorNo = shipement_address_doorNo;
	}

	public String getCustomer_address_doorNo() {
		return customer_address_doorNo;
	}

	public void setCustomer_address_doorNo(String customer_address_doorNo) {
		this.customer_address_doorNo = customer_address_doorNo;
	}

	public float getOrderTotalCost() {
		return orderTotalCost;
	}

	public void setOrderTotalCost(float orderTotalCost) {
		this.orderTotalCost = orderTotalCost;
	}

	public float getOrderTax() {
		return orderTax;
	}

	public void setOrderTax(float orderTax) {
		this.orderTax = orderTax;
	}

	public float getTotalOrderAmount() {
		return totalOrderAmount;
	}

	public void setTotalOrderAmount(float totalOrderAmount) {
		this.totalOrderAmount = totalOrderAmount;
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

	
	public Float getShipmentCharges() {
		return shipmentCharges;
	}

	public void setShipmentCharges(Float shipmentCharges) {
		this.shipmentCharges = shipmentCharges;
	}

	/*public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public Date getDelivery_date() {
		return delivery_date;
	}

	public void setDelivery_date(Date delivery_date) {
		this.delivery_date = delivery_date;
	}
*/
	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	

	public int getNo_of_items() {
		return no_of_items;
	}

	public void setNo_of_items(int no_of_items) {
		this.no_of_items = no_of_items;
	}

	public BigDecimal getTotal_qty() {
		return total_qty;
	}

	public void setTotal_qty(BigDecimal total_qty) {
		this.total_qty = total_qty;
	}

	public String getDelivery_slot() {
		return delivery_slot;
	}

	public void setDelivery_slot(String delivery_slot) {
		this.delivery_slot = delivery_slot;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	
	
	public Set<OrderTransactions> getOrderTransactions() {
		return orderTransactions;
	}

	public void setOrderTransactions(Set<OrderTransactions> orderTransactions) {
		this.orderTransactions = orderTransactions;
	}

	public Set<OrderItemTaxes> getOrderItemTaxesList() {
		return orderItemTaxesList;
	}

	public void setOrderItemTaxesList(Set<OrderItemTaxes> orderItemTaxesList) {
		this.orderItemTaxesList = orderItemTaxesList;
	}

	public Set<OrderDiscounts> getOrderDiscountsList() {
		return orderDiscountsList;
	}

	public void setOrderDiscountsList(Set<OrderDiscounts> orderDiscountsList) {
		this.orderDiscountsList = orderDiscountsList;
	}
	

}
