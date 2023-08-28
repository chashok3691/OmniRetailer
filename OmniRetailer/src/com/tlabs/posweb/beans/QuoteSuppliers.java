package com.tlabs.posweb.beans;

/**
 * @author chennakesav.a
 * createdOn   : 15-03-2016
 * Description : This model class is used to hold the values and interact with quote_suppliers table in database.
 * */
public class QuoteSuppliers {

	private int sno;
	private String supplierId;
	private String supplierEmail;
	private String quoteRef;
	private String supplierContactNumber;
	private String supplierName;

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getSupplierEmail() {
		return supplierEmail;
	}

	public void setSupplierEmail(String supplierEmail) {
		this.supplierEmail = supplierEmail;
	}

	public String getQuoteRef() {
		return quoteRef;
	}

	public void setQuoteRef(String quoteRef) {
		this.quoteRef = quoteRef;
	}

	public String getSupplierContactNumber() {
		return supplierContactNumber;
	}

	public void setSupplierContactNumber(String supplierContactNumber) {
		this.supplierContactNumber = supplierContactNumber;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	
 
	
}
