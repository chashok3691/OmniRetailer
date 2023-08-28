package com.tlabs.posweb.beans;

import java.util.List;


public class TenderMaster {
	
	private String tenderName;

	private String tenderCode;
	
	
	private List<String> tenderCodes;
	
	private List<String> tenderNames;

	private String operation;
	
	private String onlineTenderStr;
	private boolean onlineTender;

	
	
	

	public String getOnlineTenderStr() {
		return onlineTenderStr;
	}

	public void setOnlineTenderStr(String onlineTenderStr) {
		this.onlineTenderStr = onlineTenderStr;
	}

	public boolean isOnlineTender() {
		return onlineTender;
	}

	public void setOnlineTender(boolean onlineTender) {
		this.onlineTender = onlineTender;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public List<String> getTenderNames() {
		return tenderNames;
	}

	public void setTenderNames(List<String> tenderNames) {
		this.tenderNames = tenderNames;
	}

	public List<String> getTenderCodes() {
		return tenderCodes;
	}

	public void setTenderCodes(List<String> tenderCodes) {
		this.tenderCodes = tenderCodes;
	}

	private String modeOfPayment;
	
	private String countryCode;
	
	private int tenderKey;

	public boolean isAllowOtherReturnTender() {
		return allowOtherReturnTender;
	}

	public void setAllowOtherReturnTender(boolean allowOtherReturnTender) {
		this.allowOtherReturnTender = allowOtherReturnTender;
	}

	private boolean allowOtherReturnTender;
	private String allowOtherReturnTenderStr;


	public boolean isReturnTender() {
		return returnTender;
	}

	public void setReturnTender(boolean returnTender) {
		this.returnTender = returnTender;
	}

	private boolean returnTender;
	
	private String returnTenderStr;

	
	
	private RequestHeader requestHeader;

	private String startIndex;

	private String maxRecords;
	
	private String searchCritaria;
	
	private List<TenderMaster> tenderMasters;
	
	private ResponseHeader responseHeader;
	
	private int totalRecords;
	private String backEndTenderCode;
	
	
	

	public String getBackEndTenderCode() {
		return backEndTenderCode;
	}

	public void setBackEndTenderCode(String backEndTenderCode) {
		this.backEndTenderCode = backEndTenderCode;
	}

	public String getAllowOtherReturnTenderStr() {
		return allowOtherReturnTenderStr;
	}

	public void setAllowOtherReturnTenderStr(String allowOtherReturnTenderStr) {
		this.allowOtherReturnTenderStr = allowOtherReturnTenderStr;
	}

	public String getReturnTenderStr() {
		return returnTenderStr;
	}

	public void setReturnTenderStr(String returnTenderStr) {
		this.returnTenderStr = returnTenderStr;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public List<TenderMaster> getTenderMasters() {
		return tenderMasters;
	}

	public void setTenderMasters(List<TenderMaster> tenderMasters) {
		this.tenderMasters = tenderMasters;
	}

	public String getSearchCritaria() {
		return searchCritaria;
	}

	public void setSearchCritaria(String searchCritaria) {
		this.searchCritaria = searchCritaria;
	}

	public String getTenderName() {
		return tenderName;
	}

	public void setTenderName(String tenderName) {
		this.tenderName = tenderName;
	}

	public String getTenderCode() {
		return tenderCode;
	}

	public void setTenderCode(String tenderCode) {
		this.tenderCode = tenderCode;
	}

	public String getModeOfPayment() {
		return modeOfPayment;
	}

	public void setModeOfPayment(String modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public RequestHeader getRequestHeader() {
		return requestHeader;
	}

	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}

	public int getTenderKey() {
		return tenderKey;
	}

	public void setTenderKey(int tenderKey) {
		this.tenderKey = tenderKey;
	}
	
	
	
	
}
