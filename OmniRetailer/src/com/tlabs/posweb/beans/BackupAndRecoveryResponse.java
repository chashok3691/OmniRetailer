package com.tlabs.posweb.beans;

import java.util.List;

public class BackupAndRecoveryResponse {
	private ResponseHeader responseHeader;
	private int totalRecords;
	private List<BackupAndRecovery> backupList;
	
	public List<BackupAndRecovery> backupAndrecovery;
	
	
	
	
	
	public List<BackupAndRecovery> getBackupAndrecovery() {
		return backupAndrecovery;
	}

	public void setBackupAndrecovery(List<BackupAndRecovery> backupAndrecovery) {
		this.backupAndrecovery = backupAndrecovery;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<BackupAndRecovery> getBackupList() {
		return backupList;
	}

	public void setBackupList(List<BackupAndRecovery> backupList) {
		this.backupList = backupList;
	}

	public String getLastBackupType() {
		return lastBackupType;
	}

	public void setLastBackupType(String lastBackupType) {
		this.lastBackupType = lastBackupType;
	}

	public String getLastBackupDate() {
		return lastBackupDate;
	}

	public void setLastBackupDate(String lastBackupDate) {
		this.lastBackupDate = lastBackupDate;
	}

	private String lastBackupType;
	private String lastBackupDate;

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	

}
