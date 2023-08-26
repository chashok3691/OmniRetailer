package com.tlabs.posweb.beans;

import java.util.List;


public class WarehouseBOMResponse {
	private ResponseHeader responseHeader;
	private int totalRecords;
	private WarehouseProductBom bomObj;
	private List<WarehouseProductBom> bomList;
	private List<WarehouseProductBomChild> bomChildsList;
	private List<WarehouseBOMSummary> bomSummaryList;

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

	public WarehouseProductBom getBomObj() {
		return bomObj;
	}

	public void setBomObj(WarehouseProductBom bomObj) {
		this.bomObj = bomObj;
	}

	public List<WarehouseProductBom> getBomList() {
		return bomList;
	}

	public void setBomList(List<WarehouseProductBom> bomList2) {
		this.bomList = bomList2;
	}

	public List<WarehouseProductBomChild> getWarehouseBomChildList() {
		return bomChildsList;
	}

	public void setBomChildsList(List<WarehouseProductBomChild> bomChildsList) {
		this.bomChildsList = bomChildsList;
	}

	public List<WarehouseBOMSummary> getBomSummaryList() {
		return bomSummaryList;
	}

	public void setWarehouseProductBomSummaryList(List<WarehouseBOMSummary> bomSummaryList) {
		this.bomSummaryList = bomSummaryList;
	}

}
