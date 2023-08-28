package com.tlabs.posweb.beans;

//import java.util.Date;

import java.util.List;


//@Entity
//@Table(name = "outlet_day_open_master")
public class OutletDayOpen {
	
	//@EmbeddedId
	private OutletDayOpenCompositBean dayopens;
	
	//@Column(name = "user_name")
	private String userName;
	
	//@Column(name = "role_name")
	private String roleName;
	
	//@Column(name = "created_date")
	//private Date createdDate;

	//@Column(name = "updated_date")
	//private Date updatedDate;
	
	//@Transient
	private String outletLocation;
	
	//@Transient
	private String businessCounter;
	
	/*@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumns({
	@JoinColumn(name = "business_counter"),
	@JoinColumn(name = "outlet_id")
	
	})*/
	private List<OutletDayOpenChild> dayOpenChilds;
	
	public List<OutletDayOpenChild> getDayOpenChilds() {
		return dayOpenChilds;
	}

	public void setDayOpenChilds(List<OutletDayOpenChild> dayOpenChilds) {
		this.dayOpenChilds = dayOpenChilds;
	}

	public String getOutletLocation() {
		return outletLocation;
	}

	public void setOutletLocation(String outletLocation) {
		this.outletLocation = outletLocation;
	}

	public String getBusinessCounter() {
		return businessCounter;
	}

	public void setBusinessCounter(String businessCounter) {
		this.businessCounter = businessCounter;
	}

	public OutletDayOpenCompositBean getDayopens() {
		return dayopens;
	}

	public void setDayopens(OutletDayOpenCompositBean dayopens) {
		this.dayopens = dayopens;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	/*public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
*/
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	/*public Date getMonStartTime() {
		return monStartTime;
	}

	public void setMonStartTime(Date monStartTime) {
		this.monStartTime = monStartTime;
	}

	public Date getMonEndTime() {
		return monEndTime;
	}

	public void setMonEndTime(Date monEndTime) {
		this.monEndTime = monEndTime;
	}

	public Date getTueStartTime() {
		return tueStartTime;
	}

	public void setTueStartTime(Date tueStartTime) {
		this.tueStartTime = tueStartTime;
	}

	public Date getTueEndTime() {
		return tueEndTime;
	}

	public void setTueEndTime(Date tueEndTime) {
		this.tueEndTime = tueEndTime;
	}

	public Date getWedStartTime() {
		return wedStartTime;
	}

	public void setWedStartTime(Date wedStartTime) {
		this.wedStartTime = wedStartTime;
	}

	public Date getWedEndTime() {
		return wedEndTime;
	}

	public void setWedEndTime(Date wedEndTime) {
		this.wedEndTime = wedEndTime;
	}

	public Date getThuStartTime() {
		return thuStartTime;
	}

	public void setThuStartTime(Date thuStartTime) {
		this.thuStartTime = thuStartTime;
	}

	public Date getThuEndTime() {
		return thuEndTime;
	}

	public void setThuEndTime(Date thuEndTime) {
		this.thuEndTime = thuEndTime;
	}

	public Date getFriStartTime() {
		return friStartTime;
	}

	public void setFriStartTime(Date friStartTime) {
		this.friStartTime = friStartTime;
	}

	public Date getFriEndTime() {
		return friEndTime;
	}

	public void setFriEndTime(Date friEndTime) {
		this.friEndTime = friEndTime;
	}

	public Date getSatStartTime() {
		return satStartTime;
	}

	public void setSatStartTime(Date satStartTime) {
		this.satStartTime = satStartTime;
	}

	public Date getSatEndTime() {
		return satEndTime;
	}

	public void setSatEndTime(Date satEndTime) {
		this.satEndTime = satEndTime;
	}

	public Date getSunStartTime() {
		return sunStartTime;
	}

	public void setSunStartTime(Date sunStartTime) {
		this.sunStartTime = sunStartTime;
	}

	public Date getSunEndTime() {
		return sunEndTime;
	}

	public void setSunEndTime(Date sunEndTime) {
		this.sunEndTime = sunEndTime;
	}
*/
	private List<String> counterIds;
	
	public List<String> getCounterIds() {
		return counterIds;
	}

	public void setCounterIds(List<String> counterIds) {
		this.counterIds = counterIds;
	}

	public String getSunEndTimeStr() {
		return sunEndTimeStr;
	}

	public void setSunEndTimeStr(String sunEndTimeStr) {
		this.sunEndTimeStr = sunEndTimeStr;
	}

	public String getSunStartTimeStr() {
		return sunStartTimeStr;
	}

	public void setSunStartTimeStr(String sunStartTimeStr) {
		this.sunStartTimeStr = sunStartTimeStr;
	}

	public String getSatEndTimeStr() {
		return satEndTimeStr;
	}

	public void setSatEndTimeStr(String satEndTimeStr) {
		this.satEndTimeStr = satEndTimeStr;
	}

	public String getSatStartTimeStr() {
		return satStartTimeStr;
	}

	public void setSatStartTimeStr(String satStartTimeStr) {
		this.satStartTimeStr = satStartTimeStr;
	}

	public String getFriEndTimeStr() {
		return friEndTimeStr;
	}

	public void setFriEndTimeStr(String friEndTimeStr) {
		this.friEndTimeStr = friEndTimeStr;
	}

	public String getFriStartTimeStr() {
		return friStartTimeStr;
	}

	public void setFriStartTimeStr(String friStartTimeStr) {
		this.friStartTimeStr = friStartTimeStr;
	}

	public String getThuEndTimeStr() {
		return thuEndTimeStr;
	}

	public void setThuEndTimeStr(String thuEndTimeStr) {
		this.thuEndTimeStr = thuEndTimeStr;
	}

	public String getThuStartTimeStr() {
		return thuStartTimeStr;
	}

	public void setThuStartTimeStr(String thuStartTimeStr) {
		this.thuStartTimeStr = thuStartTimeStr;
	}

	public String getWedEndTimeStr() {
		return wedEndTimeStr;
	}

	public void setWedEndTimeStr(String wedEndTimeStr) {
		this.wedEndTimeStr = wedEndTimeStr;
	}

	public String getWedStartTimeStr() {
		return wedStartTimeStr;
	}

	public void setWedStartTimeStr(String wedStartTimeStr) {
		this.wedStartTimeStr = wedStartTimeStr;
	}

	public String getTueEndTimeStr() {
		return tueEndTimeStr;
	}

	public void setTueEndTimeStr(String tueEndTimeStr) {
		this.tueEndTimeStr = tueEndTimeStr;
	}

	public String getTueStartTimeStr() {
		return tueStartTimeStr;
	}

	public void setTueStartTimeStr(String tueStartTimeStr) {
		this.tueStartTimeStr = tueStartTimeStr;
	}

	public String getMonEndTimeStr() {
		return monEndTimeStr;
	}

	public void setMonEndTimeStr(String monEndTimeStr) {
		this.monEndTimeStr = monEndTimeStr;
	}

	public String getMonStartTimeStr() {
		return monStartTimeStr;
	}

	public void setMonStartTimeStr(String monStartTimeStr) {
		this.monStartTimeStr = monStartTimeStr;
	}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public String getUpdatedDateStr() {
		return updatedDateStr;
	}

	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}

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

