package com.tlabs.posweb.beans;

import java.util.List;


public class BillingCounters {

	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String storeLocation=null;
	private String startIndex;
	private List<String> counters;
	
	
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
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	
	public List<String> getCounters() {
		return counters;
	}
	public void setCounters(List<String> counters) {
		this.counters = counters;
	}
	
	
}
