package com.tlabs.posweb.beans;
import java.util.List;

/**
 * @author kesav
 * */

public class AssetMaster {

	private String assetName;
	private String assetRefNum;
	private String assetCategory;
	private String costCenter;
	private String serialNum;
	private String model;
	private String manufacturer;
	private String status;
	private String date;
	private String cost;
	private String location;
	private String assetStatus;
	private String maintainedBy;
	private String quantity;
	private String assetDetails;
	private String dateStr;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private List<String> assetNames;
	private String startIndex;
	private String maxRecords;
	private String totalRecords;
	private String searchCriteria;
	private int slNo;
	
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public List<String> getAssetNames() {
		return assetNames;
	}

	public void setAssetNames(List<String> assetNames) {
		this.assetNames = assetNames;
	}
	public String getAssetName() {
		return assetName;
	}

	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}

	public String getAssetRefNum() {
		return assetRefNum;
	}

	public void setAssetRefNum(String assetRefNum) {
		this.assetRefNum = assetRefNum;
	}

	public String getAssetCategory() {
		return assetCategory;
	}

	public void setAssetCategory(String assetCategory) {
		this.assetCategory = assetCategory;
	}

	public String getCostCenter() {
		return costCenter;
	}

	public void setCostCenter(String costCenter) {
		this.costCenter = costCenter;
	}

	public String getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAssetStatus() {
		return assetStatus;
	}

	public void setAssetStatus(String assetStatus) {
		this.assetStatus = assetStatus;
	}

	public String getMaintainedBy() {
		return maintainedBy;
	}

	public void setMaintainedBy(String maintainedBy) {
		this.maintainedBy = maintainedBy;
	}

	

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
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

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

/*	public String[] getAssetNames() {
		return assetNames;
	}

	public void setAssetNames(String[] assetNames) {
		this.assetNames = assetNames;
	}*/

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public String getAssetDetails() {
		return assetDetails;
	}

	public void setAssetDetails(String assetDetails) {
		this.assetDetails = assetDetails;
	}

	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	
	
	
	
}
 