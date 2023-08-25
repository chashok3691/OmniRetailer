package com.tlabs.posweb.beans;

import java.util.List;

public class OffersBean {
	private ResponseHeader responseHeader;
	private List<Offer> offerList;
	private List<OfferRanges> offerRangesList;
	private List<Offer> searchOffers;
	private String printURL;
	private String  printURLA7;
	
	private String filePath;
	
	
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getPrintURLA7() {
		return printURLA7;
	}
	public void setPrintURLA7(String printURLA7) {
		this.printURLA7 = printURLA7;
	}
	public String getPrintURL() {
		return printURL;
	}
	public void setPrintURL(String printURL) {
		this.printURL = printURL;
	}
	public List<Offer> getSearchOffers() {
		return searchOffers;
	}
	public void setSearchOffers(List<Offer> searchOffers) {
		this.searchOffers = searchOffers;
	}
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}
	public List<Offer> getOfferList() {
		return offerList;
	}
	public void setOfferList(List<Offer> offerList) {
		this.offerList = offerList;
	}
	public List<OfferRanges> getOfferRangesList() {
		return offerRangesList;
	}
	public void setOfferRangesList(List<OfferRanges> offerRangesList) {
		this.offerRangesList = offerRangesList;
	}
	
	
}
