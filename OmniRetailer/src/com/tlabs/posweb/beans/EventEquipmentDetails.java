package com.tlabs.posweb.beans;

import java.util.Date;

public class EventEquipmentDetails {

	private String sNo;
	private String eventReference;
	private String equipmentId;
	private String equipmentName;
	private int equipmentQuantity = 0;
	private Date createdDate;
	private Date updatedDate = new Date();
	private String userName;
	private String roleName;
	private String createDateStr;
    private int submissionCount=1;
    
		
		public int getSubmissionCount() {
			return submissionCount;
		}

		public void setSubmissionCount(int submissionCount) {
			this.submissionCount = submissionCount;
		}

	public String getsNo() {
		return sNo;
	}

	public void setsNo(String sNo) {
		this.sNo = sNo;
	}

	public String getEventReference() {
		return eventReference;
	}

	public void setEventReference(String eventReference) {
		this.eventReference = eventReference;
	}

	public String getEquipmentId() {
		return equipmentId;
	}

	public void setEquipmentId(String equipmentId) {
		this.equipmentId = equipmentId;
	}

	public String getEquipmentName() {
		return equipmentName;
	}

	public void setEquipmentName(String equipmentName) {
		this.equipmentName = equipmentName;
	}

	public int getEquipmentQuantity() {
		return equipmentQuantity;
	}

	public void setEquipmentQuantity(int equipmentQuantity) {
		this.equipmentQuantity = equipmentQuantity;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
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

	public String getCreateDateStr() {
		return createDateStr;
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}

}
