package com.tlabs.posweb.beans;

import java.util.List;
import java.util.Map;

/**
 * @author Mythri
 *
 */
public class PrintResponse {
	
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private List<String> sequenceOfObject;
	private Map<String,PrintFormat> printFomatMapObj;
	
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
	public List<String> getSequenceOfObject() {
		return sequenceOfObject;
	}
	public void setSequenceOfObject(List<String> sequenceOfObject) {
		this.sequenceOfObject = sequenceOfObject;
	}
	public Map<String, PrintFormat> getPrintFomatMapObj() {
		return printFomatMapObj;
	}
	public void setPrintFomatMapObj(Map<String, PrintFormat> printFomatMapObj) {
		this.printFomatMapObj = printFomatMapObj;
	}
}
