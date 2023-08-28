package com.tlabs.posweb.beans;


/*@Entity
@Table(name="membership_locations")*/
public class MembershipLocations {
	
	/*@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="ref_no")*/
	private int refNo;
	
	/*@Column(name="membership_program_code")*/
	private String membershipProgramCode;
	
/*	@Column(name="valid_location")*/
	private String validLocations;
	
	/*@Column(name="zone_id")*/
	private String zoneId;

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}

	public String getMembershipProgramCode() {
		return membershipProgramCode;
	}

	public void setMembershipProgramCode(String membershipProgramCode) {
		this.membershipProgramCode = membershipProgramCode;
	}

	public String getValidLocations() {
		return validLocations;
	}

	public void setValidLocations(String validLocations) {
		this.validLocations = validLocations;
	}

	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}
	
	

}
