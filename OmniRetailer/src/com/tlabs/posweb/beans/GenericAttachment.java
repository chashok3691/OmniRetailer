package com.tlabs.posweb.beans;

public class GenericAttachment {
private String fileName;
private String fileExtension;
private String fileId;
private String templateType;
private String templateUrl;
private String status;



public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getTemplateUrl() {
	return templateUrl;
}
public void setTemplateUrl(String templateUrl) {
	this.templateUrl = templateUrl;
}
public String getFileName() {
	return fileName;
}
public void setFileName(String fileName) {
	this.fileName = fileName;
}
public String getFileExtension() {
	return fileExtension;
}
public void setFileExtension(String fileExtension) {
	this.fileExtension = fileExtension;
}
public String getFileId() {
	return fileId;
}
public void setFileId(String fileId) {
	this.fileId = fileId;
}
public String getTemplateType() {
	return templateType;
}
public void setTemplateType(String templateType) {
	this.templateType = templateType;
}

}
