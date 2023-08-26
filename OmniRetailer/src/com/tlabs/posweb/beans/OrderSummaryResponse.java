package com.tlabs.posweb.beans;

import java.util.List;

public class OrderSummaryResponse {

	private String status;
	private String locaion;
	private String orderChannel;
	private double totalOrderAmt;
	private double totalOrderTax;
	private int totalRecords;
	private long cancelOrders;
	private double cancelOrdesAmt;
	private long pendingOrders;
	private double pendingOrderAmt;
	private List<OrderSummary> summaryList;
	private ResponseHeader responseHeader;
	private long totalOrders;
	private int fulFilledOrders;
	private double fulFilledOrderAmt;
	private long pendingCartOrders;
	private double pendingCartAmt;
	private int totalOrderedItems;
	
	// for Request String //
	private String orderStartDate;
	private String orderEndDate;
	private String saleLocation;
//	private String orderChannel;
	private String orderStatus;
	private RequestHeader requestHeader;
 
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getOrderStartDate() {
		return orderStartDate;
	}
	public void setOrderStartDate(String orderStartDate) {
		this.orderStartDate = orderStartDate;
	}
	public String getOrderEndDate() {
		return orderEndDate;
	}
	public void setOrderEndDate(String orderEndDate) {
		this.orderEndDate = orderEndDate;
	}
	public String getSaleLocation() {
		return saleLocation;
	}
	public void setSaleLocation(String saleLocation) {
		this.saleLocation = saleLocation;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLocaion() {
		return locaion;
	}
	public void setLocaion(String locaion) {
		this.locaion = locaion;
	}
	public String getOrderChannel() {
		return orderChannel;
	}
	public void setOrderChannel(String orderChannel) {
		this.orderChannel = orderChannel;
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
 
 
	 
	public int getFulFilledOrders() {
		return fulFilledOrders;
	}
	public void setFulFilledOrders(int fulFilledOrders) {
		this.fulFilledOrders = fulFilledOrders;
	}
	public double getFulFilledOrderAmt() {
		return fulFilledOrderAmt;
	}
	public void setFulFilledOrderAmt(double fulFilledOrderAmt) {
		this.fulFilledOrderAmt = fulFilledOrderAmt;
	}
	 
	public int getTotalOrderedItems() {
		return totalOrderedItems;
	}
	public void setTotalOrderedItems(int totalOrderedItems) {
		this.totalOrderedItems = totalOrderedItems;
	}
 
 
	public double getTotalOrderAmt() {
		return totalOrderAmt;
	}
	public void setTotalOrderAmt(double totalOrderAmt) {
		this.totalOrderAmt = totalOrderAmt;
	}
 
	public double getTotalOrderTax() {
		return totalOrderTax;
	}
	public void setTotalOrderTax(double totalOrderTax) {
		this.totalOrderTax = totalOrderTax;
	}
	public double getCancelOrdesAmt() {
		return cancelOrdesAmt;
	}
	public void setCancelOrdesAmt(double cancelOrdesAmt) {
		this.cancelOrdesAmt = cancelOrdesAmt;
	}
	public double getPendingOrderAmt() {
		return pendingOrderAmt;
	}
	public void setPendingOrderAmt(double pendingOrderAmt) {
		this.pendingOrderAmt = pendingOrderAmt;
	}
	public double getPendingCartAmt() {
		return pendingCartAmt;
	}
	public void setPendingCartAmt(double pendingCartAmt) {
		this.pendingCartAmt = pendingCartAmt;
	}
	public long getCancelOrders() {
		return cancelOrders;
	}
	public void setCancelOrders(long cancelOrders) {
		this.cancelOrders = cancelOrders;
	}
	public long getPendingOrders() {
		return pendingOrders;
	}
	public void setPendingOrders(long pendingOrders) {
		this.pendingOrders = pendingOrders;
	}
	public long getTotalOrders() {
		return totalOrders;
	}
	public void setTotalOrders(long totalOrders) {
		this.totalOrders = totalOrders;
	}
	public long getPendingCartOrders() {
		return pendingCartOrders;
	}
	public void setPendingCartOrders(long pendingCartOrders) {
		this.pendingCartOrders = pendingCartOrders;
	}
	public List<OrderSummary> getSummaryList() {
		return summaryList;
	}
	public void setSummaryList(List<OrderSummary> summaryList) {
		this.summaryList = summaryList;
	}
}
