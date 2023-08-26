package com.tlabs.posweb.beans;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Set;



public class PromotionSalesReport implements Serializable {

	  private String serialBillId;
      private String counter;
      private String dateStr;
      private String promotionDateStr;
      private float soldQty;
      private double mrp;
      private String discountValue;
      private String discountType;
      private String discountId;
      private String itemName;        
      public String getPromotionDateStr() {
		return promotionDateStr;
	}
	public void setPromotionDateStr(String promotionDateStr) {
		this.promotionDateStr = promotionDateStr;
	}
	private String skuId;        
      private Float discountPrice;
      private Float itemPrice;        
      private String remarks;        
      private String pluCode;        
      private String employeeCode;
      private String startDate;
      private String endDate;
      private String storeLocation;
      private String filePath;
      private boolean saveGNRFlag;
      private RequestHeader requestHeader;
      private String promotionName;
      private String startIndex;
      private int maxRecords;
  	  private ResponseHeader responseHeader;
  	  private List<PromotionSalesReport> itemWisePromotions;
  	  private String totalRecords;
  	  
  	  
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<PromotionSalesReport> getItemWisePromotions() {
		return itemWisePromotions;
	}
	public void setItemWisePromotions(List<PromotionSalesReport> itemWisePromotions) {
		this.itemWisePromotions = itemWisePromotions;
	}
	public String getSerialBillId() {
		return serialBillId;
	}
	public void setSerialBillId(String serialBillId) {
		this.serialBillId = serialBillId;
	}
	public String getCounter() {
		return counter;
	}
	public void setCounter(String counter) {
		this.counter = counter;
	}
	public String getDateStr() {
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	public float getSoldQty() {
		return soldQty;
	}
	public void setSoldQty(float soldQty) {
		this.soldQty = soldQty;
	}
	public double getMrp() {
		return mrp;
	}
	public void setMrp(double mrp) {
		this.mrp = mrp;
	}
	public String getDiscountValue() {
		return discountValue;
	}
	public void setDiscountValue(String discountValue) {
		this.discountValue = discountValue;
	}
	public String getDiscountType() {
		return discountType;
	}
	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}
	public String getDiscountId() {
		return discountId;
	}
	public void setDiscountId(String discountId) {
		this.discountId = discountId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public Float getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(Float discountPrice) {
		this.discountPrice = discountPrice;
	}
	public Float getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(Float itemPrice) {
		this.itemPrice = itemPrice;
	}
	
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public String getEmployeeCode() {
		return employeeCode;
	}
	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
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
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public boolean isSaveGNRFlag() {
		return saveGNRFlag;
	}
	public void setSaveGNRFlag(boolean saveGNRFlag) {
		this.saveGNRFlag = saveGNRFlag;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getPromotionName() {
		return promotionName;
	}
	public void setPromotionName(String promotionName) {
		this.promotionName = promotionName;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public int getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(int maxRecords) {
		this.maxRecords = maxRecords;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
  	  
  	  
  	  
  	  
  	  
}
