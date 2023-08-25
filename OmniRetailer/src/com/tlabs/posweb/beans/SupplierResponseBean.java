/*******************************************************************************
 * Copyright  2015 Omni Retailer Services, All rights reserved.
 * Author : Mythri.Sabath
 * Created On : 2-3-2015
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


public class SupplierResponseBean {

	private ResponseHeader responseHeader;
	private int totalRecords;
	private List<SupplierProducts> supplierProductsList;
	private SupplierMaster supplierMaster;
	private List<SupplierMaster> suppliers;
	private List<String>supplierList;

	private Map<String,Double> skulist;
	private Map<String,Double>avgSales;
	
	
	
	public Map<String, Double> getAvgSales() {
		return avgSales;
	}

	public void setAvgSales(Map<String, Double> avgSales) {
		this.avgSales = avgSales;
	}

	public Map<String, Double> getSkulist() {
		return skulist;
	}

	public void setSkulist(Map<String, Double> skulist) {
		this.skulist = skulist;
	}

	public List<String> getSupplierList() {
		return supplierList;
	}

	public void setSupplierList(List<String> supplierList) {
		this.supplierList = supplierList;
	}

	public List<SupplierMaster> getSuppliers() {
		return suppliers;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	 

	 
	public List<SupplierProducts> getSupplierProductsList() {
		return supplierProductsList;
	}

	public void setSupplierProductsList(List<SupplierProducts> supplierProductsList) {
		this.supplierProductsList = supplierProductsList;
	}

	public SupplierMaster getSupplierMaster() {
		return supplierMaster;
	}

	public void setSupplierMaster(SupplierMaster supplierMaster) {
		this.supplierMaster = supplierMaster;
	}

	public void setSuppliers(List<SupplierMaster> suppliers) {
		this.suppliers = suppliers;
	}

	
	
	
}
