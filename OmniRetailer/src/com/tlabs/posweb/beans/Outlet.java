/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 11-3-2015
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

import java.util.List;

/**
 * @author Sahitya
 * Verified By :
 * 
 * This class is used to receive/send outlet related details from GUI then send to web services
 */
public class Outlet {

	private String storeName;
	private String storeCode;
	
	private String location;
	private String phone;
	private String fax;
	
	private String status;
	private String currency;
	private String language;
	private boolean remoteBilling;
	private boolean foodCoupons;
	
	private String minPayAmount;
	private boolean printing;
	private String startTime;
	private String endTime;
	private List<Tax> taxDetails;
	private List<OutletStorageSystem> storageSystems;
    private RequestHeader requestHeader;
	private String storages;
	private ResponseHeader responseHeader;
	
	//private boolean dayStartSync;
	
	
	/*public boolean isDayStartSync() {
		return dayStartSync;
	}

	public void setDayStartSync(boolean dayStartSync) {
		this.dayStartSync = dayStartSync;
	}*/

	public String getStorages() {
		return storages;
	}

	public void setStorages(String storages) {
		this.storages = storages;
	}

	public List<OutletStorageSystem> getStorageSystems() {
		return storageSystems;
	}

	public void setStorageSystems(List<OutletStorageSystem> storageSystems) {
		this.storageSystems = storageSystems;
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

	private String userId;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getMinPayAmount() {
		return minPayAmount;
	}
	public void setMinPayAmount(String minPayAmount) {
		this.minPayAmount = minPayAmount;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	public List<Tax> getTaxDetails() {
		return taxDetails;
	}
	public void setTaxDetails(List<Tax> taxDetails) {
		this.taxDetails = taxDetails;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public boolean isRemoteBilling() {
		return remoteBilling;
	}
	public void setRemoteBilling(boolean remoteBilling) {
		this.remoteBilling = remoteBilling;
	}
	public boolean isFoodCoupons() {
		return foodCoupons;
	}
	public void setFoodCoupons(boolean foodCoupons) {
		this.foodCoupons = foodCoupons;
	}

	public boolean isPrinting() {
		return printing;
	}
	public void setPrinting(boolean printing) {
		this.printing = printing;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	
	
}
