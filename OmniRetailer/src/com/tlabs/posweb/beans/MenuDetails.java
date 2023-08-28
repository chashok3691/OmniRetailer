package com.tlabs.posweb.beans;

import java.util.List;

public class MenuDetails {

	private String menu_name;
	private String outlet_name;
	private String outlet_location;
	private String remarks;
	private List<MenuCategory> menu_category_details;
	private List<MenuItems> menu_item_details;
	private RequestHeader requestHeader;
	private String startIndex;
//	private String status;
	private boolean status;
	private String createdOnStr;
	private String flowUnder;
	
	
	
	public String getFlowUnder() {
		return flowUnder;
	}
	public void setFlowUnder(String flowUnder) {
		this.flowUnder = flowUnder;
	}
	public String getCreatedOnStr() {
		return createdOnStr;
	}
	public void setCreatedOnStr(String createdOnStr) {
		this.createdOnStr = createdOnStr;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	private String category_name;
public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
//public String getStatus() {
//		return status;
//	}
//	public void setStatus(String status) {
//		this.status = status;
//	}
	//	public boolean isStatus() {
//		return status;
//	}
	private String createdOn;
	private List<String> menuNameList;
	private String searchCriteria;
//	public void setStatus(boolean status) {
//		this.status = status;
//	}
	private int slNo;
	private boolean menuStatus;
	//private String menu_status;
	private boolean menu_status;
	
	private List<String> locationsList;
	
	public List<String> getLocationsList() {
		return locationsList;
	}
	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}
	private List<MenuItems> menuItemsList;
	
	private List<MenuCategory> menuCategories;
	
	public List<MenuCategory> getMenuCategories() {
		return menuCategories;
	}
	public void setMenuCategories(List<MenuCategory> menuCategories) {
		this.menuCategories = menuCategories;
	}
	public List<MenuItems> getMenuItemsList() {
		return menuItemsList;
	}
	public void setMenuItemsList(List<MenuItems> menuItemsList) {
		this.menuItemsList = menuItemsList;
	}
	public boolean isMenu_status() {
		return menu_status;
	}
	public void setMenu_status(boolean menu_status) {
		this.menu_status = menu_status;
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
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public List<MenuCategory> getMenu_category_details() {
		return menu_category_details;
	}
	public void setMenu_category_details(List<MenuCategory> menu_category_details) {
		this.menu_category_details = menu_category_details;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public List<MenuItems> getMenu_item_details() {
		return menu_item_details;
	}
	public void setMenu_item_details(List<MenuItems> menu_item_details) {
		this.menu_item_details = menu_item_details;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	/*public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}*/
	public String getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}
	public String getOutlet_location() {
		return outlet_location;
	}
	public void setOutlet_location(String outlet_location) {
		this.outlet_location = outlet_location;
	}
	public List<String> getMenuNameList() {
		return menuNameList;
	}
	public void setMenuNameList(List<String> menuNameList) {
		this.menuNameList = menuNameList;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public boolean isMenuStatus() {
		return menuStatus;
	}
	public void setMenuStatus(boolean menuStatus) {
		this.menuStatus = menuStatus;
	}
/*	public String getMenu_status() {
		return menu_status;
	}
	public void setMenu_status(String menu_status) {
		this.menu_status = menu_status;
	}*/
	
	
}
