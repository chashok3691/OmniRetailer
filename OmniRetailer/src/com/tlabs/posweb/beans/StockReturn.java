package com.tlabs.posweb.beans;
import java.util.List;

public class StockReturn {
	
	private String returnNoteRef ;
	
	private String fromLocation;
	
	private String toLocation;
	
	private String dateOfReturn;
	
	private String timeOfReturn;
	
	private String issueRef;
	
	private String returnBy;
	
	private String shippedBy;
	
	private String shipmentMode;
	
	private String shippedOn;
	
	private String shipmentCarrier;
	
	private String status;
	
	private String remarks;
	
	private String dateAndTime;
	
	private String receiptRef;
	
	private List<StockReturnList> stockList;
	
	private List<StockReturn> stockReturnsList;
	private boolean saveStockReport;
    private String saveStockFilePath;
	private RequestHeader requestHeader;
	
	private String startIndex;
	
	private String maxRecords;
	
	private String dateOfReturnStr;
	
	private String timeOfReturnStr;
	
	private String shippedOnStr;

	private String searchCriteria;
	
	private ResponseHeader responseHeader;
	
	private String totalRecords;
	
	private String startDate;
	
	private String endDate;
	
	private String flowUnder;
	
	private boolean outletAll;
	private boolean warehouseAll;
	private List<String> nextActivities;
	private List<String> previousActivities;
	
	private List<String> locationsList;
	
	private List<String> returnIdList;
	
	
	
	public List<String> getReturnIdList() {
		return returnIdList;
	}
	public void setReturnIdList(List<String> returnIdList) {
		this.returnIdList = returnIdList;
	}
	public List<String> getLocationsList() {
		return locationsList;
	}
	public void setLocationsList(List<String> locationsList) {
		this.locationsList = locationsList;
	}
	public List<String> getNextActivities() {
		return nextActivities;
	}
	public void setNextActivities(List<String> nextActivities) {
		this.nextActivities = nextActivities;
	}
	public boolean isOutletAll() {
		return outletAll;
	}
	public void setOutletAll(boolean outletAll) {
		this.outletAll = outletAll;
	}
	public boolean isWarehouseAll() {
		return warehouseAll;
	}
	public void setWarehouseAll(boolean warehouseAll) {
		this.warehouseAll = warehouseAll;
	}

	private int slNo;
	
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	
	public String getFlowUnder() {
		return flowUnder;
	}

	public void setFlowUnder(String flowUnder) {
		this.flowUnder = flowUnder;
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

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public List<StockReturn> getStockReturnsList() {
		return stockReturnsList;
	}

	public void setStockReturnsList(List<StockReturn> stockReturnsList) {
		this.stockReturnsList = stockReturnsList;
	}

	public String getReturnNoteRef() {
		return returnNoteRef;
	}

	public void setReturnNoteRef(String returnNoteRef) {
		this.returnNoteRef = returnNoteRef;
	}

	public String getFromLocation() {
		return fromLocation;
	}

	public void setFromLocation(String fromLocation) {
		this.fromLocation = fromLocation;
	}

	public String getToLocation() {
		return toLocation;
	}

	public void setToLocation(String toLocation) {
		this.toLocation = toLocation;
	}

	public String getIssueRef() {
		return issueRef;
	}

	public void setIssueRef(String issueRef) {
		this.issueRef = issueRef;
	}

	public String getReturnBy() {
		return returnBy;
	}

	public void setReturnBy(String returnBy) {
		this.returnBy = returnBy;
	}

	public String getShippedBy() {
		return shippedBy;
	}

	public void setShippedBy(String shippedBy) {
		this.shippedBy = shippedBy;
	}

	public String getShipmentMode() {
		return shipmentMode;
	}

	public void setShipmentMode(String shipmentMode) {
		this.shipmentMode = shipmentMode;
	}

	public String getShipmentCarrier() {
		return shipmentCarrier;
	}

	public void setShipmentCarrier(String shipmentCarrier) {
		this.shipmentCarrier = shipmentCarrier;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public String getReceiptRef() {
		return receiptRef;
	}

	public void setReceiptRef(String receiptRef) {
		this.receiptRef = receiptRef;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getShippedOnStr() {
		return shippedOnStr;
	}

	public void setShippedOnStr(String shippedOnStr) {
		this.shippedOnStr = shippedOnStr;
	}

	public String getDateOfReturnStr() {
		return dateOfReturnStr;
	}

	public void setDateOfReturnStr(String dateOfReturnStr) {
		this.dateOfReturnStr = dateOfReturnStr;
	}

	public String getTimeOfReturnStr() {
		return timeOfReturnStr;
	}

	public void setTimeOfReturnStr(String timeOfReturnStr) {
		this.timeOfReturnStr = timeOfReturnStr;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public List<StockReturnList> getStockList() {
		return stockList;
	}

	public void setStockList(List<StockReturnList> stockList) {
		this.stockList = stockList;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public String getDateOfReturn() {
		return dateOfReturn;
	}

	public void setDateOfReturn(String dateOfReturn) {
		this.dateOfReturn = dateOfReturn;
	}

	public String getTimeOfReturn() {
		return timeOfReturn;
	}

	public void setTimeOfReturn(String timeOfReturn) {
		this.timeOfReturn = timeOfReturn;
	}

	public String getShippedOn() {
		return shippedOn;
	}

	public void setShippedOn(String shippedOn) {
		this.shippedOn = shippedOn;
	}

	public String getDateAndTime() {
		return dateAndTime;
	}

	public void setDateAndTime(String dateAndTime) {
		this.dateAndTime = dateAndTime;
	}
	public List<String> getPreviousActivities() {
		return previousActivities;
	}
	public void setPreviousActivities(List<String> previousActivities) {
		this.previousActivities = previousActivities;
	}
	public boolean isSaveStockReport() {
		return saveStockReport;
	}
	public void setSaveStockReport(boolean saveStockReport) {
		this.saveStockReport = saveStockReport;
	}
	public String getSaveStockFilePath() {
		return saveStockFilePath;
	}
	public void setSaveStockFilePath(String saveStockFilePath) {
		this.saveStockFilePath = saveStockFilePath;
	}

	
}
