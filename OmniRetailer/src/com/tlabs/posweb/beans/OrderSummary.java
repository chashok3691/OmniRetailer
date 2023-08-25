package com.tlabs.posweb.beans;

public class OrderSummary {

	private String statusName;
 	private long orders;
	private double ordersAmt;
	private double orderTax;
	private long orderedItems;
 
	public long getOrders() {
		return orders;
	}
	public void setOrders(long orders) {
		this.orders = orders;
	}
	public double getOrdersAmt() {
		return ordersAmt;
	}
	public void setOrdersAmt(double ordersAmt) {
		this.ordersAmt = ordersAmt;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public double getOrderTax() {
		return orderTax;
	}
	public void setOrderTax(double orderTax) {
		this.orderTax = orderTax;
	}
	public long getOrderedItems() {
		return orderedItems;
	}
	public void setOrderedItems(long orderedItems) {
		this.orderedItems = orderedItems;
	}
	
}
