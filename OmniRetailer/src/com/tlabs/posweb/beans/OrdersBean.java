package com.tlabs.posweb.beans;

import java.util.List;

public class OrdersBean {

	private ResponseHeader responseHeader;
//	private OrderDetails order;
	private OrderDetails whOrder;
	private List<OrderedItems> itemDetails;
	private Order order;
public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	/*	public OrderDetails getOrder() {
		return order;
	}
	public void setOrder(OrderDetails order) {
		this.order = order;
	}*/
	public OrderDetails getWhOrder() {
		return whOrder;
	}
	public void setWhOrder(OrderDetails whOrder) {
		this.whOrder = whOrder;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	/*public OrderDetails getOrderDetails() {
		return order;
	}
	public void setOrderDetails(OrderDetails order) {
		this.order = order;
	}*/
	public List<OrderedItems> getItemDetails() {
		return itemDetails;
	}
	public void setItemDetails(List<OrderedItems> itemDetails) {
		this.itemDetails = itemDetails;
	}
	
	
	
}
