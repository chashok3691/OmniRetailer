package com.tlabs.posweb.beans;

import java.io.Serializable;

public class ActivityAccessControl implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private int serialNum;
	
	private String roleName;
	
	private String appName;
	
	private String appFlow;
	
	private String appSubFlow;
	
	private String appDocument;
	
	private String appSubDocument;
	
	private String appDocumentActivity;
	
	private String storeLocation;
	
	private boolean activityRead;
	
	private boolean activityWrite;
	
	private String createdDate;
	
	private String updatedDate;
	
	private String remarks;
	private boolean activityNotification;
	
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

	public boolean isActivityNotification() {
		return activityNotification;
	}

	public void setActivityNotification(boolean activityNotification) {
		this.activityNotification = activityNotification;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public boolean equals(ActivityAccessControl activityAccessControl){
		if(this.appName.equals(activityAccessControl.getAppName()) && this.appFlow.equals(activityAccessControl.getAppFlow()) && this.appDocument.equals(activityAccessControl.getAppDocument())){
			if(this.appSubFlow != null && activityAccessControl.getAppSubFlow() != null && this.appSubFlow.equals(activityAccessControl.getAppSubFlow())){
				if(this.appSubDocument != null && activityAccessControl.getAppSubDocument() != null && this.appSubDocument.equals(activityAccessControl.getAppSubDocument()))
					return true;
				else if(this.appSubDocument == null && activityAccessControl.getAppSubDocument() == null)
					return true;
				else 
					return false;
			}else if(this.appSubFlow == null && activityAccessControl.getAppSubFlow() == null){
				if(this.appSubDocument != null && activityAccessControl.getAppSubDocument() != null && this.appSubDocument.equals(activityAccessControl.getAppSubDocument()))
					return true;
				else if(this.appSubDocument == null && activityAccessControl.getAppSubDocument() == null)
					return true;
				else 
					return false;
			}
			else
				return false;
		}
		   return false;
	}
	
	/*public int hashCode(){
		if(this.appName.equals("Console"))
			return 1;
		else
			return 0;
	}*/

	
	public String getAppName() {
		return appName;
	}

	public String getAppSubDocument() {
		return appSubDocument;
	}

	public void setAppSubDocument(String appSubDocument) {
		this.appSubDocument = appSubDocument;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public int getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(int serialNum) {
		this.serialNum = serialNum;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getAppFlow() {
		return appFlow;
	}

	public void setAppFlow(String appFlow) {
		this.appFlow = appFlow;
	}

	public String getAppSubFlow() {
		return appSubFlow;
	}

	public void setAppSubFlow(String appSubFlow) {
		this.appSubFlow = appSubFlow;
	}

	public String getAppDocument() {
		return appDocument;
	}

	public void setAppDocument(String appDocument) {
		this.appDocument = appDocument;
	}

	public String getAppDocumentActivity() {
		return appDocumentActivity;
	}

	public void setAppDocumentActivity(String appDocumentActivity) {
		this.appDocumentActivity = appDocumentActivity;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public boolean isActivityRead() {
		return activityRead;
	}

	public void setActivityRead(boolean activityRead) {
		this.activityRead = activityRead;
	}

	public boolean isActivityWrite() {
		return activityWrite;
	}

	public void setActivityWrite(boolean activityWrite) {
		this.activityWrite = activityWrite;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
	
}
