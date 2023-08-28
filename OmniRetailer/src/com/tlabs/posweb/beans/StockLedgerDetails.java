package com.tlabs.posweb.beans;

import java.util.List;

public class StockLedgerDetails {
	private String soldQuantity;
	private String transferedQuantity;
	private String netStock;
	private String serialNum;
	private String stockReceipts;
	private String strDate;
	private String totalRecords;
	private float returnedQty = 0f;
	private float exchangedQty = 0f;
	private float stockReturnedFromLocQty = 0f;
	private float stockReturnedToLocQty = 0f;
	private float grnQty = 0f;
	private float dumpQty = 0f;
	
	private List<String> availItemsList;
	
	
	public List<String> getAvailItemsList() {
		return availItemsList;
	}
	public void setAvailItemsList(List<String> availItemsList) {
		this.availItemsList = availItemsList;
	}
	public String getSoldQuantity() {
		return soldQuantity;
	}
	public void setSoldQuantity(String soldQuantity) {
		this.soldQuantity = soldQuantity;
	}
	public String getTransferedQuantity() {
		return transferedQuantity;
	}
	public void setTransferedQuantity(String transferedQuantity) {
		this.transferedQuantity = transferedQuantity;
	}
	public String getNetStock() {
		return netStock;
	}
	public void setNetStock(String netStock) {
		this.netStock = netStock;
	}
	public String getSerialNum() {
		return serialNum;
	}
	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}
	public String getStockReceipts() {
		return stockReceipts;
	}
	public void setStockReceipts(String stockReceipts) {
		this.stockReceipts = stockReceipts;
	}
	public String getStrDate() {
		return strDate;
	}
	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}
	public String getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(String totalRecords) {
		this.totalRecords = totalRecords;
	}
	public Float getGrnQty() {
		return grnQty;
	}
	public void setGrnQty(Float grnQty) {
		this.grnQty = grnQty;
	}
	public Float getReturnedQty() {
		return returnedQty;
	}
	public void setReturnedQty(Float returnedQty) {
		this.returnedQty = returnedQty;
	}
	public Float getExchangedQty() {
		return exchangedQty;
	}
	public void setExchangedQty(Float exchangedQty) {
		this.exchangedQty = exchangedQty;
	}
	public Float getStockReturnedFromLocQty() {
		return stockReturnedFromLocQty;
	}
	public void setStockReturnedFromLocQty(Float stockReturnedFromLocQty) {
		this.stockReturnedFromLocQty = stockReturnedFromLocQty;
	}
	public Float getStockReturnedToLocQty() {
		return stockReturnedToLocQty;
	}
	public void setStockReturnedToLocQty(Float stockReturnedToLocQty) {
		this.stockReturnedToLocQty = stockReturnedToLocQty;
	}
	public Float getDumpQty() {
		return dumpQty;
	}
	public void setDumpQty(Float dumpQty) {
		this.dumpQty = dumpQty;
	}
	
}

