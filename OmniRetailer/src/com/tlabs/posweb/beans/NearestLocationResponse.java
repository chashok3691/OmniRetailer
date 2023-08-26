package com.tlabs.posweb.beans;

import java.util.List;

public class NearestLocationResponse {

	private String location;
	private double distance;
	private float gpsLatitude;
	private float gpsLongitude;
	private ResponseHeader responseHeader;
	private Float outletPerifery;
	private boolean isOutletAccess;
	private OutletSettings outletObj;
	private double shipmentRangeInkms;
	private String serviceAreaType;
	private int radius;
	private boolean isRadiusSepcific;
	private boolean isDefaultLocation;
	private CustomerLocations nearestLocation;
	private ZoneMaster nearestHubLocation;
	private boolean isHubLocation;

	
	
	
	
	
	public ZoneMaster getNearestHubLocation() {
		return nearestHubLocation;
	}

	public void setNearestHubLocation(ZoneMaster nearestHubLocation) {
		this.nearestHubLocation = nearestHubLocation;
	}

	public boolean isHubLocation() {
		return isHubLocation;
	}

	public void setHubLocation(boolean isHubLocation) {
		this.isHubLocation = isHubLocation;
	}

	public CustomerLocations getNearestLocation() {
		return nearestLocation;
	}

	public void setNearestLocation(CustomerLocations nearestLocation) {
		this.nearestLocation = nearestLocation;
	}

	public boolean isDefaultLocation() {
		return isDefaultLocation;
	}

	public void setDefaultLocation(boolean isDefaultLocation) {
		this.isDefaultLocation = isDefaultLocation;
	}

	public String getServiceAreaType() {
		return serviceAreaType;
	}

	public void setServiceAreaType(String serviceAreaType) {
		this.serviceAreaType = serviceAreaType;
	}

	public int getRadius() {
		return radius;
	}

	public void setRadius(int radius) {
		this.radius = radius;
	}

	public boolean isRadiusSepcific() {
		return isRadiusSepcific;
	}

	public void setRadiusSepcific(boolean isRadiusSepcific) {
		this.isRadiusSepcific = isRadiusSepcific;
	}

	public List<RetailServiceAreaMap> getPolyLineList() {
		return polyLineList;
	}

	public void setPolyLineList(List<RetailServiceAreaMap> polyLineList) {
		this.polyLineList = polyLineList;
	}

	private List<RetailServiceAreaMap> polyLineList;

	public List<CustomerLocations> getStoresList() {
		return storesList;
	}

	public void setStoresList(List<CustomerLocations> storesList) {
		this.storesList = storesList;
	}

	private List<CustomerLocations> storesList;
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	private RequestHeader requestHeader;
	
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public double getDistance() {
		return distance;
	}
	public void setDistance(double distance) {
		this.distance = distance;
	}
	public float getGpsLatitude() {
		return gpsLatitude;
	}
	public void setGpsLatitude(float gpsLatitude) {
		this.gpsLatitude = gpsLatitude;
	}
	public float getGpsLongitude() {
		return gpsLongitude;
	}
	public void setGpsLongitude(float gpsLongitude) {
		this.gpsLongitude = gpsLongitude;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public Float getOutletPerifery() {
		return outletPerifery;
	}
	public void setOutletPerifery(Float outletPerifery) {
		this.outletPerifery = outletPerifery;
	}
	public boolean isOutletAccess() {
		return isOutletAccess;
	}
	public void setOutletAccess(boolean isOutletAccess) {
		this.isOutletAccess = isOutletAccess;
	}
	public OutletSettings getOutletObj() {
		return outletObj;
	}
	public void setOutletObj(OutletSettings outletObj) {
		this.outletObj = outletObj;
	}
	public double getShipmentRangeInkms() {
		return shipmentRangeInkms;
	}
	public void setShipmentRangeInkms(double shipmentRangeInkms) {
		this.shipmentRangeInkms = shipmentRangeInkms;
	}
	 
	 
}
