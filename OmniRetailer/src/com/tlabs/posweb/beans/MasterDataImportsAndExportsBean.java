package com.tlabs.posweb.beans;

import java.io.File;

public class MasterDataImportsAndExportsBean {

	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String startDate;
	private String endDate;
	private String supplierMasterFilePath;
	private String brandMasterFilePath;
	private char dataSeparator;
	private String fileExtension;
	private File file;
	private String uploadedFilePath;
	private String msgStatus;
	private String fileName;
	private String url; 
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	private String uploadedfilePath;
	
	private String priceUploadfilePath;
	
	
	public String getPriceUploadfilePath() {
		return priceUploadfilePath;
	}

	public void setPriceUploadfilePath(String priceUploadfilePath) {
		this.priceUploadfilePath = priceUploadfilePath;
	}

	public String getUploadedfilePath() {
		return uploadedfilePath;
	}

	public void setUploadedfilePath(String uploadedfilePath) {
		this.uploadedfilePath = uploadedfilePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getMsgStatus() {
		return msgStatus;
	}

	public void setMsgStatus(String msgStatus) {
		this.msgStatus = msgStatus;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
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

	public String getSupplierMasterFilePath() {
		return supplierMasterFilePath;
	}

	public void setSupplierMasterFilePath(String supplierMasterFilePath) {
		this.supplierMasterFilePath = supplierMasterFilePath;
	}

	public String getBrandMasterFilePath() {
		return brandMasterFilePath;
	}

	public void setBrandMasterFilePath(String brandMasterFilePath) {
		this.brandMasterFilePath = brandMasterFilePath;
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

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getUploadedFilePath() {
		return uploadedFilePath;
	}

	public void setUploadedFilePath(String uploadedFilePath) {
		this.uploadedFilePath = uploadedFilePath;
	}

}
