package com.tlabs.posweb.beans;
import java.util.List;
import java.util.Set;

public class OrderShipment {
	private String shipmentId;
	private String gatePassRef;
	private String inspectedBy;
	private String noPackages;
	private String packagesDescription;
	private String orderId;
	private String customerContactNum;
	private String rfidTagNo;
	private String shipmentAgency;
	private String shipmentAgencyContact;
	private String shipmentCost;
	private String orderShippedDate;
	private String shipmentMode;
	private String shipmentNote;
	private String shipmentStatus;
	private String tax;
	private String totalCost;
	private String createdDate;
	private String shipmentDoorNo;
	private String shipmentCity;
	private String shipmentLocation;
	private String shipmentStreet;
	private String shippedBy;
	private String remarks;
	private String totalCostStr;
	private String taxStr;
	private String orderShippedDateStr;	
	private String createDateStr;	
	private String shipmentCostStr;
	private String noPackagesStr;
	private String slNo;
	private List<OrderShipmentItems> shipmentItemsList;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String searchCriteria;
	private String startIndex;
	private String maxRecords;
	private String totalRecords;
	private String startDate;
	private String endDate;
	private String location;
	private String shipmentDate;
	private String warehouse_location;
	private String contactNum;
	private String carrierId;
	private String carrier_name;
	private String vehicleNo;
	private String driverName;
	private String routingInstructions;
	private String otherCharges;
	private Set<OrderShipmentLocations> shipmentLocations;
	private String subTotal;
	private OrderShipment shipmentObj;
	private String flowUnder;
	
	
	public String getFlowUnder() {
		return flowUnder;
	}

	public void setFlowUnder(String flowUnder) {
		this.flowUnder = flowUnder;
	}

	public OrderShipment getShipmentObj() {
		return shipmentObj;
	}

	public void setShipmentObj(OrderShipment shipmentObj) {
		this.shipmentObj = shipmentObj;
	}

	public String getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(String subTotal) {
		this.subTotal = subTotal;
	}

	public String getContactNum() {
		return contactNum;
	}

	public void setContactNum(String contactNum) {
		this.contactNum = contactNum;
	}

	public String getCarrierId() {
		return carrierId;
	}

	public void setCarrierId(String carrierId) {
		this.carrierId = carrierId;
	}

	public String getCarrier_name() {
		return carrier_name;
	}

	public void setCarrier_name(String carrier_name) {
		this.carrier_name = carrier_name;
	}

	public String getVehicleNo() {
		return vehicleNo;
	}

	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getRoutingInstructions() {
		return routingInstructions;
	}

	public void setRoutingInstructions(String routingInstructions) {
		this.routingInstructions = routingInstructions;
	}

	public Set<OrderShipmentLocations> getShipmentLocations() {
		return shipmentLocations;
	}

	public void setShipmentLocations(Set<OrderShipmentLocations> shipmentLocations) {
		this.shipmentLocations = shipmentLocations;
	}

	public String getWarehouse_location() {
		return warehouse_location;
	}

	public void setWarehouse_location(String warehouse_location) {
		this.warehouse_location = warehouse_location;
	}

	public String getShipmentDate() {
		return shipmentDate;
	}

	public void setShipmentDate(String shipmentDate) {
		this.shipmentDate = shipmentDate;
	}

	private List<OrderShipment> shipmentList;
	public List<OrderShipment> getShipmentList() {
		return shipmentList;
	}

