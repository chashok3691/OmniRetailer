package com.tlabs.posweb.beans;

import java.util.List;


public class PurchaseShipmentNote {
	private String shipmentNoteRef;
	private String shipmentRef;
//	private Date shippedDate;
//	private Date createdDate;
//	private Date updatedDate;
//	private Date arrivalDate;
	private String poRef;
	private String shipmentFrom;
	private String userName;
	private String roleName;
	private String transporterCode;
	private String transporterName;
	private String carrierNo;
	private String deliveryPerson;
	private String contactNumber;
	private String shipmentComments;
	private String shipmentTerms;
    private List<PurchaseOrderItems> shipmentNoteItems;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String shippedDateStr;
	private String createdDateStr;
	private String updatedDateStr;
	private String arrivalDateStr;
//	private List<PurchaseOrderItems> purchaseItems;
	private List<LocationBean> selectedLocationList;
	private String supplierName;
	private String supplierId;
	private String status;
    private List<PurchaseOrderShipmentLocation> shipmentNoteLocations;
	private String startDate;
	private String endDate;
	private String startIndex;
	private String maxRecords;
	private String searchCriteria;
	private String location;
	private String totalRecords;
	private int slNo;
	private List<PurchaseShipmentNote> shipmentNotes;
	private PurchaseShipmentNote shipmentNoteDetails;
	private String flowUnder;
	
	public String getFlowUnder() {
		return flowUnder;
	}

	public void setFlowUnder(String flowUnder) {
		this.flowUnder = flowUnder;
	}

	public PurchaseShipmentNote getShipmentNoteDetails() {
		return shipmentNoteDetails;
	}

	public void setShipmentNoteDetails(PurchaseShipmentNote shipmentNoteDetails) {
		this.shipmentNoteDetails = shipmentNoteDetails;
	}

	public List<PurchaseShipmentNote> getShipmentNotes() {
		return shipmentNotes;
	}

	public void setShipmentNotes(List<PurchaseShipmentNote> shipmentNotes) {
		this.shipmentNotes = shipmentNotes;
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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<PurchaseOrderShipmentLocation> getShipmentNoteLocations() {
		return shipmentNoteLocations;
	}

	public void setShipmentNoteLocations(List<PurchaseOrderShipmentLocation> shipmentNoteLocations) {
		this.shipmentNoteLocations = shipmentNoteLocations;
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

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public List<LocationBean> getSelectedLocationList() {
		return selectedLocationList;
	}

	public void setSelectedLocationList(List<LocationBean> selectedLocationList) {
		this.selectedLocationList = selectedLocationList;
	}

	/*public List<PurchaseOrderItems> getPurchaseItems() {
		return purchaseItems;
	}

	public void setPurchaseItems(List<PurchaseOrderItems> purchaseItems) {
		this.purchaseItems = purchaseItems;
	}*/

	public String getShipmentRef() {
		return shipmentRef;
	}

	public void setShipmentRef(String shipmentRef) {
		this.shipmentRef = shipmentRef;
	}

	/*public Date getShippedDate() {
		return shippedDate;
	}

	public void setShippedDate(Date shippedDate) {
		this.shippedDate = shippedDate;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public Date getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
*/
	public String getPoRef() {
		return poRef;
	}

	public void setPoRef(String poRef) {
		this.poRef = poRef;
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

	
	
	public String getShippedDateStr() {
		return shippedDateStr;
	}

	public void setShippedDateStr(String shippedDateStr) {
		this.shippedDateStr = shippedDateStr;
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

	public String getArrivalDateStr() {
		return arrivalDateStr;
	}

	public void setArrivalDateStr(String arrivalDateStr) {
		this.arrivalDateStr = arrivalDateStr;
	}

	public String getShipmentNoteRef() {
		return shipmentNoteRef;
	}

	public void setShipmentNoteRef(String shipmentNoteRef) {
		this.shipmentNoteRef = shipmentNoteRef;
	}
	
	/*public Set<PurchaseShipmentNoteItems> getShipmentNoteItems() {
		return shipmentNoteItems;
	}

	public void setShipmentNoteItems(Set<PurchaseShipmentNoteItems> shipmentNoteItems) {
		this.shipmentNoteItems = shipmentNoteItems;
	}*/

	/*public String getShipperId() {
		return shipperId;
	}

	public void setShipperId(String shipperId) {
		this.shipperId = shipperId;
	}
*/

	public List<PurchaseOrderItems> getShipmentNoteItems() {
		return shipmentNoteItems;
	}

	public void setShipmentNoteItems(List<PurchaseOrderItems> shipmentNoteItems) {
		this.shipmentNoteItems = shipmentNoteItems;
	}

	public String getShipmentFrom() {
		return shipmentFrom;
	}

	public void setShipmentFrom(String shipmentFrom) {
		this.shipmentFrom = shipmentFrom;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getTransporterCode() {
		return transporterCode;
	}

	public void setTransporterCode(String transporterCode) {
		this.transporterCode = transporterCode;
	}

	public String getTransporterName() {
		return transporterName;
	}

	public void setTransporterName(String transporterName) {
		this.transporterName = transporterName;
	}

	public String getCarrierNo() {
		return carrierNo;
	}

	public void setCarrierNo(String carrierNo) {
		this.carrierNo = carrierNo;
	}

	public String getDeliveryPerson() {
		return deliveryPerson;
	}

	public void setDeliveryPerson(String deliveryPerson) {
		this.deliveryPerson = deliveryPerson;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getShipmentComments() {
		return shipmentComments;
	}

	public void setShipmentComments(String shipmentComments) {
		this.shipmentComments = shipmentComments;
	}

	public String getShipmentTerms() {
		return shipmentTerms;
	}

	public void setShipmentTerms(String shipmentTerms) {
		this.shipmentTerms = shipmentTerms;
	}
	
	
}
