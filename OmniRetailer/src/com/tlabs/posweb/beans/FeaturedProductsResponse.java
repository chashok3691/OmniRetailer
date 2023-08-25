package com.tlabs.posweb.beans;

import java.util.List;

public class FeaturedProductsResponse {
	private ResponseHeader responseHeader;
	private int totalRecords;
	private List<FeaturedProducts> productsList;
	private FeaturedProducts productObj;
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
	public List<FeaturedProducts> getProductsList() {
		return productsList;
	}
	public void setProductsList(List<FeaturedProducts> productsList) {
		this.productsList = productsList;
	}
	public FeaturedProducts getProductObj() {
		return productObj;
	}
	public void setProductObj(FeaturedProducts productObj) {
		this.productObj = productObj;
	}
	
}
