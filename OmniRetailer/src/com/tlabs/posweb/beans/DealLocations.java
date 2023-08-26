package com.tlabs.posweb.beans;

/*import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;*/

//@Entity
//@Table(name = "deal_locations")
public class DealLocations {

	//@Id
	//@GeneratedValue(strategy = GenerationType.AUTO)
	//@Column(name = "s_no")
	private int sno;
	
	//@Column(name = "deal_id")
	private String dealID;
	
	//@Column(name = "location_id")
	private String storeLocation;

	public int getSno() {
		return sno;
	}

	public String getDealID() {
		return dealID;
	}

	public void setDealID(String dealID) {
		this.dealID = dealID;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	
}
