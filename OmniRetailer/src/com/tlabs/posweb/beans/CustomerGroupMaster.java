package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;
import java.util.Set;




public class CustomerGroupMaster {
	
	//@Id
	//@Column(name = "group_id",length=20,nullable=false)
	private String group_id;
	private String image;
	private String groupComments;
	private String description;
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	private List<String> groupIds;
	private List<String> deleteIdList;
	private boolean saveCustomerGroup;
	//private boolean fileName;

	public boolean isSaveCustomerGroup() {
		return saveCustomerGroup;
	}

	public void setSaveCustomerGroup(boolean saveCustomerGroup) {
		this.saveCustomerGroup = saveCustomerGroup;
	}

	public List<String> getDeleteIdList() {
		return deleteIdList;
	}

	public void setDeleteIdList(List<String> deleteIdList) {
		this.deleteIdList = deleteIdList;
	}

	public List<String> getGroupIds() {
		return groupIds;
	}

	public void setGroupIds(List<String> groupIds) {
		this.groupIds = groupIds;
	}

	private List<CustomerGroupMaster> temporaryGroupList;
	
	public List<CustomerGroupMaster> getTemporaryGroupList() {
		return temporaryGroupList;
	}

	public void setTemporaryGroupList(List<CustomerGroupMaster> temporaryGroupList) {
		this.temporaryGroupList = temporaryGroupList;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getGroupComments() {
		return groupComments;
	}

	public void setGroupComments(String groupComments) {
		this.groupComments = groupComments;
	}

	//@Column(name = "group_name",length=50)
	private String group_name;
	
	//@Column(name = "group_description",length=150)
	private String group_description;
	
	//@Column(name = "status")
	private boolean status;
	
	//@Column(name = "created_date")
	private Date created_date;
	
	//@Column(name = "updated_date")
	private Date updated_date;
	
	//@Column(name = "role_name",length=150)
	private String role_name;
	
	//@Column(name = "user_name",length=50)
	private String user_name;
	
	//@Column(name = "group_category",length=50)
	private String group_category;
	
	//@Column(name = "location",length=50)
	private String location;
	
	//@Column(name = "zone",length=50)
	private String zone;
	
	//@Column(name = "start_date")
	private Date start_date;
	
	public int getSlNo() {
	return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	//@Column(name = "end_date")
	private Date end_date;
	
	private int slNo;
	
	//@Transient
		private String startDate;
		//@Transient
		private String endDate;
		
	
	private List<CustomerDetails> customerDetails;
	
	
	
	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	//@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	//@JoinColumn(name = "group_id")
	//@Valid
	private Set<CustomerGroupItems>	customerGroupItems;
	

	public String getGroup_category() {
		return group_category;
	}

	public void setGroup_category(String group_category) {
		this.group_category = group_category;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	private String startIndex;
	
	private String maxRecords;
	
	//@Transient
	private String totalRecords;
	
	//@Transient
	private String searchCriteria;
	
	//@Transient
	private RequestHeader requestHeader;
	
	//@Transient
	private ResponseHeader responseHeader;
	
	private String updatedDate;
	
	private String groupStatus;
	
	


	
	public String getGroupStatus() {
		return groupStatus;
	}

	public void setGroupStatus(String groupStatus) {
		this.groupStatus = groupStatus;
	}

	public String getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}

	//@Transient
	private String createdDate;
	
	//@Transient
	private List<CustomerGroupMaster> customerGroupList;
	
	//@Transient
	private String filePath;
	

	

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getGroup_description() {
		return group_description;
	}

	public void setGroup_description(String group_description) {
		this.group_description = group_description;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Date getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}

	public Date getUpdated_date() {
		return updated_date;
	}

	public void setUpdated_date(Date updated_date) {
		this.updated_date = updated_date;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
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

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
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

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	
	
	public Set<CustomerGroupItems> getCustomerGroupItems() {
		return customerGroupItems;
	}

	public void setCustomerGroupItems(Set<CustomerGroupItems> customerGroupItems) {
		this.customerGroupItems = customerGroupItems;
	}

	public List<CustomerGroupMaster> getCustomerGroupList() {
		return customerGroupList;
	}

	public void setCustomerGroupList(List<CustomerGroupMaster> customerGroupList) {
		this.customerGroupList = customerGroupList;
	}

	public List<CustomerDetails> getCustomerDetails() {
		return customerDetails;
	}

	public void setCustomerDetails(List<CustomerDetails> customerDetails) {
		this.customerDetails = customerDetails;
	}

	
	
}
