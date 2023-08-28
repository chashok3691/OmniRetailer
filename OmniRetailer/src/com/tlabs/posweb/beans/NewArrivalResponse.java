package com.tlabs.posweb.beans;

import java.util.List;


public class NewArrivalResponse {
	
	private ResponseHeader responseHeader;
	private int totalRecords;
	private List<NewArrivalProducts> newArrivalProducts;
	private NewArrivalProducts arrivalProducts;
	private List<String> returnRefId;
	
	
	public List<String> getReturnRefId() {
		return returnRefId;
	}
	public void setReturnRefId(List<String> returnRefId) {
		this.returnRefId = returnRefId;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<NewArrivalProducts> getNewArrivalProducts() {
		return newArrivalProducts;
	}
	public void setNewArrivalProducts(List<NewArrivalProducts> newArrivalProducts) {
		this.newArrivalProducts = newArrivalProducts;
	}
	public NewArrivalProducts getArrivalProducts() {
		return arrivalProducts;
	}
	public void setArrivalProducts(NewArrivalProducts arrivalProducts) {
		this.arrivalProducts = arrivalProducts;
	}
	
	


}
