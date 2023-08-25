package com.tlabs.posweb.beans;

import java.util.List;

public class GenericSettingsResponse {
	
private ResponseHeader responseHeader;
private SecuritySettings securityObj;
private PrintSettings printSettingsObj;
private GenericSettings mailSettings;
private GenericSettings msgSettings;
private GenericRegionalSettings regionalSettings;
private GenericCustomer customerSettingsObj;
private List<GenericAttachment> printTemplateList;
private List<GenericAttachment> mailTemplateList;
private List<GenericAttachment> msgTemplateList;


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
public PrintSettings getPrintSettingsObj() {
	return printSettingsObj;
}
public void setPrintSettingsObj(PrintSettings printSettingsObj) {
	this.printSettingsObj = printSettingsObj;
}
public GenericSettings getMailSettings() {
	return mailSettings;
}
public void setMailSettings(GenericSettings mailSettings) {
	this.mailSettings = mailSettings;
}
public GenericSettings getMsgSettings() {
	return msgSettings;
}
public void setMsgSettings(GenericSettings msgSettings) {
	this.msgSettings = msgSettings;
}
public GenericRegionalSettings getRegionalSettings() {
	return regionalSettings;
}
public void setRegionalSettings(GenericRegionalSettings regionalSettings) {
	this.regionalSettings = regionalSettings;
}
public GenericCustomer getCustomerSettingsObj() {
	return customerSettingsObj;
}
public void setCustomerSettingsObj(GenericCustomer customerSettingsObj) {
	this.customerSettingsObj = customerSettingsObj;
}
public List<GenericAttachment> getPrintTemplateList() {
	return printTemplateList;
}
public void setPrintTemplateList(List<GenericAttachment> printTemplateList) {
	this.printTemplateList = printTemplateList;
}
public List<GenericAttachment> getMailTemplateList() {
	return mailTemplateList;
}
public void setMailTemplateList(List<GenericAttachment> mailTemplateList) {
	this.mailTemplateList = mailTemplateList;
}
public List<GenericAttachment> getMsgTemplateList() {
	return msgTemplateList;
}
public void setMsgTemplateList(List<GenericAttachment> msgTemplateList) {
	this.msgTemplateList = msgTemplateList;
} 
}
