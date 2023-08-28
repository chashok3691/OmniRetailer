package com.tlabs.posweb.beans;

import java.util.List;

/**
 * @author chennakesav.a
 * */
public class PrintSettings {
	
private String enableRemotePrinting;
private String	allowDownLoading;
private String allowSignature;
private String formatSupported;
private RequestHeader requestHeader;
private List<GenericAttachment> templatesList;
private byte[] bytes;
private String status;

public String getEnableRemotePrinting() {
	return enableRemotePrinting;
}
public void setEnableRemotePrinting(String enableRemotePrinting) {
	this.enableRemotePrinting = enableRemotePrinting;
}
public String getAllowDownLoading() {
	return allowDownLoading;
}
public void setAllowDownLoading(String allowDownLoading) {
	this.allowDownLoading = allowDownLoading;
}
public String getAllowSignature() {
	return allowSignature;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public void setAllowSignature(String allowSignature) {
	this.allowSignature = allowSignature;
}
public String getFormatSupported() {
	return formatSupported;
}
public void setFormatSupported(String formatSupported) {
	this.formatSupported = formatSupported;
}
public RequestHeader getRequestHeader() {
	return requestHeader;
}
public void setRequestHeader(RequestHeader requestHeader) {
	this.requestHeader = requestHeader;
}
public List<GenericAttachment> getTemplatesList() {
	return templatesList;
}
public void setTemplatesList(List<GenericAttachment> templatesList) {
	this.templatesList = templatesList;
}
public byte[] getBytes() {
	return bytes;
}
public void setBytes(byte[] bytes) {
	this.bytes = bytes;
}
}
