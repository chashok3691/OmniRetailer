package com.tlabs.posweb.beans;

import java.util.List;

public class FeedbackDetailsResponse {
	private ResponseHeader responseHeader;
	private Feedback feedbackDetails;
	private String feedback_date;
	private String feedback_time;
	private List<Feedback> feedbackList;
	private int totalRecords;
	private String feedback_id;
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public Feedback getFeedbackDetails() {
		return feedbackDetails;
	}
	public void setFeedbackDetails(Feedback feedbackDetails) {
		this.feedbackDetails = feedbackDetails;
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
	public List<Feedback> getFeedbackList() {
		return feedbackList;
	}
	public void setFeedbackList(List<Feedback> feedbackList) {
		this.feedbackList = feedbackList;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public String getFeedback_id() {
		return feedback_id;
	}
	public void setFeedback_id(String feedback_id) {
		this.feedback_id = feedback_id;
	}
	
	
}
