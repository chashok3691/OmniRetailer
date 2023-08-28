package com.tlabs.posweb.beans;

import java.util.List;

public class GetLogResponse {

	private ResponseHeader responseHeader;
	private List<LogBean> logList;
	private int totalRecords;
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public List<LogBean> getLogList() {
		return logList;
	}
	public void setLogList(List<LogBean> logList) {
		this.logList = logList;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	
	
	
}
