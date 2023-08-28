package com.tlabs.posweb.beans;

import java.util.Date;
import java.util.List;



 
public class DailyStockTracker {
	
private int autoNo;

private String locationId;

private String counterId;

private String productCategory;

private String productSubCategory;

private String skuId;

private Date date;

private Float openingStock=0f;

private Float closingStock=0f;

private Float salePrice=0f;

private Float unitCost=0f;

private Float mrpPrice=0f;

private Float discountValue=0f;

private String dealId;

private String offerId;

private Float skuReceiptQty=0f;

private Float skuReturnQty=0f;

private Float skuTrnsQty=0f;

private Float skuLqdQty=0f;

private Float skuSaleQty=0f;

private Float skuSaleExchangeQty=0f;

private Float skuSaleReturnQty=0f;

private Float tax=0f;


private RequestHeader requestHeader;

private String dateStr;
private String pluCode;

private Float shipRetQty=0f;

private Float skuGrnQty=0f;

private Double costPrice=0.0;

private Double stockLoss=0.0;


private Double procPrice=0.0;

private String brand;

private String supplier;

private String department;

private String subDepartment;

private String startPrice;

private String endPrice;

private String locationType;




public String getBrand() {
	return brand;
}
public void setBrand(String brand) {
	this.brand = brand;
}
public String getSupplier() {
	return supplier;
}
public void setSupplier(String supplier) {
	this.supplier = supplier;
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
public String getStartPrice() {
	return startPrice;
}
public void setStartPrice(String startPrice) {
	this.startPrice = startPrice;
}
public String getEndPrice() {
	return endPrice;
}
public void setEndPrice(String endPrice) {
	this.endPrice = endPrice;
}
public String getLocationType() {
	return locationType;
}
public void setLocationType(String locationType) {
	this.locationType = locationType;
}
public String getCounterId() {
	return counterId;
}
public void setCounterId(String counterId) {
	this.counterId = counterId;
}
private String description;


private String ean;



private String productBatchNumber;

private ResponseHeader responseHeader;

private String startIndex;

private String maxRecords;

private String searchCriteria;

private int totalRecords;

private String startDate;

private String endDate;

private List<DailyStockTracker> dailyStockTrackers;

private String zoneId;







public String getZoneId() {
	return zoneId;
}
public void setZoneId(String zoneId) {
	this.zoneId = zoneId;
}
public String getStartIndex() {
	return startIndex;
}
public void setStartIndex(String startIndex) {
	this.startIndex = startIndex;
}
public String getMaxRecords() {
	return maxRecords;
}
public void setMaxRecords(String maxRecords) {
	this.maxRecords = maxRecords;
}
public String getSearchCriteria() {
	return searchCriteria;
}
public void setSearchCriteria(String searchCriteria) {
	this.searchCriteria = searchCriteria;
}
public int getTotalRecords() {
	return totalRecords;
}
public void setTotalRecords(int totalRecords) {
	this.totalRecords = totalRecords;
}
public String getStartDate() {
	return startDate;
}
public void setStartDate(String startDate) {
	this.startDate = startDate;
}
public String getEndDate() {
	return endDate;
}
public void setEndDate(String endDate) {
	this.endDate = endDate;
}
public List<DailyStockTracker> getDailyStockTrackers() {
	return dailyStockTrackers;
}
public void setDailyStockTrackers(List<DailyStockTracker> dailyStockTrackers) {
	this.dailyStockTrackers = dailyStockTrackers;
}
public ResponseHeader getResponseHeader() {
	return responseHeader;
}
public void setResponseHeader(ResponseHeader responseHeader) {
	this.responseHeader = responseHeader;
}
public String getProductBatchNumber() {
	return productBatchNumber;
}
public void setProductBatchNumber(String productBatchNumber) {
	this.productBatchNumber = productBatchNumber;
}
public Float getTax() {
	return tax;
}
public void setTax(Float tax) {
	this.tax = tax;
}
public Float getSkuSaleExchangeQty() {
	return skuSaleExchangeQty;
}
public void setSkuSaleExchangeQty(Float skuSaleExchangeQty) {
	this.skuSaleExchangeQty = skuSaleExchangeQty;
}
public Float getSkuSaleReturnQty() {
	return skuSaleReturnQty;
}
public void setSkuSaleReturnQty(Float skuSaleReturnQty) {
	this.skuSaleReturnQty = skuSaleReturnQty;
}
public int getAutoNo() {
	return autoNo;
}
public void setAutoNo(int autoNo) {
	this.autoNo = autoNo;
}
public String getLocationId() {
	return locationId;
}
public void setLocationId(String locationId) {
	this.locationId = locationId;
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
public String getSkuId() {
	return skuId;
}
public void setSkuId(String skuId) {
	this.skuId = skuId;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}

public Float getOpeningStock() {
	return openingStock;
}
public void setOpeningStock(Float openingStock) {
	this.openingStock = openingStock;
}
public Float getClosingStock() {
	return closingStock;
}
public void setClosingStock(Float closingStock) {
	this.closingStock = closingStock;
}
public Float getSkuSaleQty() {
	return skuSaleQty;
}
public void setSkuSaleQty(Float skuSaleQty) {
	this.skuSaleQty = skuSaleQty;
}
public Float getSalePrice() {
	return salePrice;
}
public void setSalePrice(Float salePrice) {
	this.salePrice = salePrice;
}
public Float getUnitCost() {
	return unitCost;
}
public void setUnitCost(Float unitCost) {
	this.unitCost = unitCost;
}
public Float getMrpPrice() {
	return mrpPrice;
}
public void setMrpPrice(Float mrpPrice) {
	this.mrpPrice = mrpPrice;
}

public Float getDiscountValue() {
	return discountValue;
}
public void setDiscountValue(Float discountValue) {
	this.discountValue = discountValue;
}
public String getDealId() {
	return dealId;
}
public void setDealId(String dealId) {
	this.dealId = dealId;
}
public String getOfferId() {
	return offerId;
}
public void setOfferId(String offerId) {
	this.offerId = offerId;
}
public Float getSkuReceiptQty() {
	return skuReceiptQty;
}
public void setSkuReceiptQty(Float skuReceiptQty) {
	this.skuReceiptQty = skuReceiptQty;
}
public Float getSkuReturnQty() {
	return skuReturnQty;
}
public void setSkuReturnQty(Float skuReturnQty) {
	this.skuReturnQty = skuReturnQty;
}
public Float getSkuTrnsQty() {
	return skuTrnsQty;
}
public void setSkuTrnsQty(Float skuTrnsQty) {
	this.skuTrnsQty = skuTrnsQty;
}
public Float getSkuLqdQty() {
	return skuLqdQty;
}
public void setSkuLqdQty(Float skuLqdQty) {
	this.skuLqdQty = skuLqdQty;
}
public RequestHeader getRequestHeader() {
	return requestHeader;
}
public void setRequestHeader(RequestHeader requestHeader) {
	this.requestHeader = requestHeader;
}
public String getDateStr() {
	return dateStr;
}
public void setDateStr(String dateStr) {
	this.dateStr = dateStr;
}
public String getPluCode() {
	return pluCode;
}
public void setPluCode(String pluCode) {
	this.pluCode = pluCode;
}
public Float getShipRetQty() {
	return shipRetQty;
}
public void setShipRetQty(Float shipRetQty) {
	this.shipRetQty = shipRetQty;
}
public Float getSkuGrnQty() {
	return skuGrnQty;
}
public void setSkuGrnQty(Float skuGrnQty) {
	this.skuGrnQty = skuGrnQty;
}
public Double getCostPrice() {
	return costPrice;
}
public void setCostPrice(Double costPrice) {
	this.costPrice = costPrice;
}
public Double getStockLoss() {
	return stockLoss;
}
public void setStockLoss(Double stockLoss) {
	this.stockLoss = stockLoss;
}
public Double getProcPrice() {
	return procPrice;
}
public void setProcPrice(Double procPrice) {
	this.procPrice = procPrice;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getEan() {
	return ean;
}
public void setEan(String ean) {
	this.ean = ean;
}
}
