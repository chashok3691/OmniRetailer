package com.tlabs.posweb.beans;

/*
 * Added by Surya.k on 24/04/2019
 * 
 * */

import java.math.BigDecimal;


public class PurchasePaymentChild {
	
	private String sno;
	
	private String transactionId;
	
	private String skuId;
	
	private String productDescription;
	
	private BigDecimal purchaseOrderQuantity;
	
	private BigDecimal supplyQuantity;
	
	private BigDecimal supplyPrice;
	
	private BigDecimal cost;
	
	private BigDecimal discount;
	
	private BigDecimal net_cost;
	
	private BigDecimal TotalDiscount;
    
    private BigDecimal TotalNetCost;
    private BigDecimal TotalInvoiceAmount;
    
	public BigDecimal getTotalInvoiceAmount() {
		return TotalInvoiceAmount;
	}

	public void setTotalInvoiceAmount(BigDecimal totalInvoiceAmount) {
		TotalInvoiceAmount = totalInvoiceAmount;
	}

	public BigDecimal getTotalDiscount() {
		return TotalDiscount;
	}

	public void setTotalDiscount(BigDecimal totalDiscount) {
		TotalDiscount = totalDiscount;
	}

	public BigDecimal getTotalNetCost() {
		return TotalNetCost;
	}

	public void setTotalNetCost(BigDecimal totalNetCost) {
		TotalNetCost = totalNetCost;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public BigDecimal getPurchaseOrderQuantity() {
		return purchaseOrderQuantity;
	}

	public void setPurchaseOrderQuantity(BigDecimal purchaseOrderQuantity) {
		this.purchaseOrderQuantity = purchaseOrderQuantity;
	}

	public BigDecimal getSupplyQuantity() {
		return supplyQuantity;
	}

	public void setSupplyQuantity(BigDecimal supplyQuantity) {
		this.supplyQuantity = supplyQuantity;
	}

	public BigDecimal getSupplyPrice() {
		return supplyPrice;
	}

	public void setSupplyPrice(BigDecimal supplyPrice) {
		this.supplyPrice = supplyPrice;
	}

	public BigDecimal getCost() {
		return cost;
	}

	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}

	public BigDecimal getDiscount() {
		return discount;
	}

	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}

	public BigDecimal getNet_cost() {
		return net_cost;
	}

	public void setNet_cost(BigDecimal net_cost) {
		this.net_cost = net_cost;
	}

	
}
