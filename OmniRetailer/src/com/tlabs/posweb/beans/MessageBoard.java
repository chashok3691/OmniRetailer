package com.tlabs.posweb.beans;

import java.util.List;
import java.util.Set;

public class MessageBoard {

	private String messageId;
	
	private String messageType;
	
	private String messageSubject;
	
	private String messageBody;
	
	private byte[] attachment;

	private String remarks;
	
	private String createdDate;

	private Set<MessageLocations> messageLocations;
	
	private Set<MessageRoles> messageRoles;
	
	private RequestHeader requestHeader;

	private String strDate;

	private String storeLocation;

	private String role;
	
	private String startIndex;
	
	private String totalRecords;
	
	private String maxRecords; 
	
	private List<MessageBoard> messageBoards;
	
	private MessageBoard messageBoardDetails;
	
	private List<String> locations;
	
	private List<String> users;
	
	private List<String> roles;
	
	public List<String> getLocations() {
		return locations;
	}

	public void setLocations(List<String> locations) {
		this.locations = locations;
	}

	public List<String> getUsers() {
		return users;
	}

	public void setUsers(List<String> users) {
		this.users = users;
	}

	public List<String> getRoles() {
		return roles;
	}

	public void setRoles(List<String> roles) {
		this.roles = roles;
	}

	public MessageBoard getMessageBoardDetails() {
		return messageBoardDetails;
	}

	public void setMessageBoardDetails(MessageBoard messageBoardDetails) {
		this.messageBoardDetails = messageBoardDetails;
	}

	public List<MessageBoard> getMessageBoards() {
		return messageBoards;
	}

	public void setMessageBoards(List<MessageBoard> messageBoards) {
		this.messageBoards = messageBoards;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getStrDate() {
		return strDate;
	}

	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public Set<MessageLocations> getMessageLocations() {
		return messageLocations;
	}

	public void setMessageLocations(Set<MessageLocations> messageLocations) {
		this.messageLocations = messageLocations;
	}

	public Set<MessageRoles> getMessageRoles() {
		return messageRoles;
	}

	public void setMessageRoles(Set<MessageRoles> messageRoles) {
		this.messageRoles = messageRoles;
	}

	public String getMessageId() {
		return messageId;
	}

	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public String getMessageSubject() {
		return messageSubject;
	}

	public void setMessageSubject(String messageSubject) {
		this.messageSubject = messageSubject;
	}

	public String getMessageBody() {
		return messageBody;
	}

	public void setMessageBody(String messageBody) {
		this.messageBody = messageBody;
	}

	public byte[] getAttachment() {
		return attachment;
	}

	public void setAttachment(byte[] attachment) {
		this.attachment = attachment;
	}

	

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
}
