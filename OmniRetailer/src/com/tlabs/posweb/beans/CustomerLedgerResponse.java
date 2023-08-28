package com.tlabs.posweb.beans;

public class CustomerLedgerResponse {
	private ResponseHeader responseHeader;
	private String txnRef;
	private String url;
	private String errorMsg;
	
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	public String getTxnRef() {
		return txnRef;
	}
	public void setTxnRef(String txnRef) {
		this.txnRef = txnRef;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
