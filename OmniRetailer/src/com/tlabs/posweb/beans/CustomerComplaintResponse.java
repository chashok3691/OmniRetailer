package com.tlabs.posweb.beans;

import java.util.List;
/**
 * @author chennakesav.a
 * This class is used for preparing response from service*/

public class CustomerComplaintResponse {
	
private String cusComplaintId;
private ResponseHeader responseHeaderObj;
private List<CustomerComplaints> complaintsList;
private String totalRecords;


public String getTotalRecords() {
	return totalRecords;
}

public void setTotalRecords(String totalRecords) {
	this.totalRecords = totalRecords;
}

public String getCusComplaintId() {
	return cusComplaintId;
}

public void setCusComplaintId(String cusComplaintId) {
	this.cusComplaintId = cusComplaintId;
}

public ResponseHeader getResponseHeaderObj() {
	return responseHeaderObj;
}

public void setResponseHeaderObj(ResponseHeader responseHeaderObj) {
	this.responseHeaderObj = responseHeaderObj;
}

public List<CustomerComplaints> getComplaintsList() {
	return complaintsList;
}

public void setComplaintsList(List<CustomerComplaints> complaintsList) {
	this.complaintsList = complaintsList;
}


}
