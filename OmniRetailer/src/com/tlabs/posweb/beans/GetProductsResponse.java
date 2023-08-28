/*
 * 
 */
package com.tlabs.posweb.beans;

import java.util.List;


// TODO: Auto-generated Javadoc
/**
 * The Class GetProductsResponse.
 */
@SuppressWarnings("rawtypes")
public class GetProductsResponse {

	/** The response header. */
	private ResponseHeader responseHeader;
	
	private int totalRecords=0;
	
	private List<WarehouseSkuPriceList> warehouseSkuPriceLists;
	
	private String url;
	
	
	
	
	
	

	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public List<WarehouseSkuPriceList> getWarehouseSkuPriceLists() {
		return warehouseSkuPriceLists;
	}
	public void setWarehouseSkuPriceLists(List<WarehouseSkuPriceList> warehouseSkuPriceLists) {
		this.warehouseSkuPriceLists = warehouseSkuPriceLists;
	}
	
	
	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	private  String fileUrl;
	/** The products list. */
	//private List productsList;
	private List<ProductsList> productsList;

	
	public List<ProductsList> getProductsList() {
		return productsList;
	}
	public void setProductsList(List<ProductsList> productsList) {
		this.productsList = productsList;
	}
	/**
	 * Gets the response header.
	 *
	 * @return the response header
	 */
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	/**
	 * Sets the response header.
	 *
	 * @param responseHeader the new response header
	 */
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	
	
	

}
