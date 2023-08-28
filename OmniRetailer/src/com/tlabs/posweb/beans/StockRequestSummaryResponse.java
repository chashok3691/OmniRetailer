package com.tlabs.posweb.beans;

import java.util.List;

public class StockRequestSummaryResponse {

	private String status;
	private Double itemQty;
	private Double itemPrice;
	private Long totalIndents;
	private Long totalItems;
	private Double estCost;
	private Double approvedQty;
	private Double reqEstCost;
	private List<StockRequestSummaryResponse> summaryResponse;
	private List<StockIssueSummaryResponse> summaryList;
	private List<String> noSupplierSkuList;
	private List<String> stockExistsSkuList;
	private List<String> pendingOutlets;
	private String responseMessage;
	private String responseCode;
	 private int totalPORef;
     private String totPoItems;
     private String totPOItemCost;
     private String totNetCost;
     private String totTax;
     private String totalOrderedItemsQty;
     private String totalOrderedItems;
     private String totalItemsSupplied;
     private String totalSuppliedQty;
     
     private String indentCategory;

     

	public String getIndentCategory() {
		return indentCategory;
	}
	public void setIndentCategory(String indentCategory) {
		this.indentCategory = indentCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Double getItemQty() {
		return itemQty;
	}
	public void setItemQty(Double itemQty) {
		this.itemQty = itemQty;
	}
	public Double getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(Double itemPrice) {
		this.itemPrice = itemPrice;
	}
	public Long getTotalIndents() {
		return totalIndents;
	}
	public void setTotalIndents(Long totalIndents) {
		this.totalIndents = totalIndents;
	}
	public Long getTotalItems() {
		return totalItems;
	}
	public void setTotalItems(Long totalItems) {
		this.totalItems = totalItems;
	}
	public List<StockRequestSummaryResponse> getSummaryResponse() {
		return summaryResponse;
	}
	public void setSummaryResponse(List<StockRequestSummaryResponse> summaryResponse) {
		this.summaryResponse = summaryResponse;
	}
	public List<StockIssueSummaryResponse> getSummaryList() {
		return summaryList;
	}
	public void setSummaryList(List<StockIssueSummaryResponse> summaryList) {
		this.summaryList = summaryList;
	}
	public String getResponseMessage() {
		return responseMessage;
	}
	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}
	
	public String getResponseCode() {
		return responseCode;
	}
	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}
	public List<String> getNoSupplierSkuList() {
		return noSupplierSkuList;
	}
	public void setNoSupplierSkuList(List<String> noSupplierSkuList) {
		this.noSupplierSkuList = noSupplierSkuList;
	}
	public Double getEstCost() {
		return estCost;
	}
	public void setEstCost(Double estCost) {
		this.estCost = estCost;
	}
	public List<String> getStockExistsSkuList() {
		return stockExistsSkuList;
	}
	public void setStockExistsSkuList(List<String> stockExistsSkuList) {
		this.stockExistsSkuList = stockExistsSkuList;
	}
	public List<String> getPendingOutlets() {
		return pendingOutlets;
	}
	public void setPendingOutlets(List<String> pendingOutlets) {
		this.pendingOutlets = pendingOutlets;
	}
	public Double getApprovedQty() {
		return approvedQty;
	}
	public void setApprovedQty(Double approvedQty) {
		this.approvedQty = approvedQty;
	}
	public Double getReqEstCost() {
		return reqEstCost;
	}
	public void setReqEstCost(Double reqEstCost) {
		this.reqEstCost = reqEstCost;
	}
	
	public String getTotPoItems() {
		return totPoItems;
	}
	public void setTotPoItems(String totPoItems) {
		this.totPoItems = totPoItems;
	}
	public String getTotPOItemCost() {
		return totPOItemCost;
	}
	public void setTotPOItemCost(String totPOItemCost) {
		this.totPOItemCost = totPOItemCost;
	}
	public String getTotNetCost() {
		return totNetCost;
	}
	public void setTotNetCost(String totNetCost) {
		this.totNetCost = totNetCost;
	}
	public String getTotTax() {
		return totTax;
	}
	public void setTotTax(String totTax) {
		this.totTax = totTax;
	}
	public String getTotalOrderedItemsQty() {
		return totalOrderedItemsQty;
	}
	public void setTotalOrderedItemsQty(String totalOrderedItemsQty) {
		this.totalOrderedItemsQty = totalOrderedItemsQty;
	}
	public String getTotalOrderedItems() {
		return totalOrderedItems;
	}
	public void setTotalOrderedItems(String totalOrderedItems) {
		this.totalOrderedItems = totalOrderedItems;
	}
	public String getTotalItemsSupplied() {
		return totalItemsSupplied;
	}
	public void setTotalItemsSupplied(String totalItemsSupplied) {
		this.totalItemsSupplied = totalItemsSupplied;
	}
	public String getTotalSuppliedQty() {
		return totalSuppliedQty;
	}
	public void setTotalSuppliedQty(String totalSuppliedQty) {
		this.totalSuppliedQty = totalSuppliedQty;
	}
	public int getTotalPORef() {
		return totalPORef;
	}
	public void setTotalPORef(int totalPORef) {
		this.totalPORef = totalPORef;
	}
	

	 
	
}
