package com.tlabs.posweb.beans;

import java.io.Serializable;


public class AccessControl implements Serializable{
	private static final long serialVersionUID = 1L;
	private String sno;
	private String location;
	private String appName;
	private String appFlow;
	private String appSubflow;
	private String appDocument;
	private String appSubDocument;
	private boolean read;
	private boolean write;
	private String roleName;
	private boolean notification;
	
    private String appDocumentFieldName;
    
	private String appDocumentFieldValue;
	        
	private boolean fieldRead;
	        
	private boolean fieldWrite;
	
	
	
	public String getAppDocumentFieldName() {
		return appDocumentFieldName;
	}

	public void setAppDocumentFieldName(String appDocumentFieldName) {
		this.appDocumentFieldName = appDocumentFieldName;
	}

	public String getAppDocumentFieldValue() {
		return appDocumentFieldValue;
	}

	public void setAppDocumentFieldValue(String appDocumentFieldValue) {
		this.appDocumentFieldValue = appDocumentFieldValue;
	}

	public boolean isFieldRead() {
		return fieldRead;
	}

	public void setFieldRead(boolean fieldRead) {
		this.fieldRead = fieldRead;
	}

	public boolean isFieldWrite() {
		return fieldWrite;
	}

	public void setFieldWrite(boolean fieldWrite) {
		this.fieldWrite = fieldWrite;
	}

	public boolean isNotification() {
		return notification;
	}

	public void setNotification(boolean notification) {
		this.notification = notification;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public boolean equals(AccessControl accessControl){
		if(this.appName.equals("Console") && this.appName.equals(accessControl.getAppName()) && this.appFlow.equals(accessControl.getAppFlow()) && this.appDocument.equals(accessControl.getAppDocument())){
			if(this.appSubflow != null && accessControl.getAppSubflow() != null && this.appSubflow.equals(accessControl.getAppSubflow())){
				if(this.appSubDocument != null && accessControl.getAppSubDocument() != null && this.appSubDocument.equals(accessControl.getAppSubDocument()))
					return true;
				else if(this.appSubDocument == null && accessControl.getAppSubDocument() == null)
					return true;
				else 
					return false;
			}else if(this.appSubflow == null && accessControl.getAppSubflow() == null){
				if(this.appSubDocument != null && accessControl.getAppSubDocument() != null && this.appSubDocument.equals(accessControl.getAppSubDocument()))
					return true;
				else if(this.appSubDocument == null && accessControl.getAppSubDocument() == null)
					return true;
				else 
					return false;
			}
			else
				return false;
		}
		   return false;
	}
	
	public int hashCode(){
		if(this.appName.equals("Console"))
			return 1;
		else
			return 0;
	}
	
	public String getAppSubDocument() {
		return appSubDocument;
	}

	public void setAppSubDocument(String appSubDocument) {
		this.appSubDocument = appSubDocument;
	}

	public String getLocation() {
		return location;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
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

	public String getAppFlow() {
		return appFlow;
	}

	public void setAppFlow(String appFlow) {
		this.appFlow = appFlow;
	}

	public String getAppSubflow() {
		return appSubflow;
	}

	public void setAppSubflow(String appSubflow) {
		this.appSubflow = appSubflow;
	}

	public String getAppDocument() {
		return appDocument;
	}

	public void setAppDocument(String appDocument) {
		this.appDocument = appDocument;
	}

	public boolean isRead() {
		return read;
	}

	public void setRead(boolean read) {
		this.read = read;
	}

	public boolean isWrite() {
		return write;
	}

	public void setWrite(boolean write) {
		this.write = write;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	
}
