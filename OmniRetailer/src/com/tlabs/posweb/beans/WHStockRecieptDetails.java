package com.tlabs.posweb.beans;

import java.math.BigDecimal;

public class WHStockRecieptDetails {
	
	private int S_No;
	private String reciept_id;
	

	private String description;
	
	private String skuId;
	
	private String pluCode;
	
	private String ean;
	
	private BigDecimal costPrice;

	private BigDecimal returnQty;

	private BigDecimal acceptedQty;

	private BigDecimal reqQty;

	private BigDecimal rejQty;

	private BigDecimal receivedQty;

	private BigDecimal totalCost;
	
	private String utility;

	private String color;

	private String size;

	private String measureRange;

	private String productRange;

	private String batchNum;

	private String itemScanCode;

	private boolean trackingRecquired;

	private String uom;
	private BigDecimal price;
	
	


	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public int getS_No() {
		return S_No;
	}

	public void setS_No(int s_No) {
		S_No = s_No;
	}

	public String getReciept_id() {
		return reciept_id;
	}

	public void setReciept_id(String reciept_id) {
		this.reciept_id = reciept_id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSkuId() {
		return skuId;
	}

	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}

	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

	public BigDecimal getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(BigDecimal costPrice) {
		this.costPrice = costPrice;
	}

	public BigDecimal getReturnQty() {
		return returnQty;
	}

	public void setReturnQty(BigDecimal returnQty) {
		this.returnQty = returnQty;
	}

	public BigDecimal getReceivedQty() {
		return receivedQty;
	}

	public void setReceivedQty(BigDecimal receivedQty) {
		this.receivedQty = receivedQty;
	}

	public BigDecimal getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(BigDecimal totalCost) {
		this.totalCost = totalCost;
	}

	public String getUtility() {
		return utility;
	}

	public void setUtility(String utility) {
		this.utility = utility;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getMeasureRange() {
		return measureRange;
	}

	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}

	public String getProductRange() {
		return productRange;
	}

	public void setProductRange(String productRange) {
		this.productRange = productRange;
	}

	public String getBatchNum() {
		return batchNum;
	}

	public void setBatchNum(String batchNum) {
		this.batchNum = batchNum;
	}

	public String getItemScanCode() {
		return itemScanCode;
	}

	public void setItemScanCode(String itemScanCode) {
		this.itemScanCode = itemScanCode;
	}

	public boolean isTrackingRecquired() {
		return trackingRecquired;
	}

	public void setTrackingRecquired(boolean trackingRecquired) {
		this.trackingRecquired = trackingRecquired;
	}


	public BigDecimal getReqQty() {
		return reqQty;
	}

	public BigDecimal getAcceptedQty() {
		return acceptedQty;
	}

	public void setAcceptedQty(BigDecimal acceptedQty) {
		this.acceptedQty = acceptedQty;
	}

	public void setReqQty(BigDecimal reqQty) {
		this.reqQty = reqQty;
	}

	public BigDecimal getRejQty() {
		return rejQty;
	}

	public void setRejQty(BigDecimal rejQty) {
		this.rejQty = rejQty;
	}

	public String getUom() {
		return uom;
	}

	public void setUom(String uom) {
		this.uom = uom;
	}
}
