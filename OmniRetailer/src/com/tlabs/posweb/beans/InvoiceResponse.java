package com.tlabs.posweb.beans;

import java.util.List;



public class InvoiceResponse {

	private ResponseHeader responseHeader;
	private String invoiceId;
	private List<?> invoices;
	private List<?> invoiceItems;
	private WHInvoice invoice;
	private int totalInvoices;
	
	
	public int getTotalInvoices() {
		return totalInvoices;
	}
	public void setTotalInvoices(int totalInvoices) {
		this.totalInvoices = totalInvoices;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public String getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(String invoiceId) {
		this.invoiceId = invoiceId;
	}
	public List<?> getInvoices() {
		return invoices;
	}
	public void setInvoices(List<?> invoices) {
		this.invoices = invoices;
	}
	public List<?> getInvoiceItems() {
		return invoiceItems;
	}
	public void setInvoiceItems(List<?> invoiceItems) {
		this.invoiceItems = invoiceItems;
	}
	public WHInvoice getInvoice() {
		return invoice;
	}
	public void setInvoice(WHInvoice invoice) {
		this.invoice = invoice;
	}
	
	
}