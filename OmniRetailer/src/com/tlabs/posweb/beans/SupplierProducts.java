package com.tlabs.posweb.beans;

import java.util.List;

import com.technolabssoftware.www.FileUploader;

//import java.util.Date;



public class SupplierProducts {

	private String sNo;
	private String supplierCode;

	private String skuId;
	private String uom;

/*	private Date skuLeadTime;*/

	private float minQuantity;

	private float maxQuantity;
	private String skuDescription;
	private String productRange;

	private String grade;

	private String colour;

	private String size;

	private String pattern;

	private float price;
	private float costPrice;

	private int productRating;

	private String pluCode;
/*	private Date createdDate;

	private Date updatedDate;*/
	private FileUploader file;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	
	private String fileName;
	private String storeLocation;
	private String supplierSkuId;
	
	  private List<Integer> headerPositionsList;
	  
	  
	  
	  
		
		
			public List<Integer> getHeaderPositionsList() {
			return headerPositionsList;
		}

		public void setHeaderPositionsList(List<Integer> headerPositionsList) {
			this.headerPositionsList = headerPositionsList;
		}

	
	
	
	
	public String getSupplierSkuId() {
		return supplierSkuId;
	}

	public void setSupplierSkuId(String supplierSkuId) {
		this.supplierSkuId = supplierSkuId;
	}

	public FileUploader getFile() {
		return file;
	}

	public void setFile(FileUploader file) {
		this.file = file;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	

	public String getPluCode() {
		return pluCode;
	}

	public float getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(float costPrice) {
		this.costPrice = costPrice;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getsNo() {
		return sNo;
	}

	public void setsNo(String sNo) {
		this.sNo = sNo;
	}

	public String getSupplierCode() {
		return supplierCode;
	}

	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}



	public float getMinQuantity() {
		return minQuantity;
	}

	public void setMinQuantity(float minQuantity) {
		this.minQuantity = minQuantity;
	}

	public float getMaxQuantity() {
		return maxQuantity;
	}

	public void setMaxQuantity(float maxQuantity) {
		this.maxQuantity = maxQuantity;
	}

	public String getProductRange() {
		return productRange;
	}

	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getColour() {
		return colour;
	}

	public void setColour(String colour) {
		this.colour = colour;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getPattern() {
		return pattern;
	}

	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getProductRating() {
		return productRating;
	}

	public void setProductRating(int productRating) {
		this.productRating = productRating;
	}

	public String getSkuDescription() {
		return skuDescription;
	}

	public void setSkuDescription(String skuDescription) {
		this.skuDescription = skuDescription;
	}



}
