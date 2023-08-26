package com.tlabs.posweb.beans;
/**
 * @author chennakesav.a
 * */
public class SecuritySettings {

	private String minPasswordLength;
	private String capitalLetters;
	private String smallLetters;
	private String specialLetters;
	private String passwordHistoryCount;
	private String enforcePasswordHistory;
	private String passwordExpiryInDays;
	private String enforceUserToChange;
	private String firstTimeLogin;
	private String allowOfflineLogin;
	private String noOfAttempts;
	private String restrictedArea;
	private String restrictedAreaLongitude;
	private String restrictedAreaLatitude;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	public String getRestrictedAreaLongitude() {
		return restrictedAreaLongitude;
	}
	public void setRestrictedAreaLongitude(String restrictedAreaLongitude) {
		this.restrictedAreaLongitude = restrictedAreaLongitude;
	}
	public String getRestrictedAreaLatitude() {
		return restrictedAreaLatitude;
	}
	public void setRestrictedAreaLatitude(String restrictedAreaLatitude) {
		this.restrictedAreaLatitude = restrictedAreaLatitude;
	}
	
	public String getMinPasswordLength() {
		return minPasswordLength;
	}
	public void setMinPasswordLength(String minPasswordLength) {
		this.minPasswordLength = minPasswordLength;
	}
	public String getCapitalLetters() {
		return capitalLetters;
	}
	public void setCapitalLetters(String capitalLetters) {
		this.capitalLetters = capitalLetters;
	}
	public String getSmallLetters() {
		return smallLetters;
	}
	public void setSmallLetters(String smallLetters) {
		this.smallLetters = smallLetters;
	}
	public String getSpecialLetters() {
		return specialLetters;
	}
	public void setSpecialLetters(String specialLetters) {
		this.specialLetters = specialLetters;
	}
	public String getPasswordHistoryCount() {
		return passwordHistoryCount;
	}
	public void setPasswordHistoryCount(String passwordHistoryCount) {
		this.passwordHistoryCount = passwordHistoryCount;
	}
	public String getEnforcePasswordHistory() {
		return enforcePasswordHistory;
	}
	public void setEnforcePasswordHistory(String enforcePasswordHistory) {
		this.enforcePasswordHistory = enforcePasswordHistory;
	}
	public String getPasswordExpiryInDays() {
		return passwordExpiryInDays;
	}
	public void setPasswordExpiryInDays(String passwordExpiryInDays) {
		this.passwordExpiryInDays = passwordExpiryInDays;
	}
	public String getEnforceUserToChange() {
		return enforceUserToChange;
	}
	public void setEnforceUserToChange(String enforceUserToChange) {
		this.enforceUserToChange = enforceUserToChange;
	}
	public String getFirstTimeLogin() {
		return firstTimeLogin;
	}
	public void setFirstTimeLogin(String firstTimeLogin) {
		this.firstTimeLogin = firstTimeLogin;
	}
	public String getAllowOfflineLogin() {
		return allowOfflineLogin;
	}
	public void setAllowOfflineLogin(String allowOfflineLogin) {
		this.allowOfflineLogin = allowOfflineLogin;
	}
	public String getNoOfAttempts() {
		return noOfAttempts;
	}
	public void setNoOfAttempts(String noOfAttempts) {
		this.noOfAttempts = noOfAttempts;
	}
	public String getRestrictedArea() {
		return restrictedArea;
	}
	public void setRestrictedArea(String restrictedArea) {
		this.restrictedArea = restrictedArea;
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
}
