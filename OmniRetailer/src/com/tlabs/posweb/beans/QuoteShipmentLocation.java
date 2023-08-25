package com.tlabs.posweb.beans;
import java.util.Date;
/**
 * @author chennakesav.a
 * createdOn   : 15-03-2016
 * Description : This model class is used to hold the values and interact with quote_shipment_location table in database.
 * */
public class QuoteShipmentLocation {
	private int sno;
	private String shipmentLocation;
	private String quoteRef;
	private String pluCode;
	private String skuId;
	private Date dateTime;
	private String dateTimeStr;
	private float shipmentCost;
	private String shipmentCostStr;
	private String shipmentStreet;
	private String shipmentAddress;
	private String shipmentCity;
	private String shipmentZipCode;
	private String shipmentState;
	private String shipmentCountry;
	private String quantity;
	private String itemDescription;
	private String remarks;
	private String unitOfMeasurement;
	
	public String getUnitOfMeasurement() {
		return unitOfMeasurement;
	}

	public void setUnitOfMeasurement(String unitOfMeasurement) {
		this.unitOfMeasurement = unitOfMeasurement;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getShipmentStreet() {
		return shipmentStreet;
	}

	public void setShipmentStreet(String shipmentStreet) {
		this.shipmentStreet = shipmentStreet;
	}

	public String getShipmentCity() {
		return shipmentCity;
	}

	public void setShipmentCity(String shipmentCity) {
		this.shipmentCity = shipmentCity;
	}

	public String getShipmentCountry() {
		return shipmentCountry;
	}

	public void setShipmentCountry(String shipmentCountry) {
		this.shipmentCountry = shipmentCountry;
	}

	public String getShipmentState() {
		return shipmentState;
	}

	public void setShipmentState(String shipmentState) {
		this.shipmentState = shipmentState;
	}

	public String getShipmentAddress() {
		return shipmentAddress;
	}

	public void setShipmentAddress(String shipmentAddress) {
		this.shipmentAddress = shipmentAddress;
	}

	public String getShipmentZipCode() {
		return shipmentZipCode;
	}

	public void setShipmentZipCode(String shipmentZipCode) {
		this.shipmentZipCode = shipmentZipCode;
	}

	public float getShipmentCost() {
		return shipmentCost;
	}

	public void setShipmentCost(float shipmentCost) {
		this.shipmentCost = shipmentCost;
	}

	public String getShipmentCostStr() {
		return shipmentCostStr;
	}

	public void setShipmentCostStr(String shipmentCostStr) {
		this.shipmentCostStr = shipmentCostStr;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getShipmentLocation() {
		return shipmentLocation;
	}

	public void setShipmentLocation(String shipmentLocation) {
		this.shipmentLocation = shipmentLocation;
	}

	public String getQuoteRef() {
		return quoteRef;
	}

	public void setQuoteRef(String quoteRef) {
		this.quoteRef = quoteRef;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}

	public String getDateTimeStr() {
		return dateTimeStr;
	}

	public void setDateTimeStr(String dateTimeStr) {
		this.dateTimeStr = dateTimeStr;
	}

 
	
	 
}
