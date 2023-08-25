package com.tlabs.posweb.beans;
import java.util.List;
/**
 * @author kesav */
public class Assement {
	
private String assetName;
private ResponseHeader responseHeader;
private List<AssetMaster> assetMaster;
private int totalRecords;
private List<String> deletedItems;
private List<String> nonDeletedItems;
private String url;

public String getUrl() {
	return url;
}

public void setUrl(String url) {
	this.url = url;
}

public String getAssetName() {
	return assetName;
}

public void setAssetName(String assetName) {
	this.assetName = assetName;
}

public ResponseHeader getResponseHeader() {
	return responseHeader;
}

public void setResponseHeader(ResponseHeader responseHeader) {
	this.responseHeader = responseHeader;
}

public List<AssetMaster> getAssetMaster() {
	return assetMaster;
}

public void setAssetMaster(List<AssetMaster> assetMaster) {
	this.assetMaster = assetMaster;
}

public int getTotalRecords() {
	return totalRecords;
}

public void setTotalRecords(int totalRecords) {
	this.totalRecords = totalRecords;
}

public List<String> getDeletedItems() {
	return deletedItems;
}

public void setDeletedItems(List<String> deletedItems) {
	this.deletedItems = deletedItems;
}

public List<String> getNonDeletedItems() {
	return nonDeletedItems;
}

public void setNonDeletedItems(List<String> nonDeletedItems) {
	this.nonDeletedItems = nonDeletedItems;
}

 
 

 
 

 
}
