package com.tlabs.posweb.beans;

import java.math.BigDecimal;



public class SalesAndPaymentDetails {
	
	private String sno;
	
	private String transactionId;
	
	private String skuId;
	
	private String productDescription;
	
	private String productCategory;
	
	private BigDecimal saleQuantity;
	
	private BigDecimal salePrice;
	
	private BigDecimal cost;
	
	private BigDecimal discount;
	
	private BigDecimal net_cost;
	
	private BigDecimal cgstRate;
	
	private BigDecimal cgstValue;
	
	private BigDecimal sgstRate;
	private BigDecimal sgstValue;
	
	private BigDecimal igstRate;
	
	private BigDecimal igstValue;
	
	private BigDecimal totalTaxAmt;
	
	private String hsnCode;
	
	private String uom;
	
	private String ean;
	
	private BigDecimal mrp;
	
	private Float cgst2_5;
	private Float sgst2_5;
	private Float cgst6;
	private Float sgst6;
	private Float cgst9;
	private Float sgst9;
	private Float cgst14;
	private Float sgst14;
	private BigDecimal finalRate;
	private BigDecimal totalCGSTRate;
	private BigDecimal totalSGSTRate;
	private BigDecimal totalTaxRate;
	private BigDecimal discountPercentage;
	
	
	
	public Float getCgst2_5() {
		return cgst2_5;
	}

	public void setCgst2_5(Float cgst2_5) {
		this.cgst2_5 = cgst2_5;
	}

	public Float getSgst2_5() {
		return sgst2_5;
	}

	public void setSgst2_5(Float sgst2_5) {
		this.sgst2_5 = sgst2_5;
	}

	public Float getCgst6() {
		return cgst6;
	}

	public void setCgst6(Float cgst6) {
		this.cgst6 = cgst6;
	}

	public Float getSgst6() {
		return sgst6;
	}

	public void setSgst6(Float sgst6) {
		this.sgst6 = sgst6;
	}

	public Float getCgst9() {
		return cgst9;
	}

	public void setCgst9(Float cgst9) {
		this.cgst9 = cgst9;
	}

	public Float getSgst9() {
		return sgst9;
	}

	public void setSgst9(Float sgst9) {
		this.sgst9 = sgst9;
	}

	public Float getCgst14() {
		return cgst14;
	}

	public void setCgst14(Float cgst14) {
		this.cgst14 = cgst14;
	}

	public Float getSgst14() {
		return sgst14;
	}

	public void setSgst14(Float sgst14) {
		this.sgst14 = sgst14;
	}

	public BigDecimal getFinalRate() {
		return finalRate;
	}

	public void setFinalRate(BigDecimal finalRate) {
		this.finalRate = finalRate;
	}

	public BigDecimal getTotalCGSTRate() {
		return totalCGSTRate;
	}

	public void setTotalCGSTRate(BigDecimal totalCGSTRate) {
		this.totalCGSTRate = totalCGSTRate;
	}

	public BigDecimal getTotalSGSTRate() {
		return totalSGSTRate;
	}

	public void setTotalSGSTRate(BigDecimal totalSGSTRate) {
		this.totalSGSTRate = totalSGSTRate;
	}

	public BigDecimal getTotalTaxRate() {
		return totalTaxRate;
	}

	public void setTotalTaxRate(BigDecimal totalTaxRate) {
		this.totalTaxRate = totalTaxRate;
	}

	public BigDecimal getDiscountPercentage() {
		return discountPercentage;
	}

	public void setDiscountPercentage(BigDecimal discountPercentage) {
		this.discountPercentage = discountPercentage;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public BigDecimal getCgstRate() {
		return cgstRate;
	}

	public void setCgstRate(BigDecimal cgstRate) {
		this.cgstRate = cgstRate;
	}

	public BigDecimal getCgstValue() {
		return cgstValue;
	}

	public void setCgstValue(BigDecimal cgstValue) {
		this.cgstValue = cgstValue;
	}

	public BigDecimal getSgstRate() {
		return sgstRate;
	}

	public void setSgstRate(BigDecimal sgstRate) {
		this.sgstRate = sgstRate;
	}

	public BigDecimal getSgstValue() {
		return sgstValue;
	}

	public void setSgstValue(BigDecimal sgstValue) {
		this.sgstValue = sgstValue;
	}

	public BigDecimal getIgstRate() {
		return igstRate;
	}

	public void setIgstRate(BigDecimal igstRate) {
		this.igstRate = igstRate;
	}

	public BigDecimal getIgstValue() {
		return igstValue;
	}

	public void setIgstValue(BigDecimal igstValue) {
		this.igstValue = igstValue;
	}

	public BigDecimal getTotalTaxAmt() {
		return totalTaxAmt;
	}

	public void setTotalTaxAmt(BigDecimal totalTaxAmt) {
		this.totalTaxAmt = totalTaxAmt;
	}

	public String getHsnCode() {
		return hsnCode;
	}

	public void setHsnCode(String hsnCode) {
		this.hsnCode = hsnCode;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

	public BigDecimal getMrp() {
		return mrp;
	}

	public void setMrp(BigDecimal mrp) {
		this.mrp = mrp;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
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

	public BigDecimal getSaleQuantity() {
		return saleQuantity;
	}

	public void setSaleQuantity(BigDecimal saleQuantity) {
		this.saleQuantity = saleQuantity;
	}

	public BigDecimal getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
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
