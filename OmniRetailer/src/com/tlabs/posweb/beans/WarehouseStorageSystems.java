package com.tlabs.posweb.beans;

import java.util.List;

public class WarehouseStorageSystems {

	private String storageSystemId;
	private String warehouseId;
	private Integer currentStock;
	private Integer storageSystemCapacity;
	private String storageSystemName;
	private String productId;
	private Integer rows;
	private Integer columns;
	private String rowNotation;
	private String columnNotation;
	private String storageSystemNotation;
	private String storageLocation;
	private String storageSystemType;
	private String editSystemId;
	//private String rowNotation;
	//private String columnNotation;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    private String materialType;
    
    private String height;
    
    private String length;
    
    private String width;
    
    private String storageIcon;
    
    private String manufacturer;
    
    private int noOfLevels;
    
    private int levelPartition;
    
    private String createdDate;
    
    private String updatedDate;
    
    private String userName;
    
    private String roleName;
	
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private String startIndex;
	
	private String maxRecords;

	private String searchCritaria;
	
	private List<WarehouseStorageSystems> warehouseStorageSystems;
	
	private List<WHStorageSystemDetails> warehouseStorageSystemDetails;
	
	private int totalRecords;
	
	private List<String> storageIds;

	private String iconId;
	
	private boolean iconFlag;
	private String remarks;
	
	
	
	
	
	
	
	
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getMaterialType() {
		return materialType;
	}
	public void setMaterialType(String materialType) {
		this.materialType = materialType;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	public String getStorageIcon() {
		return storageIcon;
	}
	public void setStorageIcon(String storageIcon) {
		this.storageIcon = storageIcon;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public int getNoOfLevels() {
		return noOfLevels;
	}
	public void setNoOfLevels(int noOfLevels) {
		this.noOfLevels = noOfLevels;
	}
	public int getLevelPartition() {
		return levelPartition;
	}
	public void setLevelPartition(int levelPartition) {
		this.levelPartition = levelPartition;
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
	public List<WarehouseStorageSystems> getWarehouseStorageSystems() {
		return warehouseStorageSystems;
	}
	public void setWarehouseStorageSystems(List<WarehouseStorageSystems> warehouseStorageSystems) {
		this.warehouseStorageSystems = warehouseStorageSystems;
	}
	public List<WHStorageSystemDetails> getWarehouseStorageSystemDetails() {
		return warehouseStorageSystemDetails;
	}
	public void setWarehouseStorageSystemDetails(List<WHStorageSystemDetails> warehouseStorageSystemDetails) {
		this.warehouseStorageSystemDetails = warehouseStorageSystemDetails;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<String> getStorageIds() {
		return storageIds;
	}
	public void setStorageIds(List<String> storageIds) {
		this.storageIds = storageIds;
	}
	public String getIconId() {
		return iconId;
	}
	public void setIconId(String iconId) {
		this.iconId = iconId;
	}
	public boolean isIconFlag() {
		return iconFlag;
	}
	public void setIconFlag(boolean iconFlag) {
		this.iconFlag = iconFlag;
	}
	public String getProductId() {
		return productId;
	}
	public String getEditSystemId() {
		return editSystemId;
	}
	public void setEditSystemId(String editSystemId) {
		this.editSystemId = editSystemId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getStorageSystemNotation() {
		return storageSystemNotation;
	}
	public void setStorageSystemNotation(String storageSystemNotation) {
		this.storageSystemNotation = storageSystemNotation;
	}
	
	public String getStorageLocation() {
		return storageLocation;
	}
	public void setStorageLocation(String storageLocation) {
		this.storageLocation = storageLocation;
	}
	public String getStorageSystemType() {
		return storageSystemType;
	}
	public void setStorageSystemType(String storageSystemType) {
		this.storageSystemType = storageSystemType;
	}
	public String getStorageSystemId() {
		return storageSystemId;
	}
	public void setStorageSystemId(String storageSystemId) {
		this.storageSystemId = storageSystemId;
	}
	public String getWarehouseId() {
		return warehouseId;
	}
	public void setWarehouseId(String warehouseId) {
		this.warehouseId = warehouseId;
	}
	
	public String getStorageSystemName() {
		return storageSystemName;
	}
	public void setStorageSystemName(String storageSystemName) {
		this.storageSystemName = storageSystemName;
	}
	public String getRowNotation() {
		return rowNotation;
	}
	public void setRowNotation(String rowNotation) {
		this.rowNotation = rowNotation;
	}
	public String getColumnNotation() {
		return columnNotation;
	}
	public void setColumnNotation(String columnNotation) {
		this.columnNotation = columnNotation;
	}
	public Integer getCurrentStock() {
		return currentStock;
	}
	public void setCurrentStock(Integer currentStock) {
		this.currentStock = currentStock;
	}
	public Integer getStorageSystemCapacity() {
		return storageSystemCapacity;
	}
	public void setStorageSystemCapacity(Integer storageSystemCapacity) {
		this.storageSystemCapacity = storageSystemCapacity;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getColumns() {
		return columns;
	}
	public void setColumns(Integer columns) {
		this.columns = columns;
	}
	
}
