package com.tlabs.posweb.beans;

import java.util.List;

public class CustomerDevices {

	private String customerId;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private List<String> devices;
	
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
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
	public List<String> getDevices() {
		return devices;
	}
	public void setDevices(List<String> devices) {
		this.devices = devices;
	}
	
	
}
