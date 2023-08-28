package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;




public class MemberShips {
	
	
	private String member_ship_id;
	
	
	private String membershipProgramCode;
	
	
	private String phone_num;
	
	private String customerId;
	
	
	private String email_id;
	
	private String name;
	
	private String renewalDateStr;
	
	
	
	public String getRenewalDateStr() {
		return renewalDateStr;
	}

	public void setRenewalDateStr(String renewalDateStr) {
		this.renewalDateStr = renewalDateStr;
	}




	private String customer_category;
	
	
	private boolean status;
	
	
	private String start_date;
	
	private String end_date;
	
	
	private Float membershipFee;
	
	
	private Float activationPoints;
	
	
	private Float creditAmount;
	
	private int isAutoRenewal;
	
	private int isOnline;

	private List<String> membershipIds;
	
	private List<MemberShips> memberShips;
	
	private String membershipCode;
	
	private boolean saveReport;
	private String filePath;
	
	private List<MembershipChild> memberShipChild;
	
	public List<MembershipChild> getMemberShipChild() {
		return memberShipChild;
	}

	public void setMemberShipChild(List<MembershipChild> memberShipChild) {
		this.memberShipChild = memberShipChild;
	}

	public boolean isSaveReport() {
		return saveReport;
	}

	public void setSaveReport(boolean saveReport) {
		this.saveReport = saveReport;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getMembershipCode() {
		return membershipCode;
	}

	public void setMembershipCode(String membershipCode) {
		this.membershipCode = membershipCode;
	}

	public String getMembershipProgramCode() {
		return membershipProgramCode;
	}

	public void setMembershipProgramCode(String membershipProgramCode) {
		this.membershipProgramCode = membershipProgramCode;
	}

	public List<MemberShips> getMemberShips() {
		return memberShips;
	}

	public void setMemberShips(List<MemberShips> memberShips) {
		this.memberShips = memberShips;
	}

	public Float getMembershipFee() {
		return membershipFee;
	}

	public void setMembershipFee(Float membershipFee) {
		this.membershipFee = membershipFee;
	}

	public Float getActivationPoints() {
		return activationPoints;
	}

	public void setActivationPoints(Float activationPoints) {
		this.activationPoints = activationPoints;
	}

	public Float getCreditAmount() {
		return creditAmount;
	}

	public void setCreditAmount(Float creditAmount) {
		this.creditAmount = creditAmount;
	}

	

	

	public int getIsAutoRenewal() {
		return isAutoRenewal;
	}

	public void setIsAutoRenewal(int isAutoRenewal) {
		this.isAutoRenewal = isAutoRenewal;
	}

	public int getIsOnline() {
		return isOnline;
	}

	public void setIsOnline(int isOnline) {
		this.isOnline = isOnline;
	}

	public List<String> getMembershipIds() {
		return membershipIds;
	}

	public void setMembershipIds(List<String> membershipIds) {
		this.membershipIds = membershipIds;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getMember_ship_id() {
		return member_ship_id;
	}

	public void setMember_ship_id(String member_ship_id) {
		this.member_ship_id = member_ship_id;
	}

	public String getPhone_num() {
		return phone_num;
	}

	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}

	public String getEmail_id() {
		return email_id;
	}

	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCustomer_category() {
		return customer_category;
	}

	public void setCustomer_category(String customer_category) {
		this.customer_category = customer_category;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	
	
	
	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}




	private RequestHeader requestHeader;

	private ResponseHeader responseHeader;

	private Integer startIndex;

	private Integer maxRecords;

	private String searchCriteria;

	private String startDateStr;

	private String endDateStr;
	
	private String createdDateStr;
	
	private String updatedDateStr;

	private List<MemberShips> memberShipsDetails;
	
	private String membershipStatus;
	
	private int totalRecords;
	
	private String expiryStatus;
	

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getUpdatedDateStr() {
		return updatedDateStr;
	}

	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}

	public String getExpiryStatus() {
		return expiryStatus;
	}

	public void setExpiryStatus(String expiryStatus) {
		this.expiryStatus = expiryStatus;
	}

	public String getMembershipStatus() {
		return membershipStatus;
	}

	public void setMembershipStatus(String membershipStatus) {
		this.membershipStatus = membershipStatus;
	}

	public List<MemberShips> getMemberShipsDetails() {
		return memberShipsDetails;
	}

	public void setMemberShipsDetails(List<MemberShips> memberShipsDetails) {
		this.memberShipsDetails = memberShipsDetails;
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

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public Integer getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}

	public Integer getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(Integer maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

}
