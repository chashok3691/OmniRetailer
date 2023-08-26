package com.tlabs.posweb.beans;

import java.io.Serializable;
import java.util.List;

public class ProductSubCategoryBean implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2593843305467355441L;
	private RequestHeader requestHeader;
	private String categoryName;
	private String subcategoryName;
	private String subcategoryDescription;
	private String startIndex;
	private List<String> subCategoryList;
	private String totalRecords;
	private String searchCriteria;
	private List<String> categoryList;
	private List<String> brandList;
	private int slNo;
	private List<ProductSubcategorySections> subcategorySections;
	private String image;
	private String imageId;
	
	private String maxRecords;
	
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
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
	public String getSubcategoryDescription() {
		return subcategoryDescription;
	}
	public void setSubcategoryDescription(String subcategoryDescription) {
		this.subcategoryDescription = subcategoryDescription;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getSubcategoryName() {
		return subcategoryName;
	}
	public void setSubcategoryName(String subcategoryName) {
		this.subcategoryName = subcategoryName;
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
	public List<String> getSubCategoryList() {
		return subCategoryList;
	}
	public void setSubCategoryList(List<String> subCategoryList) {
		this.subCategoryList = subCategoryList;
	}
	public List<ProductSubcategorySections> getSubcategorySections() {
		return subcategorySections;
	}
	public void setSubcategorySections(List<ProductSubcategorySections> subcategorySections) {
		this.subcategorySections = subcategorySections;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getImageId() {
		return imageId;
	}
	public void setImageId(String imageId) {
		this.imageId = imageId;
	}
	public List<String> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<String> categoryList) {
		this.categoryList = categoryList;
	}
	public List<String> getBrandList() {
		return brandList;
	}
	public void setBrandList(List<String> brandList) {
		this.brandList = brandList;
	}
	
	
}
