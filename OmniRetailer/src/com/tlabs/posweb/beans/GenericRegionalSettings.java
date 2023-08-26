package com.tlabs.posweb.beans;
public class GenericRegionalSettings {
private String dateFormat;
private String currency;
private String numberFormat;
private String timeFormat;
private RequestHeader requestHeader;
private ResponseHeader responseHeader;
private String countryCode;
private String language;

private String timeZone;

private String date;

private String time;

public String getLanguage() {
	return language;
}
public void setLanguage(String language) {
	this.language = language;
}
public String getTimeZone() {
	return timeZone;
}
public void setTimeZone(String timeZone) {
	this.timeZone = timeZone;
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
public String getDateFormat() {
	return dateFormat;
}
public void setDateFormat(String dateFormat) {
	this.dateFormat = dateFormat;
}
public String getCurrency() {
	return currency;
}
public void setCurrency(String currency) {
	this.currency = currency;
}
public String getNumberFormat() {
	return numberFormat;
}
public void setNumberFormat(String numberFormat) {
	this.numberFormat = numberFormat;
}
public String getTimeFormat() {
	return timeFormat;
}
public void setTimeFormat(String timeFormat) {
	this.timeFormat = timeFormat;
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
public String getCountryCode() {
	return countryCode;
}
public void setCountryCode(String countryCode) {
	this.countryCode = countryCode;
}
}
