package com.tlabs.posweb.beans;

import java.util.Date;

public class ReportBatchLog {
	
		
		private Integer autoNum;
		
		private String reportId;
		
		private Date batchDataDdate;
	   
	    private Date startTime;
	  
		private Date endTime;
	  
		private String userName;
		
		private String roleName;
		
		private String remarks;

		private boolean entryStatus;
       
		private String status;
       private String batchDataDdateStr;
       private String batchTimeStr;
       private boolean runStatus;

       
       
	public boolean isRunStatus() {
		return runStatus;
	}

	public void setRunStatus(boolean runStatus) {
		this.runStatus = runStatus;
	}

	public String getBatchDataDdateStr() {
		return batchDataDdateStr;
	}

	public void setBatchDataDdateStr(String batchDataDdateStr) {
		this.batchDataDdateStr = batchDataDdateStr;
	}

	public String getBatchTimeStr() {
		return batchTimeStr;
	}

	public void setBatchTimeStr(String batchTimeStr) {
		this.batchTimeStr = batchTimeStr;
	}

	public Integer getAutoNum() {
		return autoNum;
	}

	public void setAutoNum(Integer autoNum) {
		this.autoNum = autoNum;
	}

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	public Date getBatchDataDdate() {
		return batchDataDdate;
	}

	public void setBatchDataDdate(Date batchDataDdate) {
		this.batchDataDdate = batchDataDdate;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public boolean isEntryStatus() {
		return entryStatus;
	}

	public void setEntryStatus(boolean entryStatus) {
		this.entryStatus = entryStatus;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


}
