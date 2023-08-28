package com.tlabs.posweb.beans;

import java.util.List;


public class WarehouseGoodsReceiptNoteResponse {

	private ResponseHeader responseHeader;
	private int totalRecords;
	private List<WarehouseGoodsReceiptNote> grnList;
	private WarehouseGoodsReceiptNote grnObj;
	
	
//	private List<WarehouseGrnSummary> summaryList;
	
	
	
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<WarehouseGoodsReceiptNote> getGrnList() {
		return grnList;
	}
	public void setGrnList(List<WarehouseGoodsReceiptNote> grnList) {
		this.grnList = grnList;
	}
	public WarehouseGoodsReceiptNote getGrnObj() {
		return grnObj;
	}
	public void setGrnObj(WarehouseGoodsReceiptNote grnObj) {
		this.grnObj = grnObj;
	}
	/*public List<WarehouseGrnSummary> getSummaryList() {
		return summaryList;
	}
	public void setSummaryList(List<WarehouseGrnSummary> summaryList) {
		this.summaryList = summaryList;
	}*/
 
}
