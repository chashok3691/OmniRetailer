package com.tlabs.posweb.beans;

import java.util.ArrayList;

public class OrganizationLocations {
	
	private int sNo;
	private RequestHeader requestHeader;
	private String startIndex;
	private String locationId;
	private String maxRecords;
	
	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	ArrayList<OrganizationLocations> organizationLocations;
	public ArrayList<OrganizationLocations> getOrganizationLocations() {
		return organizationLocations;
	}

	public void setOrganizationLocations(ArrayList<OrganizationLocations> organizationLocations) {
		this.organizationLocations = organizationLocations;
	}

	private String organizationId;

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getLocationId() {
		return locationId;
	}

	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}

	public String getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(String organizationId) {
		this.organizationId = organizationId;
	}
	
	
}
