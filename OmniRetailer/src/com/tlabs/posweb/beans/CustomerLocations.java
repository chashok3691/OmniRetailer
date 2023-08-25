
/*******************************************************************************
 * Copyright  2015 Omni Retailer Services, All rights reserved.
 * Author : Mythri.Sabath
 * Created On : 24-2-2015
 * 
 * Licensed under the Technolabs Software License, Version 1.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.technolabssoftware.com/pages/privacy-policy/
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/

package com.tlabs.posweb.beans;

import java.util.List;


/**
 * 
 * @author Mythri.S
 * @modified_By  : Satya Narayan Shukla
 * @modified_On  : 17-08-2018
 * This is a model class used to communicate with database via hibernate.
 *
 */


public class CustomerLocations {

	
	private String locationId;
	

	private String address;
	

	private String area;
	

	private String city;


	private String pin;


	private String country;
	

	private String officePhone;
	

	private String officeMailId;


	private String businessActivity;


	private String state = null;


	private String description;


	private String gpsLatitude;
	
	
	private String gpsLongitude;
	

	private String storeName;
	
	
	private boolean geoCordinatesRequest;


	private String startIndex;
	
	@SuppressWarnings("rawtypes")

	private List locationList;
	

	private RequestHeader requestHeader;
	

	private String searchCriteria;
	
	
	private String maxRecords;

	
	private boolean allLocations;

	private boolean status;

	
	private String location_city;
	

	private String gstnNo;
	
	

	public String getGstnNo() {
		return gstnNo;
	}

	public void setGstnNo(String gstnNo) {
		this.gstnNo = gstnNo;
	}

	
	private String warehouseId;

	public String getWarehouseId() {
		return warehouseId;
	}

	public void setWarehouseId(String warehouseId) {
		this.warehouseId = warehouseId;
	}

	public String getLocation_city() {
		return location_city;
	}

	public void setLocation_city(String location_city) {
		this.location_city = location_city;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean isAllLocations() {
		return allLocations;
	}

	public void setAllLocations(boolean allLocations) {
		this.allLocations = allLocations;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	@SuppressWarnings("rawtypes")
	public List getLocationList() {
		return locationList;
	}

	@SuppressWarnings("rawtypes")
	public void setLocationList(List locationList) {
		this.locationList = locationList;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public CustomerLocations() {
	}

	public String getBusinessActivity() {
		return businessActivity;
	}

	public void setBusinessActivity(String businessActivity) {
		this.businessActivity = businessActivity;
	}

	public String getLocationId() {
		return locationId;
	}

	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}

	public String getAddress() {
		return address;
	}

	public String getGpsLatitude() {
		return gpsLatitude;
	}

	public void setGpsLatitude(String gpsLatitude) {
		this.gpsLatitude = gpsLatitude;
	}

	public String getGpsLongitude() {
		return gpsLongitude;
	}

	public void setGpsLongitude(String gpsLongitude) {
		this.gpsLongitude = gpsLongitude;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public boolean isGeoCordinatesRequest() {
		return geoCordinatesRequest;
	}

	public void setGeoCordinatesRequest(boolean geoCordinatesRequest) {
		this.geoCordinatesRequest = geoCordinatesRequest;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getOfficePhone() {
		return officePhone;
	}

	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}

	public String getOfficeMailId() {
		return officeMailId;
	}

	public void setOfficeMailId(String officeMailId) {
		this.officeMailId = officeMailId;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
