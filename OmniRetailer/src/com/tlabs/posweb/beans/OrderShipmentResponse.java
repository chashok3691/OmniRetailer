package com.tlabs.posweb.beans;

import java.util.List;

/**
 * @author chennakesav.a
 * */
public class OrderShipmentResponse {
	private List<OrderShipment> shipmentList;
	private ResponseHeader responseHeader;
	private int totalRecords;
	private OrderShipment shipmentObj;
	public OrderShipment getShipmentObj() {
		return shipmentObj;
	}

	public void setShipmentObj(OrderShipment shipmentObj) {
		this.shipmentObj = shipmentObj;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public List<OrderShipment> getShipmentList() {
		return shipmentList;
	}

	public void setShipmentList(List<OrderShipment> shipmentList) {
		this.shipmentList = shipmentList;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
}
