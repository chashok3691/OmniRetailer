package com.tlabs.posweb.beans;

import java.util.List;



/**
* @author chennakesav.a*/
public class ShoppingItemsListResponse {
private ResponseHeader responseHeader;
private int totalRecords;
private List<CustomerShoppingList> shoppingLists;
private CustomerShoppingList shoppingObj;

public ResponseHeader getResponseHeader() {
	return responseHeader;
}
public void setResponseHeader(ResponseHeader responseHeader) {
	this.responseHeader = responseHeader;
}
public int getTotalRecords() {
	return totalRecords;
}
public void setTotalRecords(int totalRecords) {
	this.totalRecords = totalRecords;
}
public CustomerShoppingList getShoppingObj() {
	return shoppingObj;
}
public void setShoppingObj(CustomerShoppingList shoppingObj) {
	this.shoppingObj = shoppingObj;
}
public List<CustomerShoppingList> getShoppingLists() {
	return shoppingLists;
}
public void setShoppingLists(List<CustomerShoppingList> shoppingLists) {
	this.shoppingLists = shoppingLists;
}
 
 
}
