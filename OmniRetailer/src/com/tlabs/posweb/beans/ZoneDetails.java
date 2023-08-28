package com.tlabs.posweb.beans;

import java.io.Serializable;

public class ZoneDetails implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8480711715955744637L;
	private int slNo;
	private String zoneID;
	private String location;
	private String state;
	private String locationType;
	
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public String getZoneID() {
		return zoneID;
	}
	public void setZoneID(String zoneID) {
		this.zoneID = zoneID;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getLocationType() {
		return locationType;
	}
	public void setLocationType(String locationType) {
		this.locationType = locationType;
	}
}
