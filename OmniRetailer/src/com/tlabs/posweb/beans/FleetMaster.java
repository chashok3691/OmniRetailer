package com.tlabs.posweb.beans;


import java.util.Date;
import java.util.List;


/* written by : Ashok Kumar Chintapalli 
 * on 04/02/2022  */

/*@Entity
@Table(name="fleet_master")*/
public class FleetMaster {
	
	/*@Id
	@Column(name = "tranporter_id")*/
	private String tranporterId;
	
	/*@Column(name = "transporter_name")*/
	private String transporterName;
	/*
	@Column(name = "bulding_house_no")*/
	private String buldingHouseNo;
	
	/*@Column(name = "road_name")*/
	private String roadName;
	
	/*@Column(name = "location")*/
	private String location;
	
	/*@Column(name = "city")*/
	private String city;
	
	/*@Column(name = "state")*/
	private String state;
	
	/*@Column(name = "gst_id")*/
	private String gstId;
	
	/*@Column(name = "pan_id")*/
	private String panId;
	
	/*@Column(name = "pin_code")*/
	private String pinCode;
	
	/*@Column(name = "phone_no")*/
	private String phoneNo;
	
	/*@Column(name = "mobile_no")*/
	private String mobileNo;
	
	/*@Column(name = "status")*/
	private boolean status;
	
	/*@Column(name = "created_date")*/
	private String createdDate;
	
	/*@Column(name = "updated_date")*/
	private String updatedDate;
	
/*	@Column(name = "user_name")*/
	private String userName;
	
	/*@Column(name = "role_name")*/
	private String roleName;
	private int totalRecords;
	private String startDateStr;
	private String endDateStr;
	
	private String responseMessage;
	private int noofrec;
	
	
	public int getNoofrec() {
		return noofrec;
	}

	public void setNoofrec(int noofrec) {
		this.noofrec = noofrec;
	}

	public String getResponseMessage() {
		return responseMessage;
	}

	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}

	public String getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	/*@Transient
	@Valid*/
	private List<FleetDetails> fleetDetails;
	
	/*@Transient*/
	private RequestHeader requestHeader;
	
	/*@Transient*/
	private String searchCriteria;
	
	/*@Transient*/
	private ResponseHeader responseHeader;
	
/*	@Transient*/
	private String startIndex;
	
	/*@Transient*/
	private String maxRecords;
	public String getTranporterId() {
		return tranporterId;
	}

	public String getTransporterName() {
		return transporterName;
	}

	public String getBuldingHouseNo() {
		return buldingHouseNo;
	}

	public String getRoadName() {
		return roadName;
	}

	public String getLocation() {
		return location;
	}

	public String getCity() {
		return city;
	}

	public String getState() {
		return state;
	}

	public String getGstId() {
		return gstId;
	}

	public String getPanId() {
		return panId;
	}

	public String getPinCode() {
		return pinCode;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public boolean isStatus() {
		return status;
	}


	public String getUserName() {
		return userName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setTranporterId(String tranporterId) {
		this.tranporterId = tranporterId;
	}

	public void setTransporterName(String transporterName) {
		this.transporterName = transporterName;
	}

	public void setBuldingHouseNo(String buldingHouseNo) {
		this.buldingHouseNo = buldingHouseNo;
	}

	public void setRoadName(String roadName) {
		this.roadName = roadName;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setGstId(String gstId) {
		this.gstId = gstId;
	}

	public void setPanId(String panId) {
		this.panId = panId;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	

	

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	

	public List<FleetDetails> getFleetDetails() {
		return fleetDetails;
	}

	public void setFleetDetails(List<FleetDetails> fleetDetails) {
		this.fleetDetails = fleetDetails;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

}