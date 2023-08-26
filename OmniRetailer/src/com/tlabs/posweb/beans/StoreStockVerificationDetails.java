/*******************************************************************************
 * Copyright  2015 Omni Retailer Customer Console, All rights reserved.
 * Author : Sahitya
 * Created On : 20-4-2015
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
 * This class is used to receive store stock verification related item details from webservices
 */
/**
 * @author Mythri
 *
 */
public class StoreStockVerificationDetails {

	
	
	private int s_no;

	private String verification_code;

	private String product_id;

	private String sku_id;

	private int product_book_stock;

	private int product_physical_stock;

	private int stock_loss;

	private String loss_type;

	private String remarks;

	private int sku_book_stock;

	private int sku_physical_stock;

	private int sku_allocated;

	private int sku_reordered_qty;

	private String sku_reordered_date;

	private String sku_replenishment_date;

	private String storage_unit;
	private int slNo;
	private RequestHeader requestHeader;
	private String startIndex;
	private String maxRecords;
	private ResponseHeader responseHeader;
	private List<StoreStockVerificationDetails> verificationItemsList;
	private String totalRecords;
	private String description;
	 
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
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

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public List<StoreStockVerificationDetails> getVerificationItemsList() {
		return verificationItemsList;
	}

	public void setVerificationItemsList(List<StoreStockVerificationDetails> verificationItemsList) {
		this.verificationItemsList = verificationItemsList;
	}

	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getVerification_code() {
		return verification_code;
	}

	public void setVerification_code(String verification_code) {
		this.verification_code = verification_code;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getSku_id() {
		return sku_id;
	}

	public void setSku_id(String sku_id) {
		this.sku_id = sku_id;
	}

	public int getProduct_book_stock() {
		return product_book_stock;
	}

	public void setProduct_book_stock(int product_book_stock) {
		this.product_book_stock = product_book_stock;
	}

	public int getProduct_physical_stock() {
		return product_physical_stock;
	}

	public void setProduct_physical_stock(int product_physical_stock) {
		this.product_physical_stock = product_physical_stock;
	}

	public int getStock_loss() {
		return stock_loss;
	}

	public void setStock_loss(int stock_loss) {
		this.stock_loss = stock_loss;
	}

	public String getLoss_type() {
		return loss_type;
	}

	public void setLoss_type(String loss_type) {
		this.loss_type = loss_type;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public int getSku_book_stock() {
		return sku_book_stock;
	}

	public void setSku_book_stock(int sku_book_stock) {
		this.sku_book_stock = sku_book_stock;
	}

	public int getSku_physical_stock() {
		return sku_physical_stock;
	}

	public void setSku_physical_stock(int sku_physical_stock) {
		this.sku_physical_stock = sku_physical_stock;
	}

	public int getSku_allocated() {
		return sku_allocated;
	}

	public void setSku_allocated(int sku_allocated) {
		this.sku_allocated = sku_allocated;
	}

	public int getSku_reordered_qty() {
		return sku_reordered_qty;
	}

	public void setSku_reordered_qty(int sku_reordered_qty) {
		this.sku_reordered_qty = sku_reordered_qty;
	}

	public String getSku_reordered_date() {
		return sku_reordered_date;
	}

	public void setSku_reordered_date(String sku_reordered_date) {
		this.sku_reordered_date = sku_reordered_date;
	}

	public String getSku_replenishment_date() {
		return sku_replenishment_date;
	}

	public void setSku_replenishment_date(String sku_replenishment_date) {
		this.sku_replenishment_date = sku_replenishment_date;
	}

	public String getStorage_unit() {
		return storage_unit;
	}

	public void setStorage_unit(String storage_unit) {
		this.storage_unit = storage_unit;
	}

	
	
}
