package com.tlabs.posweb.beans;

import java.util.Date;



public class StoreFacilities {

	private int autoNum;
	
	private String businessCategory;


	private String businessSubCategory;
	public String getBusinessCategory() {
		return businessCategory;
	}

	public void setBusinessCategory(String businessCategory) {
		this.businessCategory = businessCategory;
	}

	public String getBusinessSubCategory() {
		return businessSubCategory;
	}

	public void setBusinessSubCategory(String businessSubCategory) {
		this.businessSubCategory = businessSubCategory;
	}

	private String storeCode;
	private String storeLocation;
	private String buildingName;
	private String facilityCategory;
	private int levels;
	private String remarks;
	private Date date;
	public int getAutoNum() {
		return autoNum;
	}

	public void setAutoNum(int autoNum) {
		this.autoNum = autoNum;
	}

	public String getStoreCode() {
		return storeCode;
	}

	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	
	public String getFacilityCategory() {
		return facilityCategory;
	}

	public void setFacilityCategory(String facilityCategory) {
		this.facilityCategory = facilityCategory;
	}

	public int getLevels() {
		return levels;
	}

	public void setLevels(int levels) {
		this.levels = levels;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
}
