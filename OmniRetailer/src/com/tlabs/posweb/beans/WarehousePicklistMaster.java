package com.tlabs.posweb.beans;
import java.util.Date;
import java.util.List;



public class WarehousePicklistMaster {
	private String pickListId;
	
	private String warehouseId;
	
	private String pickListType;
	
	private Date createdDate;
	
	private Date upDatedDate;
	
	private Date startTime;
	
	private Date endTime;
	
	private String userName;
	
	private String roleName;
	
	private String remarks;
	
	private String editSystemId = null;
	
	private RequestHeader requestHeader;
	
	private List<String> requestIds;
	
	private String skuId;
	
	private List<String> issueIds;
	
	private ResponseHeader responseHeader;
	
	private String startIndex;
	
	private String maxRecords;

	private String searchCritaria;
	
	private String outletId;
	
	private String startDateStr;
	
	private String endDateStr;
	
	private String storeLocation;
	
	private String startTimeStr;
	
	private String endTimeStr;
	
    private String createDatestr;
	
	private String upDatedateStr;
	
    /*private List<WarehousePickListItems> itemsList;*/
    
    private String status;
    private int totalRecords;
    private float totalCost;
    
    private String operation;
    
    private String stockType;
    private String brand;
	private String category;
	private String subCategory;
	private String department;
	private Float startPriceRange;
	private Float endPriceRange;
	private String supplierName;
    
	private String zoneId; 
	private String storageArea="";
	

	
	

	public String getStorageArea() {
		return storageArea;
	}

	public void setStorageArea(String storageArea) {
		this.storageArea = storageArea;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public String getStockType() {
		return stockType;
	}

	public void setStockType(String stockType) {
		this.stockType = stockType;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Float getStartPriceRange() {
		return startPriceRange;
	}

	public void setStartPriceRange(Float startPriceRange) {
		this.startPriceRange = startPriceRange;
	}

	public Float getEndPriceRange() {
		return endPriceRange;
	}

	public void setEndPriceRange(Float endPriceRange) {
		this.endPriceRange = endPriceRange;
	}

	public float getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(float totalCost) {
		this.totalCost = totalCost;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	private List<UpdateDto> pickListDetails;
	
	
	
	public List<UpdateDto> getPickListDetails() {
		return pickListDetails;
	}

	public void setPickListDetails(List<UpdateDto> pickListDetails) {
		this.pickListDetails = pickListDetails;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUpDatedateStr() {
		return upDatedateStr;
	}

	public void setUpDatedateStr(String upDatedateStr) {
		this.upDatedateStr = upDatedateStr;
	}

	public String getCreateDatestr() {
		return createDatestr;
	}

	public void setCreateDatestr(String createDatestr) {
		this.createDatestr = createDatestr;
	}

	/*public List<WarehousePickListItems> getItemsList() {
		return itemsList;
	}

	public void setItemsList(List<WarehousePickListItems> itemsList) {
		this.itemsList = itemsList;
	}*/

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

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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

	private List<WarehousePicklistMaster> warehousePickListMaster;
	
	private List<WarehousePickListItems> warehousePickListItems;

	public String getPickListId() {
		return pickListId;
	}

	public void setPickListId(String pickListId) {
		this.pickListId = pickListId;
	}

	public String getOutletId() {
		return outletId;
	}

	public void setOutletId(String outletId) {
		this.outletId = outletId;
	}
	public String getWarehouseId() {
		return warehouseId;
	}

	public void setWarehouseId(String warehouseId) {
		this.warehouseId = warehouseId;
	}

	public String getPickListType() {
		return pickListType;
	}

	public void setPickListType(String pickListType) {
		this.pickListType = pickListType;
	}

	

	



	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<String> getRequestIds() {
		return requestIds;
	}

	public void setRequestIds(List<String> requestIds) {
		this.requestIds = requestIds;
	}
	public List<String> getIssueIds() {
		return issueIds;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public void setIssueIds(List<String> issueIds) {
		this.issueIds = issueIds;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpDatedDate() {
		return upDatedDate;
	}

	public void setUpDatedDate(Date upDatedDate) {
		this.upDatedDate = upDatedDate;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getEditSystemId() {
		return editSystemId;
	}

	public void setEditSystemId(String editSystemId) {
		this.editSystemId = editSystemId;
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

	public String getSearchCritaria() {
		return searchCritaria;
	}

	public void setSearchCritaria(String searchCritaria) {
		this.searchCritaria = searchCritaria;
	}

	public List<WarehousePicklistMaster> getWarehousePickListMaster() {
		return warehousePickListMaster;
	}

	public void setWarehousePickListMaster(List<WarehousePicklistMaster> warehousePickListMaster) {
		this.warehousePickListMaster = warehousePickListMaster;
	}

	public List<WarehousePickListItems> getWarehousePickListItems() {
		return warehousePickListItems;
	}

	public void setWarehousePickListItems(List<WarehousePickListItems> warehousePickListItems) {
		this.warehousePickListItems = warehousePickListItems;
	}
	
	
	
	
}
