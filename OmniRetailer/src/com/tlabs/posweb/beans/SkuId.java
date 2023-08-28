package com.tlabs.posweb.beans;

import java.util.List;

/**
 * updated by chaitanya 11 April 2016
 * added few new fields as per service update .
 * 
 * 
 * @author kalyankumar
 * new arrivals response
 */
public class SkuId {

// following fields added by kesav
private ResponseHeader responseHeader;
private String skuId;
private String pluCode;
private String skuName;
private String productCategory;
private String productSubCategory;
private String department;
private String brand;
private String price;
private String picture1;
private String picture2;
private String picture3;
private String minSaleQty;
private String stockStatus;
private String customerRating;
private String productDescription;
private String skuDescription;
private List<SkuId> skuIdList;
private int totalRecords;
private String salePrice;
private String productId;
private String taxCode="1";
private String taxValue="2";
private String uom;
private String status;

private List<Sku> skuList;



public List<Sku> getSkuList() {
	return skuList;
}
public void setSkuList(List<Sku> skuList) {
	this.skuList = skuList;
}
private String ean;

public String getEan() {
	return ean;
}
public void setEan(String ean) {
	this.ean = ean;
}
private	RequestHeader requestHeader;
public void setSkuId(String skuId){
	this.skuId=skuId;
}
public String getSkuId(){
	return skuId;
}
public void setRequestHeader(RequestHeader requestHeader){
	this.requestHeader=requestHeader;
}
public RequestHeader getRequestHeader(){
	return requestHeader;
}
public ResponseHeader getResponseHeader() {
	return responseHeader;
}
public void setResponseHeader(ResponseHeader responseHeader) {
	this.responseHeader = responseHeader;
}
public String getSkuName() {
	return skuName;
}
public void setSkuName(String skuName) {
	this.skuName = skuName;
}
public String getProductCategory() {
	return productCategory;
}
public void setProductCategory(String productCategory) {
	this.productCategory = productCategory;
}
public String getProductSubCategory() {
	return productSubCategory;
}
public void setProductSubCategory(String productSubCategory) {
	this.productSubCategory = productSubCategory;
}
public String getDepartment() {
	return department;
}
public void setDepartment(String department) {
	this.department = department;
}
public String getBrand() {
	return brand;
}
public void setBrand(String brand) {
	this.brand = brand;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
public String getPicture1() {
	return picture1;
}
public void setPicture1(String picture1) {
	this.picture1 = picture1;
}
public String getPicture2() {
	return picture2;
}
public void setPicture2(String picture2) {
	this.picture2 = picture2;
}
public String getPicture3() {
	return picture3;
}
public void setPicture3(String picture3) {
	this.picture3 = picture3;
}
public String getMinSaleQty() {
	return minSaleQty;
}
public void setMinSaleQty(String minSaleQty) {
	this.minSaleQty = minSaleQty;
}
public String getStockStatus() {
	return stockStatus;
}
public void setStockStatus(String stockStatus) {
	this.stockStatus = stockStatus;
}
public String getSkuDescription() {
	return skuDescription;
}
public void setSkuDescription(String skuDescription) {
	this.skuDescription = skuDescription;
}
public String getProductDescription() {
	return productDescription;
}
public void setProductDescription(String productDescription) {
	this.productDescription = productDescription;
}
public String getCustomerRating() {
	return customerRating;
}
public void setCustomerRating(String customerRating) {
	this.customerRating = customerRating;
}
public List<SkuId> getSkuIdList() {
	return skuIdList;
}
public void setSkuIdList(List<SkuId> skuIdList) {
	this.skuIdList = skuIdList;
}
public int getTotalRecords() {
	return totalRecords;
}
public void setTotalRecords(int totalRecords) {
	this.totalRecords = totalRecords;
}
public String getTaxCode() {
	return taxCode;
}
public void setTaxCode(String taxCode) {
	this.taxCode = taxCode;
}
public String getTaxValue() {
	return taxValue;
}
public void setTaxValue(String taxValue) {
	this.taxValue = taxValue;
}
public String getSalePrice() {
	return salePrice;
}
public void setSalePrice(String salePrice) {
	this.salePrice = salePrice;
}
public String getProductId() {
	return productId;
}
public void setProductId(String productId) {
	this.productId = productId;
}
public String getPluCode() {
	return pluCode;
}
public void setPluCode(String pluCode) {
	this.pluCode = pluCode;
}
public String getUom() {
	return uom;
}
public void setUom(String uom) {
	this.uom = uom;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}


}
