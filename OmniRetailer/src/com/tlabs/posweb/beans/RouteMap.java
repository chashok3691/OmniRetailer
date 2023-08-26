package com.tlabs.posweb.beans;

import java.util.Date;
/*
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name="route_map")*/
public class RouteMap {
	/*@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="s_no")*/
	private Integer sno;
	
//	@Column(name="route_id")
	private String routeIdRef;
	
//	@Column(name="location")
	private String location;
	
//	@Column(name="day")
	private String day;
	
//	@Column(name="city")
	private String city;
	
//	@Column(name="description")
	private String description;
	
/*	@Column(name="date")
	@Temporal(TemporalType.DATE)*/
	private String date;

	/*@Column(name="time")
	@Temporal(TemporalType.TIME)*/
	private String time;

	
//	@Transient
	private String startTimeStr;
	
//	@Transient
	private String endTimeStr;

	private Integer maximum_allowed_orders;
	
	
	public Integer getMaximum_allowed_orders() {
		return maximum_allowed_orders;
	}

	public void setMaximum_allowed_orders(Integer maximum_allowed_orders) {
		this.maximum_allowed_orders = maximum_allowed_orders;
	}

	public String getStartTimeStr() {
		return startTimeStr;
	}

	public void setStartTimeStr(String startTimeStr) {
		this.startTimeStr = startTimeStr;
	}

	public String getEndTimeStr() {
		return endTimeStr;
	}

	public void setEndTimeStr(String endTimeStr) {
		this.endTimeStr = endTimeStr;
	}

	/*@Column(name="start_time")
	private Date startTime;
	
	@Column(name="end_time")
	private Date endTime;
	*/
//	@Column(name="latitude")
	private String gpsLatitude;
	
//	@Column(name="longitude")
	private String gpsLongitude;
	
//	@Column(name="start_date")
	private Date startDate;
	
//	@Column(name="end_date")
	private Date endDate;
	
//	@Transient
	private String dateStr;
	
//	@Transient
	private String timeStr;
	
//	@Transient
	private String startDateStr;
	
//	@Transient
	private String endDateStr;
	
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


	
	public Integer getSno() {
		return sno;
	}

	public void setSno(Integer sno) {
		this.sno = sno;
	}

	public String getRouteIdRef() {
		return routeIdRef;
	}

	public void setRouteIdRef(String routeIdRef) {
		this.routeIdRef = routeIdRef;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDate() {
	
		return date;
	}

	public void setDate(String date) {
		this.date = date;
 	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}

	public String getTimeStr() {
		return timeStr;
	}

	public void setTimeStr(String timeStr) {
		this.timeStr = timeStr;
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
}
