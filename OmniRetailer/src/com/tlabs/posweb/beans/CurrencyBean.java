package com.tlabs.posweb.beans;

import java.util.List;

public class CurrencyBean {
	
	private RequestHeader requestHeader;
	private List<?> countryList;
	private String startIndex;
	private String currencyCode;
	private String countryName;
	private String totalRecords;
	private String baseCurrency;
	private String conversionRatio;
	private int slNo;
	
	private String maxRecords;
	
	public String getMaxRecords() {
		return maxRecords;
	}
	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public String getBaseCurrency() {
		return baseCurrency;
	}
	public void setBaseCurrency(String baseCurrency) {
		this.baseCurrency = baseCurrency;
	}
	public String getConversionRatio() {
		return conversionRatio;
	}
	public void setConversionRatio(String conversionRatio) {
		this.conversionRatio = conversionRatio;
	}
	public String getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}
	
	public List<?> getCountryList() {
		return countryList;
	}
	public void setCountryList(List<?> countryList) {
		this.countryList = countryList;
	}
	public String getCurrencyCode() {
		return currencyCode;
	}
	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public RequestHeader getRequestHeader() {
		return requestHeader;
	}
	public void setRequestHeader(RequestHeader requestHeader) {
		this.requestHeader = requestHeader;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	
	
}
