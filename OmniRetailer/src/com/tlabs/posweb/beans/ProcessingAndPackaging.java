package com.tlabs.posweb.beans;

import java.util.List;

public class ProcessingAndPackaging {

	private String packagingRefId;

	private String supplierName;

	private String GRNNumber;

	private String createdDate;

	private String updatedDate;

	private String noOfItems;

	private String totalPackedQty;

	private String totalStockQty;

	private String status;

	private String packedBy;

	private String storeLocation;

	private String zone;

	private String department;

	private String subCategory;

	private String Model;
	
	private String brand;

	private String subDepartment;

	private String userName;

	private String roleName;

	private String startDateStr;

	private String endDateStr;

	//private Set<PackagingDetails> packagingDetails;
	private List<PackagingDetails> packagingDetails;
	private RequestHeader requestHeader;
	
	
	


	

	

	

	

	private String category;
	
	
	private String startIndex;
	private ResponseHeader responseHeader;
	private String maxRecords;
	
	private int totalRecords;
	
	private String operation;
	
	
	private String storageArea;
	
	private String storageLevel;
	
	private String packer;
	
	private String verifiedBy;
	
	private String packageLine;
	private String createdDateStr;
	
	private String updatedDateStr;
	
	
	
	
	

	
	
	
	
	
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

	public String getStorageArea() {
		return storageArea;
	}

	public void setStorageArea(String storageArea) {
		this.storageArea = storageArea;
	}

	public String getStorageLevel() {
		return storageLevel;
	}

	public void setStorageLevel(String storageLevel) {
		this.storageLevel = storageLevel;
	}

	public String getPacker() {
		return packer;
	}

	public void setPacker(String packer) {
		this.packer = packer;
	}

	public String getVerifiedBy() {
		return verifiedBy;
	}

	public void setVerifiedBy(String verifiedBy) {
		this.verifiedBy = verifiedBy;
	}

	public String getPackageLine() {
		return packageLine;
	}

	public void setPackageLine(String packageLine) {
		this.packageLine = packageLine;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<PackagingDetails> getPackagingDetails() {
		return packagingDetails;
	}

	public void setPackagingDetails(List<PackagingDetails> packagingDetails) {
		this.packagingDetails = packagingDetails;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	/*public Set<PackagingDetails> getPackagingDetails() {
		return packagingDetails;
	}

	public void setPackagingDetails(Set<PackagingDetails> packagingDetails) {
		this.packagingDetails = packagingDetails;
	}*/
	
	

	public String getPackagingRefId() {
		return packagingRefId;
	}

	

	public void setPackagingRefId(String packagingRefId) {
		this.packagingRefId = packagingRefId;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getGRNNumber() {
		return GRNNumber;
	}

	public void setGRNNumber(String gRNNumber) {
		GRNNumber = gRNNumber;
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

	public String getNoOfItems() {
		return noOfItems;
	}

	public void setNoOfItems(String noOfItems) {
		this.noOfItems = noOfItems;
	}

	public String getTotalPackedQty() {
		return totalPackedQty;
	}

	public void setTotalPackedQty(String totalPackedQty) {
		this.totalPackedQty = totalPackedQty;
	}

	public String getTotalStockQty() {
		return totalStockQty;
	}

	public void setTotalStockQty(String totalStockQty) {
		this.totalStockQty = totalStockQty;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPackedBy() {
		return packedBy;
	}

	public void setPackedBy(String packedBy) {
		this.packedBy = packedBy;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getModel() {
		return Model;
	}

	public void setModel(String model) {
		Model = model;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getSubDepartment() {
		return subDepartment;
	}

	public void setSubDepartment(String subDepartment) {
		this.subDepartment = subDepartment;
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
	
	
}
