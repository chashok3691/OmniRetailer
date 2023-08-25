package com.tlabs.posweb.beans;

import java.util.List;

//import com.tlabs.omniretailerservices.models.BillOfMaterial;

public class WarehouseBomRequest {

	private String productId;
	private String startIndex;
	private String maxRecords;
	private RequestHeader requestHeader;
	private List<WarehouseProductBom> bomList;
	private String searchCriteria;
	private String[] productIds;
	private Object WarehouseProductBomList;
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
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
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public List<WarehouseProductBom> getWarehouseProductBomList() {
		return bomList;
	}
	public void setWarehouseProductBomList(List<WarehouseProductBom> WarehouseProductBomBomList) {
		this.WarehouseProductBomList = WarehouseProductBomList;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String[] getProductIds() {
		return productIds;
	}
	public void setProductIds(String[] productIds) {
		this.productIds = productIds;
	}
	
}
