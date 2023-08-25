package com.tlabs.posweb.beans;
import java.util.Date;

import java.util.List;
public class WarehouseGatepass {

		private String gatePassRef;

		
		private String locationId;
		
		private List<WarehouseGatepassItems> gatePassItems;

		
		private String salesOrderRef;

		
		private String shipmentOrderRef;

		
		private String userName;

		
		private String userRole;

		
	//	private Date createdDate;

		
	//	private Date updatedDate;

		
		private String submittedBy;

		
		private String destination;

		
		private String checkedBy;

		
		private String issuedBy;

		
		private String pickedBy;

		
		private String description;

		private RequestHeader requestHeader;

		
		private String startIndex;

		
		private String maxRecords;

		
		private String searchCriteria;

		
		private String startDateStr;

		
		private String endDateStr;

		
		private String createdDateStr;

	
		private String updatedDateStr;

	
		private String zoneId;

	
	//	private List<String> warehouseGatepassIds;

		public String getGatePassRef() {
			return gatePassRef;
		}

		public void setGatePassRef(String gatePassRef) {
			this.gatePassRef = gatePassRef;
		}

		public String getLocationId() {
			return locationId;
		}

		public void setLocationId(String locationId) {
			this.locationId = locationId;
		}

		public String getSalesOrderRef() {
			return salesOrderRef;
		}

		public void setSalesOrderRef(String salesOrderRef) {
			this.salesOrderRef = salesOrderRef;
		}

		public String getShipmentOrderRef() {
			return shipmentOrderRef;
		}

		public void setShipmentOrderRef(String shipmentOrderRef) {
			this.shipmentOrderRef = shipmentOrderRef;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getUserRole() {
			return userRole;
		}

		public void setUserRole(String userRole) {
			this.userRole = userRole;
		}

		/*public Date getCreatedDate() {
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
		}*/

		public String getSubmittedBy() {
			return submittedBy;
		}

		public void setSubmittedBy(String submittedBy) {
			this.submittedBy = submittedBy;
		}

		public String getDestination() {
			return destination;
		}

		public void setDestination(String destination) {
			this.destination = destination;
		}

		public String getCheckedBy() {
			return checkedBy;
		}

		public void setCheckedBy(String checkedBy) {
			this.checkedBy = checkedBy;
		}

		public String getIssuedBy() {
			return issuedBy;
		}

		public void setIssuedBy(String issuedBy) {
			this.issuedBy = issuedBy;
		}

		public String getPickedBy() {
			return pickedBy;
		}

		public void setPickedBy(String pickedBy) {
			this.pickedBy = pickedBy;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		
		public RequestHeader getRequestHeader() {
			return requestHeader;
		}

		public void setRequestHeader(RequestHeader requestHeader) {
			this.requestHeader = requestHeader;
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

		/*public List<String> getWarehouseGatepassIds() {
			return warehouseGatepassIds;
		}

		public void setWarehouseGatepassIds(List<String> warehouseGatepassIds) {
			this.warehouseGatepassIds = warehouseGatepassIds;
		}*/

		public String getZoneId() {
			return zoneId;
		}

		public void setZoneId(String zoneId) {
			this.zoneId = zoneId;
		}
		
		public List<WarehouseGatepassItems> getGatePassItems() {
			return gatePassItems;
		}

		public void setGatePassItems(List<WarehouseGatepassItems> gatePassItems) {
			this.gatePassItems = gatePassItems;
		}


	

}
