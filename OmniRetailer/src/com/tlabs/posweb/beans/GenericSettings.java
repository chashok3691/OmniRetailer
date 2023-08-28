package com.tlabs.posweb.beans;

import java.util.List;

public class GenericSettings {
	private String server;
	private String userID;
	private String userPassword;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String gateWay;
	private String userName;
	private String password;
	private String portNO;
	private String message;
	private String protocol;
	
	private String templateId;
	private String mobileNumber;
	private String textMsg;
	
	private GenericSettings commonconfigSettings;
	private BackUpftpSettings backUpftpSettings;
	private FtpSettings ftpSettings;
	private String operation;
	
	
	
	public GenericSettings getCommonconfigSettings() {
		return commonconfigSettings;
	}
	public void setCommonconfigSettings(GenericSettings commonconfigSettings) {
		this.commonconfigSettings = commonconfigSettings;
	}
	public BackUpftpSettings getBackUpftpSettings() {
		return backUpftpSettings;
	}
	public void setBackUpftpSettings(BackUpftpSettings backUpftpSettings) {
		this.backUpftpSettings = backUpftpSettings;
	}
	public FtpSettings getFtpSettings() {
		return ftpSettings;
	}
	public void setFtpSettings(FtpSettings ftpSettings) {
		this.ftpSettings = ftpSettings;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getTemplateId() {
		return templateId;
	}
	public void setTemplateId(String templateId) {
		this.templateId = templateId;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getTextMsg() {
		return textMsg;
	}
	public void setTextMsg(String textMsg) {
		this.textMsg = textMsg;
	}
	
	
	public String getProtocol() {
		return protocol;
	}
	public void setProtocol(String protocol) {
		this.protocol = protocol;
	}
	private boolean enabled;
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	private List<GenericSettings> parametersList;
	private String parameterName;
	private String parameterValue;
	private String mobileKey;
	private String messageKey;
	private String parameters;
	private String smsURL;
	private String wattsappURL;
	
	
	public String getWattsappURL() {
		return wattsappURL;
	}
	public void setWattsappURL(String wattsappURL) {
		this.wattsappURL = wattsappURL;
	}
	public List<GenericSettings> getParametersList() {
		return parametersList;
	}
	public void setParametersList(List<GenericSettings> parametersList) {
		this.parametersList = parametersList;
	}
	public String getParameterName() {
		return parameterName;
	}
	public void setParameterName(String parameterName) {
		this.parameterName = parameterName;
	}
	public String getParameterValue() {
		return parameterValue;
	}
	public void setParameterValue(String parameterValue) {
		this.parameterValue = parameterValue;
	}
	public String getMobileKey() {
		return mobileKey;
	}
	public void setMobileKey(String mobileKey) {
		this.mobileKey = mobileKey;
	}
	public String getMessageKey() {
		return messageKey;
	}
	public void setMessageKey(String messageKey) {
		this.messageKey = messageKey;
	}
	public String getParameters() {
		return parameters;
	}
	public void setParameters(String parameters) {
		this.parameters = parameters;
	}
	public String getSmsURL() {
		return smsURL;
	}
	public void setSmsURL(String smsURL) {
		this.smsURL = smsURL;
	}
	private List<GenericAttachment> templatesList;
	//For customerSettings
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
	public String getGateWay() {
		return gateWay;
	}
	public void setGateWay(String gateWay) {
		this.gateWay = gateWay;
	}
	public String getUserName() {
		return userName;
	}
	public String getPortNO() {
		return portNO;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public void setPortNO(String portNO) {
		this.portNO = portNO;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	 
	public void setPassword(String password) {
		this.password = password;
	}
	public String getServer() {
		return server;
	}
	public void setServer(String server) {
		this.server = server;
	}
 
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public List<GenericAttachment> getTemplatesList() {
		return templatesList;
	}
	public void setTemplatesList(List<GenericAttachment> templatesList) {
		this.templatesList = templatesList;
	}
	 
}
