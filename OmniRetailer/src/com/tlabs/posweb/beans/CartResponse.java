package com.tlabs.posweb.beans;

import java.util.List;

public class CartResponse {
	
private ResponseHeader responseHeader;
private Cart cartObj;
private List<Cart> cartList;
private String totalRecords;
private String filePath;
private int cartItemsSize;



public String getFilePath() {
	return filePath;
}
public void setFilePath(String filePath) {
	this.filePath = filePath;
}
public ResponseHeader getResponseHeader() {
	return responseHeader;
}
public void setResponseHeader(ResponseHeader responseHeader) {
	this.responseHeader = responseHeader;
}
public Cart getCartObj() {
	return cartObj;
}
public void setCartObj(Cart cartObj) {
	this.cartObj = cartObj;
}
public List<Cart> getCartList() {
	return cartList;
}
public void setCartList(List<Cart> cartList) {
	this.cartList = cartList;
}
public String getTotalRecords() {
	return totalRecords;
}
public void setTotalRecords(String totalRecords) {
	this.totalRecords = totalRecords;
}

public int getCartItemsSize() {
	return cartItemsSize;
}
public void setCartItemsSize(int cartItemsSize) {
	this.cartItemsSize = cartItemsSize;
}

}
