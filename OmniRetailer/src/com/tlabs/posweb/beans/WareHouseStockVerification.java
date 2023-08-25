package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;


/**
 * @author Mythri
 *
 */
public class WareHouseStockVerification {

	private String verification_code;
	private String verified_by;
	private String verified_on;
	private String updatedOn;
	private String wh_location;
	private String remarks;
	private String verified_onStr;
	
	
	
	private String updatedOnStr;
	
	private Float closedStockCost;
	
	public Float getClosedStockCost() {
		return closedStockCost;
	}
	public void setClosedStockCost(Float closedStockCost) {
		this.closedStockCost = closedStockCost;
	}
	public String getUpdatedOnStr() {
		return updatedOnStr;
	}

	public void setUpdatedOnStr(String updatedOnStr) {
		this.updatedOnStr = updatedOnStr;
	}

	private List<WareHouseStockVerificationItems> itemsList;
	
	
	private String verificationRef;
	
 public String getVerificationRef() {
		return verificationRef;
	}

	public void setVerificationRef(String verificationRef) {
		this.verificationRef = verificationRef;
	}

public List<String> getNextActivities() {
		return nextActivities;
	}

	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}

private List<String> nextActivities;
	
	

	private int slNo;
	private String totalRecords;
	/*private List<String> previousStates;
	private List<String> nextWorkFlowStates;
	private List<String> workFlowActivities;*/
	private String sku_id;
	private String openStock="0.00";
	private String saleQty="0.00";
	private String dumpCost="0.00";
	private String closedStock="0.00";
	private String declaredQty="0.00";
	private String masterVerificationCode;
	private String dumpQty="0.00";
	private String zone;
	private String startTimeStr;
	private String endTimeStr;
	private String verifiedUptoStr;
	private String stockLossQty = "0.0";
	
	
	
	
	

	private String userName;

	private String roleName;


	

	private List<WareHouseStockVerification> verificationList;
	
	private List<String> previousStates;
	private List<String> nextWorkFlowStates;
	private List<String> workFlowActivities;


	private List<WareHouseStockVerificationItems> categoryWiseitemsList;

	

	private ResponseHeader responseHeader;

	
	
	
	private String masterCodeStartDate;

	private String masterCodeEndDate;

	
	
	
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public List<WareHouseStockVerification> getVerificationList() {
		return verificationList;
	}
	public void setVerificationList(List<WareHouseStockVerification> verificationList) {
		this.verificationList = verificationList;
	}
	public List<String> getPreviousStates() {
		return previousStates;
	}
	public void setPreviousStates(List<String> previousStates) {
		this.previousStates = previousStates;
	}
	public List<String> getNextWorkFlowStates() {
		return nextWorkFlowStates;
	}
	public void setNextWorkFlowStates(List<String> nextWorkFlowStates) {
		this.nextWorkFlowStates = nextWorkFlowStates;
	}
	public List<String> getWorkFlowActivities() {
		return workFlowActivities;
	}
	public void setWorkFlowActivities(List<String> workFlowActivities) {
		this.workFlowActivities = workFlowActivities;
	}
	public List<WareHouseStockVerificationItems> getCategoryWiseitemsList() {
		return categoryWiseitemsList;
	}
	public void setCategoryWiseitemsList(List<WareHouseStockVerificationItems> categoryWiseitemsList) {
		this.categoryWiseitemsList = categoryWiseitemsList;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public String getMasterCodeStartDate() {
		return masterCodeStartDate;
	}
	public void setMasterCodeStartDate(String masterCodeStartDate) {
		this.masterCodeStartDate = masterCodeStartDate;
	}
	public String getMasterCodeEndDate() {
		return masterCodeEndDate;
	}
	public void setMasterCodeEndDate(String masterCodeEndDate) {
		this.masterCodeEndDate = masterCodeEndDate;
	}

	private BigDecimal sku_physical_stock = new BigDecimal("0.0"); 
	
	public BigDecimal getSku_physical_stock() {
		return sku_physical_stock;
	}

	public void setSku_physical_stock(BigDecimal sku_physical_stock) {
		this.sku_physical_stock = sku_physical_stock;
	}

	private BigDecimal bookQty=new BigDecimal("0");
	
public BigDecimal getBookQty() {
		return bookQty;
	}

	public void setBookQty(BigDecimal bookQty) {
		this.bookQty = bookQty;
	}

public String getStockLossQty() {
		return stockLossQty;
	}

	public void setStockLossQty(String stockLossQty) {
		this.stockLossQty = stockLossQty;
	}

private String location;
	private String status;
	
	private String stockCost;

	public String getStockCost() {
		return stockCost;
	}

	public void setStockCost(String stockCost) {
		this.stockCost = stockCost;
	}

	private String stock_in_qty="0";

	public String getStock_in_qty() {
		return stock_in_qty;
	}

	public void setStock_in_qty(String stock_in_qty) {
		this.stock_in_qty = stock_in_qty;
	}

	private RequestHeader requestHeader;
	
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getLocation() {
	return location;
}

public void setLocation(String location) {
	this.location = location;
}

	private String verifiedOnStr;
private String verificationStartDateStr;

	private String verificationEndDateStr;
	public String getVerificationStartDateStr() {
		return verificationStartDateStr;
	}

	public void setVerificationStartDateStr(String verificationStartDateStr) {
		this.verificationStartDateStr = verificationStartDateStr;
	}

	public String getVerificationEndDateStr() {
		return verificationEndDateStr;
	}

	public void setVerificationEndDateStr(String verificationEndDateStr) {
		this.verificationEndDateStr = verificationEndDateStr;
	}

	public String getVerifiedOnStr() {
		return verifiedOnStr;
	}

	public void setVerifiedOnStr(String verifiedOnStr) {
		this.verifiedOnStr = verifiedOnStr;
	}

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	

	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public String getVerified_onStr() {
		return verified_onStr;
	}

	public void setVerified_onStr(String verified_onStr) {
		this.verified_onStr = verified_onStr;
	}

	public String getVerification_code() {
		return verification_code;
	}

	public void setVerification_code(String verification_code) {
		this.verification_code = verification_code;
	}

	public String getVerified_by() {
		return verified_by;
	}

	public void setVerified_by(String verified_by) {
		this.verified_by = verified_by;
	}

	public String getWh_location() {
		return wh_location;
	}

	public void setWh_location(String wh_location) {
		this.wh_location = wh_location;
	}

	public String getRemarks() {
		return remarks;
	}

	public String getVerified_on() {
		return verified_on;
	}

	public void setVerified_on(String verified_on) {
		this.verified_on = verified_on;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public List<WareHouseStockVerificationItems> getItemsList() {
		return itemsList;
	}

	public void setItemsList(List<WareHouseStockVerificationItems> itemsList) {
		this.itemsList = itemsList;
	}

	public String getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(String updatedOn) {
		this.updatedOn = updatedOn;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSku_id() {
		return sku_id;
	}

	public void setSku_id(String sku_id) {
		this.sku_id = sku_id;
	}

	public String getOpenStock() {
		return openStock;
	}

	public void setOpenStock(String openStock) {
		this.openStock = openStock;
	}

	public String getSaleQty() {
		return saleQty;
	}

	public void setSaleQty(String saleQty) {
		this.saleQty = saleQty;
	}

	public String getDumpCost() {
		return dumpCost;
	}

	public void setDumpCost(String dumpCost) {
		this.dumpCost = dumpCost;
	}

	public String getClosedStock() {
		return closedStock;
	}

	public void setClosedStock(String closedStock) {
		this.closedStock = closedStock;
	}

	public String getDeclaredQty() {
		return declaredQty;
	}

	public void setDeclaredQty(String declaredQty) {
		this.declaredQty = declaredQty;
	}

	public String getMasterVerificationCode() {
		return masterVerificationCode;
	}

	public void setMasterVerificationCode(String masterVerificationCode) {
		this.masterVerificationCode = masterVerificationCode;
	}

	public String getDumpQty() {
		return dumpQty;
	}

	public void setDumpQty(String dumpQty) {
		this.dumpQty = dumpQty;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getStartTimeStr() {
		return startTimeStr;
	}

	public void setStartTimeStr(String startTimeStr) {
		this.startTimeStr = startTimeStr;
	}

	public String getEndTimeStr() {
		return endTimeStr;
	}

	public void setEndTimeStr(String endTimeStr) {
		this.endTimeStr = endTimeStr;
	}

	public String getVerifiedUptoStr() {
		return verifiedUptoStr;
	}

	public void setVerifiedUptoStr(String verifiedUptoStr) {
		this.verifiedUptoStr = verifiedUptoStr;
	}
	
	private String maxRecords;
	
	private String startIndex;

	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	
	



}
