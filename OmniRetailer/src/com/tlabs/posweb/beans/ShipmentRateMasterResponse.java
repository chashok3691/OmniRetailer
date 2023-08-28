package com.tlabs.posweb.beans;

import java.util.List;


public class ShipmentRateMasterResponse {

private ResponseHeader responseHeader;
private List<ShipmentRateMaster> shipmentRatesList;
private ShipmentRateMaster shipmentRateObj;
private int totalRecords;
private String shipmentCost;
private String errorMessage;


public String getShipmentCost() {
	return shipmentCost;
}

public void setShipmentCost(String shipmentCost) {
	this.shipmentCost = shipmentCost;
}

public String getErrorMessage() {
	return errorMessage;
}

public void setErrorMessage(String errorMessage) {
	this.errorMessage = errorMessage;
}

public List<ShipmentRateMaster> getShipmentRatesList() {
	return shipmentRatesList;
}

public void setShipmentRatesList(List<ShipmentRateMaster> shipmentRatesList) {
	this.shipmentRatesList = shipmentRatesList;
}

public ShipmentRateMaster getShipmentRateObj() {
	return shipmentRateObj;
}

public void setShipmentRateObj(ShipmentRateMaster shipmentRateObj) {
	this.shipmentRateObj = shipmentRateObj;
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

}