	public void setShipmentList(List<OrderShipment> shipmentList) {
		this.shipmentList = shipmentList;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

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

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getShipmentId() {
		return shipmentId;
	}

	public void setShipmentId(String shipmentId) {
		this.shipmentId = shipmentId;
	}

	public String getGatePassRef() {
		return gatePassRef;
	}

	public void setGatePassRef(String gatePassRef) {
		this.gatePassRef = gatePassRef;
	}

	public String getInspectedBy() {
		return inspectedBy;
	}

	public void setInspectedBy(String inspectedBy) {
		this.inspectedBy = inspectedBy;
	}

	public String getPackagesDescription() {
		return packagesDescription;
	}

	public void setPackagesDescription(String packagesDescription) {
		this.packagesDescription = packagesDescription;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getCustomerContactNum() {
		return customerContactNum;
	}

	public void setCustomerContactNum(String customerContactNum) {
		this.customerContactNum = customerContactNum;
	}

	public String getRfidTagNo() {
		return rfidTagNo;
	}

	public void setRfidTagNo(String rfidTagNo) {
		this.rfidTagNo = rfidTagNo;
	}

	public String getShipmentAgency() {
		return shipmentAgency;
	}

	public void setShipmentAgency(String shipmentAgency) {
		this.shipmentAgency = shipmentAgency;
	}

	public String getShipmentAgencyContact() {
		return shipmentAgencyContact;
	}

	public void setShipmentAgencyContact(String shipmentAgencyContact) {
		this.shipmentAgencyContact = shipmentAgencyContact;
	}

	public String getShipmentCostStr() {
		return shipmentCostStr;
	}

	public void setShipmentCostStr(String shipmentCostStr) {
		this.shipmentCostStr = shipmentCostStr;
	}

	public String getNoPackagesStr() {
		return noPackagesStr;
	}

	public void setNoPackagesStr(String noPackagesStr) {
		this.noPackagesStr = noPackagesStr;
	}

	public String getShipmentMode() {
		return shipmentMode;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
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

	public void setShipmentMode(String shipmentMode) {
		this.shipmentMode = shipmentMode;
	}

	public String getShipmentNote() {
		return shipmentNote;
	}

	 

	public String getTotalCostStr() {
		return totalCostStr;
	}

	public void setTotalCostStr(String totalCostStr) {
		this.totalCostStr = totalCostStr;
	}

	public String getTaxStr() {
		return taxStr;
	}

	public void setTaxStr(String taxStr) {
		this.taxStr = taxStr;
	}

	public String getOrderShippedDateStr() {
		return orderShippedDateStr;
	}

	public void setOrderShippedDateStr(String orderShippedDateStr) {
		this.orderShippedDateStr = orderShippedDateStr;
	}

	public String getCreateDateStr() {
		return createDateStr;
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}

	public void setShipmentNote(String shipmentNote) {
		this.shipmentNote = shipmentNote;
	}

	public String getShipmentStatus() {
		return shipmentStatus;
	}

	public void setShipmentStatus(String shipmentStatus) {
		this.shipmentStatus = shipmentStatus;
	}

	public String getShipmentDoorNo() {
		return shipmentDoorNo;
	}

	public void setShipmentDoorNo(String shipmentDoorNo) {
		this.shipmentDoorNo = shipmentDoorNo;
	}

	public String getShipmentCity() {
		return shipmentCity;
	}

	public void setShipmentCity(String shipmentCity) {
		this.shipmentCity = shipmentCity;
	}

	public String getShipmentLocation() {
		return shipmentLocation;
	}

	public void setShipmentLocation(String shipmentLocation) {
		this.shipmentLocation = shipmentLocation;
	}

	public String getShipmentStreet() {
		return shipmentStreet;
	}

	public void setShipmentStreet(String shipmentStreet) {
		this.shipmentStreet = shipmentStreet;
	}

	public String getShippedBy() {
		return shippedBy;
	}

	public void setShippedBy(String shippedBy) {
		this.shippedBy = shippedBy;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public List<OrderShipmentItems> getShipmentItemsList() {
		return shipmentItemsList;
	}

	public void setShipmentItemsList(List<OrderShipmentItems> shipmentItemsList) {
		this.shipmentItemsList = shipmentItemsList;
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

	public String getNoPackages() {
		return noPackages;
	}

	public void setNoPackages(String noPackages) {
		this.noPackages = noPackages;
	}

	public String getShipmentCost() {
		return shipmentCost;
	}

	public void setShipmentCost(String shipmentCost) {
		this.shipmentCost = shipmentCost;
	}

	public String getOrderShippedDate() {
		return orderShippedDate;
	}

	public void setOrderShippedDate(String orderShippedDate) {
		this.orderShippedDate = orderShippedDate;
	}

	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	public String getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(String totalCost) {
		this.totalCost = totalCost;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getSlNo() {
		return slNo;
	}

	public void setSlNo(String slNo) {
		this.slNo = slNo;
	}

	public String getOtherCharges() {
		return otherCharges;
	}

	public void setOtherCharges(String otherCharges) {
		this.otherCharges = otherCharges;
	}
	
 
}
