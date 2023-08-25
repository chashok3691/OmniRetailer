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

/*
 * This class is used to receive/send tax related details 
 */
public class Tax {
	
	private String autoNumber;
	
	private String location;
	
	private String taxName;

	private String taxType;
	
	private Float taxRate;

	private String taxId;

	public String getAutoNumber() {
		return autoNumber;
	}

	public void setAutoNumber(String autoNumber) {
		this.autoNumber = autoNumber;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTaxName() {
		return taxName;
	}

	public void setTaxName(String taxName) {
		this.taxName = taxName;
	}

	public String getTaxType() {
		return taxType;
	}

	public void setTaxType(String taxType) {
		this.taxType = taxType;
	}

	

	public Float getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(Float taxRate) {
		this.taxRate = taxRate;
	}

	public String getTaxId() {
		return taxId;
	}

	public void setTaxId(String taxId) {
		this.taxId = taxId;
	}

	
	

	
	

}
