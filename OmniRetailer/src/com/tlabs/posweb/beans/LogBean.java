package com.tlabs.posweb.beans;

public class LogBean {
	private int SNo;
	private String userName;
	private String role;
	private String loginId;
	private String location;
	private String appName;
	private String txnDate;
	private String txnTime;
	private String module;
	private String txnName;
	private String txnStatus;
	private String deviceId;
	private String ipAddress;
	private String comments;
	private String requestChannel;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private int slNo;
	private String totalRecords;
	private boolean isSaveLog;
	private String logFileurl;
	private String id;
	
	
	
	
	public boolean isSaveLog() {
		return isSaveLog;
	}


	public void setSaveLog(boolean isSaveLog) {
		this.isSaveLog = isSaveLog;
	}


	public String getLogFileurl() {
		return logFileurl;
	}


	public void setLogFileurl(String logFileurl) {
		this.logFileurl = logFileurl;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getSlNo() {
		return slNo;
	}
	
	
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public int getSNo() {
		return SNo;
	}
	public void setSNo(int SNo) {
		this.SNo = SNo;
	}
	public String getRequestChannel() {
		return requestChannel;
	}
	public void setRequestChannel(String requestChannel) {
		this.requestChannel = requestChannel;
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
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getAppName() {
		return appName;
	}
	public void setAppName(String appName) {
		this.appName = appName;
	}
	public String getTxnDate() {
		return txnDate;
	}
	public void setTxnDate(String txnDate) {
		this.txnDate = txnDate;
	}
	public String getTxnTime() {
		return txnTime;
	}
	public void setTxnTime(String txnTime) {
		this.txnTime = txnTime;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getTxnName() {
		return txnName;
	}
	public void setTxnName(String txnName) {
		this.txnName = txnName;
	}
	public String getTxnStatus() {
		return txnStatus;
	}
	public void setTxnStatus(String txnStatus) {
		this.txnStatus = txnStatus;
	}
	public String getDeviceId() {
		return deviceId;
	}
	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	
}
