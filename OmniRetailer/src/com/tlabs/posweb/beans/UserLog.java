package com.tlabs.posweb.beans;
//import java.util.Date;
import java.util.List;

/*import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Length;

import com.tlabs.omniretailerservices.beans.RequestHeader;
import com.tlabs.omniretailerservices.beans.ResponseHeader;*/

/*@Entity
@Table(name = "user_log")*/
public class UserLog {
	
/*	@Id
	@GenericGenerator(name = "increment", strategy = "org.hibernate.id.IncrementGenerator")
	@GeneratedValue(generator = "increment")
	@Column(name = "s_no")*/
	private int s_no;
	
//	@Column(name = "transaction_time", nullable = false)
//	private String  transaction_time;
	
//	@Column (name = "logout_transaction_time")
//	private Date logout_transaction_time;
	
//	@Column (name = "user_id", nullable = false)
//	@Length(min=6,max = 10, message = "USER_ID_LENGTH_10")
	private String user_id;
	
//	C@Column (name = "email_id")
	private String email_id;
	
//	@Column (name = "role_name", nullable = false)
//	@Length(min=1,max = 250, message = "ROLE_ID_LENGTH_250")
	private String role_name;
	
//	@Column (name = "ip_address")
	private String ip_address;
	
//	@Column (name = "device_id")
	private String device_id;
	
//	@Column (name = "version_id")
	private String version_id;
	
//	@Column (name = "app_name")
	private String app_name;
	
//	@Column(name="store_location")
	private String store_location;
	
//	@Column(name="activity")
	private String activity;
	
//	@Column(name="request_channel")
	private String request_channel;
	
//	@Column(name="counter_id")
	private String counter_id;
	
//	@Column(name="version_activated_on")
	private String version_activated_on_str;
	
//	@Column(name="shift_id")
	private int shift_id;
	
	
	
	public String getCounter_id() {
		return counter_id;
	}

	public void setCounter_id(String counter_id) {
		this.counter_id = counter_id;
	}

	

	public String getVersion_activated_on_str() {
		return version_activated_on_str;
	}

	public void setVersion_activated_on_str(String version_activated_on_str) {
		this.version_activated_on_str = version_activated_on_str;
	}

	public int getShift_id() {
		return shift_id;
	}

	public void setShift_id(int shift_id) {
		this.shift_id = shift_id;
	}

	/*public Date getTransaction_time() {
		return transaction_time;
	}

	public void setTransaction_time(Date transaction_time) {
		this.transaction_time = transaction_time;
	}*/

	public String getActivity() {
		return activity;
	}

	public void setActivity(String activity) {
		this.activity = activity;
	} 

	public String getRequest_channel() {
		return request_channel;
	}

	public void setRequest_channel(String request_channel) {
		this.request_channel = request_channel;
	}
	
	
	

	//	@Column(name="login_status")
//	@Transient
	private boolean login_status;
	
//	@Transient
	private String startDate;
//	@Transient
	private String endDate;
//	@Transient
	private String startIndex;
//	@Transient
	private String maxRecords;
//	@Transient
	private String login_transaction_time_str;
//	@Transient
	private String searchCriteria;
//	@Transient
	private  ResponseHeader responseHeader;
//	@Transient
	private RequestHeader requestHeader;
//	@Transient
	private int totalRecords;
//	@Transient
	private List<UserLog> userLogDetails;
//	@Transient
	private String zone;

	
	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<UserLog> getUserLogDetails() {
		return userLogDetails;
	}

	public void setUserLogDetails(List<UserLog> userLogDetails) {
		this.userLogDetails = userLogDetails;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getEmail_id() {
		return email_id;
	}

	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getIp_address() {
		return ip_address;
	}

	public void setIp_address(String ip_address) {
		this.ip_address = ip_address;
	}

	public String getDevice_id() {
		return device_id;
	}

	public void setDevice_id(String device_id) {
		this.device_id = device_id;
	}

	public String getVersion_id() {
		return version_id;
	}

	public void setVersion_id(String version_id) {
		this.version_id = version_id;
	}

	public String getApp_name() {
		return app_name;
	}

	public void setApp_name(String app_name) {
		this.app_name = app_name;
	}

	public String getStore_location() {
		return store_location;
	}

	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}

	public boolean isLogin_status() {
		return login_status;
	}

	public void setLogin_status(boolean login_status) {
		this.login_status = login_status;
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

	public String getLogin_transaction_time_str() {
		return login_transaction_time_str;
	}

	public void setLogin_transaction_time_str(String login_transaction_time_str) {
		this.login_transaction_time_str = login_transaction_time_str;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	
	
	
	
}
