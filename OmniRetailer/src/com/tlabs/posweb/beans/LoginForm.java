/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Mythri.Sabath
 * Created On : 20-1-2015
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
import java.util.Map;


/**
 * 
 * @author Mythri.S
 * Modified by Sahitya on 27-3-2015 
 * 
 *	This bean class is used to communicate the Login Details between the services and clients
 *
 */

public class LoginForm{
	
	private String emailId;
	private String customerId;
	private String password;
	private RequestHeader requestHeader;
	private String role;
	private String language;
	private String firstName;
	private ResponseHeader responseHeader;
	private String status;
	private List<Role> roles;
	private Map<String,List<AccessControl>> accessControlList;
	private List<LicenseDetails> licenseDetails;
	
	private boolean warehouseLicense;
	private String logo;
	private String businessName;
	private IntegrationSettings b2cSettings;
	private String captchaPassword;
	private boolean multipleUserAccessDB;
	private IntegrationSettings googleApi;
	private boolean restaruntLicense;
	private List<String> fieldNames;
	private String uuid;
	
	
	
	
	
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public List<String> getFieldNames() {
		return fieldNames;
	}
	public void setFieldNames(List<String> fieldNames) {
		this.fieldNames = fieldNames;
	}
	public boolean isRestaruntLicense() {
		return restaruntLicense;
	}
	public void setRestaruntLicense(boolean restaruntLicense) {
		this.restaruntLicense = restaruntLicense;
	}
	public boolean isMultipleUserAccessDB() {
		return multipleUserAccessDB;
	}
	public void setMultipleUserAccessDB(boolean multipleUserAccessDB) {
		this.multipleUserAccessDB = multipleUserAccessDB;
	}
	public IntegrationSettings getB2cSettings() {
		return b2cSettings;
	}
	public void setB2cSettings(IntegrationSettings b2cSettings) {
		this.b2cSettings = b2cSettings;
	}
	public IntegrationSettings getGoogleApi() {
		return googleApi;
	}
	public void setGoogleApi(IntegrationSettings googleApi) {
		this.googleApi = googleApi;
	}
	public String getCaptchaPassword() {
		return captchaPassword;
	}
	public void setCaptchaPassword(String captchaPassword) {
		this.captchaPassword = captchaPassword;
	}
	private Map<String,List<ActivityAccessControl>> activityAccessControlList;
	private String geoLocation;
	private List<String> roleLocationsList;
	
	public Map<String, List<ActivityAccessControl>> getActivityAccessControlList() {
		return activityAccessControlList;
	}
	public void setActivityAccessControlList(Map<String, List<ActivityAccessControl>> activityAccessControlList) {
		this.activityAccessControlList = activityAccessControlList;
	}
	public String getBusinessName() {
		return businessName;
	}
	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public boolean isWarehouseLicense() {
		return warehouseLicense;
	}
	public void setWarehouseLicense(boolean warehouseLicense) {
		this.warehouseLicense = warehouseLicense;
	}
	public List<LicenseDetails> getLicenseDetails() {
		return licenseDetails;
	}
	public void setLicenseDetails(List<LicenseDetails> licenseDetails) {
		this.licenseDetails = licenseDetails;
	}
	public Map<String, List<AccessControl>> getAccessControlList() {
		return accessControlList;
	}
	public void setAccessControlList(
			Map<String, List<AccessControl>> accessControlList) {
		this.accessControlList = accessControlList;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public String getGeoLocation() {
		return geoLocation;
	}
	public void setGeoLocation(String geoLocation) {
		this.geoLocation = geoLocation;
	}
	public List<String> getRoleLocationsList() {
		return roleLocationsList;
	}
	public void setRoleLocationsList(List<String> roleLocationsList) {
		this.roleLocationsList = roleLocationsList;
	}
	
}
