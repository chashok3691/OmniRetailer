package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;


public class BatchOperations{
	
	private String batch_id;
	private String batch_title;
	private String batch_description;
	private String batch_operation;
	private String batch_sub_operation;
	private List<String> batchoperations;
	private String  batch_period;
	private Date batch_start_day;
	private Date batch_end_day;
	private String batch_day;
	///private Date batch_time;
	private Date created_on;
	private Date updated_on;
	private String user_name;
	private String role_name;
	private boolean periodic;
	private String storeLocation;
	private String serveripaddress;
	private Boolean productmasterDate;
	private Boolean billings;
	private Boolean customerData;
	private Boolean customerLoyaltyCards;
	private String scheduleTime;
	private Date previousScheduleTime;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String startDateStr;
	private String startTimeStr;
	private String execustiomTimeStr;
	private String dailyBatchTimeStr;
	private List<String> dayList;
	
	private String startIndex;
	private String maxRecords;
	

	private String created_onStr;
	private String batchDataDdateStr;
	private String batchTimeStr;

	private String monthDate;
	private String nthDay;
	
	private String searchCriteria;
	private int totalRecords;
	private String createOnStr;
	private String status;
	private List<String> deleteBatchIDList;
	private String noOfDDays;
	private String reportId;
	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	private List<ReportBatchLog> batchHistoryList;
	
	
	
	
	
	public String getCreated_onStr() {
		return created_onStr;
	}

	public void setCreated_onStr(String created_onStr) {
		this.created_onStr = created_onStr;
	}

	public List<ReportBatchLog> getBatchHistoryList() {
		return batchHistoryList;
	}

	public void setBatchHistoryList(List<ReportBatchLog> batchHistoryList) {
		this.batchHistoryList = batchHistoryList;
	}

	public String getBatchDataDdateStr() {
		return batchDataDdateStr;
	}

	public void setBatchDataDdateStr(String batchDataDdateStr) {
		this.batchDataDdateStr = batchDataDdateStr;
	}

	public List<String> getDeleteBatchIDList() {
		return deleteBatchIDList;
	}

	public void setDeleteBatchIDList(List<String> deleteBatchIDList) {
		this.deleteBatchIDList = deleteBatchIDList;
	}

	public String getNoOfDDays() {
		return noOfDDays;
	}

	public void setNoOfDDays(String noOfDDays) {
		this.noOfDDays = noOfDDays;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBatchTimeStr() {
		return batchTimeStr;
	}

	public void setBatchTimeStr(String batchTimeStr) {
		this.batchTimeStr = batchTimeStr;
	}

	public String getCreateOnStr() {
		return createOnStr;
	}

	public void setCreateOnStr(String createOnStr) {
		this.createOnStr = createOnStr;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getMonthDate() {
		return monthDate;
	}

	public void setMonthDate(String monthDate) {
		this.monthDate = monthDate;
	}

	public String getNthDay() {
		return nthDay;
	}

	public void setNthDay(String nthDay) {
		this.nthDay = nthDay;
	}

	public List<String> getBatchoperations() {
		return batchoperations;
	}

	public void setBatchoperations(List<String> batchoperations) {
		this.batchoperations = batchoperations;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getBatch_id() {
		return batch_id;
	}

	public String getBatch_title() {
		return batch_title;
	}

	public String getBatch_description() {
		return batch_description;
	}

	public String getBatch_operation() {
		return batch_operation;
	}

	public String getBatch_sub_operation() {
		return batch_sub_operation;
	}

	
	public Date getBatch_start_day() {
		return batch_start_day;
	}

	public Date getBatch_end_day() {
		return batch_end_day;
	}

	

	/*public Date getBatch_time() {
		return batch_time;
	}*/

	public Date getCreated_on() {
		return created_on;
	}

	public Date getUpdated_on() {
		return updated_on;
	}

	public String getUser_name() {
		return user_name;
	}

	public String getRole_name() {
		return role_name;
	}

	public boolean isPeriodic() {
		return periodic;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public String getServeripaddress() {
		return serveripaddress;
	}

	public Boolean getProductmasterDate() {
		return productmasterDate;
	}

	public Boolean getBillings() {
		return billings;
	}

	public Boolean getCustomerData() {
		return customerData;
	}

	public Boolean getCustomerLoyaltyCards() {
		return customerLoyaltyCards;
	}

	public String getScheduleTime() {
		return scheduleTime;
	}

	public Date getPreviousScheduleTime() {
		return previousScheduleTime;
	}

	public void setBatch_id(String batch_id) {
		this.batch_id = batch_id;
	}

	public void setBatch_title(String batch_title) {
		this.batch_title = batch_title;
	}

	public void setBatch_description(String batch_description) {
		this.batch_description = batch_description;
	}

	public void setBatch_operation(String batch_operation) {
		this.batch_operation = batch_operation;
	}

	public void setBatch_sub_operation(String batch_sub_operation) {
		this.batch_sub_operation = batch_sub_operation;
	}



	public String getBatch_period() {
		return batch_period;
	}

	public void setBatch_period(String batch_period) {
		this.batch_period = batch_period;
	}

	public void setBatch_start_day(Date batch_start_day) {
		this.batch_start_day = batch_start_day;
	}

	public void setBatch_end_day(Date batch_end_day) {
		this.batch_end_day = batch_end_day;
	}

	

	/*public void setBatch_time(Date batch_time) {
		this.batch_time = batch_time;
	}*/

	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}

	public void setUpdated_on(Date updated_on) {
		this.updated_on = updated_on;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public void setPeriodic(boolean periodic) {
		this.periodic = periodic;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public void setServeripaddress(String serveripaddress) {
		this.serveripaddress = serveripaddress;
	}

	public void setProductmasterDate(Boolean productmasterDate) {
		this.productmasterDate = productmasterDate;
	}

	public void setBillings(Boolean billings) {
		this.billings = billings;
	}

	public void setCustomerData(Boolean customerData) {
		this.customerData = customerData;
	}

	public void setCustomerLoyaltyCards(Boolean customerLoyaltyCards) {
		this.customerLoyaltyCards = customerLoyaltyCards;
	}

	public void setScheduleTime(String scheduleTime) {
		this.scheduleTime = scheduleTime;
	}

	public void setPreviousScheduleTime(Date previousScheduleTime) {
		this.previousScheduleTime = previousScheduleTime;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public String getStartTimeStr() {
		return startTimeStr;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public void setStartTimeStr(String startTimeStr) {
		this.startTimeStr = startTimeStr;
	}

	

	public String getExecustiomTimeStr() {
		return execustiomTimeStr;
	}

	public void setExecustiomTimeStr(String execustiomTimeStr) {
		this.execustiomTimeStr = execustiomTimeStr;
	}

	public String getDailyBatchTimeStr() {
		return dailyBatchTimeStr;
	}

	public void setDailyBatchTimeStr(String dailyBatchTimeStr) {
		this.dailyBatchTimeStr = dailyBatchTimeStr;
	}

	public String getBatch_day() {
		return batch_day;
	}

	public List<String> getDayList() {
		return dayList;
	}

	public void setBatch_day(String batch_day) {
		this.batch_day = batch_day;
	}

	public void setDayList(List<String> dayList) {
		this.dayList = dayList;
	}
	
	//List of Non-persist Column
	
	
	
//Setter and getter method	
	
	
	
}