package com.tlabs.posweb.beans;



//@Entity
//@Table(name="gift_vouchure_locations")
public class GiftVoucherLocations {

	//@Id
	//@Column(name="ref_no")
	//@GeneratedValue(strategy = GenerationType.AUTO)
	private int sno;
	
	//@Column(name="gift_vouchure_promo")
	private String voucherPrgCode;
	
	//@Column(name="valid_location")
	private String validLocation;

	//@Column(name="zone_id")
	private String zone_id;
	
	
	
	public String getZone_id() {
		return zone_id;
	}

	public void setZone_id(String zone_id) {
		this.zone_id = zone_id;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getVoucherPrgCode() {
		return voucherPrgCode;
	}

	public void setVoucherPrgCode(String voucherPrgCode) {
		this.voucherPrgCode = voucherPrgCode;
	}

	public String getValidLocation() {
		return validLocation;
	}

	public void setValidLocation(String validLocation) {
		this.validLocation = validLocation;
	}
	
	
}
