package com.tlabs.posweb.beans;

/*import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;*/

import org.apache.commons.lang.builder.EqualsBuilder;



public class GiftCouponLocations {

	

	private int sno;
	
	
	private String couponPrgCode;
	
	
	private String validLocation;
	
	
	private String zoneId;
	


	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

 

	public String getValidLocation() {
		return validLocation;
	}

	public void setValidLocation(String validLocation) {
		this.validLocation = validLocation;
	}

	public String getCouponPrgCode() {
		return couponPrgCode;
	}

	public void setCouponPrgCode(String couponPrgCode) {
		this.couponPrgCode = couponPrgCode;
	}

	

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}
		 
	
	
	
}
