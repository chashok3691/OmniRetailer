package com.tlabs.posweb.beans;

import java.util.List;

public class DealsBean {

	private ResponseHeader responseHeader;
	private List<Deal> dealsList;
	private List<DealRanges> rangeList;
	private List<Deal> searchDeals;
	private String filePath;
	
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public List<Deal> getSearchDeals() {
		return searchDeals;
	}
	public void setSearchDeals(List<Deal> searchDeals) {
		this.searchDeals = searchDeals;
	}
	public List<DealRanges> getRangeList() {
		return rangeList;
	}
	public void setRangeList(List<DealRanges> rangeList) {
		this.rangeList = rangeList;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public List<Deal> getDealsList() {
		return dealsList;
	}
	public void setDealsList(List<Deal> dealsList) {
		this.dealsList = dealsList;
	}
	
	
}
