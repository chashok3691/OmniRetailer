package com.tlabs.posweb.beans;
public class EventEquipmentReturnDetails {
	
	private int sNo;
	
	private String eventReference;
	
	private String machineEquipmentId;
	
	private String description;
	
	private Double issueQuantity=0.0;
	
	private Double returnQuantity=0.0;
	
	private String created_date;
	
	private String updated_date;
	
	private String user_name;
	
	private String role_name;
	private String eventLocation;
	
	private String createdDateStr;
	
	private String updatedDateStr;

	
	public String getEventLocation() {
		return eventLocation;
	}

	public void setEventLocation(String eventLocation) {
		this.eventLocation = eventLocation;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getEventReference() {
		return eventReference;
	}

	public void setEventReference(String eventReference) {
		this.eventReference = eventReference;
	}



	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	public String getCreated_date() {
		return created_date;
	}

	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}

	public String getUpdated_date() {
		return updated_date;
	}

	public void setUpdated_date(String updated_date) {
		this.updated_date = updated_date;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public String getUpdatedDateStr() {
		return updatedDateStr;
	}

	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}

	public String getMachineEquipmentId() {
		return machineEquipmentId;
	}

	public void setMachineEquipmentId(String machineEquipmentId) {
		this.machineEquipmentId = machineEquipmentId;
	}

	public Double getIssueQuantity() {
		return issueQuantity;
	}

	public void setIssueQuantity(Double issueQuantity) {
		this.issueQuantity = issueQuantity;
	}

	public Double getReturnQuantity() {
		return returnQuantity;
	}

	public void setReturnQuantity(Double returnQuantity) {
		this.returnQuantity = returnQuantity;
	}
	
	
	
	
	

}
