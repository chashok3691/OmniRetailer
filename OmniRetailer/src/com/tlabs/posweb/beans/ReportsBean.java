package com.tlabs.posweb.beans;

import java.math.BigDecimal;
import java.util.List;

public class ReportsBean {

	public TrackerItemDetails getItemdetails() {
		return itemdetails;
	}

	public void setItemdetails(TrackerItemDetails itemdetails) {
		this.itemdetails = itemdetails;
	}

	private String date;
	private String counterId;
	private String totalPrice;
	private int serialNumber;
	private String response;
	private String reports;
	private float cardTotal;
	private float cashTotal;
	private String discount;
	private int totalRecords;
	// private List<?> reportsList;
	private List<SalesReportsBean> reportsList;
	private List<?> profitableitemsList;

	private TrackerItemDetails itemdetails;

	/* private List<TrackerItemDetails> itemdetails; */
	private List<?> lossableList;
	private BigDecimal totalSoldQty = BigDecimal.ZERO;

	private BigDecimal totalSoldValue = BigDecimal.ZERO;

	private String filePath;

	private float soldQty;
	private float procQty;
	private float procCost;
	private float dumpQty;
	private float dumpCost;
	private float marginValue;
	private float marginPer;

	private ResponseHeader responseHeader;
	private String salesReportFilePath;
	private TaxDatesSummery reportSummery;
	private int totalBills;
	
	
	
	public int getTotalBills() {
		return totalBills;
	}

	public void setTotalBills(int totalBills) {
		this.totalBills = totalBills;
	}

	public List<SalesReportsBean> getReportsList() {
		return reportsList;
	}

	public void setReportsList(List<SalesReportsBean> reportsList) {
		this.reportsList = reportsList;
	}

	public String getSalesReportFilePath() {
		return salesReportFilePath;
	}

	public void setSalesReportFilePath(String salesReportFilePath) {
		this.salesReportFilePath = salesReportFilePath;
	}

	public TaxDatesSummery getReportSummery() {
		return reportSummery;
	}

	public void setReportSummery(TaxDatesSummery reportSummery) {
		this.reportSummery = reportSummery;
	}

	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}

	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}

	/**
	 * @return the counterId
	 */
	public String getCounterId() {
		return counterId;
	}

	/**
	 * @param counterId the counterId to set
	 */
	public void setCounterId(String counterId) {
		this.counterId = counterId;
	}

	/**
	 * @return the totalPrice
	 */
	public String getTotalPrice() {
		return totalPrice;
	}

	/**
	 * @param totalPrice the totalPrice to set
	 */
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	/**
	 * @return the serialNumber
	 */
	public int getSerialNumber() {
		return serialNumber;
	}

	/**
	 * @param serialNumber the serialNumber to set
	 */
	public void setSerialNumber(int serialNumber) {
		this.serialNumber = serialNumber;
	}

	/**
	 * @return the response
	 */
	public String getResponse() {
		return response;
	}

	/**
	 * @param response the response to set
	 */
	public void setResponse(String response) {
		this.response = response;
	}

	/**
	 * @return the reports
	 */
	public String getReports() {
		return reports;
	}

	/**
	 * @param reports the reports to set
	 */
	public void setReports(String reports) {
		this.reports = reports;
	}

	/**
	 * @return the cardTotal
	 */
	public float getCardTotal() {
		return cardTotal;
	}

	/**
	 * @param cardTotal the cardTotal to set
	 */
	public void setCardTotal(float cardTotal) {
		this.cardTotal = cardTotal;
	}

	/**
	 * @return the cashTotal
	 */
	public float getCashTotal() {
		return cashTotal;
	}

	/**
	 * @param cashTotal the cashTotal to set
	 */
	public void setCashTotal(float cashTotal) {
		this.cashTotal = cashTotal;
	}

	/**
	 * @return the discount
	 */
	public String getDiscount() {
		return discount;
	}

	/**
	 * @param discount the discount to set
	 */
	public void setDiscount(String discount) {
		this.discount = discount;
	}

	/**
	 * @return the totalRecords
	 */
	public int getTotalRecords() {
		return totalRecords;
	}

	/**
	 * @param totalRecords the totalRecords to set
	 */
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	/**
	 * @return the reportsList
	 */
	/*
	 * public List<?> getReportsList() { return reportsList; }
	 *//**
		 * @param reportsList the reportsList to set
		 *//*
			 * public void setReportsList(List<?> reportsList) { this.reportsList =
			 * reportsList; }
			 */

	/**
	 * @return the responseHeader
	 */
	public ResponseHeader getResponseHeader() {
		return responseHeader;
	}

	/**
	 * @param responseHeader the responseHeader to set
	 */
	public void setResponseHeader(ResponseHeader responseHeader) {
		this.responseHeader = responseHeader;
	}

	public BigDecimal getTotalSoldQty() {
		return totalSoldQty;
	}

	public void setTotalSoldQty(BigDecimal totalSoldQty) {
		this.totalSoldQty = totalSoldQty;
	}

	public BigDecimal getTotalSoldValue() {
		return totalSoldValue;
	}

	public void setTotalSoldValue(BigDecimal totalSoldValue) {
		this.totalSoldValue = totalSoldValue;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public float getSoldQty() {
		return soldQty;
	}

	public void setSoldQty(float soldQty) {
		this.soldQty = soldQty;
	}

	public float getProcQty() {
		return procQty;
	}

	public void setProcQty(float procQty) {
		this.procQty = procQty;
	}

	public float getProcCost() {
		return procCost;
	}

	public void setProcCost(float procCost) {
		this.procCost = procCost;
	}

	public float getDumpQty() {
		return dumpQty;
	}

	public void setDumpQty(float dumpQty) {
		this.dumpQty = dumpQty;
	}

	public float getDumpCost() {
		return dumpCost;
	}

	public void setDumpCost(float dumpCost) {
		this.dumpCost = dumpCost;
	}

	public float getMarginValue() {
		return marginValue;
	}

	public void setMarginValue(float marginValue) {
		this.marginValue = marginValue;
	}

	public float getMarginPer() {
		return marginPer;
	}

	public void setMarginPer(float marginPer) {
		this.marginPer = marginPer;
	}

	public List<?> getProfitableitemsList() {
		return profitableitemsList;
	}

	public void setProfitableitemsList(List<?> profitableitemsList) {
		this.profitableitemsList = profitableitemsList;
	}

	public List<?> getLossableList() {
		return lossableList;
	}

	public void setLossableList(List<?> lossableList) {
		this.lossableList = lossableList;
	}
	/*
	 * public List<TrackerItemDetails> getItemdetails() { return itemdetails; }
	 * public void setItemdetails(List<TrackerItemDetails> itemdetails) {
	 * this.itemdetails = itemdetails; }
	 */

}
