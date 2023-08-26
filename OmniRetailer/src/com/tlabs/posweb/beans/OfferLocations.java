package com.tlabs.posweb.beans;

/*import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;*/

//@Entity
//@Table(name = "offer_locations")
public class OfferLocations {

	//@Id
	//@GeneratedValue(strategy = GenerationType.AUTO)
	//@Column(name = "s_no")
	private int sno;
	
	//@Column(name = "offer_id")
	private String offerID;
	
	//@Column(name = "location_id")
	private String storeLocation;

	public int getSno() {
		return sno;
	}

	public String getOfferID() {
		return offerID;
	}

	public void setOfferID(String offerID) {
		this.offerID = offerID;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	
}
