package com.tlabs.posweb.beans;

public class MessageRoles {
	
	private int serialNum;
	
	private String messageId;
	
	private String role;
	
	private String remarks;
	
	private String receiverType;
	
	public String getReceiverType() {
		return receiverType;
	}

	public void setReceiverType(String receiverType) {
		this.receiverType = receiverType;
	}

	public int getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(int serialNum) {
		this.serialNum = serialNum;
	}

	public String getMessageId() {
		return messageId;
	}

	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	
}
