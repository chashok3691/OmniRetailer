package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;
import java.util.Set;



public class Menu {


	private String menu_name;


	private String desc;
	
	private boolean menu_status;
	
	
	private String userName;
	
	private String roleName;

	private Date createdOn;
	

	private Date updatedOn;
	
	
	
	private String remarks;
	
	
	private List<MenuLocations> menuLocations;
	
	private List<MenuCategory>	menu_category_details;
	
	private List<MenuItems> menu_item_details;
	
	private List<MenuCategory> menuCategories;

	private java.util.List<String> deleteMenuItems;	
	
	private boolean status;	
	
	private List<String> locationsList; 
	
	private String menuId;
	
	private String maxRecords;
	
	private ResponseHeader responseHeader;
	
	private RequestHeader requestHeader;
	
	private String startIndex;
	
	private List<String> menuNameList;

	private String outlet_name;
	
	private String category_name;


	private String searchCriteria;
	
	private String eventReference;

	private String operation;
	
	
	
	
	
	
	
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public List<MenuLocations> getMenuLocations() {
		return menuLocations;
	}
	public void setMenuLocations(List<MenuLocations> menuLocations) {
		this.menuLocations = menuLocations;
	}
	public List<MenuCategory> getMenu_category_details() {
		return menu_category_details;
	}
	public void setMenu_category_details(List<MenuCategory> menu_category_details) {
		this.menu_category_details = menu_category_details;
	}
	public List<MenuItems> getMenu_item_details() {
		return menu_item_details;
	}
	public void setMenu_item_details(List<MenuItems> menu_item_details) {
		this.menu_item_details = menu_item_details;
	}
	public String getEventReference() {
		return eventReference;
	}
	public void setEventReference(String eventReference) {
		this.eventReference = eventReference;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	} 
	
	
	
	public String getOutlet_name() {
		return outlet_name;
	}
	public void setOutlet_name(String outlet_name) {
		this.outlet_name = outlet_name;
	}

	

	
	
	
	
	public List<String> getLocationsList() {
		return locationsList;
	}
	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}



	

	
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public boolean getStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public List<MenuCategory> getMenuCategories() {
		return menuCategories;
	}
	public void setMenuCategories(List<MenuCategory> menuCategories) {
		this.menuCategories = menuCategories;
	}
	
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public List<String> getMenuNameList() {
		return menuNameList;
	}
	public void setMenuNameList(List<String> menuNameList) {
		this.menuNameList = menuNameList;
	}

	
	public boolean getMenu_status() {
		return menu_status;
	}
	public void setMenu_status(boolean menu_status) {
		this.menu_status = menu_status;
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
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	public Date getUpdatedOn() {
		return updatedOn;
	}
	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	public java.util.List<String> getDeleteMenuItems() {
		return deleteMenuItems;
	}
	public void setDeleteMenuItems(java.util.List<String> deleteMenuItems) {
		this.deleteMenuItems = deleteMenuItems;
	}
	
	
	

}
