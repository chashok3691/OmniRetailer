package com.tlabs.posweb.beans;

public class BackupAndRecovery {
	
	
	private String databaseName;
	private boolean alldatabases;
	private String userName;
	private String password;
	private String backUpType;
	private String dbipAddress;
	private String startIndex;
	private String backupDateStr;
	private String fileName;
	private String id;
	private String status;
	private String backupDate;
	private String size;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getBackupDate() {
		return backupDate;
	}
	public void setBackupDate(String backupDate) {
		this.backupDate = backupDate;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getDbipAddress() {
		return dbipAddress;
	}
	public void setDbipAddress(String dbipAddress) {
		this.dbipAddress = dbipAddress;
	}
	public String getBackUpType() {
		return backUpType;
	}
	public void setBackUpType(String backUpType) {
		this.backUpType = backUpType;
	}
	private RequestHeader requestHeader;
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getDatabaseName() {
		return databaseName;
	}
	public void setDatabaseName(String databaseName) {
		this.databaseName = databaseName;
	}
	public boolean isAlldatabases() {
		return alldatabases;
	}
	public void setAlldatabases(boolean alldatabases) {
		this.alldatabases = alldatabases;
	}
	public String getUserName() {
		return userName;
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
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public String getBackupDateStr() {
		return backupDateStr;
	}
	public void setBackupDateStr(String backupDateStr) {
		this.backupDateStr = backupDateStr;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	

}
