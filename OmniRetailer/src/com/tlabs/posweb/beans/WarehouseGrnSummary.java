package com.tlabs.posweb.beans;

public class WarehouseGrnSummary {
	private String status;
	private Double totalOrderedItemsQty;
	private Double itemPrice;
	private Long totalGrns;
	private Long totalOrderedItems;
	private Long totalItemsSupplied;
	private Double totalSuppliedQty;
	private Long totalPORef;
	private long totPoItems;
	private float totPOItemCost;
	private float totNetCost;
	private float totTax;

	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
 
	public Double getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(Double itemPrice) {
		this.itemPrice = itemPrice;
	}
	public Double getTotalOrderedItemsQty() {
		return totalOrderedItemsQty;
	}
	public void setTotalOrderedItemsQty(Double totalOrderedItemsQty) {
		this.totalOrderedItemsQty = totalOrderedItemsQty;
	}
	public Long getTotalGrns() {
		return totalGrns;
	}
	public void setTotalGrns(Long totalGrns) {
		this.totalGrns = totalGrns;
	}
	public Long getTotalOrderedItems() {
		return totalOrderedItems;
	}
	public void setTotalOrderedItems(Long totalOrderedItems) {
		this.totalOrderedItems = totalOrderedItems;
	}
	public Long getTotalItemsSupplied() {
		return totalItemsSupplied;
	}
	public void setTotalItemsSupplied(Long totalItemsSupplied) {
		this.totalItemsSupplied = totalItemsSupplied;
	}
	public Double getTotalSuppliedQty() {
		return totalSuppliedQty;
	}
	public void setTotalSuppliedQty(Double totalSuppliedQty) {
		this.totalSuppliedQty = totalSuppliedQty;
	}
	public Long getTotalPORef() {
		return totalPORef;
	}
	public void setTotalPORef(Long totalPORef) {
		this.totalPORef = totalPORef;
	}
	public long getTotPoItems() {
		return totPoItems;
	}
	public void setTotPoItems(long totPoItems) {
		this.totPoItems = totPoItems;
	}
	public float getTotPOItemCost() {
		return totPOItemCost;
	}
	public void setTotPOItemCost(float totPOItemCost) {
		this.totPOItemCost = totPOItemCost;
	}
	public float getTotNetCost() {
		return totNetCost;
	}
	public void setTotNetCost(float totNetCost) {
		this.totNetCost = totNetCost;
	}
	public float getTotTax() {
		return totTax;
	}
	public void setTotTax(float totTax) {
		this.totTax = totTax;
	}
	 
}
