package com.tlabs.posweb.beans;
import java.util.Date;
import java.util.List;
public class BrandMaster {
	private String bName;
	private String bDescription;
	private String manufacturer;
	private String supplier;
    private String brandCategory;
	private Date dateTime;
	private String customerGroup;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private List<String> bNames;
	private String startIndex;
	private String maxRecords;
	private String searchCriteria;
	private String totalRecords;
	private List<BrandMaster> brandDetails;
	private List<BrandProductRange> brandproduct;
	private List<BrandPriceRange> brandprice;
	private int slNo;
	private boolean b2cBrand;

	
	public boolean isB2cBrand() {
		return b2cBrand;
	}
	public void setB2cBrand(boolean b2cBrand) {
		this.b2cBrand = b2cBrand;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	
	public String getbDescription() {
		return bDescription;
	}

	public void setbDescription(String bDescription) {
		this.bDescription = bDescription;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public Date getDateTime() {
		return dateTime;
	}

	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
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

	public String getBrandCategory() {
		return brandCategory;
	}

	public void setBrandCategory(String brandCategory) {
		this.brandCategory = brandCategory;
	}

	public List<BrandProductRange> getBrandproduct() {
		return brandproduct;
	}

	public void setBrandproduct(List<BrandProductRange> brandproduct) {
 		this.brandproduct = brandproduct;
 	}

	public List<BrandPriceRange> getBrandprice() {
		return brandprice;
	} 

	public void setBrandprice(List<BrandPriceRange> brandprice) {
		this.brandprice = brandprice;
	}

	public List<String> getbNames() {
		return bNames;
	}

	public void setbNames(List<String> bNames) {
		this.bNames = bNames;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getCustomerGroup() {
		return customerGroup;
	}

	public void setCustomerGroup(String customerGroup) {
		this.customerGroup = customerGroup;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public List<BrandMaster> getBrandDetails() {
		return brandDetails;
	}

	public void setBrandDetails(List<BrandMaster> brandDetails) {
		this.brandDetails = brandDetails;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

 
}
