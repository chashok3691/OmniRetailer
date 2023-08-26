package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;

public class HoursReportBean {
	
	private String location;
	
	private int hour;
	
	private String dateStr;
	
	private BigDecimal cashTotal=BigDecimal.ZERO;
	
	private BigDecimal cardTotal=BigDecimal.ZERO;;
	
	private BigDecimal sodexoTotal=BigDecimal.ZERO;;
	
	private BigDecimal ticketTotal=BigDecimal.ZERO;;
	
	private BigDecimal loyalityTotal=BigDecimal.ZERO;;
	
	private BigDecimal creditNoteTotal=BigDecimal.ZERO;;
	
	private BigDecimal giftVoucherTotal=BigDecimal.ZERO;;
	
	private BigDecimal couponsTotal=BigDecimal.ZERO;;
	
	private BigDecimal creditsAmount=BigDecimal.ZERO;;
	
	private BigDecimal overallCashTotal=BigDecimal.ZERO;
	
	private BigDecimal returnAmount=BigDecimal.ZERO;
	
	private BigDecimal exchangeAmount=BigDecimal.ZERO;
	
	private int totalRecords;
	
	private RequestHeader requestHeader;
	
	private ResponseHeader responseHeader;
	
	private String startIndex;
	
	private String maxRecords;
	
	private String counterId;
	
	private String startDate;
	
	private String endDate;
	
	public String getCounterId() {
		return counterId;
	}

	public void setCounterId(String counterId) {
		this.counterId = counterId;
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

	public String getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(String startIndex) {
		this.startIndex = startIndex;
	}

	private List<HoursReportBean> hoursReportList;

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
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

	public List<HoursReportBean> getHoursReportList() {
		return hoursReportList;
	}

	public void setHoursReportList(List<HoursReportBean> hoursReportList) {
		this.hoursReportList = hoursReportList;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public BigDecimal getReturnAmount() {
		return returnAmount;
	}

	public void setReturnAmount(BigDecimal returnAmount) {
		this.returnAmount = returnAmount;
	}

	public BigDecimal getExchangeAmount() {
		return exchangeAmount;
	}

	public void setExchangeAmount(BigDecimal exchangeAmount) {
		this.exchangeAmount = exchangeAmount;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public String getDateStr() {
		return dateStr;
	}

	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}

	public BigDecimal getCashTotal() {
		return cashTotal;
	}

	public void setCashTotal(BigDecimal cashTotal) {
		this.cashTotal = cashTotal;
	}

	public BigDecimal getCardTotal() {
		return cardTotal;
	}

	public void setCardTotal(BigDecimal cardTotal) {
		this.cardTotal = cardTotal;
	}

	public BigDecimal getSodexoTotal() {
		return sodexoTotal;
	}

	public void setSodexoTotal(BigDecimal sodexoTotal) {
		this.sodexoTotal = sodexoTotal;
	}

	public BigDecimal getTicketTotal() {
		return ticketTotal;
	}

	public void setTicketTotal(BigDecimal ticketTotal) {
		this.ticketTotal = ticketTotal;
	}

	public BigDecimal getLoyalityTotal() {
		return loyalityTotal;
	}

	public void setLoyalityTotal(BigDecimal loyalityTotal) {
		this.loyalityTotal = loyalityTotal;
	}

	public BigDecimal getCreditNoteTotal() {
		return creditNoteTotal;
	}

	public void setCreditNoteTotal(BigDecimal creditNoteTotal) {
		this.creditNoteTotal = creditNoteTotal;
	}

	public BigDecimal getGiftVoucherTotal() {
		return giftVoucherTotal;
	}

	public void setGiftVoucherTotal(BigDecimal giftVoucherTotal) {
		this.giftVoucherTotal = giftVoucherTotal;
	}

	public BigDecimal getCouponsTotal() {
		return couponsTotal;
	}

	public void setCouponsTotal(BigDecimal couponsTotal) {
		this.couponsTotal = couponsTotal;
	}

	public BigDecimal getCreditsAmount() {
		return creditsAmount;
	}

	public void setCreditsAmount(BigDecimal creditsAmount) {
		this.creditsAmount = creditsAmount;
	}

	public BigDecimal getOverallCashTotal() {
		return overallCashTotal;
	}

	public void setOverallCashTotal(BigDecimal overallCashTotal) {
		this.overallCashTotal = overallCashTotal;
	}
	
	public String getMaxRecords() {
		return maxRecords;
	}

	public void setMaxRecords(String maxRecords) {
		this.maxRecords = maxRecords;
	}
	
}
