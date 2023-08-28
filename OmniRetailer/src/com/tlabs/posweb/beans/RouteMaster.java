package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;
import java.util.Set;
/*
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.tlabs.omniretailerservices.beans.RequestHeader;

@Entity
@Table(name="route_master")*/
public class RouteMaster {
public List<RouteMaster> getRouteMasterList() {
		return routeMasterList;
	}

	public void setRouteMasterList(List<RouteMaster> routeMasterList) {
		this.routeMasterList = routeMasterList;
	}


	private String routeId;
	

	private String routeName;
	

	private boolean routeStatus;
	private String routeStatusStr;

 
	private Date createdDate;


	

	private float latitude;

	private float longitude;
	
	
	
public String getRouteStatusStr() {
		return routeStatusStr;
	}

	public void setRouteStatusStr(String routeStatusStr) {
		this.routeStatusStr = routeStatusStr;
	}

public float getLatitude() {
		return latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public float getLongitude() {
		return longitude;
	}

	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}


	private Date updatedDate;
	

	private String userName;
	

	private String roleName;
	

	private String routeDescription;
	

	private String routeCategory;
	

	private String city;

	private Boolean day1;
	private Boolean day2;
	private Boolean day3;
	private Boolean day4;
	private Boolean day5;
	private Boolean day6;
	private Boolean day7;


	public Boolean getDay1() {
		return day1;
	}

	public void setDay1(Boolean day1) {
		this.day1 = day1;
	}

	public Boolean getDay2() {
		return day2;
	}

	public void setDay2(Boolean day2) {
		this.day2 = day2;
	}

	public Boolean getDay3() {
		return day3;
	}

	public void setDay3(Boolean day3) {
		this.day3 = day3;
	}

	public Boolean getDay4() {
		return day4;
	}

	public void setDay4(Boolean day4) {
		this.day4 = day4;
	}

	public Boolean getDay5() {
		return day5;
	}

	public void setDay5(Boolean day5) {
		this.day5 = day5;
	}

	public Boolean getDay6() {
		return day6;
	}

	public void setDay6(Boolean day6) {
		this.day6 = day6;
	}

	public Boolean getDay7() {
		return day7;
	}

	public void setDay7(Boolean day7) {
		this.day7 = day7;
	}


	private String pickupPoint;
	
	private String totalRecords;
	
public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

    private List<RouteMap> routeList;
		
   

	private String endPoint;

	private String zone;

	private Date startDate;

	private Date endDate;
	

	private List<RouteMaster> routeMasterList;
	

	private Integer startIndex;
	

	private Integer maxRecords;
	

	private String searchCriteria;
	

	private String createdDateStr;
	

	private String updatedDateStr;
	

	private RequestHeader requestHeader;
	

	private String startDateStr;

	private String endDateStr;
	

	private List<String> routeIds;


	
	public String getRouteId() {
		return routeId;
	}

	public void setRouteId(String routeId) {
		this.routeId = routeId;
	}

	public String getRouteName() {
		return routeName;
	}

	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}

	public boolean isRouteStatus() {
		return routeStatus;
	}

	public void setRouteStatus(boolean routeStatus) {
		this.routeStatus = routeStatus;
	}

	public Date getCreatedDate() {
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

	public String getRouteDescription() {
		return routeDescription;
	}

	public void setRouteDescription(String routeDescription) {
		this.routeDescription = routeDescription;
	}

	public String getRouteCategory() {
		return routeCategory;
	}

	public void setRouteCategory(String routeCategory) {
		this.routeCategory = routeCategory;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPickupPoint() {
		return pickupPoint;
	}

	public void setPickupPoint(String pickupPoint) {
		this.pickupPoint = pickupPoint;
	}
 


	public List<RouteMap> getRouteList() {
		return routeList;
	}

	public void setRouteList(List<RouteMap> routeList) {
		this.routeList = routeList;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
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

/*	public Calendar getDate() {
		return date;
	}

	public void setDate(Calendar date) {
		this.date = date;
	}
*/
	public List<String> getRouteIds() {
		return routeIds;
	}

	public void setRouteIds(List<String> routeIds) {
		this.routeIds = routeIds;
	}

	

	public String getEndPoint() {
		return endPoint;
	}

	public void setEndPoint(String endPoint) {
		this.endPoint = endPoint;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
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

	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public Integer getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}

	public Integer getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(Integer maxRecords) {
		this.maxRecords = maxRecords;
	}


}
