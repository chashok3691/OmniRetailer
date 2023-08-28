package com.tlabs.posweb.beans;

import java.util.List;

public class Shipment {
	
	private ShipmentBean shipment;
	private List<WHShipmentItems> shipmentItems;
	public ShipmentBean getShipment() {
		return shipment;
	}
	public void setShipment(ShipmentBean shipment) {
		this.shipment = shipment;
	}
	public List<WHShipmentItems> getShipmentItems() {
		return shipmentItems;
	}
	public void setShipmentItems(List<WHShipmentItems> shipmentItems) {
		this.shipmentItems = shipmentItems;
	}
		
	

}
