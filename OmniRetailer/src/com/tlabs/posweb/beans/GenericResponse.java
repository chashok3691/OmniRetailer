package com.tlabs.posweb.beans;

import java.util.List;
/**
 * @author chennakesav.a
 * This is for setting response from service*/
public class GenericResponse {
	private String customerID;
	private ResponseHeader responseHeader;
	private List<GenericAttachment>  mailTemplates;
	private List<GenericSettings>    mailSettings;
	private List<GenericSettings>    messageSettings;
	private List<GenericAttachment>  messageTemplates;
	private String templateID;
	private List<GenericSettings> messageParameters;
	private List<GenericSettings> wattsAppMessageSettings;
	private List<GenericSettings> wattsappMessageParameters;
	private List<GenericAttachment>  wattsappMsgTemplates;
	
	private List<BackUpftpSettings>  backUpSftpsettingsnew;
	private List<FtpSettings> sftpSettingsnew;
	
	
	
	public List<BackUpftpSettings> getBackUpSftpsettingsnew() {
		return backUpSftpsettingsnew;
	}
	public void setBackUpSftpsettingsnew(List<BackUpftpSettings> backUpSftpsettingsnew) {
		this.backUpSftpsettingsnew = backUpSftpsettingsnew;
	}
	public List<FtpSettings> getSftpSettingsnew() {
		return sftpSettingsnew;
	}
	public void setSftpSettingsnew(List<FtpSettings> sftpSettingsnew) {
		this.sftpSettingsnew = sftpSettingsnew;
	}
	public List<GenericAttachment> getWattsappMsgTemplates() {
		return wattsappMsgTemplates;
	}
	public void setWattsappMsgTemplates(List<GenericAttachment> wattsappMsgTemplates) {
		this.wattsappMsgTemplates = wattsappMsgTemplates;
	}
	public List<GenericSettings> getWattsAppMessageSettings() {
		return wattsAppMessageSettings;
	}
	public void setWattsAppMessageSettings(List<GenericSettings> wattsAppMessageSettings) {
		this.wattsAppMessageSettings = wattsAppMessageSettings;
	}
	public List<GenericSettings> getWattsappMessageParameters() {
		return wattsappMessageParameters;
	}
	public void setWattsappMessageParameters(List<GenericSettings> wattsappMessageParameters) {
		this.wattsappMessageParameters = wattsappMessageParameters;
	}
	public List<GenericSettings> getMessageParameters() {
		return messageParameters;
	}
	public void setMessageParameters(List<GenericSettings> messageParameters) {
		this.messageParameters = messageParameters;
	}
	private List<GenericRegionalSettings> regionalSettings;
	private List<GenericCustomer> customerSettings;
	public String getCustomerID() {
		return customerID;
	}
	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
 
	public String getTemplateID() {
		return templateID;
	}
	public void setTemplateID(String templateID) {
		this.templateID = templateID;
	}
 
	public List<GenericRegionalSettings> getRegionalSettings() {
		return regionalSettings;
	}
	public void setRegionalSettings(List<GenericRegionalSettings> regionalSettings) {
		this.regionalSettings = regionalSettings;
	}
	
	public List<GenericCustomer> getCustomerSettings() {
		return customerSettings;
	}
	public void setCustomerSettings(List<GenericCustomer> customerSettings) {
		this.customerSettings = customerSettings;
	}
	public List<GenericSettings> getMailSettings() {
		return mailSettings;
	}
	public void setMailSettings(List<GenericSettings> mailSettings) {
		this.mailSettings = mailSettings;
	}
	public List<GenericAttachment> getMailTemplates() {
		return mailTemplates;
	}
	public void setMailTemplates(List<GenericAttachment> mailTemplates) {
		this.mailTemplates = mailTemplates;
	}
	public List<GenericSettings> getMessageSettings() {
		return messageSettings;
	}
	public void setMessageSettings(List<GenericSettings> messageSettings) {
		this.messageSettings = messageSettings;
	}
	public List<GenericAttachment> getMessageTemplates() {
		return messageTemplates;
	}
	public void setMessageTemplates(List<GenericAttachment> messageTemplates) {
		this.messageTemplates = messageTemplates;
	}
 
 
 
 
	 
}
