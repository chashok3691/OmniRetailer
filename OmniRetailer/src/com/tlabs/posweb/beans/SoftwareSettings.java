package com.tlabs.posweb.beans;

import java.util.List;

public class SoftwareSettings {

	
	private String url;
	private String contentType;
	private String userName;
	private String password;
	private String authorization;
	private String authorizationType;
	
	private String  logisticsProvider;
	
	private List<IntegrationSettings> placesApiAccess;
	private List<IntegrationSettings> assetApiAccess;
	private IntegrationSettings fireBaseSettings;
	
	
	
	public IntegrationSettings getFireBaseSettings() {
		return fireBaseSettings;
	}
	public void setFireBaseSettings(IntegrationSettings fireBaseSettings) {
		this.fireBaseSettings = fireBaseSettings;
	}
	public List<IntegrationSettings> getPlacesApiAccess() {
		return placesApiAccess;
	}
	public void setPlacesApiAccess(List<IntegrationSettings> placesApiAccess) {
		this.placesApiAccess = placesApiAccess;
	}
	public List<IntegrationSettings> getAssetApiAccess() {
		return assetApiAccess;
	}
	public void setAssetApiAccess(List<IntegrationSettings> assetApiAccess) {
		this.assetApiAccess = assetApiAccess;
	}
	public String getLogisticsProvider() {
		return logisticsProvider;
	}
	public void setLogisticsProvider(String logisticsProvider) {
		this.logisticsProvider = logisticsProvider;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAuthorization() {
		return authorization;
	}
	public void setAuthorization(String authorization) {
		this.authorization = authorization;
	}
	public String getAuthorizationType() {
		return authorizationType;
	}
	public void setAuthorizationType(String authorizationType) {
		this.authorizationType = authorizationType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	
}
