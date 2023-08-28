package com.tlabs.posweb.beans;


public class CustomerAddress {

	private String custAddressId;
	private String phoneNumber;
	private String addressType;
	private String doorNumber;
	private String streetName;
	private String locality;
	private String district;
	private String state;
	private String zipCode;
	private String zone;
	private String city;
	private String shipmentName;
	private String customerGstin;

	private String shipmentContact;
	private String instructions;
	private String latitude;
	private String longitude;
	private String country;
	private String landLine;
	private String shipmentContactCode;
	private String landLineCode;
	private String house_type;
	private String buildingName;
	private String shipmentApartmentName;
	
	
	
	
	
	
	public String getShipmentApartmentName() {
		return shipmentApartmentName;
	}

	public void setShipmentApartmentName(String shipmentApartmentName) {
		this.shipmentApartmentName = shipmentApartmentName;
	}

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	public String getCustomerGstin() {
		return customerGstin;
	}

	public void setCustomerGstin(String customerGstin) {
		this.customerGstin = customerGstin;
	}

	public String getHouse_type() {
		return house_type;
	}

	public void setHouse_type(String house_type) {
		this.house_type = house_type;
	}

	public String getLandLineCode() {
		return landLineCode;
	}

	public void setLandLineCode(String landLineCode) {
		this.landLineCode = landLineCode;
	}

	public String getShipmentContactCode() {
		return shipmentContactCode;
	}

	public void setShipmentContactCode(String shipmentContactCode) {
		this.shipmentContactCode = shipmentContactCode;
	}

	public String getLandLine() {
		return landLine;
	}

	public void setLandLine(String landLine) {
		this.landLine = landLine;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCustAddressId() {
		return custAddressId;
	}

	public void setCustAddressId(String custAddressId) {
		this.custAddressId = custAddressId;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddressType() {
		return addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public String getDoorNumber() {
		return doorNumber;
	}

	public void setDoorNumber(String doorNumber) {
		this.doorNumber = doorNumber;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getShipmentName() {
		return shipmentName;
	}

	public void setShipmentName(String shipmentName) {
		this.shipmentName = shipmentName;
	}

	public String getShipmentContact() {
		return shipmentContact;
	}

	public void setShipmentContact(String shipmentContact) {
		this.shipmentContact = shipmentContact;
	}

	public String getInstructions() {
		return instructions;
	}

	public void setInstructions(String instructions) {
		this.instructions = instructions;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
	public boolean isEmpty(){
		if(this.custAddressId != null && !this.custAddressId.equals(""))
			return false;
		if(this.phoneNumber != null && !this.phoneNumber.equals(""))
			return false;
		/*if(this.addressType != null && !this.addressType.equals(""))
			return false;*/
		if(this.doorNumber != null && !this.doorNumber.equals(""))
			return false;
		if(this.streetName != null && !this.streetName.equals(""))
			return false;
		if(this.locality != null && !this.locality.equals(""))
			return false;
		if(this.district != null && !this.district.equals(""))
			return false;
		if(this.state != null && !this.state.equals(""))
			return false;
		if(this.zipCode != null && !this.zipCode.equals(""))
			return false;
		if(this.zone != null && !this.zone.equals(""))
			return false;
		if(this.city != null && !this.city.equals(""))
			return false;
		if(this.shipmentName != null && !this.shipmentName.equals(""))
			return false;
		if(this.shipmentContact != null && !this.shipmentContact.equals(""))
			return false;
		if(this.instructions != null && !this.instructions.equals(""))
			return false;
		if(this.latitude != null && !this.latitude.equals(""))
			return false;
		if(this.longitude != null && !this.longitude.equals(""))
			return false;
		if(this.country != null && !this.country.equals(""))
			return false;
		if(this.landLine != null && !this.landLine.equals(""))
			return false;
		return true;
	}
	
	public boolean equals(CustomerAddress customerAddress){
		boolean flag = false;
		if(this.shipmentContact != null && !this.shipmentContact.equals("")){
			if((customerAddress.getShipmentContact() != null && !customerAddress.getShipmentContact().equals("")) && (this.shipmentContact.contains(customerAddress.getShipmentContact()) ||  customerAddress.getShipmentContact().contains(this.shipmentContact)))
				flag = true;
			if(!flag &&  (customerAddress.getLandLine() != null && !customerAddress.getLandLine().equals("")) && (this.shipmentContact.contains(customerAddress.getLandLine()) || customerAddress.getLandLine().contains(this.shipmentContact)))
				flag = true;
		}
		else if(this.shipmentContact == null && customerAddress.getShipmentContact() == null && customerAddress.getLandLine() == null)
			flag = true;
		else
			return false;
		if(flag && this.shipmentName != null && customerAddress.getShipmentName() != null && this.shipmentName.equals(customerAddress.getShipmentName()))
			flag = true;
		else if(this.shipmentName == null && customerAddress.getShipmentName() == null)
			flag = true;
		else
			return false;
		if(flag && this.doorNumber != null && customerAddress.getDoorNumber() != null && this.doorNumber.equals(customerAddress.getDoorNumber()))
			flag = true;
		else if(this.doorNumber == null && customerAddress.getDoorNumber() == null)
			flag = true;
		else
			return false;
		if(flag && this.streetName != null && customerAddress.getStreetName() != null && this.streetName.equals(customerAddress.getStreetName()))
			flag = true;
		else if(this.streetName == null && customerAddress.getStreetName() == null)
			flag = true;
		else
			return false;
		if(flag && this.locality != null && customerAddress.getLocality() != null && this.locality.equals(customerAddress.getLocality()))
			flag = true;
		else if(this.locality == null && customerAddress.getLocality() == null)
			flag = true;
		else
			return false;
		if(flag && this.city != null && customerAddress.getCity() != null && this.city.equals(customerAddress.getCity()))
			flag = true;
		else if(this.city == null && customerAddress.getCity() == null)
			flag = true;
		else
			return false;
		if(flag && this.state != null && customerAddress.getState() != null && this.state.equals(customerAddress.getState()))
			flag = true;
		else if(this.state == null && customerAddress.getState() == null)
			flag = true;
		else
			return false;
		if(flag && this.country != null && customerAddress.getCountry() != null && this.country.equals(customerAddress.getCountry()))
			flag = true;
		else if(this.country == null && customerAddress.getCountry() == null)
			flag = true;
		else
			return false;
		if(flag && this.latitude != null && customerAddress.getLatitude() != null && this.latitude.equals(customerAddress.getLatitude()))
			flag = true;
		else if(this.latitude == null && customerAddress.getLatitude() == null)
			flag = true;
		else
			return false;
		if(flag && this.longitude != null && customerAddress.getLongitude() != null && this.longitude.equals(customerAddress.getLongitude()))
			flag = true;
		else if(this.longitude == null && customerAddress.getLongitude() == null)
			flag = true;
		else
			return false;
		return flag;
	}
	public int hashCode(){
			return 1;
	}
}
