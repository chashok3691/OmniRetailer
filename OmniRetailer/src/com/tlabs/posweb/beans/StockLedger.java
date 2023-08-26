package com.tlabs.posweb.beans;

import java.util.List;


public class StockLedger {

	private RequestHeader requestHeader;
	private String skuId;
	private String storeLocation;
	private String startIndex;
	private String requiredRecords;
	private String totalRecords;
	private String wareHouseLocation;
	private String pluCode;
	private List<StockLedgerDetails> ledgerDetails;
	private List<StockLedgerDetails> itemdetails;
	
public List<StockLedgerDetails> getItemdetails() {
		return itemdetails;
	}
	public void setItemdetails(List<StockLedgerDetails> itemdetails) {
		this.itemdetails = itemdetails;
	}
	/*	private List<ItemWiseReport> itemdetails;
	public List<ItemWiseReport> getItemdetails() {
		return itemdetails;
	}
	public void setItemdetails(List<ItemWiseReport> itemdetails) {
		this.itemdetails = itemdetails;
	}*/
	private List<VerificationDetails> verificationDetails;
	
	public List<VerificationDetails> getVerificationDetails() {
		return verificationDetails;
	}
	public void setVerificationDetails(List<VerificationDetails> verificationDetails) {
		this.verificationDetails = verificationDetails;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<StockLedgerDetails> getLedgerDetails() {
		return ledgerDetails;
	}
	public void setLedgerDetails(List<StockLedgerDetails> ledgerDetails) {
		this.ledgerDetails = ledgerDetails;
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
	public String getStoreLocation() {
		return storeLocation;
	}
	public void setStoreLocation(String storeLocation) {
		this.storeLocation = storeLocation;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	public String getRequiredRecords() {
		return requiredRecords;
	}
	public void setRequiredRecords(String requiredRecords) {
		this.requiredRecords = requiredRecords;
	}
	public String getWareHouseLocation() {
		return wareHouseLocation;
	}
	public void setWareHouseLocation(String wareHouseLocation) {
		this.wareHouseLocation = wareHouseLocation;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	
	
	}
