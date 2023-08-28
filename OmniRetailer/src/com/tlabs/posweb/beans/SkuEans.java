package com.tlabs.posweb.beans;
/**
 * @author Sambaiah Y
 * @Created_On : 21-12-2015
 * @Description : This class will have ean's information for the specific sku
 * 
 */
import java.io.Serializable;
import java.util.Date;
import java.util.List;




@SuppressWarnings("serial")
public class SkuEans implements Serializable {
	
	
	private int serialNum;
	
	private String skuId;



	
	private String ean;
	
	private String sku_status;
	
	private String remarks;
	
	//private Date updatedDate;
	
	private String storeLocation;

	private List<SkuEans> skuEans;
	private RequestHeader requestHeader;
	private ResponseHeader responseHeader;
	private String date;
	private String startIndex;
	private String totalRecords;
	
	private boolean fileRequired;
	
	
	public boolean isFileRequired() {
		return fileRequired;
	}

	public void setFileRequired(boolean fileRequired) {
		this.fileRequired = fileRequired;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	

	public String getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStoreLocation() {
		return storeLocation;
	}

	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
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

	public List<SkuEans> getSkuEans() {
		return skuEans;
	}

	public void setSkuEans(List<SkuEans> skuEans) {
		this.skuEans = skuEans;
	}

	public int getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(int serialNum) {
		this.serialNum = serialNum;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

 

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	
	public String getSku_status() {
		return sku_status;
	}

	public void setSku_status(String sku_status) {
		this.sku_status = sku_status;
	}
}