	public String getMaxRecords() {
		return maxRecords;
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

	//@Column(name = "status")
	private String status;
	
	//@Column(name = "mon_start_time")
	//private Date monStartTime;
	
	//@Column(name = "mon_end_time")
	//private Date monEndTime;
	
	//@Column(name = "tue_start_time")
	//private Date tueStartTime;
	
	//@Column(name = "tue_end_time")
	//private Date tueEndTime;
	
	//@Column(name = "wed_start_time")
//	private Date wedStartTime;
	
	//@Column(name = "wed_end_time")
	//private Date wedEndTime;
	
	//@Column(name = "thu_start_time")
	//private Date thuStartTime;
	
	//@Column(name = "thu_end_time")
	//private Date thuEndTime;
	
	//@Column(name = "fri_start_time")
	//private Date friStartTime;
	
	//@Column(name = "fri_end_time")
	//private Date friEndTime;
	
	//@Column(name = "sat_start_time")
	//private Date satStartTime;
	
	//@Column(name = "sat_end_time")
	//private Date satEndTime;
	
	//@Column(name = "sun_start_time")
	//private Date sunStartTime;
	
	//@Column(name = "sun_end_time")
	//private Date sunEndTime;
	
	//@Transient
	private String sunEndTimeStr;
	
	//@Transient
	private String sunStartTimeStr;
	
	//@Transient
	private String satEndTimeStr;
	
	//@Transient
	private String satStartTimeStr;
	
	//@Transient
	private String friEndTimeStr;
	
	//@Transient
	private String friStartTimeStr;
	
	//@Transient
	private String thuEndTimeStr;
	
	//@Transient
	private String thuStartTimeStr;
	
	//@Transient
	private String wedEndTimeStr;
	
	//@Transient
	private String wedStartTimeStr;
	
	//@Transient
	private String tueEndTimeStr;
	
	//@Transient
	private String tueStartTimeStr;
	
	//@Transient
	private String monEndTimeStr;
	
	//@Transient
	private String monStartTimeStr;
	
	//@Transient
	private String createdDateStr;

	//@Transient
	private String updatedDateStr;
	
	//@Transient
	private RequestHeader requestHeader;

	//@Transient
	private String startIndex;

	//@Transient
	private String maxRecords;

	//@Transient
	private String searchCriteria;

	//@Transient
	private String startDateStr;

	//@Transient
	private String endDateStr;

}
