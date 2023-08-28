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

import java.math.BigDecimal;
import java.util.Set;

/**
 * @author Sahitya
 * Verified By :
 * 
 * This class is used to receive sku related details from webservices
 */

public class SkuDetails {
	private String location;
	private String category;
	private String skuId;
	private String description;
	private BigDecimal costPrice;
	private BigDecimal salePrice;
	private BigDecimal availableQty;
	private BigDecimal totalQuantity;
    private BigDecimal totalPrice;
    private String ean;
    private double stockQty;
	private String measurementRange;
	private String dateStr;
	
	
	private String categoryName;
	private String closedStockQty;
	private String openStockQty;
	private String openStock;
	private String closedStock;
	private String grade;
	
	private Set<String> stockLocations; 
	
	private String storageAreaRef="";
	private String storageArea;
	
	private String  productBatchNumber;
	
	private String   expiryDateStr;
	
	
	
	public Float getMrp() {
		return mrp;
	}

	public void setMrp(Float mrp) {
		this.mrp = mrp;
	}
	private Float mrp;
	
	
	
	public String getProductBatchNumber() {
		return productBatchNumber;
	}

	public String getExpiryDateStr() {
		return expiryDateStr;
	}

	public void setExpiryDateStr(String expiryDateStr) {
		this.expiryDateStr = expiryDateStr;
	}

	public void setProductBatchNumber(String productBatchNumber) {
		this.productBatchNumber = productBatchNumber;
	}

	public String getStorageAreaRef() {
		return storageAreaRef;
	}

	public void setStorageAreaRef(String storageAreaRef) {
		this.storageAreaRef = storageAreaRef;
	}

	public String getStorageArea() {
		return storageArea;
	}

	public void setStorageArea(String storageArea) {
		this.storageArea = storageArea;
	}

	public Set<String> getStockLocations() {
		return stockLocations;
	}

	public void setStockLocations(Set<String> stockLocations) {
		this.stockLocations = stockLocations;
	}
	private String brandCode;
	
	public String getBrandCode() {
		return brandCode;
	}

	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getClosedStockQty() {
		return closedStockQty;
	}

	public void setClosedStockQty(String closedStockQty) {
		this.closedStockQty = closedStockQty;
	}

	public String getOpenStockQty() {
		return openStockQty;
	}

	public void setOpenStockQty(String openStockQty) {
		this.openStockQty = openStockQty;
	}

	public String getOpenStock() {
		return openStock;
	}

	public void setOpenStock(String openStock) {
		this.openStock = openStock;
	}

	public String getClosedStock() {
		return closedStock;
	}

	public void setClosedStock(String closedStock) {
		this.closedStock = closedStock;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}
	private String color;
	private String size;
	private String uom;
	private String productRange;
	private String date;
	private String skuID;
	private String subCategory;
	private String reorderPoint;
	private String productId;
	private String totalRecords;
	private String billID;
	private String reason;
	private float quantity;
	private String blockedQty;
	private String scrapedQty;
	private String skuReorderedQty;
	private String productName;
	private String price;
	private String itemDesc;
	private String itemPrice;
	private String totalCost;
	private String cost;
	private int slNo;
	private String orderDate;
	private String deliveryDate;
	private String pluCode;
	private String stockDownload;
	private float stockValue;
	
	
	private String productCategory;
	private String productSubCategory;
	private String productDepartment;
	private String productSubDepartment;
	private String productClass;
	private String productSubClass;
	
	private String subDepartment;
	private String department;
	
	private String stockDaywiseDownload;
	
	public String getStockDaywiseDownload() {
		return stockDaywiseDownload;
	}

	public void setStockDaywiseDownload(String stockDaywiseDownload) {
		this.stockDaywiseDownload = stockDaywiseDownload;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getSubDepartment() {
		return subDepartment;
	}

	public void setSubDepartment(String subDepartment) {
		this.subDepartment = subDepartment;
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

	public String getProductDepartment() {
		return productDepartment;
	}

	public void setProductDepartment(String productDepartment) {
		this.productDepartment = productDepartment;
	}

	public String getProductSubDepartment() {
		return productSubDepartment;
	}

	public void setProductSubDepartment(String productSubDepartment) {
		this.productSubDepartment = productSubDepartment;
	}

	public String getProductClass() {
		return productClass;
	}

	public void setProductClass(String productClass) {
		this.productClass = productClass;
	}

	public String getProductSubClass() {
		return productSubClass;
	}

	public void setProductSubClass(String productSubClass) {
		this.productSubClass = productSubClass;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public double getStockQty() {
		return stockQty;
	}

	public void setStockQty(double stockQty) {
		this.stockQty = stockQty;
	}

	public String getMeasurementRange() {
		return measurementRange;
	}

	public void setMeasurementRange(String measurementRange) {
		this.measurementRange = measurementRange;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(String totalCost) {
		this.totalCost = totalCost;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public String getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getSkuReorderedQty() {
		return skuReorderedQty;
	}

	public void setSkuReorderedQty(String skuReorderedQty) {
		this.skuReorderedQty = skuReorderedQty;
	}

	public String getScrapedQty() {
		return scrapedQty;
	}

	public void setScrapedQty(String scrapedQty) {
		this.scrapedQty = scrapedQty;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getBlockedQty() {
		return blockedQty;
	}

	public void setBlockedQty(String blockedQty) {
		this.blockedQty = blockedQty;
	}

	public String getBillID() {
		return billID;
	}

	public void setBillID(String billID) {
		this.billID = billID;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getSkuID() {
		return skuID;
	}

	public void setSkuID(String skuID) {
		this.skuID = skuID;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}



	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getReorderPoint() {
		return reorderPoint;
	}

	public void setReorderPoint(String reorderPoint) {
		this.reorderPoint = reorderPoint;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getStockDownload() {
		return stockDownload;
	}

	public void setStockDownload(String stockDownload) {
		this.stockDownload = stockDownload;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public BigDecimal getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(BigDecimal costPrice) {
		this.costPrice = costPrice;
	}

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	public BigDecimal getAvailableQty() {
		return availableQty;
	}

	public void setAvailableQty(BigDecimal availableQty) {
		this.availableQty = availableQty;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public float getQuantity() {
		return quantity;
	}

	public void setQuantity(float quantity) {
		this.quantity = quantity;
	}

	public float getStockValue() {
		return stockValue;
	}

	public void setStockValue(float stockValue) {
		this.stockValue = stockValue;
	}

	public BigDecimal getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(BigDecimal totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getProductRange() {
		return productRange;
	}

	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}

	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}

}
