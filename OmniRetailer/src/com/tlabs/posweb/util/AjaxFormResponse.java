/**
 * Creation date: 28/3/2016 
 * Created by: S Nikhil
 * Last updated on: 
 * Updated by: 
 * Verified by: 
 * Purpose: this is a bean class that we use to send response to a AJAX form submission like contactUs, feedback, complaints
 */

package com.tlabs.posweb.util;

public class AjaxFormResponse {
	
	private boolean status=false;
	private String message;
	private String response;
	private String cost;
	private String condition;
	private String saleLocation;
	
	private String code;
//private int statusCheck;
	
public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

public String getMessage() {
	return message;
}

public void setMessage(String message) {
	this.message = message;
}

public String getResponse() {
	return response;
}

public void setResponse(String response) {
	this.response = response;
}

public String getCost() {
	return cost;
}

public void setCost(String cost) {
	this.cost = cost;
}

public String getCondition() {
	return condition;
}

public void setCondition(String condition) {
	this.condition = condition;
}

public String getSaleLocation() {
	return saleLocation;
}

public void setSaleLocation(String saleLocation) {
	this.saleLocation = saleLocation;
}


}
