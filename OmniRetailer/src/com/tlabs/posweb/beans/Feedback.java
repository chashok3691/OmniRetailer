package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

public class Feedback {
	private String feedback_id;
	private int slNo;
	private Date feedbackDate;
	private Date feedbackTime;
	private String customer_mobileNo;
	private String customer_emailId;
	private String order_ref;
	private String customerName;
	private int customer_rating;
	private int outlet_rating;
	private int onlineExp_rating;
	private int mobileShopping_rating;
	private int staffBehaviour_rating;
	private String customerComments;
	private String feedbackChannel;
	private String feedbackCategory;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String startDate;
	private String endDate;
	private String searchCriteria;
	private String startIndex;
	private String maxRecords;
	private String totalRecords;
	private Set<Feedback> feedbackList;
	private String feedback_date;	
	private String feedback_time;
	private String status;
	private String storeLocation;
	private String lastName;
	private String country;
    private String houseNo;
    private String street;
    private String locality;
    private String area;
    private String city;
    
    private float summaryRating;
    
    private String zoneId;

    
    
    
	public String getZoneId() {
		return zoneId;
	}

	public void setZoneId(String zoneId) {
		this.zoneId = zoneId;
	}

	public float getSummaryRating() {
		return summaryRating;
	}

	public void setSummaryRating(float summaryRating) {
		this.summaryRating = summaryRating;
	}

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
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

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public String getFeedback_id() {
		return feedback_id;
	}
	
	public void setFeedback_id(String feedback_id) {
		this.feedback_id = feedback_id;
	}
	
	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public Date getFeedbackDate() {
		return feedbackDate;
	}
	public void setFeedbackDate(Date feedbackDate) {
		this.feedbackDate = feedbackDate;
	}
	public Date getFeedbackTime() {
		return feedbackTime;
	}
	public void setFeedbackTime(Date feedbackTime) {
		this.feedbackTime = feedbackTime;
	}
	public String getCustomer_mobileNo() {
		return customer_mobileNo;
	}
	public void setCustomer_mobileNo(String customer_mobileNo) {
		this.customer_mobileNo = customer_mobileNo;
	}
	public String getCustomer_emailId() {
		return customer_emailId;
	}
	public void setCustomer_emailId(String customer_emailId) {
		this.customer_emailId = customer_emailId;
	}
	public String getOrder_ref() {
		return order_ref;
	}
	public void setOrder_ref(String order_ref) {
		this.order_ref = order_ref;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public int getCustomer_rating() {
		return customer_rating;
	}
	public void setCustomer_rating(int customer_rating) {
		this.customer_rating = customer_rating;
	}
	public int getOutlet_rating() {
		return outlet_rating;
	}
	public void setOutlet_rating(int outlet_rating) {
		this.outlet_rating = outlet_rating;
	}
	public int getOnlineExp_rating() {
		return onlineExp_rating;
	}
	public void setOnlineExp_rating(int onlineExp_rating) {
		this.onlineExp_rating = onlineExp_rating;
	}
	public int getMobileShopping_rating() {
		return mobileShopping_rating;
	}
	public void setMobileShopping_rating(int mobileShopping_rating) {
		this.mobileShopping_rating = mobileShopping_rating;
	}
	public int getStaffBehaviour_rating() {
		return staffBehaviour_rating;
	}
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public void setStaffBehaviour_rating(int staffBehaviour_rating) {
		this.staffBehaviour_rating = staffBehaviour_rating;
	}
	public String getCustomerComments() {
		return customerComments;
	}
	public void setCustomerComments(String customerComments) {
		this.customerComments = customerComments;
	}
	public String getFeedbackChannel() {
		return feedbackChannel;
	}
	public void setFeedbackChannel(String feedbackChannel) {
		this.feedbackChannel = feedbackChannel;
	}
	public String getFeedbackCategory() {
		return feedbackCategory;
	}
	public void setFeedbackCategory(String feedbackCategory) {
		this.feedbackCategory = feedbackCategory;
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
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
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
	public Set<Feedback> getFeedbackList() {
		return feedbackList;
	}
	public void setFeedbackList(Set<Feedback> feedbackList) {
		this.feedbackList = feedbackList;
	}
	public String getFeedback_date() {
		return feedback_date;
	}
	public void setFeedback_date(String feedback_date) {
		this.feedback_date = feedback_date;
	}
	public String getFeedback_time() {
		return feedback_time;
	}
	public void setFeedback_time(String feedback_time) {
		this.feedback_time = feedback_time;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	

}
