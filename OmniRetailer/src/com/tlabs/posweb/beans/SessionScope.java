package com.tlabs.posweb.beans;

import java.io.Serializable;
import java.util.List;

public class SessionScope implements Serializable{
	
	
	private static final long serialVersionUID = -1224936798398389488L;
	private String userName;
	private String customerId;
	private String applicationName;
	private String role;
	private String ipAddress;
	private String loginId;
	private String location;
	private List<String> roleLocationsList;
	private boolean warehouseLicense;
	private boolean restaruntLicense;
	
	private String windowName;
	
	
	public boolean isRestaruntLicense() {
		return restaruntLicense;
	}
	public void setRestaruntLicense(boolean restaruntLicense) {
		this.restaruntLicense = restaruntLicense;
	}
	public String getWindowName() {
		return windowName;
	}
	public void setWindowName(String windowName) {
		this.windowName = windowName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getApplicationName() {
		return applicationName;
	}
	public void setApplicationName(String applicationName) {
		this.applicationName = applicationName;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public boolean isWarehouseLicense() {
		return warehouseLicense;
	}
	public void setWarehouseLicense(boolean warehouseLicense) {
		this.warehouseLicense = warehouseLicense;
	}
	public List<String> getRoleLocationsList() {
		return roleLocationsList;
	}
	public void setRoleLocationsList(List<String> roleLocationsList) {
		this.roleLocationsList = roleLocationsList;
	}
}
