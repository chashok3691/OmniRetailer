package com.tlabs.posweb.beans;

import java.util.List;

public class ShipmentBean {

	private String shipmentId;
	private String orderId;
	private String shipmentNote;
	private String gatePassRef;
	private String shipmentDate;
	private String shipmentMode;
	private String shipmentAgency;
	private String shipmentAgencyContact;
	private int noPackages;
	private String inspectedBy;
	private String shippedBy;
	private String rfidTagNo;
	private String packagesDescription;
	private float shipmentCost;
	private float tax;
	private float totalCost;
	private String shipmentStatus = null;
	private String remarks;
	private String shipmentDoorNo;
	private String shipmentStreet;
	private String shipmentLocation;
	private String shipmentCity;
	private List<WHShipmentItems> shipmentItemsList;
	private String warehouse_location;
	private String items;
	private String startIndex;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;

	public String getItems() {
		return items;
	}

	public void setItems(String items) {
		this.items = items;
	}

	public String getShipmentDoorNo() {
		return shipmentDoorNo;
	}

	public void setShipmentDoorNo(String shipmentDoorNo) {
		this.shipmentDoorNo = shipmentDoorNo;
	}

	public String getShipmentStreet() {
		return shipmentStreet;
	}

	public void setShipmentStreet(String shipmentStreet) {
		this.shipmentStreet = shipmentStreet;
	}

	public String getShipmentLocation() {
		return shipmentLocation;
	}

	public void setShipmentLocation(String shipmentLocation) {
		this.shipmentLocation = shipmentLocation;
	}

	public String getShipmentCity() {
		return shipmentCity;
	}

	public void setShipmentCity(String shipmentCity) {
		this.shipmentCity = shipmentCity;
	}

	public List<WHShipmentItems> getShipmentItemsList() {
		return shipmentItemsList;
	}

	public void setShipmentItemsList(List<WHShipmentItems> shipmentItemsList) {
		this.shipmentItemsList = shipmentItemsList;
	}

	public String getShipmentId() {
		return shipmentId;
	}

	public void setShipmentId(String shipmentId) {
		this.shipmentId = shipmentId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getShipmentNote() {
		return shipmentNote;
	}

	public void setShipmentNote(String shipmentNote) {
		this.shipmentNote = shipmentNote;
	}

	public String getGatePassRef() {
		return gatePassRef;
	}

	public void setGatePassRef(String gatePassRef) {
		this.gatePassRef = gatePassRef;
	}

	public String getShipmentDate() {
		return shipmentDate;
	}

	public void setShipmentDate(String shipmentDate) {
		this.shipmentDate = shipmentDate;
	}

	public String getShipmentMode() {
		return shipmentMode;
	}

	public void setShipmentMode(String shipmentMode) {
		this.shipmentMode = shipmentMode;
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

	public int getNoPackages() {
		return noPackages;
	}

	public void setNoPackages(int noPackages) {
		this.noPackages = noPackages;
	}

	public String getInspectedBy() {
		return inspectedBy;
	}

	public void setInspectedBy(String inspectedBy) {
		this.inspectedBy = inspectedBy;
	}

	public String getShippedBy() {
		return shippedBy;
	}

	public void setShippedBy(String shippedBy) {
		this.shippedBy = shippedBy;
	}

	public String getRfidTagNo() {
		return rfidTagNo;
	}

	public void setRfidTagNo(String rfidTagNo) {
		this.rfidTagNo = rfidTagNo;
	}

	public String getPackagesDescription() {
		return packagesDescription;
	}

	public void setPackagesDescription(String packagesDescription) {
		this.packagesDescription = packagesDescription;
	}

	public float getShipmentCost() {
		return shipmentCost;
	}

	public void setShipmentCost(float shipmentCost) {
		this.shipmentCost = shipmentCost;
	}

	public float getTax() {
		return tax;
	}

	public void setTax(float tax) {
		this.tax = tax;
	}

	public float getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(float totalCost) {
		this.totalCost = totalCost;
	}

	public String getShipmentStatus() {
		return shipmentStatus;
	}

	public void setShipmentStatus(String shipmentStatus) {
		this.shipmentStatus = shipmentStatus;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public String getWarehouse_location() {
		return warehouse_location;
	}

	public void setWarehouse_location(String warehouse_location) {
		this.warehouse_location = warehouse_location;
	}
	
	

}
