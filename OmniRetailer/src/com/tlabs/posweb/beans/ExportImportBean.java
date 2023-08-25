package com.tlabs.posweb.beans;

import com.technolabssoftware.www.FileUploader;

public class ExportImportBean {
	
	private RequestHeader requestHeader;
	private String billDate;
	private ResponseHeader responseHeader;
	private String billTransactionFilePath;
	private String billItemsFilePath;
	private String startDate;
	private String endDate;
	private boolean isWarehouseExport;
	private String exportSkuMasterPath;
	private String storeLocation;
	private String status;
	private String stockReceiptsFilePath;
	private String stockIssuesFilePath;
    private char dataSeparator;
    private String fileExtension;
    private String stockReturnsFilePath;
    private String stockRequestsFilePath;
    private String location;
    private FileUploader file;
    private String billingUrl;
    private Boolean isFtpUploadRequired;
    private String server;
    private String userId;
    private String password;
    private int portNo;
    private String uploadedFilePath;
    private String flowStatus;
    private String store_location;
    private String maxRecords;
    
    
    

    
    public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public String getStore_location() {
		return store_location;
	}
	public void setStore_location(String store_location) {
		this.store_location = store_location;
	}
	public String getFlowStatus() {
		return flowStatus;
	}
	public void setFlowStatus(String flowStatus) {
		this.flowStatus = flowStatus;
	}
	private String salesReportFilePath;
    
	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}
	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getBillDate() {
		return billDate;
	}
	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public String getBillTransactionFilePath() {
		return billTransactionFilePath;
	}
	public String getBillItemsFilePath() {
		return billItemsFilePath;
	}
	public void setBillItemsFilePath(String billItemsFilePath) {
		this.billItemsFilePath = billItemsFilePath;
	}
	public void setBillTransactionFilePath(String billTransactionFilePath) {
		this.billTransactionFilePath = billTransactionFilePath;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
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
	public String getExportSkuMasterPath() {
		return exportSkuMasterPath;
	}
	public void setExportSkuMasterPath(String exportSkuMasterPath) {
		this.exportSkuMasterPath = exportSkuMasterPath;
	}
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStockReceiptsFilePath() {
		return stockReceiptsFilePath;
	}
	public void setStockReceiptsFilePath(String stockReceiptsFilePath) {
		this.stockReceiptsFilePath = stockReceiptsFilePath;
	}
	public String getStockIssuesFilePath() {
		return stockIssuesFilePath;
	}
	public void setStockIssuesFilePath(String stockIssuesFilePath) {
		this.stockIssuesFilePath = stockIssuesFilePath;
	}
	public char getDataSeparator() {
		return dataSeparator;
	}
	public void setDataSeparator(char dataSeparator) {
		this.dataSeparator = dataSeparator;
	}
	public String getFileExtension() {
		return fileExtension;
	}
	public void setFileExtension(String fileExtension) {
		this.fileExtension = fileExtension;
	}
	public String getStockReturnsFilePath() {
		return stockReturnsFilePath;
	}
	public void setStockReturnsFilePath(String stockReturnsFilePath) {
		this.stockReturnsFilePath = stockReturnsFilePath;
	}
	public String getStockRequestsFilePath() {
		return stockRequestsFilePath;
	}
	public void setStockRequestsFilePath(String stockRequestsFilePath) {
		this.stockRequestsFilePath = stockRequestsFilePath;
	}
	public FileUploader getFile() {
		return file;
	}
	public void setFile(FileUploader file) {
		this.file = file;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getBillingUrl() {
		return billingUrl;
	}
	public void setBillingUrl(String billingUrl) {
		this.billingUrl = billingUrl;
	}
	public Boolean getIsFtpUploadRequired() {
		return isFtpUploadRequired;
	}
	public void setIsFtpUploadRequired(Boolean isFtpUploadRequired) {
		this.isFtpUploadRequired = isFtpUploadRequired;
	}
	public String getServer() {
		return server;
	}
	public void setServer(String server) {
		this.server = server;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getPortNo() {
		return portNo;
	}
	public void setPortNo(int portNo) {
		this.portNo = portNo;
	}
	public boolean isWarehouseExport() {
		return isWarehouseExport;
	}
	public void setWarehouseExport(boolean isWarehouseExport) {
		this.isWarehouseExport = isWarehouseExport;
	}
	public String getUploadedFilePath() {
		return uploadedFilePath;
	}
	public void setUploadedFilePath(String uploadedFilePath) {
		this.uploadedFilePath = uploadedFilePath;
	}
	
}
