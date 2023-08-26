/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 17-3-2015
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
 * This class is used to send outlet settings details to webservices
 */
public class OutletSettings {

	    private String location;
		private String currency;
		private String language;
		private boolean remoteBilling;
		private boolean foodCoupons;
		private String minPayAmount;
		private boolean printing;
		private String storeName;
		private String startTime;
		private String endTime;
		private String userId;
		private String requiredRecords;
		private List<Tax> taxes;

		private String email;
		private String street;
		private String locality;
		private String phone;
		private String zoneId;
		private String 	outletType;
		
		public String getMinPayAmount() {
			return minPayAmount;
		}

		public void setMinPayAmount(String minPayAmount) {
			this.minPayAmount = minPayAmount;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getStreet() {
			return street;
		}

		public void setStreet(String street) {
			this.street = street;
		}

		public String getLocality() {
			return locality;
		}

		public void setLocality(String locality) {
			this.locality = locality;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getZoneId() {
			return zoneId;
		}

		public void setZoneId(String zoneId) {
			this.zoneId = zoneId;
		}

		public String getOutletType() {
			return outletType;
		}

		public void setOutletType(String outletType) {
			this.outletType = outletType;
		}

		private String counterType; 
		private boolean activeStatus;
		public String getCounterType() {
			return counterType;
		}

		public void setCounterType(String counterType) {
			this.counterType = counterType;
		}

		public boolean isActiveStatus() {
			return activeStatus;
		}

		public void setActiveStatus(boolean activeStatus) {
			this.activeStatus = activeStatus;
		}

		private String gpsLongitude;
		public String getGpsLongitude() {
			return gpsLongitude;
		}

		public void setGpsLongitude(String gpsLongitude) {
			this.gpsLongitude = gpsLongitude;
		}

		public String getGpsLatitude() {
			return gpsLatitude;
		}

		public void setGpsLatitude(String gpsLatitude) {
			this.gpsLatitude = gpsLatitude;
		}

		public String getStartIndex() {
			return startIndex;
		}

		public void setStartIndex(String startIndex) {
			this.startIndex = startIndex;
		}

		public List<OutletSettings> getOutletSettingsObj() {
			return outletSettingsObj;
		}

		public void setOutletSettingsObj(List<OutletSettings> outletSettingsObj) {
			this.outletSettingsObj = outletSettingsObj;
		}

		private String gpsLatitude;
		private String startIndex;
		private List<OutletSettings> outletSettingsObj;
		private List<OutletSettings> outletSettingsList;
		private boolean offlineDuplicateBill;
		private boolean creditNoteMultipleClaims;
		private boolean counterOTP;
		private String  companyOwned;
		
		
		
	public boolean isCreditNoteMultipleClaims() {
			return creditNoteMultipleClaims;
		}

		public void setCreditNoteMultipleClaims(boolean creditNoteMultipleClaims) {
			this.creditNoteMultipleClaims = creditNoteMultipleClaims;
		}

	public String getCompanyOwned() {
			return companyOwned;
		}

		public void setCompanyOwned(String companyOwned) {
			this.companyOwned = companyOwned;
		}

	public List<OutletSettings> getOutletSettingsList() {
			return outletSettingsList;
		}

		public void setOutletSettingsList(List<OutletSettings> outletSettingsList) {
			this.outletSettingsList = outletSettingsList;
		}

	public boolean isOfflineDuplicateBill() {
			return offlineDuplicateBill;
		}

		public void setOfflineDuplicateBill(boolean offlineDuplicateBill) {
			this.offlineDuplicateBill = offlineDuplicateBill;
		}

		public boolean isCounterOTP() {
			return counterOTP;
		}

		public void setCounterOTP(boolean counterOTP) {
			this.counterOTP = counterOTP;
		}

	private RequestHeader requestHeader;

	private ResponseHeader responseHeader;
	
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
		public List<Tax> getTaxes() {
			return taxes;
		}

		public void setTaxes(List<Tax> taxes) {
			this.taxes = taxes;
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

		
		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

	

		public String getStoreName() {
			return storeName;
		}

		public void setStoreName(String storeName) {
			this.storeName = storeName;
		}

		public String getLocation() {
			return location;
		}

		public void setLocation(String location) {
			this.location = location;
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

		public String getMinPayAmmount() {
			return minPayAmount;
		}

		public void setMinPayAmmount(String minPayAmmount) {
			this.minPayAmount = minPayAmmount;
		}

		public boolean isPrinting() {
			return printing;
		}

		public void setPrinting(boolean printing) {
			this.printing = printing;
		}

		public String getRequiredRecords() {
			return requiredRecords;
		}

		public void setRequiredRecords(String requiredRecords) {
			this.requiredRecords = requiredRecords;
		}
		
		
	
}
