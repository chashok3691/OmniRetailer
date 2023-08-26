package com.tlabs.posweb.beans;

/**
 * 
 * @author K. Ramalingaiah on 07-02-2022
 *
 * This is a model class used to communicate with database via hibernate.
 *
 */

public class SupplierAddresses {
	
	
	private String sNo;
	private String supplierCode;
	private String plotNo;
	private String streetName;
	private String location;
	private String city;
	private String pincode;
	private String stateCode;
	private String countryCode;
	private String phone;
	private String addressType;
	private String emailId;
	private RequestHeader requestHeader;
	
	
	
	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getsNo() {
		return sNo;
	}

	public void setsNo(String sNo) {
		this.sNo = sNo;
	}


	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPlotNo() {
		return plotNo;
	}

	public void setPlotNo(String plotNo) {
		this.plotNo = plotNo;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}


	public String getSupplierCode() {
		return supplierCode;
	}


	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}
	
	public String getAddressType() {
		return addressType;
	}


	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getStateCode() {
		return stateCode;
	}


	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public RequestHeader getRequestHeader() {
		return requestHeader;
	}


	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}



	
	
}