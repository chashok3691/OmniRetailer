package com.tlabs.posweb.beans;

import java.util.List;

public class QuoteRequestResponse {

	private ResponseHeader responseHeader;
	private String quoteRef;
	private List<Quotation> quotesList;
	private int totalRecords;
	private Quotation quoteObj;
	
	public Quotation getQuoteObj() {
		return quoteObj;
	}
	public void setQuoteObj(Quotation quoteObj) {
		this.quoteObj = quoteObj;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public String getQuoteRef() {
		return quoteRef;
	}
	public void setQuoteRef(String quoteRef) {
		this.quoteRef = quoteRef;
	}
	public List<Quotation> getQuotesList() {
		return quotesList;
	}
	public void setQuotesList(List<Quotation> quotesList) {
		this.quotesList = quotesList;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	
	
}
