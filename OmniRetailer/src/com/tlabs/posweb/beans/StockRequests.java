package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class StockRequests {

 private String stockRequestId;
 private String fromStoreCode;
 private String fromWareHouseId;
 private String toStoreCode;
 private String toWareHouseId;
 private String status;
 private String requestedUserName;
 private String reason;
 private BigDecimal approvedQty;
 private Date requestDate;
 private Date deliveryDate;
 private String requestApprovedBy;
 private String shippingMode;
 private BigDecimal shippingCost;
 private BigDecimal totalStockRequestValue;
 private String remarks;
 private String totalRecords;
 private List<StockRequests> stockRequests;
 private List<StockRequestItems> statusWiseQtyList;
 private List<StockRequestItems> stockRequestItems;
 private RequestHeader requestHeader;
 private ResponseHeader responseHeader;
 private String requestDateStr;
 private String deliveryDateStr;
 private String searchCriteria;
 private List<String> sid;
 private List<String> qty;
 private int slNo;
 private List<String> nextActivities;
 private List<String> workFlowActivities;
 private List<String> previousStates;
 private List<String> nextWorkFlowStates;
 private BigDecimal requestedQty;
 private String zoneId;
 private String priority;
 private String flowUnder;
 private String createdDateStr;
 private Integer totalOutlets;
 private Double totalIndentQty;
 private Integer indentsOpened;
 private Integer totalIndents;
 private String saveStockFilePath;
 private List<String> formStoreCodeList;
 private String category;
 private int noofitems;
 
 
 
 public int getNoofitems() {
	return noofitems;
}
public void setNoofitems(int noofitems) {
	this.noofitems = noofitems;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public List<String> getFormStoreCodeList() {
	return formStoreCodeList;
}
public void setFormStoreCodeList(List<String> formStoreCodeList) {
	this.formStoreCodeList = formStoreCodeList;
}
public List<String> getWorkFlowActivities() {
	return workFlowActivities;
}
public void setWorkFlowActivities(List<String> workFlowActivities) {
	this.workFlowActivities = workFlowActivities;
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
public List<String> getNextActivities() {
	return nextActivities;
}
public void setNextActivities(List<String> nextActivities) {
	this.nextActivities = nextActivities;
}
public int getSlNo() {
	return slNo;
 }
 public void setSlNo(int slNo) {
	this.slNo = slNo;
 }

public String getSearchCriteria() {
	return searchCriteria;
}

public void setSearchCriteria(String searchCriteria) {
	this.searchCriteria = searchCriteria;
}

public String getRequestDateStr() {
	return requestDateStr;
}

public void setRequestDateStr(String requestDateStr) {
	this.requestDateStr = requestDateStr;
}

public String getDeliveryDateStr() {
	return deliveryDateStr;
}

public void setDeliveryDateStr(String deliveryDateStr) {
	this.deliveryDateStr = deliveryDateStr;
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

public List<StockRequests> getStockRequests() {
	return stockRequests;
}

public void setStockRequests(List<StockRequests> stockRequests) {
	this.stockRequests = stockRequests;
}

public List<StockRequestItems> getStockRequestItems() {
	return stockRequestItems;
}

public void setStockRequestItems(List<StockRequestItems> stockRequestItems) {
	this.stockRequestItems = stockRequestItems;
}

public String getTotalRecords() {
	return totalRecords;
}

public void setTotalRecords(String totalRecords) {
	this.totalRecords = totalRecords;
}

public String getStockRequestId() {
	return stockRequestId;
}

public void setStockRequestId(String stockRequestId) {
	this.stockRequestId = stockRequestId;
}

public String getFromStoreCode() {
	return fromStoreCode;
}

public void setFromStoreCode(String fromStoreCode) {
	this.fromStoreCode = fromStoreCode;
}

public String getFromWareHouseId() {
	return fromWareHouseId;
}

public void setFromWareHouseId(String fromWareHouseId) {
	this.fromWareHouseId = fromWareHouseId;
}

public String getToStoreCode() {
	return toStoreCode;
}

public void setToStoreCode(String toStoreCode) {
	this.toStoreCode = toStoreCode;
}

public String getToWareHouseId() {
	return toWareHouseId;
}

public void setToWareHouseId(String toWareHouseId) {
	this.toWareHouseId = toWareHouseId;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public String getRequestedUserName() {
	return requestedUserName;
}

public void setRequestedUserName(String requestedUserName) {
	this.requestedUserName = requestedUserName;
}

public String getReason() {
	return reason;
}

public void setReason(String reason) {
	this.reason = reason;
}

public Date getRequestDate() {
	return requestDate;
}

public void setRequestDate(Date requestDate) {
	this.requestDate = requestDate;
}

public Date getDeliveryDate() {
	return deliveryDate;
}

public void setDeliveryDate(Date deliveryDate) {
	this.deliveryDate = deliveryDate;
}

public String getRequestApprovedBy() {
	return requestApprovedBy;
}

public void setRequestApprovedBy(String requestApprovedBy) {
	this.requestApprovedBy = requestApprovedBy;
}

public String getShippingMode() {
	return shippingMode;
}

public void setShippingMode(String shippingMode) {
	this.shippingMode = shippingMode;
}



public String getRemarks() {
	return remarks;
}

public void setRemarks(String remarks) {
	this.remarks = remarks;
}

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((deliveryDate == null) ? 0 : deliveryDate.hashCode());
	result = prime * result + ((fromStoreCode == null) ? 0 : fromStoreCode.hashCode());
	result = prime * result + ((fromWareHouseId == null) ? 0 : fromWareHouseId.hashCode());
	result = prime * result + ((reason == null) ? 0 : reason.hashCode());
	result = prime * result + ((remarks == null) ? 0 : remarks.hashCode());
	result = prime * result + ((requestApprovedBy == null) ? 0 : requestApprovedBy.hashCode());
	result = prime * result + ((requestDate == null) ? 0 : requestDate.hashCode());
	result = prime * result + ((requestedUserName == null) ? 0 : requestedUserName.hashCode());
	result = prime * result + ((shippingCost == null) ? 0 : shippingCost.hashCode());
	result = prime * result + ((shippingMode == null) ? 0 : shippingMode.hashCode());
	result = prime * result + ((status == null) ? 0 : status.hashCode());
	result = prime * result + ((stockRequestId == null) ? 0 : stockRequestId.hashCode());
	result = prime * result + ((toStoreCode == null) ? 0 : toStoreCode.hashCode());
	result = prime * result + ((toWareHouseId == null) ? 0 : toWareHouseId.hashCode());
	result = prime * result + ((totalStockRequestValue == null) ? 0 : totalStockRequestValue.hashCode());
	return result;
}

@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	StockRequests other = (StockRequests) obj;
	if (deliveryDate == null) {
		if (other.deliveryDate != null)
			return false;
	} else if (!deliveryDate.equals(other.deliveryDate))
		return false;
	if (fromStoreCode == null) {
		if (other.fromStoreCode != null)
			return false;
	} else if (!fromStoreCode.equals(other.fromStoreCode))
		return false;
	if (fromWareHouseId == null) {
		if (other.fromWareHouseId != null)
			return false;
	} else if (!fromWareHouseId.equals(other.fromWareHouseId))
		return false;
	if (reason == null) {
		if (other.reason != null)
			return false;
	} else if (!reason.equals(other.reason))
		return false;
	if (remarks == null) {
		if (other.remarks != null)
			return false;
	} else if (!remarks.equals(other.remarks))
		return false;
	if (requestApprovedBy == null) {
		if (other.requestApprovedBy != null)
			return false;
	} else if (!requestApprovedBy.equals(other.requestApprovedBy))
		return false;
	if (requestDate == null) {
		if (other.requestDate != null)
			return false;
	} else if (!requestDate.equals(other.requestDate))
		return false;
	if (requestedUserName == null) {
		if (other.requestedUserName != null)
			return false;
	} else if (!requestedUserName.equals(other.requestedUserName))
		return false;
	if (shippingCost == null) {
		if (other.shippingCost != null)
			return false;
	} else if (!shippingCost.equals(other.shippingCost))
		return false;
	if (shippingMode == null) {
		if (other.shippingMode != null)
			return false;
	} else if (!shippingMode.equals(other.shippingMode))
		return false;
	if (status == null) {
		if (other.status != null)
			return false;
	} else if (!status.equals(other.status))
		return false;
	if (stockRequestId == null) {
		if (other.stockRequestId != null)
			return false;
	} else if (!stockRequestId.equals(other.stockRequestId))
		return false;
	if (toStoreCode == null) {
		if (other.toStoreCode != null)
			return false;
	} else if (!toStoreCode.equals(other.toStoreCode))
		return false;
	if (toWareHouseId == null) {
		if (other.toWareHouseId != null)
			return false;
	} else if (!toWareHouseId.equals(other.toWareHouseId))
		return false;
	if (totalStockRequestValue == null) {
		if (other.totalStockRequestValue != null)
			return false;
	} else if (!totalStockRequestValue.equals(other.totalStockRequestValue))
		return false;
	return true;
}

public String getZoneId() {
	return zoneId;
}
public void setZoneId(String zoneId) {
	this.zoneId = zoneId;
}
public String getFlowUnder() {
	return flowUnder;
}
public void setFlowUnder(String flowUnder) {
	this.flowUnder = flowUnder;
}
public String getPriority() {
	return priority;
}
public void setPriority(String priority) {
	this.priority = priority;
}

public List<String> getQty() {
	return qty;
}
public void setQty(List<String> qty) {
	this.qty = qty;
}
public List<String> getSid() {
	return sid;
}
public void setSid(List<String> sid) {
	this.sid = sid;
}
public String getCreatedDateStr() {
	return createdDateStr;
}
public void setCreatedDateStr(String createdDateStr) {
	this.createdDateStr = createdDateStr;
}

public Integer getTotalOutlets() {
	return totalOutlets;
}
public void setTotalOutlets(Integer totalOutlets) {
	this.totalOutlets = totalOutlets;
}
public Double getTotalIndentQty() {
	return totalIndentQty;
}
public void setTotalIndentQty(Double totalIndentQty) {
	this.totalIndentQty = totalIndentQty;
}
public Integer getIndentsOpened() {
	return indentsOpened;
}
public void setIndentsOpened(Integer indentsOpened) {
	this.indentsOpened = indentsOpened;
}
public Integer getTotalIndents() {
	return totalIndents;
}
public void setTotalIndents(Integer totalIndents) {
	this.totalIndents = totalIndents;
}
public BigDecimal getApprovedQty() {
	return approvedQty;
}
public void setApprovedQty(BigDecimal approvedQty) {
	this.approvedQty = approvedQty;
}
public BigDecimal getShippingCost() {
	return shippingCost;
}
public void setShippingCost(BigDecimal shippingCost) {
	this.shippingCost = shippingCost;
}
public BigDecimal getTotalStockRequestValue() {
	return totalStockRequestValue;
}
public void setTotalStockRequestValue(BigDecimal totalStockRequestValue) {
	this.totalStockRequestValue = totalStockRequestValue;
}
public BigDecimal getRequestedQty() {
	return requestedQty;
}
public void setRequestedQty(BigDecimal requestedQty) {
	this.requestedQty = requestedQty;
}
public List<StockRequestItems> getStatusWiseQtyList() {
	return statusWiseQtyList;
}
public void setStatusWiseQtyList(List<StockRequestItems> statusWiseQtyList) {
	this.statusWiseQtyList = statusWiseQtyList;
}
public String getSaveStockFilePath() {
	return saveStockFilePath;
}
public void setSaveStockFilePath(String saveStockFilePath) {
	this.saveStockFilePath = saveStockFilePath;
}


}
