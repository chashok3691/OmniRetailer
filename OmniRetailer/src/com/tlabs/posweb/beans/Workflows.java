package com.tlabs.posweb.beans;

import java.util.List;

public class Workflows {

	private int serialNum;
	
	private String businessFlow;
	
	private String statusName;
	
	private String statusDesc;
	
	private Float statusOrderNumber;
	
	private Float statusMailFlowOrder;
	
	private Float statusScenarioOrder;

	private String startIndex;
	
	private String maxRecords;
	
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private List<Workflows> workFlowList;

	
	
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public List<Workflows> getWorkFlowList() {
		return workFlowList;
	}

	public void setWorkFlowList(List<Workflows> workFlowList) {
		this.workFlowList = workFlowList;
	}

	public int getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(int serialNum) {
		this.serialNum = serialNum;
	}

	public String getBusinessFlow() {
		return businessFlow;
	}

	public void setBusinessFlow(String businessFlow) {
		this.businessFlow = businessFlow;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getStatusDesc() {
		return statusDesc;
	}

	public void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}

	public Float getStatusOrderNumber() {
		return statusOrderNumber;
	}

	public void setStatusOrderNumber(Float statusOrderNumber) {
		this.statusOrderNumber = statusOrderNumber;
	}

	public Float getStatusMailFlowOrder() {
		return statusMailFlowOrder;
	}

	public void setStatusMailFlowOrder(Float statusMailFlowOrder) {
		this.statusMailFlowOrder = statusMailFlowOrder;
	}

	public Float getStatusScenarioOrder() {
		return statusScenarioOrder;
	}

	public void setStatusScenarioOrder(Float statusScenarioOrder) {
		this.statusScenarioOrder = statusScenarioOrder;
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

	
	
	
	
}
