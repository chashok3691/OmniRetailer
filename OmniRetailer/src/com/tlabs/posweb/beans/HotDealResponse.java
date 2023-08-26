package com.tlabs.posweb.beans;

import java.util.List;

 
/**
* @author 		: kesav A
* @Created_on   : 10-02-2016
* @verified_By  :
* @modified_By  : 
* @modified_On  :  
* @modified_Ref :  
* @description  : This class is used give response  . 
* */
public class HotDealResponse {
private ResponseHeader responseHeader;
private String hotDealRef;
private List<HotDeals> hotDealsList;
private int totalRecords;
private HotDeals dealObj;
private List<String> deletedHotDeals;
private List<String> nonDeletedHotDeals;
private HotDealsList homePageDeals;
public HotDeals getDealObj() {
	return dealObj;
}

public void setDealObj(HotDeals dealObj) {
	this.dealObj = dealObj;
}
public ResponseHeader getResponseHeader() {
	return responseHeader;
}
public void setResponseHeader(ResponseHeader responseHeader) {
	this.responseHeader = responseHeader;
}
public String getHotDealRef() {
	return hotDealRef;
}
public void setHotDealRef(String hotDealRef) {
	this.hotDealRef = hotDealRef;
}
public List<HotDeals> getHotDealsList() {
	return hotDealsList;
}
public void setHotDealsList(List<HotDeals> hotDealsList) {
	this.hotDealsList = hotDealsList;
}
public int getTotalRecords() {
	return totalRecords;
}
public void setTotalRecords(int totalRecords) {
	this.totalRecords = totalRecords;
}
public List<String> getDeletedHotDeals() {
	return deletedHotDeals;
}
public void setDeletedHotDeals(List<String> deletedHotDeals) {
	this.deletedHotDeals = deletedHotDeals;
}
public List<String> getNonDeletedHotDeals() {
	return nonDeletedHotDeals;
}
public void setNonDeletedHotDeals(List<String> nonDeletedHotDeals) {
	this.nonDeletedHotDeals = nonDeletedHotDeals;
}

public HotDealsList getHomePageDeals() {
	return homePageDeals;
}

public void setHomePageDeals(HotDealsList homePageDeals) {
	this.homePageDeals = homePageDeals;
}

}
