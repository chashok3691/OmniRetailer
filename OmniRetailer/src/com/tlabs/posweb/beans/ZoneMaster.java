package com.tlabs.posweb.beans;
import java.io.Serializable;
import java.util.List;

public class ZoneMaster implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1580711633395303867L;
	private String zoneID;
	private String zoneDescription;
	private String dateTime;
	private String addressOne;
	private String addressTwo;
	private String phoneNum;
	private String remarks;
	private String date=null;
	private List<ZoneDetails> zoneDetails;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String startIndex;
	private String maxRecords;
	private int totalRecords;
	private List<ZoneMaster> zoneMasterList;
	private List<String> zones;
	private String searchCriteria;
	private String[] zoneIDS;
	private int slNo;
	private String locationType;
	private String status;
	private String location;
	
    private String gpsLatitude;
    private String gpsLongitude;


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
private List<String> zoneList;
		
	public List<String> getZoneList() {
	return zoneList;
}
public void setZoneList(List<String> zoneList) {
	this.zoneList = zoneList;
}
	//added by vijay	
	private String country;
	private int sno;
	private String loyaltyProgId;
	private String loyaltyZoneDescription;
	private String states;
	private String zone;
	
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getLoyaltyProgId() {
		return loyaltyProgId;
	}
	public void setLoyaltyProgId(String loyaltyProgId) {
		this.loyaltyProgId = loyaltyProgId;
	}
	public String getLoyaltyZoneDescription() {
		return loyaltyZoneDescription;
	}
	public void setLoyaltyZoneDescription(String loyaltyZoneDescription) {
		this.loyaltyZoneDescription = loyaltyZoneDescription;
	}
	public String getStates() {
		return states;
	}
	public void setStates(String states) {
		this.states = states;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public String[] getZoneIDS() {
		return zoneIDS;
	}
	public void setZoneIDS(String[] zoneIDS) {
		this.zoneIDS = zoneIDS;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public List<ZoneMaster> getZoneMasterList() {
		return zoneMasterList;
	}
	public void setZoneMasterList(List<ZoneMaster> zoneMasterList) {
		this.zoneMasterList = zoneMasterList;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public String getZoneID() {
		return zoneID;
	}
	public void setZoneID(String zoneID) {
		this.zoneID = zoneID;
	}
	public String getZoneDescription() {
		return zoneDescription;
	}
	public void setZoneDescription(String zoneDescription) {
		this.zoneDescription = zoneDescription;
	}
	 
	public List<ZoneDetails> getZoneDetails() {
		return zoneDetails;
	}
	public void setZoneDetails(List<ZoneDetails> zoneDetails) {
		this.zoneDetails = zoneDetails;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public String getDate() {
		return date;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public void setDate(String date) {
		this.date = date;
	}
	 
	public String getAddressOne() {
		return addressOne;
	}
	public void setAddressOne(String addressOne) {
		this.addressOne = addressOne;
	}
 
	public String getAddressTwo() {
		return addressTwo;
	}
	public void setAddressTwo(String addressTwo) {
		this.addressTwo = addressTwo;
	}
 
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public List<String> getZones() {
		return zones;
	}
	public void setZones(List<String> zones) {
		this.zones = zones;
	}
	public String getLocationType() {
		return locationType;
	}
	public void setLocationType(String locationType) {
		this.locationType = locationType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
