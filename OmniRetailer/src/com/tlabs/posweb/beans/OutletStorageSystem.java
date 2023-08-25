package com.tlabs.posweb.beans;

import java.util.List;


public class OutletStorageSystem {

	private String storageSystemId;
	private String storageSystemName;
	private String outletId;
	//private int storageSystemCapacity;
	private String storageSystemType;
	private String storageLocation;
	private String productId;
	//private int currentStock;
	private int rows;
	private int columns;
	//private String storageSystemNotation;
	//private String columnNotation;
	//private String rowNotation;
	private String editSystemId = null;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private List<OutletStorageSystemDetails> storagesInformation;
	private String serialNumber;
	
	private int length;
	private int width;
	
	private List<OutletStorageSystem> outletLayouotDetails;
	
	
	public List<OutletStorageSystem> getOutletLayouotDetails() {
		return outletLayouotDetails;
	}
	public void setOutletLayouotDetails(List<OutletStorageSystem> outletLayouotDetails) {
		this.outletLayouotDetails = outletLayouotDetails;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public String getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}
	public List<OutletStorageSystemDetails> getStoragesInformation() {
		return storagesInformation;
	}
	public void setStoragesInformation(
			List<OutletStorageSystemDetails> storagesInformation) {
		this.storagesInformation = storagesInformation;
	}
	public String getStorageSystemId() {
		return storageSystemId;
	}
	public void setStorageSystemId(String storageSystemId) {
		this.storageSystemId = storageSystemId;
	}
	public String getStorageSystemName() {
		return storageSystemName;
	}
	public void setStorageSystemName(String storageSystemName) {
		this.storageSystemName = storageSystemName;
	}
	public String getOutletId() {
		return outletId;
	}
	public void setOutletId(String outletId) {
		this.outletId = outletId;
	}
	public String getStorageSystemType() {
		return storageSystemType;
	}
	public void setStorageSystemType(String storageSystemType) {
		this.storageSystemType = storageSystemType;
	}
	public String getStorageLocation() {
		return storageLocation;
	}
	public void setStorageLocation(String storageLocation) {
		this.storageLocation = storageLocation;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getColumns() {
		return columns;
	}
	public void setColumns(int columns) {
		this.columns = columns;
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
	
	
	
}
