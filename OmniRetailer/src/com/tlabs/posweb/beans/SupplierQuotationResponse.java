package com.tlabs.posweb.beans;

import java.util.List;

import com.tlabs.posweb.beans.SupplierQuotations;

public class SupplierQuotationResponse {
	
	private ResponseHeader responseHeader;
	
	private String quoteRef;
	
	private List<SupplierQuotations> supplierQuotesList;
	
	private int totalRecords;
	
	private SupplierQuotations supplierQuoteObj;

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

	public List<SupplierQuotations> getSupplierQuotesList() {
		return supplierQuotesList;
	}

	public void setSupplierQuotesList(List<SupplierQuotations> supplierQuotesList) {
		this.supplierQuotesList = supplierQuotesList;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public SupplierQuotations getSupplierQuoteObj() {
		return supplierQuoteObj;
	}

	public void setSupplierQuoteObj(SupplierQuotations supplierQuoteObj) {
		this.supplierQuoteObj = supplierQuoteObj;
	}
}
