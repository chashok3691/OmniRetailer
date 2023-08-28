/*******************************************************************************
 * Copyright  2015 Omni Retailer Services, All rights reserved.
 * Author : Mythri.Sabath
 * Created On : 28-2-2015
 * 
 * Licensed under the Technolabs Software License, Version 1.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.technolabssoftware.com/pages/privacy-policy/
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;



public class SupplierMaster {

	
	private String supplierCode;
	
	private String firmName;

	
	private String plotNo;

	private String streetName;

	private String city;

	private String zipCode;

	private String countryCode;

	private String currencyCode;

	private String emailId;

	private String websiteUrl;

	private String phone;

	private String mobile;

	private String fax;

	private String paymentTerms;

	private String shipmentMode;

	private String shipmentTerms;

	private Integer minOrderCost;

	private Integer minQuantity;

	private Integer leadTime;

	private String uom;

	private String targetOrderValue;

	private Float rFactor;

	private Float maxFactor;

	private Float rating;

	private Date createdDate;

	private Date updatedDate;

	private String userName;

	private String roleName;

	private String gstn_num;
	
	
	private boolean isProductRestrictions;
	
	
	private boolean status;
	
	private String skuId;

	private String storeLocation;
	
	private List<SupplierAddresses> supplierAddresses;
	
	private String fofoReference;

	
	
	
	public String getFofoReference() {
		return fofoReference;
	}

	public void setFofoReference(String fofoReference) {
		this.fofoReference = fofoReference;
	}

	public List<SupplierAddresses> getSupplierAddresses() {
		return supplierAddresses;
	}

	public void setSupplierAddresses(List<SupplierAddresses> supplierAddresses) {
		this.supplierAddresses = supplierAddresses;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public boolean isProductRestrictions() {
		return isProductRestrictions;
	}

	public void setProductRestrictions(boolean isProductRestrictions) {
		this.isProductRestrictions = isProductRestrictions;
	}

	public String getGstn_num() {
		return gstn_num;
	}

	public void setGstn_num(String gstn_num) {
		this.gstn_num = gstn_num;
	}

/*	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "supplier_code" ,nullable = false, updatable = false)
	private List<SupplierProducts> supplierProducts;*/
	
	private List<SupplierProducts> supplierProducts;

	private RequestHeader requestHeader;

	private String createdDateStr;

	private String updatedDateStr;

	private String startDateStr;

	private String endDateStr;

	private String maxRecords;

	private String productRange;

	private String productRating;

	private Integer pageNo;

	/*@Transient
	private String userId;*/

	/* for header information */
	/*@Transient
	private String userName;
	
	@Transient
	private String accessKey;
	
	@Transient
	private String applicationName;
	
	@Transient
	private String dateAndTime;
	
	@Transient
	private String correlationId;
	*/
	private Integer startIndex;

	private String searchCriteria;

	private List<String> supplierCodes;
	
	private String supplierCity;
	

	public String getSupplierCity() {
		return supplierCity;
	}

	public void setSupplierCity(String supplierCity) {
		this.supplierCity = supplierCity;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public void setLeadTime(Integer leadTime) {
		this.leadTime = leadTime;
	}

	public void setrFactor(Float rFactor) {
		this.rFactor = rFactor;
	}

	public void setMaxFactor(Float maxFactor) {
		this.maxFactor = maxFactor;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	public List<String> getSupplierCodes() {
		return supplierCodes;
	}

	public void setSupplierCodes(List<String> supplierCodes) {
		this.supplierCodes = supplierCodes;
	}

	public Integer getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(Integer startIndex) {
		this.startIndex = startIndex;
	}

	public String getSupplierCode() {
		return supplierCode;
	}

	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}

	public Float getRating() {
		return rating;
	}

	public void setRating(Float rating) {
		this.rating = rating;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getFirmName() {
		return firmName;
	}

	public void setFirmName(String firmName) {
		this.firmName = firmName;
	}

	public String getPlotNo() {
		return plotNo;
	}

	public void setPlotNo(String plotNo) {
		this.plotNo = plotNo;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getCurrencyCode() {
		return currencyCode;
	}

	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getWebsiteUrl() {
		return websiteUrl;
	}

	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getPaymentTerms() {
		return paymentTerms;
	}

	public void setPaymentTerms(String paymentTerms) {
		this.paymentTerms = paymentTerms;
	}

	public String getShipmentMode() {
		return shipmentMode;
	}

	public void setShipmentMode(String shipmentMode) {
		this.shipmentMode = shipmentMode;
	}

	public String getShipmentTerms() {
		return shipmentTerms;
	}

	public void setShipmentTerms(String shipmentTerms) {
		this.shipmentTerms = shipmentTerms;
	}

	public int getLeadTime() {
		return leadTime;
	}

	public Integer getMinOrderCost() {
		return minOrderCost;
	}

	public void setMinOrderCost(Integer minOrderCost) {
		this.minOrderCost = minOrderCost;
	}

	public Integer getMinQuantity() {
		return minQuantity;
	}

	public void setMinQuantity(Integer minQuantity) {
		this.minQuantity = minQuantity;
	}

	public void setLeadTime(int leadTime) {
		this.leadTime = leadTime;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getTargetOrderValue() {
		return targetOrderValue;
	}

	public void setTargetOrderValue(String targetOrderValue) {
		this.targetOrderValue = targetOrderValue;
	}

	public String getCity() {
		return city;
	}

	public Float getrFactor() {
		return rFactor;
	}

	public Float getMaxFactor() {
		return maxFactor;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public List<SupplierProducts> getSupplierProducts() {
		return supplierProducts;
	}

	public void setSupplierProducts(List<SupplierProducts> supplierProducts) {
		this.supplierProducts = supplierProducts;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getCreatedDateStr() {
		return createdDateStr;
	}

	public void setCreatedDateStr(String createdDateStr) {
		this.createdDateStr = createdDateStr;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

	public String getUpdatedDateStr() {
		return updatedDateStr;
	}

	public void setUpdatedDateStr(String updatedDateStr) {
		this.updatedDateStr = updatedDateStr;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getProductRange() {
		return productRange;
	}

	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}

	public String getProductRating() {
		return productRating;
	}

	public void setProductRating(String productRating) {
		this.productRating = productRating;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

}
