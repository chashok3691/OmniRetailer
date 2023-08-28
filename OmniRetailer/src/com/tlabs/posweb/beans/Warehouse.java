package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;


public class Warehouse {
   
	
	private boolean posEnabled;
    
    
	
	
	
	private String searchCriteria;
	private ResponseHeader responseHeader;
    private boolean storageSystemEnabled;
    
    
    private String posEnabledStr;
    
    private String isItFranchiseStr;
    
    private String isItDistributionCenterStr;
    
    private String storageSystemEnabledStr;
    
    
    private String gstin;
    
    private int radius;
    
    private String createdDateStr;
    
    private String updatedDateStr;
    private String createdDate;
    
    private String updatedDate;
    
    
    
    
    
    public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}
	private String startTimeStr;
    
    private String endTimeStr;
    
    private String locality;
    private boolean remoteMonitoring;
    private boolean testWarehouse;
    private String stockVerificationType;
    private boolean secured;
    private boolean authorizedPicklist; 
    
    private String remoteMonitoringStr;
    private String testWarehouseStr;
    private String securedStr;
    private String authorizedPicklistStr; 
    private boolean isItFranchise;
   // private boolean isWareHouse;
	//private String isWareHouseStr;
	private boolean warehouse;
	private String warehouseStatusStr;
	
	
	
	
	
	/*public boolean isWareHouse() {
		return isWareHouse;
	}
	public void setWareHouse(boolean isWareHouse) {
		this.isWareHouse = isWareHouse;
	}
	public String getIsWareHouseStr() {
		return isWareHouseStr;
	}
	public void setIsWareHouseStr(String isWareHouseStr) {
		this.isWareHouseStr = isWareHouseStr;
	}*/
	
	public String getWarehouseStatusStr() {
		return warehouseStatusStr;
	}
	public void setWarehouseStatusStr(String warehouseStatusStr) {
		this.warehouseStatusStr = warehouseStatusStr;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	private boolean isItDistributionCenter;
    
	public boolean isItFranchise() {
		return isItFranchise;
	}
	public void setItFranchise(boolean isItFranchise) {
		this.isItFranchise = isItFranchise;
	}
	public boolean isItDistributionCenter() {
		return isItDistributionCenter;
	}
	public void setItDistributionCenter(boolean isItDistributionCenter) {
		this.isItDistributionCenter = isItDistributionCenter;
	}
    
     public String getPosEnabledStr() {
		return posEnabledStr;
	}
	public void setPosEnabledStr(String posEnabledStr) {
		this.posEnabledStr = posEnabledStr;
	}
	public String getIsItFranchiseStr() {
		return isItFranchiseStr;
	}
	public void setIsItFranchiseStr(String isItFranchiseStr) {
		this.isItFranchiseStr = isItFranchiseStr;
	}
	public String getIsItDistributionCenterStr() {
		return isItDistributionCenterStr;
	}
	public void setIsItDistributionCenterStr(String isItDistributionCenterStr) {
		this.isItDistributionCenterStr = isItDistributionCenterStr;
	}
	public String getStorageSystemEnabledStr() {
		return storageSystemEnabledStr;
	}
	public void setStorageSystemEnabledStr(String storageSystemEnabledStr) {
		this.storageSystemEnabledStr = storageSystemEnabledStr;
	}
	public String getRemoteMonitoringStr() {
		return remoteMonitoringStr;
	}
	public void setRemoteMonitoringStr(String remoteMonitoringStr) {
		this.remoteMonitoringStr = remoteMonitoringStr;
	}
	public String getTestWarehouseStr() {
		return testWarehouseStr;
	}
	public void setTestWarehouseStr(String testWarehouseStr) {
		this.testWarehouseStr = testWarehouseStr;
	}
	public String getSecuredStr() {
		return securedStr;
	}
	public void setSecuredStr(String securedStr) {
		this.securedStr = securedStr;
	}
	public String getAuthorizedPicklistStr() {
		return authorizedPicklistStr;
	}
	public void setAuthorizedPicklistStr(String authorizedPicklistStr) {
		this.authorizedPicklistStr = authorizedPicklistStr;
	}
	private boolean onlineOrder;
	
	private boolean telephonicOrder;
	
	private boolean billingAndDelivery;
	
	private boolean purchaseOrder;
	
	private boolean shipmentReturn;
	
	private boolean warehouseGrn;
	
	
     private boolean stockRequest;
	
	private boolean stockReciept;
	
	private boolean stockIssue;
	
	private String mainWarehouse;
	
	
	private boolean stockReturn;
	
	private boolean stockAlerts;

	private String warehouse_code;
	private String warehouseId;
	private String warehouse_name;
	private String warehouse_type;
	private String address_1;
	private String address_2;
	private String fax;
	private String phone_number;
	private String city;
	private String email;
	private String state;
	private String zip;
	private boolean warehouse_status;
	private String warehouse_statusStr;
	private String warehouseLocation;
	private String country;
	private String warehouseDetails;
	private String storageStstemDetails;
	private Warehouse warehouses;
	private List<WarehouseStorageSystems> storageSystems;
	private RequestHeader requestHeader;
	private String startIndex;
	private String type;
	private List<Warehouse> warehouseIds;
	private String gpsLongitude;
	private String gpsLatitude;
	private String category;
	private String totalRecords;
	private String operation;
	private String location;
	
	
	
			
	
	

	
	public String getWarehouse_statusStr() {
		return warehouse_statusStr;
	}
	public void setWarehouse_statusStr(String warehouse_statusStr) {
		this.warehouse_statusStr = warehouse_statusStr;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getMainWarehouse() {
		return mainWarehouse;
	}
	public void setMainWarehouse(String mainWarehouse) {
		this.mainWarehouse = mainWarehouse;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public boolean isStockAlerts() {
		return stockAlerts;
	}
	public void setStockAlerts(boolean stockAlerts) {
		this.stockAlerts = stockAlerts;
	}
	public boolean isStockRequest() {
		return stockRequest;
	}
	public void setStockRequest(boolean stockRequest) {
		this.stockRequest = stockRequest;
	}
	public boolean isStockReciept() {
		return stockReciept;
	}
	public void setStockReciept(boolean stockReciept) {
		this.stockReciept = stockReciept;
	}
	public boolean isStockIssue() {
		return stockIssue;
	}
	public void setStockIssue(boolean stockIssue) {
		this.stockIssue = stockIssue;
	}
	public boolean isStockReturn() {
		return stockReturn;
	}
	public void setStockReturn(boolean stockReturn) {
		this.stockReturn = stockReturn;
	}
	public boolean isWarehouseGrn() {
		return warehouseGrn;
	}
	public void setWarehouseGrn(boolean warehouseGrn) {
		this.warehouseGrn = warehouseGrn;
	}
	public boolean isOnlineOrder() {
		return onlineOrder;
	}
	public void setOnlineOrder(boolean onlineOrder) {
		this.onlineOrder = onlineOrder;
	}
	public boolean isTelephonicOrder() {
		return telephonicOrder;
	}
	public void setTelephonicOrder(boolean telephonicOrder) {
		this.telephonicOrder = telephonicOrder;
	}
	public boolean isBillingAndDelivery() {
		return billingAndDelivery;
	}
	public void setBillingAndDelivery(boolean billingAndDelivery) {
		this.billingAndDelivery = billingAndDelivery;
	}
	public boolean isPurchaseOrder() {
		return purchaseOrder;
	}
	public void setPurchaseOrder(boolean purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
	}
	public boolean isShipmentReturn() {
		return shipmentReturn;
	}
	public void setShipmentReturn(boolean shipmentReturn) {
		this.shipmentReturn = shipmentReturn;
	}
	public String getLocality() {
		return locality;
	}
	public void setLocality(String locality) {
		this.locality = locality;
	}
	public boolean isRemoteMonitoring() {
		return remoteMonitoring;
	}
	public void setRemoteMonitoring(boolean remoteMonitoring) {
		this.remoteMonitoring = remoteMonitoring;
	}
	public boolean isTestWarehouse() {
		return testWarehouse;
	}
	public void setTestWarehouse(boolean testWarehouse) {
		this.testWarehouse = testWarehouse;
	}
	public String getStockVerificationType() {
		return stockVerificationType;
	}
	public void setStockVerificationType(String stockVerificationType) {
		this.stockVerificationType = stockVerificationType;
	}
	public boolean isSecured() {
		return secured;
	}
	public void setSecured(boolean secured) {
		this.secured = secured;
	}
	public boolean isAuthorizedPicklist() {
		return authorizedPicklist;
	}
	public void setAuthorizedPicklist(boolean authorizedPicklist) {
		this.authorizedPicklist = authorizedPicklist;
	}
	public boolean isPosEnabled() {
		return posEnabled;
	}
	public void setPosEnabled(boolean posEnabled) {
		this.posEnabled = posEnabled;
	}
	
	

	
	
	public boolean isStorageSystemEnabled() {
		return storageSystemEnabled;
	}
	public void setStorageSystemEnabled(boolean storageSystemEnabled) {
		this.storageSystemEnabled = storageSystemEnabled;
	}
	public String getGstin() {
		return gstin;
	}
	public void setGstin(String gstin) {
		this.gstin = gstin;
	}
	public int getRadius() {
		return radius;
	}
	public void setRadius(int radius) {
		this.radius = radius;
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
	public String getStartTimeStr() {
		return startTimeStr;
	}
	public void setStartTimeStr(String startTimeStr) {
		this.startTimeStr = startTimeStr;
	}
	public String getEndTimeStr() {
		return endTimeStr;
	}
	public void setEndTimeStr(String endTimeStr) {
		this.endTimeStr = endTimeStr;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getGpsLongitude() {
		return gpsLongitude;
	}
	public void setGpsLongitude(String gpsLongitude) {
		this.gpsLongitude = gpsLongitude;
	}
	public String getGpsLatitude() {
		return gpsLatitude;
	}
	public void setGpsLatitude(String gpsLatitude) {
		this.gpsLatitude = gpsLatitude;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public List<Warehouse> getWarehouseIds() {
		return warehouseIds;
	}
	public void setWarehouseIds(List<Warehouse> warehouseIds) {
		this.warehouseIds = warehouseIds;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getWarehouseId() {
		return warehouseId;
	}
	public void setWarehouseId(String warehouseId) {
		this.warehouseId = warehouseId;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public String getWarehouseLocation() {
		return warehouseLocation;
	}
	public void setWarehouseLocation(String warehouseLocation) {
		this.warehouseLocation = warehouseLocation;
	}
	
	
	public boolean isWarehouse() {
		return warehouse;
	}
	public void setWarehouse(boolean warehouse) {
		this.warehouse = warehouse;
	}
	public Warehouse getWarehouses() {
		return warehouses;
	}
	public void setWarehouses(Warehouse warehouses) {
		this.warehouses = warehouses;
	}
	public List<WarehouseStorageSystems> getStorageSystems() {
		return storageSystems;
	}
	public void setStorageSystems(List<WarehouseStorageSystems> storageSystems) {
		this.storageSystems = storageSystems;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getWarehouseDetails() {
		return warehouseDetails;
	}
	public void setWarehouseDetails(String warehouseDetails) {
		this.warehouseDetails = warehouseDetails;
	}
	public String getStorageStstemDetails() {
		return storageStstemDetails;
	}
	public void setStorageStstemDetails(String storageStstemDetails) {
		this.storageStstemDetails = storageStstemDetails;
	}
	public String getWarehouse_code() {
		return warehouse_code;
	}
	public void setWarehouse_code(String warehouse_code) {
		this.warehouse_code = warehouse_code;
	}
	public String getWarehouse_name() {
		return warehouse_name;
	}
	public void setWarehouse_name(String warehouse_name) {
		this.warehouse_name = warehouse_name;
	}
	public String getWarehouse_type() {
		return warehouse_type;
	}
	public void setWarehouse_type(String warehouse_type) {
		this.warehouse_type = warehouse_type;
	}
	public String getAddress_1() {
		return address_1;
	}
	public void setAddress_1(String address_1) {
		this.address_1 = address_1;
	}
	public String getAddress_2() {
		return address_2;
	}
	public void setAddress_2(String address_2) {
		this.address_2 = address_2;
	}
	
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
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
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public boolean getWarehouse_status() {
		return warehouse_status;
	}
	public void setWarehouse_status(boolean warehouse_status) {
		this.warehouse_status = warehouse_status;
	}
	
	
}
