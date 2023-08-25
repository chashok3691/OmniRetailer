package com.tlabs.posweb.beans;

public class SecuritySettingsResponse {
	
private ResponseHeader responseHeader;
private SecuritySettings securityObj;
private PrintSettings printSettingsObj;

public PrintSettings getPrintSettingsObj() {
	return printSettingsObj;
}

public void setPrintSettingsObj(PrintSettings printSettingsObj) {
	this.printSettingsObj = printSettingsObj;
}

public ResponseHeader getResponseHeader() {
	return responseHeader;
}

public void setResponseHeader(ResponseHeader responseHeader) {
	this.responseHeader = responseHeader;
}

public SecuritySettings getSecurityObj() {
	return securityObj;
}

public void setSecurityObj(SecuritySettings securityObj) {
	this.securityObj = securityObj;
}
}
