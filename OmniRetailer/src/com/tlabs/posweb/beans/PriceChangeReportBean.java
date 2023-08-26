package com.tlabs.posweb.beans;

import java.util.List;

public class PriceChangeReportBean {

	
	private String searchCriteria;
	private String categoryName;
	private String subCategory;
	private String department;
	private String section;
	private String startIndex;
	private String startDate;
	private String endDate;
	private String requiredRecords;
	private boolean isSaveReport;
	private boolean saveReportFlag;
	private String store_location;
	private int totalRecords;
	private List<PriceChangeReportBean> itemReportList;
	private ResponseHeader responseHeader;
	private RequestHeader requestHeader;
	
	
	private String skuId;
	private String category;
	private float soldQty;
	private float totalCost;
	private float itemUnitPrice;
	private float priceDiff;
	private float priceVar;
	private float returnedQty;
	private float exchangedQty;
	private String pluCode;
	private float exchangedAmt;
	private float returnedAmt;
	private float totalExchangedAmt;
	private float totalReturnAmt;
	private String dateStr;
	private float discount;
	private float manualdiscount;
	private float tax;
	private float mrp;
	private float weighedSaleQty;
	private String priceUpdateFrom;
	private float costPrice;
	private String storeLocation;
	private String itemDescription;
	private String zone;
	private String salesReportFilePath;
	
	
	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}
	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}
	public String getItemDescription() {
		return itemDescription;
	}
	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSearchCriteria() {
		return searchCriteria;
	}
	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
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
	public String getRequiredRecords() {
		return requiredRecords;
	}
	public void setRequiredRecords(String requiredRecords) {
		this.requiredRecords = requiredRecords;
	}
	public boolean isSaveReport() {
		return isSaveReport;
	}
	public void setSaveReport(boolean isSaveReport) {
		this.isSaveReport = isSaveReport;
	}
	public boolean isSaveReportFlag() {
		return saveReportFlag;
	}
	public void setSaveReportFlag(boolean saveReportFlag) {
		this.saveReportFlag = saveReportFlag;
	}
	public String getStore_location() {
		return store_location;
	}
	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<PriceChangeReportBean> getItemReportList() {
		return itemReportList;
	}
	public void setItemReportList(List<PriceChangeReportBean> itemReportList) {
		this.itemReportList = itemReportList;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public float getSoldQty() {
		return soldQty;
	}
	public void setSoldQty(float soldQty) {
		this.soldQty = soldQty;
	}
	public float getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(float totalCost) {
		this.totalCost = totalCost;
	}
	public float getItemUnitPrice() {
		return itemUnitPrice;
	}
	public void setItemUnitPrice(float itemUnitPrice) {
		this.itemUnitPrice = itemUnitPrice;
	}
	public float getPriceDiff() {
		return priceDiff;
	}
	public void setPriceDiff(float priceDiff) {
		this.priceDiff = priceDiff;
	}
	public float getPriceVar() {
		return priceVar;
	}
	public void setPriceVar(float priceVar) {
		this.priceVar = priceVar;
	}
	public float getReturnedQty() {
		return returnedQty;
	}
	public void setReturnedQty(float returnedQty) {
		this.returnedQty = returnedQty;
	}
	public float getExchangedQty() {
		return exchangedQty;
	}
	public void setExchangedQty(float exchangedQty) {
		this.exchangedQty = exchangedQty;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public float getExchangedAmt() {
		return exchangedAmt;
	}
	public void setExchangedAmt(float exchangedAmt) {
		this.exchangedAmt = exchangedAmt;
	}
	public float getReturnedAmt() {
		return returnedAmt;
	}
	public void setReturnedAmt(float returnedAmt) {
		this.returnedAmt = returnedAmt;
	}
	public float getTotalExchangedAmt() {
		return totalExchangedAmt;
	}
	public void setTotalExchangedAmt(float totalExchangedAmt) {
		this.totalExchangedAmt = totalExchangedAmt;
	}
	public float getTotalReturnAmt() {
		return totalReturnAmt;
	}
	public void setTotalReturnAmt(float totalReturnAmt) {
		this.totalReturnAmt = totalReturnAmt;
	}
	public String getDateStr() {
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public float getManualdiscount() {
		return manualdiscount;
	}
	public void setManualdiscount(float manualdiscount) {
		this.manualdiscount = manualdiscount;
	}
	public float getTax() {
		return tax;
	}
	public void setTax(float tax) {
		this.tax = tax;
	}
	public float getMrp() {
		return mrp;
	}
	public void setMrp(float mrp) {
		this.mrp = mrp;
	}
	public float getWeighedSaleQty() {
		return weighedSaleQty;
	}
	public void setWeighedSaleQty(float weighedSaleQty) {
		this.weighedSaleQty = weighedSaleQty;
	}
	public String getPriceUpdateFrom() {
		return priceUpdateFrom;
	}
	public void setPriceUpdateFrom(String priceUpdateFrom) {
		this.priceUpdateFrom = priceUpdateFrom;
	}
	public float getCostPrice() {
		return costPrice;
	}
	public void setCostPrice(float costPrice) {
		this.costPrice = costPrice;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	
	
	
}
