package com.tlabs.posweb.beans;


public class PackagingDetails {
	private String sNo;
	
	private String packagingRefId;
	
	private String parentSkuId;
	
	private String childSkuId;
	
	private String parentSkuIdDescription;
	
	private String childSkuIdDescription;
	
	private String measureRange;
	
	private String noOfPacks;
	private String stockQty;
	

	
	private String ean;
	
	private String batchId;

	
	private float avlQty;
	
	private float inwardQty;
	
	private float procQty;
	
	private float childSkuAvailableQty;
	private String uom;

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public float getChildSkuAvailableQty() {
		return childSkuAvailableQty;
	}

	public void setChildSkuAvailableQty(float childSkuAvailableQty) {
		this.childSkuAvailableQty = childSkuAvailableQty;
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

	public String getBatchId() {
		return batchId;
	}

	public void setBatchId(String batchId) {
		this.batchId = batchId;
	}

	public float getAvlQty() {
		return avlQty;
	}

	public void setAvlQty(float avlQty) {
		this.avlQty = avlQty;
	}

	public float getInwardQty() {
		return inwardQty;
	}

	public void setInwardQty(float inwardQty) {
		this.inwardQty = inwardQty;
	}

	public float getProcQty() {
		return procQty;
	}

	public void setProcQty(float procQty) {
		this.procQty = procQty;
	}

	public String getStockQty() {
		return stockQty;
	}

	public void setStockQty(String stockQty) {
		this.stockQty = stockQty;
	}

	private String batchNumber;
	
	private int costPrice;
	
	private int salePrice;
	
	private int totalCostValue;
	
	private int saleValue;
	private int costValue;
	
	
	
	

	private String comments;

	private String pluCode;
	
	
	
	public String getPluCode() {
		return pluCode;
	}

	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}

	public String getsNo() {
		return sNo;
	}

	public void setsNo(String sNo) {
		this.sNo = sNo;
	}

	public String getPackagingRefId() {
		return packagingRefId;
	}

	public void setPackagingRefId(String packagingRefId) {
		this.packagingRefId = packagingRefId;
	}

	public String getParentSkuId() {
		return parentSkuId;
	}

	public void setParentSkuId(String parentSkuId) {
		this.parentSkuId = parentSkuId;
	}

	public String getChildSkuId() {
		return childSkuId;
	}

	public void setChildSkuId(String childSkuId) {
		this.childSkuId = childSkuId;
	}

	public String getParentSkuIdDescription() {
		return parentSkuIdDescription;
	}

	public void setParentSkuIdDescription(String parentSkuIdDescription) {
		this.parentSkuIdDescription = parentSkuIdDescription;
	}

	public String getChildSkuIdDescription() {
		return childSkuIdDescription;
	}

	public void setChildSkuIdDescription(String childSkuIdDescription) {
		this.childSkuIdDescription = childSkuIdDescription;
	}

	public String getMeasureRange() {
		return measureRange;
	}

	public void setMeasureRange(String measureRange) {
		this.measureRange = measureRange;
	}

	public String getNoOfPacks() {
		return noOfPacks;
	}

	public void setNoOfPacks(String noOfPacks) {
		this.noOfPacks = noOfPacks;
	}

	public String getBatchNumber() {
		return batchNumber;
	}

	public void setBatchNumber(String batchNumber) {
		this.batchNumber = batchNumber;
	}

	

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(int costPrice) {
		this.costPrice = costPrice;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getTotalCostValue() {
		return totalCostValue;
	}

	public void setTotalCostValue(int totalCostValue) {
		this.totalCostValue = totalCostValue;
	}

	public int getSaleValue() {
		return saleValue;
	}

	public void setSaleValue(int saleValue) {
		this.saleValue = saleValue;
	}

	public int getCostValue() {
		return costValue;
	}

	public void setCostValue(int costValue) {
		this.costValue = costValue;
	}

	
	
	
	
	
}
