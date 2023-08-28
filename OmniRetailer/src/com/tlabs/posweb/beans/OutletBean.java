/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 16-3-2015
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

/**
 * @author Sahitya
 * Verified By : 
 * 
 * This bean class is used to receive outlet related details from controller then send to webservices for creating outlet
 */
public class OutletBean {
	
	
	private String locationId;
	
	private String storeName;
	
	private String phone;
	
	private String fax;
	private String storeCode;
    private RequestHeader requestHeader;
    private ResponseHeader responseHeader;
    private String storeDetails;
    private String layoutDetails;
    
    
   public String getStoreDetails() {
		return storeDetails;
	}
	public void setStoreDetails(String storeDetails) {
		this.storeDetails = storeDetails;
	}
	public String getLayoutDetails() {
		return layoutDetails;
	}
	public void setLayoutDetails(String layoutDetails) {
		this.layoutDetails = layoutDetails;
	}
public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
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
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	
	public String getLocationId() {
		return locationId;
	}
	public void setLocationId(String locationId) {
		this.locationId = locationId;
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
	

}
