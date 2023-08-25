package com.tlabs.posweb.beans;

import java.util.List;

public class SearchProductResponse {

	private ProductsList[] productsList;
	
	private int totalRecords; 
	private ResponseHeader responseHeader;
	private List<ProductsList> skuLists;
	private List<ProductsList> skuIdList;
	
	private List<SkuPriceList> skuPriceList;
	
	public List<SkuPriceList> getSkuPriceList() {
		return skuPriceList;
	}

	public void setSkuPriceList(List<SkuPriceList> skuPriceList) {
		this.skuPriceList = skuPriceList;
	}

	public ProductsList[] getProductsList() {
		return productsList;
	}

	public void setProductsList(ProductsList[] productsList) {
		this.productsList = productsList;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	@Override
	public String toString() {
		return "ClassPojo [productsList = " + productsList + ", responseHeader = " + responseHeader + "]";
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<ProductsList> getSkuLists() {
		return skuLists;
	}

	public void setSkuLists(List<ProductsList> skuLists) {
		this.skuLists = skuLists;
	}

	public List<ProductsList> getSkuIdList() {
		return skuIdList;
	}

	public void setSkuIdList(List<ProductsList> skuIdList) {
		this.skuIdList = skuIdList;
	}

}
