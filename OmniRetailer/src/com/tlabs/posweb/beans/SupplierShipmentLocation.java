package com.tlabs.posweb.beans;

import java.util.Date;





/*Author:Karthik K
 * createdOn:30-12-2016
 */
//@Entity
//@Table(name="supplier_shipment_location")
public class SupplierShipmentLocation {
	//@Id
	
	private int sno;

//	@Column(name = "shipment_location ")
	private String shipmentLocation;
	private String shipmentStreet;
	private String shipmentCity;
	private String remarks;
	//private Float quantity;
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getShipmentCity() {
		return shipmentCity;
	}

	public void setShipmentCity(String shipmentCity) {
		this.shipmentCity = shipmentCity;
	}

	public String getShipmentStreet() {
		return shipmentStreet;
	}

	public void setShipmentStreet(String shipmentStreet) {
		this.shipmentStreet = shipmentStreet;
	}

	//@Column(name = "quote_ref")
	private String quoteRef;
	
	//@Column(name = "plu_code")
	private String pluCode;
	
	//@Column(name = "sku_id")
	private String skuId;
	
	//@Column(name = "date_time")
	private Date dateTime;

	//@Column(name = "shipment_state ")
	private String shipmentState;
	
	//@Column(name = "shipment_address ")
	private String shipmentAddress;
	
	//@Column(name = "shipment_zip_code ")
	private String shipmentZipCode;
	
	//@Column(name = "shipment_cost ")
	private float shipmentCost;
	
	//@Column(name = "quantity")
	private float quantity;
	
	//@Transient
	private String dateTimeStr;
	
	//@Transient
	private String shipmentCostStr;
	private String itemDescription;
	private Float supplyQty;
	public Float getSupplyQty() {
		return supplyQty;
	}

	public void setSupplyQty(Float supplyQty) {
		this.supplyQty = supplyQty;
	}

	public Float getMinQty() {
		return minQty;
	}

	public void setMinQty(Float minQty) {
		this.minQty = minQty;
	}

	public Float getLeadTime() {
		return leadTime;
	}

	public void setLeadTime(Float leadTime) {
		this.leadTime = leadTime;
	}

	private Float minQty;
	private Float leadTime;
	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public String getUnitOfMeasurement() {
		return unitOfMeasurement;
	}

	public void setUnitOfMeasurement(String unitOfMeasurement) {
		this.unitOfMeasurement = unitOfMeasurement;
	}

	private String unitOfMeasurement;

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

	public float getQuantity() {
		return quantity;
	}

	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}

	public String getDateTimeStr() {
		return dateTimeStr;
	}

	public void setDateTimeStr(String dateTimeStr) {
		this.dateTimeStr = dateTimeStr;
	}

	public String getShipmentCostStr() {
		return shipmentCostStr;
	}

	public void setShipmentCostStr(String shipmentCostStr) {
		this.shipmentCostStr = shipmentCostStr;
	}
	
	
}
