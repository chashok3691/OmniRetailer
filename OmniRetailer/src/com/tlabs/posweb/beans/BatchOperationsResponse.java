package com.tlabs.posweb.beans;

import java.util.List;


public class BatchOperationsResponse {
	private ResponseHeader responseHeader;
	private BatchOperations batchOperations;
	private List<BatchOperations> batchOperationsList;
	private List<ReportBatchLog> batchHistoryList;
	private int totalRecords;

	private String batchDataDdateStr;
	private String batchTimeStr;
	
	public String getBatchDataDdateStr() {
		return batchDataDdateStr;
	}

	public void setBatchDataDdateStr(String batchDataDdateStr) {
		this.batchDataDdateStr = batchDataDdateStr;
	}

	public String getBatchTimeStr() {
		return batchTimeStr;
	}

	public void setBatchTimeStr(String batchTimeStr) {
		this.batchTimeStr = batchTimeStr;
	}

	public List<ReportBatchLog> getBatchHistoryList() {
		return batchHistoryList;
	}

	public void setBatchHistoryList(List<ReportBatchLog> batchHistoryList) {
		this.batchHistoryList = batchHistoryList;
	}

	public BatchOperations getBatchOperations() {
		return batchOperations;
	}

	public void setBatchOperations(BatchOperations batchOperations) {
		this.batchOperations = batchOperations;
	}

	public List<BatchOperations> getBatchOperationsList() {
		return batchOperationsList;
	}

	public void setBatchOperationsList(List<BatchOperations> batchOperationsList) {
		this.batchOperationsList = batchOperationsList;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

}
