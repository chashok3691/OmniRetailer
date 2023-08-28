package com.tlabs.posweb.beans;

import java.util.List;


public class OnlinePaymentResponse {
	
	private ResponseHeader responseHeader;
	private OnlinePayments onlinePayments;
	private List<OnlinePayments> paymentsList;
	private int totalRecords;
	
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public OnlinePayments getOnlinePayments() {
		return onlinePayments;
	}
	public void setOnlinePayments(OnlinePayments onlinePayments) {
		this.onlinePayments = onlinePayments;
	}
	public List<OnlinePayments> getPaymentsList() {
		return paymentsList;
	}
	public void setPaymentsListl(List<OnlinePayments> paymentsList) {
		this.paymentsList= paymentsList;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	
	

}
